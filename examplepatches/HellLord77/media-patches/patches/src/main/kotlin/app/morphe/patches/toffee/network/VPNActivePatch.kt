package app.morphe.patches.toffee.network

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.network.maskVPNTransportPatch
import app.morphe.patches.toffee.shared.Constants.COMPATIBILITY_TOFFEE

@Suppress("unused")
val vpnActivePatch = bytecodePatch(
    name = "VPN active",
    description = "Hide VPN state.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TOFFEE)

    dependsOn(maskVPNTransportPatch)
}