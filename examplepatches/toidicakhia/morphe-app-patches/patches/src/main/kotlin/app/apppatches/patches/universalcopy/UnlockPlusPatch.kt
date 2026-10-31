package app.apppatches.patches.universalcopy

import app.apppatches.patches.shared.Constants.UNIVERSAL_COPY_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Unlocks Universal Copy Plus: removes ads and upgrade prompts, and bypasses the PairIP license check so the patched app starts.",
    default = true
) {
    compatibleWith(UNIVERSAL_COPY_COMPATIBILITY)

    execute {
        // ── PairIP: repacked APKs are not recognized as Play installs ─────────
        // The manifest Application and LicenseContentProvider both start the
        // check, so both entry points must be disabled.
        PairIpCheckLicenseFingerprint.matchSingle().method.addInstructions(0, "return-void")
        PairIpInitializeLicenseCheckFingerprint.matchSingle().method.addInstructions(0, "return-void")

        // ── Unlock Plus ───────────────────────────────────────────────────────
        val purchaseCheck = PlusPurchaseCheckFingerprint.matchSingle()
        val baseActivity = purchaseCheck.classDef

        // The billing result may never arrive on devices without Play services.
        // Set the premium flag in the shared activity constructor so the UI is
        // already unlocked before the first billing callback.
        val constructor = baseActivity.methods.single {
            it.name == "<init>" && it.parameterTypes.isEmpty()
        }
        val constructorInstructions = constructor.implementation?.instructions
            ?: throw PatchException("Shared activity constructor has no implementation")

        constructor.addInstructions(
            constructorInstructions.count() - 1,
            """
                const/4 v0, 0x1
                iput-boolean v0, p0, ${baseActivity.type}->t:Z
            """
        )

        // Force the entitlement check to report an active UC Plus purchase and
        // push the premium state into the activity UI.
        purchaseCheck.method.addInstructions(
            0,
            """
                const/4 v1, 0x1
                move-object/from16 v0, p0
                iput-boolean v1, v0, ${baseActivity.type}->t:Z
                invoke-virtual { v0, v1 }, ${baseActivity.type}->f(Z)V
                return v1
            """
        )
    }
}
