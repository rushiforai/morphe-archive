/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * The comment half of onlynazril-patches' TikTok handle patch (GPL-3.0),
 * https://github.com/na-x-ril/onlynazril-patches, hooked at the comment cell instead of
 * User.getNickname.
 */
package app.morphe.patches.pinedrama.misc.comment

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.pinedrama.shared.callThroughLocals
import app.morphe.patches.pinedrama.shared.objectIn
import app.morphe.patches.pinedrama.shared.requireLocals
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import app.morphe.util.numberOfParameterRegisters
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WHAT = "Show commenter handle and region"

/** The comment list's cell. The first-level comment and the reply cells both extend it. */
internal const val COMMENT_CELL = "Lcom/ss/android/ugc/aweme/commentv2/commentlist/powercell/BaseCommentCell;"
internal const val COMMENT_MODEL = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val COMMENTER_DETAILS = "Lapp/morphe/extension/pinedrama/comment/CommenterDetails;"

/**
 * The cell's name setter (`U7` on 47.1.4). The cell's bind picks the name, the display name or
 * a remark, and hands it here, which passes it straight to PineDrama's colored text helper for the
 * name view. Only that bind calls it, once per comment drawn.
 */
internal object CommentNameWriteFingerprint : Fingerprint(
    definingClass = COMMENT_CELL,
    returnType = "V",
    parameters = listOf(CHAR_SEQUENCE),
    custom = { method, _ -> method.isCommentNameWrite() },
)

/**
 * A reply's "replying to" label (`X.0H6D.LIZ` on 47.1.4): it reads the nickname and user name of
 * the person a reply answers, picks one, and writes it through the same colored text helper.
 * The comment cell and the poll cell both bind it.
 */
internal object CommentReplyLabelFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(COMMENT_MODEL),
    // The filter repeats a reference the custom block requires, so the patcher reads only the
    // classes that make it (#54).
    filters = listOf(methodCall(definingClass = COMMENT_MODEL, name = "getReplyToNickName")),
    custom = { method, _ -> method.isReplyLabelWrite() },
)

/**
 * The cell's time and status row (`U8` on 47.1.4). Each of its layouts reads the comment's
 * creation time, formats it and writes it on one of two time views.
 */
internal object CommentTimeWriteFingerprint : Fingerprint(
    definingClass = COMMENT_CELL,
    returnType = "V",
    // The filter repeats a reference the custom block requires, so the patcher reads only the
    // classes that make it (#54).
    filters = listOf(methodCall(definingClass = COMMENT_MODEL, name = "getCreateTime")),
    custom = { method, _ ->
        method.implementation?.instructions?.let { instructions ->
            instructions.any { it.calls(COMMENT_MODEL, "getCreateTime") } && instructions.any { it.isTextWrite() }
        } == true
    },
)

