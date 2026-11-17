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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val TAB_LABELS = "tab_labels"

/** The two names Messenger's own tab description carries, which is what the holder is found by. */
private const val TAB_ICON_DESCRIPTION = "tabIconContentDescription"
private const val TAB_TITLE = "title"
private const val JAVA_STRING = "Ljava/lang/String;"

private fun Instruction.labelRef() = (this as? ReferenceInstruction)?.reference
private fun Method.labelCode() = implementation?.instructions?.toList().orEmpty()
private fun Method.labelStrings() = labelCode().mapNotNull { (it.labelRef() as? StringReference)?.string }.toSet()

private fun labelsChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the tab description no longer matches the tested build ($detail)")

/**
 * One tab's description, built with its icon, the content description TalkBack reads, the title drawn under the icon
 * and whether the tab takes a badge. Kotlin null-checks both strings before storing them, so the holder is named by
 * the two check literals rather than by its obfuscated class.
 */
internal fun Method.isTabDescription(): Boolean {
    if (name != "<init>" || AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    val params = parameterTypes.map { it.toString() }
    if (params.size != 4 || !params[0].startsWith("L") || params[1] != JAVA_STRING ||
        params[2] != JAVA_STRING || params[3] != "Z") return false
    return labelStrings().containsAll(setOf(TAB_ICON_DESCRIPTION, TAB_TITLE))
}

internal fun findTabLabels(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isTabDescription() }

/** Where the title the bar draws is stored on the holder, which is the one instruction a blank label gets in front of. */
private fun Method.titleStore(): Int? {
    val code = labelCode()
    val title = parameterRegister(3)
    val self = parameterRegister(0)
    return code.indices.singleOrNull { i ->
        val store = code[i] as? TwoRegisterInstruction ?: return@singleOrNull false
        code[i].opcode == Opcode.IPUT_OBJECT && store.registerA == title && store.registerB == self &&
            (code[i].labelRef() as? FieldReference)?.type == JAVA_STRING
    }
}

/**
 * The store of the title, with Kotlin's null check for it already behind us. A blank title goes in there rather than
 * null: the check throws on null, and it has run by then, so the holder is built exactly as Messenger builds it.
 */
internal fun MutableMethod.validateTabLabels(): Int {
    if (!isTabDescription()) labelsChanged("holder ${hookId()}")
    val store = titleStore() ?: labelsChanged("title store in ${hookId()}")
    val title = parameterRegister(3)
    // const-string reaches v255, past anything a four-parameter constructor needs.
    if (title > 255) labelsChanged("the title is out of reach in ${hookId()}")
    val flow = ReadFlow(this)
    val c = flow.code
    // The null check has to be a plain branch on the title that every path into the store goes through.
    val checked = c.indices.filter { i ->
        i < store && c[i].opcode == Opcode.IF_EQZ && (c[i] as OneRegisterInstruction).registerA == title
    }
    if (checked.isEmpty() || flow.reaches(0, store, checked.toSet())) labelsChanged("the title's null check moved in ${hookId()}")
    if (store in jumpTargets()) labelsChanged("a jump lands on the title store")
    // Insertion would otherwise stretch a try that ended at the store over the new call.
    if ((store - 1..store).any { flow.protected(it) }) labelsChanged("the title store sits inside a try")
    // The title is Messenger's to read until it is stored, and nobody's after it.
    if (!flow.deadAt(store + 1, title)) labelsChanged("the title is read again after it is stored")
    // v0 holds the literal the null check threw with, which every path has left behind by the store.
    if (!flow.deadAt(store, 0)) labelsChanged("the scratch register is still live at the title store")
    validateSwitch()
    return store
}

internal fun MutableMethod.injectTabLabels() {
    val store = validateTabLabels()
    val title = parameterRegister(3)
    addInstructionsWithLabels(store, """
        invoke-static {}, $SETTINGS->hideTabLabels()Z
        move-result v0
        if-eqz v0, :stock_label
        const-string v$title, ""
    """.trimIndent(), ExternalLabel("stock_label", getInstruction(store)))
}
