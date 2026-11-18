package app.template.patches.coffeebusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val STRING = "Ljava/lang/String;"

internal fun checkCoffee(value: Boolean, message: String) {
    if (!value) throw PatchException("Coffee: $message. Use a clean supported Good Coffee, Great Coffee APKM.")
}

internal fun Method.calls(owner: String, name: String): Boolean =
    implementation?.instructions?.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == owner && ref.name == name
    } == true

internal fun Method.hasString(value: String): Boolean = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

internal fun BytecodePatchContext.coffeeMethod(
    owner: String, name: String, parameters: List<String>, returns: String,
    static: Boolean = true,
): MutableMethod {
    val method = mutableClassDefBy(owner).methods.singleOrNull {
        it.name == name && it.parameterTypes == parameters && it.returnType == returns
    } ?: throw PatchException("Coffee: missing $owner->$name signature")
    checkCoffee(AccessFlags.STATIC.isSet(method.accessFlags) == static, "$name static/instance shape changed")
    return method
}
