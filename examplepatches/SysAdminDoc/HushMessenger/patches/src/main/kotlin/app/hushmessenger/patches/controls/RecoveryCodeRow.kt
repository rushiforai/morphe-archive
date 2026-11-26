package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * #197: Message storage offers "Generate 40-character code" only while a server flag is off. With the flag on, the same
 * spot lists "More options" and the code row is gone, though tapping it never depended on the flag.
 *
 * The page's render method picks each of these rows with an if and an else that load a title and a row code and meet at the
 * call that adds the row. With the switch on, the flag's side first adds the else side's row, from the title, code, calls
 * and registers the else side itself uses. "More options" stays where it was.
 */
internal const val RECOVERY_CODE_ROW = "recovery_code_row"
internal const val RECOVERY_CODE_ROW_CALL = "$SETTINGS->recoveryCodeRow()Z"

private const val RECOVERY_ROW_STRING = "Ljava/lang/String;"

/**
 * The else titles of the page's two picked rows, "Create PIN" and "Generate 40-character code", in 588's string pack. The
 * armv7 pack numbers both two higher, which gives its "Generate" row the number the other builds use for "Create PIN".
 */
private val RECOVERY_ROW_TITLES = setOf(0x7f14179e to 0x7f1417a0, 0x7f1417a0 to 0x7f1417a2)

/** One side of a picked row: its title, its row code, the lookup that reads the title and the registers that lookup uses. */
private class RecoveryArm(val title: Int, val rowCode: Int, val label: String, val owner: Int, val text: Int)

private class RecoveryChoice(val at: Int, val flag: Int, val otherwise: RecoveryArm, val add: String, val list: Int, val self: Int)

/** Where the flag's side starts, and everything needed to add the else side's row there. */
internal class RecoveryCodeSite(
    val at: Int,
    val flag: Int,
    val text: Int,
    val owner: Int,
    val title: Int,
    val rowCode: Int,
    val label: String,
    val add: String,
    val list: Int,
    val self: Int,
)

private fun Instruction.recoveryCall() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.recoveryArguments(): List<Int>? {
    val call = this as? FiveRegisterInstruction ?: return null
    if (opcode != Opcode.INVOKE_STATIC) return null
    return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
}

/** The four instructions of a side: title, lookup, its result, row code. Null for anything else. */
private fun List<Instruction>.recoveryArm(at: Int, flag: Int): RecoveryArm? {
    val title = getOrNull(at) ?: return null
    val lookup = getOrNull(at + 1) ?: return null
    val result = getOrNull(at + 2) ?: return null
    val rowCode = getOrNull(at + 3) ?: return null
    if (title.opcode != Opcode.CONST || (title as OneRegisterInstruction).registerA != flag) return null
    if (rowCode.opcode != Opcode.CONST_16 || (rowCode as OneRegisterInstruction).registerA != flag) return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val text = (result as OneRegisterInstruction).registerA
    val label = lookup.recoveryCall() ?: return null
    val arguments = lookup.recoveryArguments() ?: return null
    if (text == flag || arguments.size != 2 || arguments[1] != flag || label.returnType != RECOVERY_ROW_STRING ||
        label.parameterTypes.lastOrNull()?.toString() != "I") return null
    return RecoveryArm(
        (title as NarrowLiteralInstruction).narrowLiteral,
        (rowCode as NarrowLiteralInstruction).narrowLiteral,
        label.toString(),
        arguments[0],
        text,
    )
}

