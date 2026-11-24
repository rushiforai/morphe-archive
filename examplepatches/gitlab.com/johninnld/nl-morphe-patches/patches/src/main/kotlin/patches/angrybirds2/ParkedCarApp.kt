package patches.angrybirds2

import app.morphe.patcher.patch.resourcePatch
import patches.shared.ensureCarParkedAppDeclaration

@Suppress("unused")
val angryBirds2ParkedCarApp = resourcePatch(
    name = "Parked app for Android Auto",
    description = "Declares Angry Birds 2 a parked game app, so Android Auto and car hosts like " +
        "DriveDeck and Gearslip list it on the car screen by themselves. Android Auto still needs " +
        "Unknown sources in its developer settings for a patched app.",
) {
    compatibleWith(angryBirds2)
    dependsOn(originalInput)

    execute {
        document("AndroidManifest.xml").use { ensureCarParkedAppDeclaration(it, "game") }
    }
}
