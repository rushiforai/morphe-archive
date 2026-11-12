package lab.ltediscovery.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import lab.ltediscovery.patches.shared.COMPATIBILITY_LTEDISCOVERY

/**
 * Marks the Pro Plus / Donate tier (`e6`, `BillingEntitlements.c`) as owned.
 *
 * This does not add any feature beyond Pro Plus. The donate flag only affects
 * cosmetic surfaces: the "Pro Plus / Donate" entitlement label and the
 * supporter badge. The app's own store copy says "Everything in Pro Plus, plus
 * extra support for LTE Discovery development."
 *
 * Requires [unlockProPatch], which also supplies the PairIP bypass needed for a
 * repackaged build to start.
 */
@Suppress("unused")
val unlockDonateTierPatch = bytecodePatch(
    name = "Unlock Pro Plus / Donate",
    description = "Marks the Pro Plus / Donate (e6) tier as owned. It does not add any " +
        "feature beyond Pro Plus - the only visible effect is the 'Pro Plus / Donate' label " +
        "and the supporter badge. Requires Unlock Pro. Disabled by default.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LTEDISCOVERY)
    dependsOn(unlockProPatch)

    execute {
        val constructor = BillingEntitlementsConstructorFingerprint.method
        val fieldWriteIndex = constructor.indexOfFieldWrite(
            definingClass = constructor.definingClass,
            name = "c",
        )
        if (fieldWriteIndex < 0) {
            throw PatchException("Could not find the donate flag write in BillingEntitlements.<init>")
        }

        // `c` is the third boolean parameter of the full constructor (p3).
        constructor.addInstructions(fieldWriteIndex, "const/4 p3, 0x1")
    }
}

/**
 * Index of the first instruction that writes [definingClass]->[name], or -1.
 */
private fun MutableMethod.indexOfFieldWrite(definingClass: String, name: String): Int {
    val instructions = implementation?.instructions ?: return -1
    instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        if (reference != null &&
            reference.definingClass == definingClass &&
            reference.name == name
        ) {
            return index
        }
    }
    return -1
}