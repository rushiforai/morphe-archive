package patches.gamesnacks

import app.morphe.patcher.patch.resourcePatch
import patches.shared.allowInstallOutsideAutomotive
import patches.shared.ensureCarParkedAppDeclaration

/**
 * GameSnacks ships as an Android Automotive OS app: its manifest requires
 * android.hardware.type.automotive and its single activity is a WebView for gamesnacks.com. On a
 * phone that requirement blocks the install the car host needs, so the parked-app patch also makes
 * the feature optional before declaring the parked-app category.
 */
@Suppress("unused")
val gameSnacksParkedCarApp = resourcePatch(
    name = "Parked app for Android Auto",
    description = "Declares GameSnacks a parked game app and lets it install outside Android " +
        "Automotive OS, so Android Auto and car hosts like DriveDeck and Gearslip list it on the " +
        "car screen by themselves. Android Auto still needs Unknown sources in its developer " +
        "settings for a patched app.",
) {
    compatibleWith(gameSnacks)
    dependsOn(originalInput)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            check(allowInstallOutsideAutomotive(manifest) == 1) {
                "GameSnacks no longer declares required automotive hardware"
            }
            ensureCarParkedAppDeclaration(manifest, "game")
        }
    }
}
