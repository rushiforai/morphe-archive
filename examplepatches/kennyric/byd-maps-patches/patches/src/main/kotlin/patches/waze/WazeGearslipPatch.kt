package patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import patches.shared.androidAutoHostVisibility
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE

@Suppress("unused")
val wazeGearslipPatch = bytecodePatch(
    name = "Allow any Android Auto host",
    description = "Lets any Android Auto compatible host connect to Waze's car screens, including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, " +
        "whatever its package name or signing key. Google's Android Auto keeps working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(androidAutoHostVisibility)

    execute {
        // Runs after validateHost has tied the package name to the caller's UID, so a forged
        // package claim is still rejected. Every real host passes the allowlist.
        HostValidatorAllowListFingerprint.method.apply {
            if (implementation!!.registerCount <= parameterTypes.size + 1)
                throw PatchException("Waze host allowlist check has no free register")
            addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }
    }
}
