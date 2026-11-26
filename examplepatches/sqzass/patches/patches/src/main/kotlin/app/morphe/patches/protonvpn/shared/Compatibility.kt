/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val PROTON_VPN = Compatibility(
    name = "Proton VPN",
    packageName = "ch.protonvpn.android",
    targets = listOf(
        AppTarget(version = "5.21.57.0", versionCode = 605215700),
    ),
)

internal val PROTON_VPN_FOSS = Compatibility(
    name = "Proton VPN",
    packageName = "ch.protonvpn.android.reproducible",
    targets = listOf(
        AppTarget(version = "5.21.57.0", versionCode = 605215700),
    ),
)
