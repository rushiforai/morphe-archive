/*
 * Ported from MrCool-888/mrcool-patches (GPL-3.0), adapted from hoo-dles/morphe-patches
 * (copyright 2026 Hoo-dles, GPL-3.0). See the commit trailer and NOTICE.
 */

package app.template.patches.smartlauncher.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTLAUNCHER
import app.template.patches.smartlauncher.misc.signature.spoofSignaturePatch
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Smart Launcher keeps its Pro state in the PurchasableItems holder: one local boolean per
 * product ("unlockpro", "lifetime", ...). At the end of the holder's static initializer the
 * lifetime item is set to true through its own setter and the
 * "ginlemon.action.hasPremiumAccessChanged" broadcast is fired, so every consumer (feature
 * gates, the licence provider used by other apps, the widgets) sees a consistent Pro state.
 *
 * Play Billing then refreshes the licence: for a sideloaded build it returns no purchases and
 * the refresh revokes the local licence, clearing Pro again. The refresh's revoke flag is
 * forced to false, so the state set above survives. The purchase flow itself is untouched.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Pro features.",
) {
    compatibleWith(COMPATIBILITY_SMARTLAUNCHER)

    // The app exits at start when its signature is not the original one.
    dependsOn(spoofSignaturePatch)

    execute {
        PurchaseItemsCtor.apply {
            val sputInstruction = instructionMatches[2].getInstruction<Instruction21c>()
            val lifetimeField = sputInstruction.reference as FieldReference
            val purchasableItemType = classDefBy(lifetimeField.type)

            val singletonField = classDef.staticFields.first { field -> field.type == classDef.type }

            val itemSetMethod = PurchasableItemSetFingerprint.match(purchasableItemType).originalMethod
            val itemGetMethod = PurchasableItemGetFingerprint.match(purchasableItemType).originalMethod

            // Set "lifetime" to true and fire the access-changed broadcast.
            method.addInstructionsWithLabels(
                method.instructions.size - 1,
                """
                    sget-object v0, $lifetimeField
                    invoke-virtual {v0}, $itemGetMethod
                    move-result v1
                    if-nez v1, :end
                    invoke-static {}, ${GetAppFingerprint.method}
                    move-result-object v1
                    const/4 v2, 0x1
                    invoke-virtual {v0, v1, v2}, $itemSetMethod
                    sget-object v0, $singletonField
                    invoke-static {v0, v1, v2}, ${HasChangedIntentFingerprint.method}
                """.trimIndent(),
                ExternalLabel("end", method.instructions.last()),
            )
        }

        LicenseRefreshFingerprint.apply {
            val revokeParam = method.implementation!!.registerCount -
                method.parameterTypes.size + method.parameterTypes.indexOf("Z")
            method.addInstructions(0, "const/4 v$revokeParam, 0x0")
        }
    }
}