/** Every if and else in the method that picks a row this way, in code order. */
private fun Method.recoveryChoices(): List<RecoveryChoice> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    val addresses = IntArray(code.size + 1)
    for (i in code.indices) addresses[i + 1] = addresses[i] + code[i].codeUnits
    val indexAt = code.indices.associateBy { addresses[it] }
    return code.indices.mapNotNull { at ->
        val branch = code[at]
        if (branch.opcode != Opcode.IF_EQZ) return@mapNotNull null
        val flag = (branch as OneRegisterInstruction).registerA
        val chosen = code.recoveryArm(at + 1, flag) ?: return@mapNotNull null
        val addAt = at + 5
        val add = code.getOrNull(addAt) ?: return@mapNotNull null
        val call = add.recoveryCall() ?: return@mapNotNull null
        val arguments = add.recoveryArguments() ?: return@mapNotNull null
        val types = call.parameterTypes.map { it.toString() }
        if (call.definingClass != definingClass || call.returnType != "V" || types.size != 4 || types[2] != RECOVERY_ROW_STRING ||
            types[3] != "I" || arguments.size != 4 || arguments[2] != chosen.text || arguments[3] != flag) return@mapNotNull null
        val elseAt = indexAt[addresses[at] + (branch as OffsetInstruction).codeOffset] ?: return@mapNotNull null
        val otherwise = code.recoveryArm(elseAt, flag) ?: return@mapNotNull null
        if (otherwise.label != chosen.label || otherwise.owner != chosen.owner || otherwise.text != chosen.text) return@mapNotNull null
        val back = code.getOrNull(elseAt + 4) ?: return@mapNotNull null
        if (back.opcode != Opcode.GOTO && back.opcode != Opcode.GOTO_16 && back.opcode != Opcode.GOTO_32) return@mapNotNull null
        if (indexAt[addresses[elseAt + 4] + (back as OffsetInstruction).codeOffset] != addAt) return@mapNotNull null
        RecoveryChoice(at + 1, flag, otherwise, call.toString(), arguments[0], arguments[1])
    }
}

/**
 * The second of the page's two picked rows, or null for any other method. The two are told apart by their else titles,
 * since their code is identical apart from those numbers.
 */
internal fun Method.recoveryCodeSite(): RecoveryCodeSite? {
    if (name != "render" || AccessFlags.STATIC.isSet(accessFlags) || returnType == "V" || parameterTypes.size != 1) return null
    val choices = recoveryChoices()
    if (choices.size != 2 || (choices[0].otherwise.title to choices[1].otherwise.title) !in RECOVERY_ROW_TITLES) return null
    val row = choices[1]
    if (row.at in jumpTargets()) return null
    val arm = row.otherwise
    return RecoveryCodeSite(row.at, row.flag, arm.text, arm.owner, arm.title, arm.rowCode, arm.label, row.add, row.list, row.self)
}

internal val recoveryCodeRows = methodCheck { _, method -> method.recoveryCodeSite() != null }

/** The page's render method, taken only while exactly one method has its shape. */
internal fun findRecoveryCodeRow(classes: Iterable<ClassDef>): List<Method> =
    listOfNotNull(recoveryCodeRows.methods(classes).singleOrNull())

private fun recoveryCodeChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the Message storage page's ${method.hookId()} no longer matches the tested build")

internal fun Method.validateRecoveryCodeRow() {
    recoveryCodeSite() ?: recoveryCodeChanged(this)
}

/**
 * At the start of the flag's side, whose first two writes are the same two registers this borrows: the row is added, then
 * the stock code loads its own title and goes on to add "More options".
 */
internal fun MutableMethod.injectRecoveryCodeRow() {
    val site = recoveryCodeSite() ?: recoveryCodeChanged(this)
    val flag = "v${site.flag}"
    val text = "v${site.text}"
    addInstructionsWithLabels(
        site.at,
        """
            invoke-static {}, $RECOVERY_CODE_ROW_CALL
            move-result $flag
            if-eqz $flag, :stock_row
            const $flag, 0x${site.title.toString(16)}
            invoke-static {v${site.owner}, $flag}, ${site.label}
            move-result-object $text
            const/16 $flag, 0x${site.rowCode.toString(16)}
            invoke-static {v${site.list}, v${site.self}, $text, $flag}, ${site.add}
        """.trimIndent(),
        ExternalLabel("stock_row", getInstruction(site.at)),
    )
}
