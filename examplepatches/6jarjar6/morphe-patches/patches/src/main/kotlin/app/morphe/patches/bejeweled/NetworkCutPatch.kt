package app.morphe.patches.bejeweled

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import org.w3c.dom.Element

/**
 * Network-cut patch for Bejeweled Classic.
 *
 * A fail-closed hammer that removes the `android.permission.INTERNET`
 * permission from the manifest. Once the permission is gone, the platform
 * denies every socket/connection system call — no code path (Java glue,
 * native Nimble SDK, ad networks, telemetry channels) can open a network
 * connection. This severs telemetry and ads structurally, independent of
 * any individual bytecode kill, closing every known or unknown channel
 * (including the ones still observed in the live traffic: nextdns,
 * Facebook/Instagram graphs, Google ads/measurement, and the IronSource
 * mediation fan-out).
 *
 * Trade-offs: the app's network-bound features are unavailable (leaderboards,
 * cloud synchronisation, live ad delivery). Core offline gameplay is
 * unaffected. If the game performs a mandatory network handshake at launch,
 * the app may refuse to start — this is the intended fail-closed cost.
 */
@Suppress("SpellCheckingInspection")
val bejeweledNetworkCut = resourcePatch(
    name = "Network-cut",
    description = "Removes android.permission.INTERNET, disabling the network entirely (fail-closed). All telemetry and ads are structurally severed.",
    default = true
) {
    compatibleWith(Constants.BEJEWELED_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val usesPermissions = document.getElementsByTagName("uses-permission")
            for (i in usesPermissions.length - 1 downTo 0) {
                val element = usesPermissions.item(i) as? Element ?: continue
                if (element.getAttribute("android:name") == "android.permission.INTERNET") {
                    element.parentNode?.removeChild(element)
                }
            }
        }
    }
}
