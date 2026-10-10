package app.template.patches.maps.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.maps.renaming.restoreMapDataPatch
import app.template.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS

@Suppress("unused")
val bypassPlayServicesChecksPatch = bytecodePatch(
    name = "Bypass Play Services checks",
    description = "Makes Maps' bundled Play services signature and availability checks always pass, so it " +
        "runs re-signed and with Play services disabled or absent, and lets it load tiles, search and " +
        "routing by sending Google's own package and certificate in the identity headers the Maps backend " +
        "checks. Where Play services rejects the re-signed app, Maps degrades instead of crashing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)
    dependsOn(restoreMapDataPatch)

    execute {
        PlayServicesSignatureCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        PlayServicesAvailabilityFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