@Suppress("unused")
val commenterDetailsPatch = bytecodePatch(
    name = "Show commenter handle and region",
    description = "Shows a commenter's @username in place of their display name and the country " +
        "their account is set to after the comment's time. It can also give each commenter's name " +
        "a color of its own. Each starts off. Turn them on in HushPine settings > Comments.",
) {
    category("Comments")
    dependsOn(settingsPatch, sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableCommenterDetails()V",
        )

        // The name: swapped as the setter is entered, so the text PineDrama writes is the handle.
        // Every local is free at index 0, so the comment can be read into v0.
        val getter = CommentNameWriteFingerprint.originalClassDef.commentGetter()
        CommentNameWriteFingerprint.method.apply {
            // The name's color: right after PineDrama's write, which set PineDrama's own color. Put in
            // before the swap below, so its index still holds.
            val color = nameColorSite()
            addInstructions(
                color.writeIndex + 1,
                """
                    invoke-virtual {p0}, $COMMENT_CELL->$getter()$COMMENT_MODEL
                    move-result-object v${color.commentRegister}
                    invoke-static {v${color.commentRegister}, v${color.viewRegister}}, $COMMENTER_DETAILS->onCommenterName(Ljava/lang/Object;$TEXT_VIEW)V
                """,
            )

            requireLocals(WHAT, 1)
            val readComment = callThroughLocals(WHAT, "invoke-virtual", "$COMMENT_CELL->$getter()$COMMENT_MODEL", objectIn("p0"))
            val swapName = callThroughLocals(
                WHAT,
                "invoke-static",
                "$COMMENTER_DETAILS->commenterName(Ljava/lang/Object;$CHAR_SEQUENCE)$CHAR_SEQUENCE",
                objectIn("v0"),
                objectIn("p1"),
            )
            addInstructions(
                0,
                """
                    $readComment
                    move-result-object v0
                    $swapName
                    move-result-object p1
                """,
            )
        }

        // The reply label: swapped right before the write, on the label every path to it takes,
        // and its view handed over right after, so a switch change can redo a label PineDrama
        // won't bind again. The later index goes in first, so the write's index still holds.
        CommentReplyLabelFingerprint.method.apply {
            val site = replyLabelSite()
            addInstructions(
                site.callIndex + 1,
                callThroughLocals(
                    WHAT,
                    "invoke-static",
                    "$COMMENTER_DETAILS->onReplyLabel(Ljava/lang/Object;$TEXT_VIEW)V",
                    false,
                    objectIn("p1"),
                    objectIn("v${site.viewRegister}"),
                ),
            )
            val swapLabel = callThroughLocals(
                WHAT,
                "invoke-static",
                "$COMMENTER_DETAILS->replyTargetName(Ljava/lang/Object;$CHAR_SEQUENCE)$CHAR_SEQUENCE",
                false,
                objectIn("p1"),
                objectIn("v${site.textRegister}"),
            )
            addInstructionsAtControlFlowLabel(
                site.callIndex,
                """
                    $swapLabel
                    move-result-object v${site.textRegister}
                """,
            )
        }

        // The time: stamped right after each write. Highest first, so the earlier indexes hold.
        CommentTimeWriteFingerprint.method.apply {
            commentTimeSites().sortedByDescending { it.writeIndex }.forEach { site ->
                addInstructions(
                    site.writeIndex + 1,
                    """
                        invoke-virtual {p0}, $COMMENT_CELL->$getter()$COMMENT_MODEL
                        move-result-object v${site.commentRegister}
                        invoke-static {v${site.commentRegister}, v${site.viewRegister}}, $COMMENTER_DETAILS->onCommentTime(Ljava/lang/Object;$TEXT_VIEW)V
                    """,
                )
            }
        }
    }
}

/**
 * Where the reply label is written: the helper call, the register holding the label's text, and
 * the one holding the view it's written on.
 */
internal data class ReplyLabelSite(val callIndex: Int, val textRegister: Int, val viewRegister: Int)

/**
 * Where one time view gets the comment's time: the setText at [writeIndex], on [viewRegister],
 * with [commentRegister] free after it to read the comment into.
 */
internal data class TimeSite(val writeIndex: Int, val commentRegister: Int, val viewRegister: Int)

/**
 * Where the name's color goes on: right after [writeIndex], the setter's one write, on
 * [viewRegister], with [commentRegister] a local free to read the comment into.
 */
internal data class NameColorSite(val writeIndex: Int, val viewRegister: Int, val commentRegister: Int)

private fun Instruction.calls(owner: String, name: String) =
    getReference<MethodReference>()?.let { it.definingClass == owner && it.name == name } == true

/**
 * PineDrama's static helper that colours a text view and writes its text: (I, I, TextView, CharSequence)V.
 * PineDrama 47.5.3's takes the view and the text first: (TextView, CharSequence, I, I)V.
 */
private val COLORED_TEXT_WRITE_SHAPES = setOf(
    listOf("I", "I", TEXT_VIEW, CHAR_SEQUENCE),
    listOf(TEXT_VIEW, CHAR_SEQUENCE, "I", "I"),
)

