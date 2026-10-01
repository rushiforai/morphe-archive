package app.ckzombies.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val OBB_CHECK = "Lapp/ckzombies/extension/ObbCheck;"
private const val CENTERED_TEXT = "Lapp/ckzombies/extension/CenteredText;"
private const val RESDL = "Lcom/glu/platform/android/resdl/"
internal const val DOWNLOAD_VIEW = "${RESDL}ResFileDownloadView;"
internal const val TEXT_AREA = "${RESDL}ResFileDownloadView\$GluTextArea;"
internal const val DOWNLOAD_MANAGER = "${RESDL}GluDownloadResMgr;"

/** The resource screen's state machine: a switch on the state inside a loop the states jump back to. */
internal object DownloadViewNewStateFingerprint : Fingerprint(
    definingClass = DOWNLOAD_VIEW,
    name = "newState",
    returnType = "V",
    parameters = listOf("I"),
)

/** Draws a text area of the resource screen, one wrapped line under the other. */
internal object TextAreaDrawFingerprint : Fingerprint(
    definingClass = TEXT_AREA,
    name = "draw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
)

/** Looks for the OBB in one folder; deletes every candidate whose size is wrong. */
internal object FindGpkFileInDirFingerprint : Fingerprint(
    definingClass = DOWNLOAD_MANAGER,
    name = "findGPKFileInDir",
    returnType = "Ljava/io/File;",
    parameters = listOf("Ljava/io/File;", "Z"),
    filters = listOf(
        methodCall(definingClass = "Ljava/io/File;", name = "delete"),
    ),
)

private fun Instruction.method() = ((this as? ReferenceInstruction)?.reference as? MethodReference)
private fun Instruction.field() = ((this as? ReferenceInstruction)?.reference as? FieldReference)

/**
 * Puts `ObbCheck.route()` at the head of `newState()`'s loop, the `const/4 v1, -0x1` every state
 * change jumps back to, so it sees the first state and every one after it. The hook replaces
 * that instruction, which keeps the loop's label on the hook, and ends with it. `v0` holds
 * `this` for the whole method; `v1` and `v3` are written before they are read on every path
 * from there, so the hook may use them.
 *
 * The hook also switches the game's "play from the packed OBB" flag back on whenever the screen
 * starts its check (state 1). The game turns it off when it finds no OBB, and `Activity.finish()`
 * behind Exit leaves the process, and so the flag, alive; opened again with the OBB in place,
 * the check would unpack the whole OBB beside itself instead of starting the game. The flag
 * starts out on (`GameLet`'s class initializer) and nothing else changes it.
 */
internal fun routeMissingObb(newState: MutableMethod) {
    val code = newState.implementation ?: throw PatchException("ResFileDownloadView.newState has no code")
    val state = code.registerCount - 1 // p1
    val instructions = code.instructions
    val head = instructions.indices.singleOrNull { i ->
        val insn = instructions[i]
        val next = instructions.getOrNull(i + 1)
        insn.opcode == Opcode.CONST_4 && (insn as OneRegisterInstruction).registerA == 1 &&
            (insn as NarrowLiteralInstruction).narrowLiteral == -1 &&
            next?.opcode == Opcode.IF_NE && (next as TwoRegisterInstruction).registerA == state &&
            next.registerB == 1
    } ?: throw PatchException("ResFileDownloadView.newState: no single loop head (const/4 v1, -0x1; if-ne p1, v1)")
    if (instructions.none { it is BuilderOffsetInstruction && it.target.location.index == head }) {
        throw PatchException("ResFileDownloadView.newState: nothing jumps back to its loop head")
    }
    val thisCopy = instructions.take(head).any {
        it.opcode == Opcode.MOVE_OBJECT && (it as TwoRegisterInstruction).registerA == 0 &&
            it.registerB == code.registerCount - 2
    }
    if (!thisCopy) throw PatchException("ResFileDownloadView.newState: v0 is not a copy of this")

    newState.replaceInstruction(
        head,
        "invoke-static {}, ${RESDL}ResDL;->getContext()Landroid/app/Activity;",
    )
    newState.addInstructionsWithLabels(
        head + 1,
        """
            move-result-object v3
            invoke-static {}, $DOWNLOAD_MANAGER->getSpecialFileSize()I
            move-result v1
            invoke-static {v3, p1, v1}, $OBB_CHECK->route(Landroid/content/Context;II)I
            move-result p1
            invoke-static {}, $OBB_CHECK->takeMessage()Ljava/lang/String;
            move-result-object v3
            if-eqz v3, :keep_error
            iput-object v3, v0, $DOWNLOAD_VIEW->m_downloadError:Ljava/lang/String;
            :keep_error
            const/4 v1, 0x1
            if-ne p1, v1, :keep_flag
            sput-boolean v1, ${RESDL}GameLet;->DO_NOT_UNPACK_GPK:Z
            :keep_flag
            const/4 v1, -0x1
        """,
    )
}

