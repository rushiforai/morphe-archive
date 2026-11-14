package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Blur behind menus (#162): the menu a long press on a chat opens, and every other sheet or dialog that dims the screen
 * behind it, blurs it instead, the way an iPhone does. Each of them is a DialogFragment, and androidx's DialogFragment
 * shows its dialog from onStart. The hook hands the dialog to the extension right after that `show()`: the window's dim
 * is set by then, a plain AlertDialog's included, and the change lands before the sheet's first frame.
 */
internal const val MENU_BLUR = "menu_blur"
internal const val MENU_BLUR_HOST = "Lapp/hushmessenger/extension/MenuBlur;"
internal const val MENU_BLUR_CALL = "$MENU_BLUR_HOST->shown(Landroid/app/Dialog;)V"

private const val DIALOG ="Landroid/app/Dialog;"
private const val DIALOG_SHOW = "Landroid/app/Dialog;->show()V"
private const val DIALOG_FIELD = "mDialog"

/** androidx's DialogFragment is both of these listeners, whatever Redex names the class. */
internal val DIALOG_FRAGMENT_LISTENERS = setOf("Landroid/content/DialogInterface\$OnDismissListener;", "Landroid/content/DialogInterface\$OnCancelListener;")

private fun Instruction.blurMethod() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.blurField() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.writesBlurRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/** androidx's DialogFragment: a Fragment that listens for both dismiss and cancel and keeps its dialog in mDialog. */
internal fun ClassDef.isDialogFragment(): Boolean =
    superclass == ANDROIDX_FRAGMENT && interfaces.map { it.toString() }.toSet() == DIALOG_FRAGMENT_LISTENERS &&
        fields.any { it.name == DIALOG_FIELD && it.type == DIALOG && !AccessFlags.STATIC.isSet(it.accessFlags) }

/**
 * Where the hook goes in DialogFragment's onStart and the dialog's register: right after its one `Dialog.show()`,
 * called on what the method last read from its own mDialog, with an instruction after it that nothing jumps onto.
 * Null when that isn't the shape.
 */
internal fun Method.menuBlurSite(): Pair<Int, Int>? {
    if (name != "onStart" || returnType != "V" || parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(accessFlags)) return null
    val code = implementation?.instructions?.toList() ?: return null
    val shows = code.indices.filter { code[it].opcode == Opcode.INVOKE_VIRTUAL && code[it].blurMethod()?.toString() == DIALOG_SHOW }
    val at = shows.singleOrNull() ?: return null
    if (at + 1 >= code.size || at + 1 in jumpTargets()) return null
    val dialog = (code[at] as FiveRegisterInstruction).registerC
    val read = (at - 1 downTo 0).firstOrNull { code[it].writesBlurRegister(dialog) } ?: return null
    val field = code[read].blurField() ?: return null
    val self = parameterRegister(0)
    if (code[read].opcode != Opcode.IGET_OBJECT || (code[read] as TwoRegisterInstruction).registerB != self ||
        field.definingClass != definingClass || field.name != DIALOG_FIELD || field.type != DIALOG) return null
    if ((0 until read).any { code[it].writesBlurRegister(self) }) return null
    return at + 1 to dialog
}

/** DialogFragment's onStart, taken only while exactly one class has the DialogFragment shape and its onStart the site. */
internal fun findMenuBlur(classes: Iterable<ClassDef>): List<Method> {
    val fragments = classes.filter { it.isDialogFragment() }
    val fragment = fragments.singleOrNull() ?: return emptyList()
    return fragment.methods.filter { it.menuBlurSite() != null }.takeIf { it.size == 1 }.orEmpty()
}

private fun menuBlurChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: DialogFragment's onStart in ${method.hookId()} no longer matches the tested build")

internal fun MutableMethod.validateMenuBlur() {
    menuBlurSite() ?: menuBlurChanged(this)
}

/** The dialog goes to the extension right after it's shown. It only changes the window, and Off leaves it as it was. */
internal fun MutableMethod.injectMenuBlur() {
    val (at, dialog) = menuBlurSite() ?: menuBlurChanged(this)
    addInstructions(at, "invoke-static/range {v$dialog .. v$dialog}, $MENU_BLUR_CALL")
}