private fun Instruction.isColoredTextWrite() =
    (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
        getReference<MethodReference>()?.let { reference ->
            reference.returnType == "V" &&
                reference.parameterTypes.map(CharSequence::toString) in COLORED_TEXT_WRITE_SHAPES
        } == true

/** The register a colored text write hands over as [type]: the view or the text. No parameter is wide. */
private fun Instruction.coloredWriteArgument(type: String): Int? {
    val position = getReference<MethodReference>()?.parameterTypes?.map(CharSequence::toString)?.indexOf(type)
    return position?.takeIf { it >= 0 }?.let { namedRegisters().getOrNull(it) }
}

private fun Instruction.isTextWrite() =
    opcode == Opcode.INVOKE_VIRTUAL &&
        getReference<MethodReference>()?.let { reference ->
            reference.definingClass == TEXT_VIEW && reference.name == "setText" && reference.returnType == "V" &&
                reference.parameterTypes.map(CharSequence::toString) == listOf(CHAR_SEQUENCE)
        } == true

/** Whether [instruction] writes [register], or the pair a wide write starting one below covers. */
private fun writes(instruction: Instruction, register: Int): Boolean {
    if (!instruction.opcode.setsRegister()) return false
    val written = (instruction as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (instruction.opcode.setsWideRegister() && written == register - 1)
}

/**
 * An instance method that hands its one parameter, unchanged, to the colored text helper as the
 * text. The parameter is the last register of the frame.
 */
internal fun Method.isCommentNameWrite(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags)) return false
    val body = implementation ?: return false
    val name = body.registerCount - 1
    val helpers = body.instructions.filter { it.isColoredTextWrite() }
    return helpers.size == 1 && helpers.single().coloredWriteArgument(CHAR_SEQUENCE) == name &&
        body.instructions.none { writes(it, name) }
}

/**
 * The name setter's one colored text write. The hook goes right after it, so PineDrama's color is
 * on the view to read, and the write has to fall straight through to the return that ends the
 * method: past it every local but the view's is free, and the comment is read into the lowest.
 */
internal fun Method.nameColorSite(): NameColorSite {
    val body = implementation ?: throw PatchException("$WHAT: the name setter has no code.")
    val instructions = body.instructions.toList()
    val writes = instructions.indices.filter { instructions[it].isColoredTextWrite() }
    val call = writes.singleOrNull()
        ?: throw PatchException("$WHAT: expected one name write, found ${writes.size}.")
    val view = instructions[call].coloredWriteArgument(TEXT_VIEW)
        ?: throw PatchException("$WHAT: the name write names no view.")
    if (ControlFlow.of(this).normal[call] != listOf(call + 1) ||
        instructions.getOrNull(call + 1)?.opcode != Opcode.RETURN_VOID
    ) {
        throw PatchException("$WHAT: the name write doesn't fall straight through to the setter's return.")
    }
    // An instance method taking one CharSequence: this and the name sit above the locals.
    val locals = body.registerCount - (parameterTypes.size + 1)
    val comment = (0 until locals).firstOrNull { it != view }
        ?: throw PatchException("$WHAT: the name setter has no local to read the comment into.")
    if (view > 15 || comment > 15 || locals > 15) {
        throw PatchException("$WHAT: v$view, v$comment or the cell doesn't fit a short invoke.")
    }
    return NameColorSite(call, view, comment)
}

/**
 * The cell's own getter for the comment it's bound to (`J6` on 47.1.4): the one instance method
 * of the cell that takes nothing and answers a comment.
 */
internal fun ClassDef.commentGetter(): String {
    val getters = methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
            method.returnType == COMMENT_MODEL && method.parameterTypes.isEmpty()
    }
    return getters.singleOrNull()?.name
        ?: throw PatchException("$WHAT: expected one comment getter on the cell, found ${getters.map { it.name }}.")
}

private fun Method.isReplyLabelWrite(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags)) return false
    val instructions = implementation?.instructions ?: return false
    return instructions.any { it.calls(COMMENT_MODEL, "getReplyToUserName") } &&
        instructions.any { it.calls(COMMENT_MODEL, "getReplyToUserId") } &&
        instructions.count { it.isColoredTextWrite() } == 1
}

