package patches.candysoda

import app.morphe.patcher.patch.resourcePatch
import patches.shared.ensureCarParkedAppDeclaration

@Suppress("unused")
val candySodaParkedCarApp = resourcePatch(
    name = "Parked app for Android Auto",
    description = "Declares Candy Crush Soda Saga a parked game app, so Android Auto and car hosts like " +
        "DriveDeck and Gearslip list it on the car screen by themselves. Android Auto still needs " +
        "Unknown sources in its developer settings for a patched app.",
) {
    compatibleWith(candySoda)
    dependsOn(originalInput)

    execute {
        document("AndroidManifest.xml").use { ensureCarParkedAppDeclaration(it, "game") }
    }
}
