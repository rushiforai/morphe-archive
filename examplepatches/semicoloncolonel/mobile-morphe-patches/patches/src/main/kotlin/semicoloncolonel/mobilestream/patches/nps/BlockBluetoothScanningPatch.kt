package semicoloncolonel.mobilestream.patches.nps

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.nps.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.BLUETOOTH_REWRITES
import semicoloncolonel.mobilestream.patches.shared.privacy.beaconWakeupPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.rewriteCalls

// NPS 2.15.0 scans for Bluetooth beacons (iBeacons) inside parks, to show
// content about the spot you are at. The shared nearby-device code stops the
// scanning.

@Suppress("unused")
val blockBluetoothScanningPatch = bytecodePatch(
    name = "Block Bluetooth scanning",
    description = "Stops the app from scanning for Bluetooth beacons in parks.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(beaconWakeupPatch)

    extendWith("extensions/extension.mpe")

    execute { rewriteCalls(BLUETOOTH_REWRITES) }
}
