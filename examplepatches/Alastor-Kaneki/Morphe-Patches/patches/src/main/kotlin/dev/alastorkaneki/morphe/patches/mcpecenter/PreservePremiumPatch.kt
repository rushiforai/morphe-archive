package dev.alastorkaneki.morphe.patches.mcpecenter

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import dev.alastorkaneki.morphe.patches.mcpecenter.Constants.MCPE_CENTER

private const val PREMIUM_STATE_CLASS =
    "Ldev/alastorkaneki/morphe/extension/mcpecenter/PremiumState;"

/**
 * Preserves an entitlement only after this app data sandbox has actually observed the app's
 * Flutter premium flag as true. It intentionally does not turn a false/never-seen entitlement
 * into premium.
 */
@Suppress("unused")
val preservePremiumEntitlementPatch = bytecodePatch(
    name = "Preserve premium entitlement",
    description =
        "Keeps an already-observed premium entitlement stable across local preference migrations without granting premium to a fresh install.",
    default = true
) {
    compatibleWith(MCPE_CENTER)
    extendWith("extensions/extension.mpe")

    execute {
        ConfigureFlutterEngineFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $PREMIUM_STATE_CLASS->initialize(Landroid/app/Activity;)V"
        )
    }
}
