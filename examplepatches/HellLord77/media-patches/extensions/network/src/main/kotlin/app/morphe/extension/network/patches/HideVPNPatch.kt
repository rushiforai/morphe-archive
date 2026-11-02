@file:JvmName("HideVPNPatch")

package app.morphe.extension.network.patches

import android.net.NetworkCapabilities

@Suppress("unused")
fun hasTransport(
    self: NetworkCapabilities,
    transportType: Int,
) = transportType != NetworkCapabilities.TRANSPORT_VPN && self.hasTransport(transportType)
