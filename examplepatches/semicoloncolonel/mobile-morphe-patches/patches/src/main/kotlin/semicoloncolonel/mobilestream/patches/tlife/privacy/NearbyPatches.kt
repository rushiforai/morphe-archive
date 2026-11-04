package semicoloncolonel.mobilestream.patches.tlife.privacy

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.BLUETOOTH_REWRITES
import semicoloncolonel.mobilestream.patches.shared.privacy.WIFI_REWRITES
import semicoloncolonel.mobilestream.patches.shared.privacy.beaconWakeupPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.removeBackgroundLocation
import semicoloncolonel.mobilestream.patches.shared.privacy.rewriteCalls
import semicoloncolonel.mobilestream.patches.tlife.shared.Constants

// T-Life versions of the shared nearby-device patches, with notes for
// T-Life's own features. The code is the shared code.

@Suppress("unused")
val hideWifiNetworksPatch = bytecodePatch(
    name = "Hide Wi-Fi networks",
    description = "Hides nearby Wi-Fi networks and the name of the network you are on from T-Life. Do " +
        "not enable this if you use Secure Wi-Fi or manage T-Mobile Home Internet in T-Life, " +
        "since both need to see Wi-Fi networks.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute { rewriteCalls(WIFI_REWRITES) }
}

@Suppress("unused")
val blockBluetoothScanningPatch = bytecodePatch(
    name = "Block Bluetooth scanning",
    description = "Stops T-Life from scanning for Bluetooth devices and beacons, and hides your paired " +
        "devices.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(beaconWakeupPatch)

    extendWith("extensions/extension.mpe")

    execute { rewriteCalls(BLUETOOTH_REWRITES) }
}

@Suppress("unused")
val blockBackgroundLocationPatch = resourcePatch(
    name = "Block background location",
    description = "Removes T-Life's ability to get your location while it is closed or in the " +
        "background. Location while you use the app still works if you allow it. May affect " +
        "store check-in.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute { removeBackgroundLocation() }
}
