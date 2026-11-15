package app.hushmessenger.patches.controls

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PACKAGE_MANAGER_TYPE = "Landroid/content/pm/PackageManager;"

/**
 * The PackageManager method [this] calls, as "name(params)return", or null. Morphe's Spoof signature patch (Morphe
 * patches 2.3.0-dev.5 on) turns each invoke-virtual of getPackageInfo and getInstalledPackages outside its own
 * extension into an invoke-static of a wrapper that takes the PackageManager first and then asks it. Picked next to
 * ours it runs first, so a call written either way names the same PackageManager method here (#174).
 */
internal fun Instruction.packageManagerCall(): String? {
    val method = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    val parameters = method.parameterTypes.map { it.toString() }
    val asked = when (opcode) {
        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> parameters.takeIf { method.definingClass == PACKAGE_MANAGER_TYPE }
        Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE ->
            parameters.drop(1).takeIf { method.definingClass != PACKAGE_MANAGER_TYPE && parameters.firstOrNull() == PACKAGE_MANAGER_TYPE }
        else -> null
    } ?: return null
    return asked.joinToString("", "${method.name}(", ")") + method.returnType
}