/**
 * The error page is the one case that reads `m_downloadError`: it lays out that text above Retry
 * and Exit with `createPromptLayout()`. `ObbCheck.exitOnly()` runs right after the layout.
 */
internal fun exitOnlyOnErrorPage(newState: MutableMethod) {
    val instructions = newState.implementation?.instructions?.toList()
        ?: throw PatchException("ResFileDownloadView.newState has no code")
    val reads = instructions.indices.filter {
        instructions[it].opcode == Opcode.IGET_OBJECT && instructions[it].field()?.name == "m_downloadError"
    }
    val read = reads.singleOrNull()
        ?: throw PatchException("ResFileDownloadView.newState reads m_downloadError ${reads.size} times, expected once")
    val layout = (read + 1 until minOf(read + 12, instructions.size)).firstOrNull {
        instructions[it].method()?.name == "createPromptLayout"
    } ?: throw PatchException("ResFileDownloadView.newState: no createPromptLayout() after reading m_downloadError")
    val view = (instructions[layout] as? RegisterRangeInstruction)?.startRegister
        ?: throw PatchException("ResFileDownloadView.newState: the error page's createPromptLayout() is not a range call")
    newState.addInstruction(layout + 1, "invoke-static {v$view}, $OBB_CHECK->exitOnly(Ljava/lang/Object;)V")
}

/**
 * `GluTextArea.draw()` computes the area's middle into `v4` as a float, with the line height in
 * `v2` and the line count in `v3`, then draws line i at `v4 + i * v2`. `CenteredText.begin()`
 * turns `v4` into the first line that centres the block, and `end()` runs where it returns.
 * `v5` and `v6` are only written inside the loop, so they are free before it.
 */
internal fun centerTextArea(draw: MutableMethod) {
    val instructions = draw.implementation?.instructions?.toList()
        ?: throw PatchException("GluTextArea.draw has no code")
    fun resultOf(name: String) = instructions.indices.singleOrNull { instructions[it].method()?.name == name }
        ?.let { (instructions.getOrNull(it + 1) as? OneRegisterInstruction)?.registerA }
    val lineHeight = resultOf("getTextSize")
    val lines = resultOf("size")
    val middle = instructions.indexOfFirst { it.opcode == Opcode.INT_TO_FLOAT }
    val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
    if (lineHeight != 2 || lines != 3 || middle < 0 || (instructions[middle] as OneRegisterInstruction).registerA != 4 ||
        returns.size != 1 || draw.implementation!!.registerCount != 10
    ) {
        throw PatchException("GluTextArea.draw is not laid out as expected (text size v2, lines v3, middle v4)")
    }

    // The return first, so the index of the earlier insertion stays valid.
    draw.replaceInstruction(returns.single(), "invoke-static {p1}, $CENTERED_TEXT->end(Landroid/graphics/Canvas;)V")
    draw.addInstruction(returns.single() + 1, "return-void")
    draw.addInstructions(
        middle + 1,
        """
            iget v5, p0, $TEXT_AREA->m_dy:I
            iget v6, p0, $TEXT_AREA->m_y:I
            sub-int/2addr v5, v6
            invoke-static {p1, v2, v3, v4, v5}, $CENTERED_TEXT->begin(Landroid/graphics/Canvas;FIFI)F
            move-result v4
        """,
    )
}

/**
 * The game deletes every OBB candidate whose size is wrong, which leaves the player nothing to
 * look at: the message could not list the file, and a slightly different OBB would be gone
 * without a word. The call's result is not used, so it becomes a `nop`.
 */
internal fun keepMismatchedFiles(findInDir: MutableMethod) {
    val instructions = findInDir.implementation?.instructions?.toList()
        ?: throw PatchException("findGPKFileInDir has no code")
    val deletes = instructions.indices.filter {
        val call = instructions[it].method()
        instructions[it].opcode == Opcode.INVOKE_VIRTUAL && call?.definingClass == "Ljava/io/File;" &&
            call.name == "delete"
    }
    val delete = deletes.singleOrNull()
        ?: throw PatchException("findGPKFileInDir calls File.delete() ${deletes.size} times, expected once")
    if (instructions.getOrNull(delete + 1)?.opcode == Opcode.MOVE_RESULT) {
        throw PatchException("findGPKFileInDir uses the result of File.delete()")
    }
    findInDir.replaceInstruction(delete, "nop")
}

/**
 * Without its OBB the game asks Google Play and then Glu's `rpack.glu.com`, which no longer
 * resolves, for the file, and says "Download failed. Could not connect to server." Instead the
 * resource screen goes straight to its error page, with only an Exit button, and says what it
 * found in the OBB folder (see the extension's `ObbCheck` and `CenteredText`).
 */
internal val obbMessagePatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val newState = DownloadViewNewStateFingerprint.method
        val draw = TextAreaDrawFingerprint.method
        val findInDir = FindGpkFileInDirFingerprint.method
        exitOnlyOnErrorPage(newState)
        routeMissingObb(newState)
        centerTextArea(draw)
        keepMismatchedFiles(findInDir)
    }
}
