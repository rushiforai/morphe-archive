package app.template.patches.fishingpoints.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FISHINGPOINTS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val APP_CLASS = "Lcom/gregacucnik/fishingpoints/AppClass;"

/**
 * RevenueCat's active entitlements are pushed into four subscription-tier flags on the
 * Application class, and every premium gate (and the ad manager) reads aggregate getters
 * that OR those tiers together. The getter names are R8-renamed, so they are found by shape:
 * a no-arg boolean method on AppClass that reads three or more of the class's own boolean
 * fields / boolean getters. Plain single-flag getters are left alone.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Fishing Points premium features and removes ads."
) {
    compatibleWith(COMPATIBILITY_FISHINGPOINTS)

    execute {
        val aggregates = mutableClassDefBy(APP_CLASS).methods.filter { method ->
            method.implementation != null &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.implementation!!.instructions.count { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference
                    (insn.opcode == Opcode.IGET_BOOLEAN && (ref as? FieldReference)?.definingClass == APP_CLASS) ||
                        (insn.opcode == Opcode.INVOKE_VIRTUAL && (ref as? MethodReference)?.let {
                            it.definingClass == APP_CLASS && it.returnType == "Z" && it.parameterTypes.isEmpty()
                        } == true)
                } >= 3
        }
        if (aggregates.size < 2) {
            throw PatchException("Expected the premium aggregate getters on $APP_CLASS, found ${aggregates.map { it.name }}")
        }
        aggregates.forEach { it.returnEarly(true) }
    }
}