/**
 * The reply label's one write. The hook in front of it reads the comment from p1, so nothing in
 * the method may write p1, and it replaces the text register with a CharSequence, so nothing may
 * read that register afterwards as the String it held. It sits outside any try, so a handler
 * never sees the swapped register either. The hook after it reads the view the write was handed,
 * which the call leaves in its register.
 */
internal fun Method.replyLabelSite(): ReplyLabelSite {
    val body = implementation ?: throw PatchException("$WHAT: the reply label has no code.")
    val instructions = body.instructions.toList()
    val helpers = instructions.indices.filter { instructions[it].isColoredTextWrite() }
    val call = helpers.singleOrNull()
        ?: throw PatchException("$WHAT: expected one reply label write, found ${helpers.size}.")
    val text = instructions[call].coloredWriteArgument(CHAR_SEQUENCE)
        ?: throw PatchException("$WHAT: the reply label write names no text.")
    val view = instructions[call].coloredWriteArgument(TEXT_VIEW)
        ?: throw PatchException("$WHAT: the reply label write names no view.")

    val comment = body.registerCount - 1
    if (instructions.any { writes(it, comment) }) {
        throw PatchException("$WHAT: the reply label writes over its comment parameter.")
    }
    val flow = ControlFlow.of(this)
    if (flow.exceptional[call].isNotEmpty()) {
        throw PatchException("$WHAT: the reply label is written inside a try block.")
    }
    val liveness = RegisterLiveness.of(this)
    if (flow.normal[call].any { text in liveness.liveInto(it) }) {
        throw PatchException("$WHAT: the reply label's text register is read after the write.")
    }
    if (text > 15 || view > 15 || comment > 15) {
        throw PatchException("$WHAT: v$text, v$view or the comment parameter doesn't fit a short invoke.")
    }
    return ReplyLabelSite(call, text, view)
}

/**
 * Each place the cell writes a comment's time: `comment.getCreateTime()`, then the first
 * `TextView.setText(CharSequence)` after it. The hook runs right after that write and reads the
 * comment through the cell's getter into a register the code writes before it reads again, since
 * 47.7.3 reuses the comment's own register before the write. The write has to fall through to the
 * hook, and `this` has to stay the cell. A jump straight to the instruction after the write skips
 * the hook, which is the cell's own path for a missing time view.
 */
internal fun Method.commentTimeSites(): List<TimeSite> {
    val instructions = implementation?.instructions?.toList()
        ?: throw PatchException("$WHAT: the time row has no code.")
    val reads = instructions.indices.filter {
        instructions[it].opcode == Opcode.INVOKE_VIRTUAL && instructions[it].calls(COMMENT_MODEL, "getCreateTime")
    }
    if (reads.isEmpty()) throw PatchException("$WHAT: the time row never reads a comment's time.")
    val self = implementation!!.registerCount - numberOfParameterRegisters
    if (instructions.any { writes(it, self) }) throw PatchException("$WHAT: the time row writes over this.")
    if (self > 15) throw PatchException("$WHAT: this, v$self, doesn't fit a short invoke.")
    val flow = ControlFlow.of(this)

    return reads.map { read ->
        val write = (read + 1 until instructions.size).firstOrNull { instructions[it].isTextWrite() }
            ?: throw PatchException("$WHAT: the comment time read at $read is never written.")
        val view = (instructions[write] as FiveRegisterInstruction).registerC
        if (flow.normal[write] != listOf(write + 1)) {
            throw PatchException("$WHAT: the comment time write at $write doesn't fall through to the hook.")
        }
        if (view > 15) throw PatchException("$WHAT: v$view doesn't fit a short invoke.")
        val comment = runCatching { getFreeRegisterProvider(write + 1, 1, view, self).getFreeRegister4Bit() }
            .getOrElse { throw PatchException("$WHAT: no register is free after the time write at $write.", it) }
        TimeSite(write, comment, view)
    }
}
