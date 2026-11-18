package patches.reolink

import app.morphe.patcher.patch.resourcePatch
import patches.shared.ensureCarParkedAppDeclaration

@Suppress("unused")
val reolinkParkedCarApp = resourcePatch(
    name = "Parked app for Android Auto",
    description = "Declares Reolink a parked video app, so Android Auto and car hosts like DriveDeck list it on " +
        "the car screen by themselves. Android Auto still needs Unknown sources in its developer settings for a patched app.",
) {
    compatibleWith(reolink)
    dependsOn(originalInput)

    execute {
        document("AndroidManifest.xml").use { ensureCarParkedAppDeclaration(it, "video") }
    }
}
