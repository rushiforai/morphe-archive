package app.morphe.patches.klikk.network

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.network.maskVPNTransportPatch
import app.morphe.patches.klikk.shared.Constants.COMPATIBILITY_KLIKK

@Suppress("unused")
val vpnActivePatch = bytecodePatch(
    name = "VPN active",
    description = "Hide VPN state.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_KLIKK)

    dependsOn(maskVPNTransportPatch)
}