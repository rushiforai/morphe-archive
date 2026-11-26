/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.luxu

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.protonvpn.accelerator.unlockVpnAccelerator
import app.morphe.patches.protonvpn.connectionpreferences.unlockConnectionPreferences
import app.morphe.patches.protonvpn.customdns.unlockCustomDns
import app.morphe.patches.protonvpn.excluded.filterExcludedLocations
import app.morphe.patches.protonvpn.lan.unlockLanConnections
import app.morphe.patches.protonvpn.nat.unlockNatType
import app.morphe.patches.protonvpn.netshield.unlockNetShield
import app.morphe.patches.protonvpn.profiles.unlockProfiles
import app.morphe.patches.protonvpn.shared.PROTON_VPN
import app.morphe.patches.protonvpn.shared.PROTON_VPN_FOSS
import app.morphe.patches.protonvpn.shared.anchors.resourceFieldsPatch
import app.morphe.patches.protonvpn.splittunneling.unlockSplitTunneling

@Suppress("unused")
val unlockFeaturesPatch = bytecodePatch(
    name = "Lustx Unlocks",
    description = "Unlocks premium features on free plans. Each feature can be toggled individually.",
) {
    compatibleWith(PROTON_VPN, PROTON_VPN_FOSS)
    dependsOn(resourceFieldsPatch)

    val lanOption = booleanOption(
        key = "unlockLan",
        default = true,
        title = "Unlock LAN connections",
        description = "Unlocks LAN connections on free plans.",
    )
    val netShieldOption = booleanOption(
        key = "unlockNetShield",
        default = true,
        title = "Unlock NetShield",
        description = "Unlocks NetShield ad and tracker blocking on free plans.",
    )
    val customDnsOption = booleanOption(
        key = "unlockCustomDns",
        default = true,
        title = "Unlock custom DNS",
        description = "Unlocks custom DNS on free plans.",
    )
    val splitTunnelingOption = booleanOption(
        key = "unlockSplitTunneling",
        default = true,
        title = "Unlock split tunneling",
        description = "Unlocks split tunneling on free plans.",
    )
    val connectionPreferencesOption = booleanOption(
        key = "unlockConnectionPreferences",
        default = true,
        title = "Unlock connection preferences",
        description = "Unlocks the default connection, recent connections and excluded locations on free plans.",
    )
    val profilesOption = booleanOption(
        key = "unlockProfiles",
        default = true,
        title = "Unlock profiles",
        description = "Unlocks profiles on free plans and limits them to free locations.",
    )

    val vpnAcceleratorOption = booleanOption(
        key = "unlockVpnAccelerator",
        default = true,
        title = "Unlock VPN Accelerator",
        description = "Unlocks VPN Accelerator on free plans (enables the split-tcp connection feature). " +
            "Actual speed gain depends on the server honoring it.",
    )

    val natOption = booleanOption(
        key = "unlockNat",
        default = true,
        title = "Unlock NAT type",
        description = "Unlocks NAT type selection on free plans (randomized NAT feature).",
    )

    val excludedLocationsOption = booleanOption(
        key = "filterExcludedLocations",
        default = true,
        title = "Filter excluded locations",
        description = "Shows only free locations in the excluded locations picker.",
    )

    execute {
        if (lanOption.value == true) unlockLanConnections()
        if (netShieldOption.value == true) unlockNetShield()
        if (customDnsOption.value == true) unlockCustomDns()
        if (splitTunnelingOption.value == true) unlockSplitTunneling()
        if (connectionPreferencesOption.value == true) unlockConnectionPreferences()
        if (profilesOption.value == true) unlockProfiles()
        if (vpnAcceleratorOption.value == true) unlockVpnAccelerator()
        if (natOption.value == true) unlockNatType()
        if (excludedLocationsOption.value == true) filterExcludedLocations()
    }
}
