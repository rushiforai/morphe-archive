package semicoloncolonel.mobilestream.patches.checkout51.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block location tracking.
//
// Checkout 51 9.22.10 bundles Foursquare's Movement SDK, which records the
// places you visit in the background and reports them to Foursquare with
// your Checkout 51 user ID, gender, and birthday (MovementSdkManager
// .getMovementSdkUserInfo). It is configured at launch (initialise) and
// started from the gas map (startMovementSdk).
//
// Both now return at once, so the SDK never runs. Its services and receivers
// are also removed from the manifest, so nothing of it starts on boot, after
// an app update, or from an alarm it set before this patch, and
// sdk.foursquare.com is on the shared tracker blocklist. The gas map reads your
// location from Android's fused location provider first and uses Foursquare
// only when that fails; that fallback now fails too, and the map asks you to
// search an area instead. Your location still goes to Checkout 51's own
// server when you open the gas map, because that is how it finds nearby
// stations.
// ─────────────────────────────────────────────────────────────────────────────

private const val MOVEMENT_SDK_MANAGER =
    "Lcom/c51/core/app/location/movementsdk/MovementSdkManager;"

internal object MovementSdkInitialiseFingerprint : Fingerprint(
    definingClass = MOVEMENT_SDK_MANAGER,
    name = "initialise",
    parameters = listOf(),
    returnType = "V",
)

internal object MovementSdkStartFingerprint : Fingerprint(
    definingClass = MOVEMENT_SDK_MANAGER,
    name = "startMovementSdk",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
)

private val removeFoursquareComponentsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            listOf("service", "receiver", "provider", "activity").forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                // Snapshot: the NodeList is live.
                (0 until nodes.length)
                    .map { nodes.item(it) as Element }
                    .filter { it.getAttribute("android:name").startsWith("com.foursquare.") }
                    .forEach { it.parentNode.removeChild(it) }
            }
        }
    }
}

@Suppress("unused")
val blockLocationTrackingPatch = bytecodePatch(
    name = "Block location tracking",
    description = "Stops Foursquare's Movement SDK, which records the places you visit in the background " +
        "and reports them with your user ID, gender, and birthday.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(removeFoursquareComponentsPatch)

    execute {
        MovementSdkInitialiseFingerprint.method.addInstructions(0, "return-void")
        MovementSdkStartFingerprint.method.addInstructions(0, "return-void")
    }
}
