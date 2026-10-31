package app.hrisapn.patches.agriconnect.mocklocation

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.hrisapn.patches.agriconnect.shared.Constants.COMPATIBILITY_AGRICONNECT

/**
 * Fallback that neutralises the check in the Angular bundle itself.
 *
 * The shipped chunk contains, twice (Android and iOS branches):
 *
 *     this.isMockLocation = s.simulated
 *
 * Replacing the right-hand side with a constant `false` keeps the rest of the
 * flow untouched. Enable this instead of (or in addition to) the bytecode patch.
 */
@Suppress("unused")
val disableMockLocationDetectionJsPatch = resourcePatch(
    name = "Disable mock GPS detection (JS fallback)",
    description = "Neutralises the isMockLocation assignment in the check-in/out web bundle.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_AGRICONNECT)

    execute {
        val assetPath = listApkEntries("assets/public/")
            .firstOrNull {
                it.contains("checkinout", ignoreCase = true) && it.endsWith(".js")
            }
            ?: throw PatchException("Check-in/out JS chunk was not found in assets/public/")

        val asset = get(assetPath)
        val original = asset.readText()
        val patched = original.replace(
            "this.isMockLocation=s.simulated",
            "this.isMockLocation=!1",
        )

        if (patched == original) {
            throw PatchException("Mock-location assignment was not found in $assetPath")
        }

        asset.writeText(patched)
    }
}
