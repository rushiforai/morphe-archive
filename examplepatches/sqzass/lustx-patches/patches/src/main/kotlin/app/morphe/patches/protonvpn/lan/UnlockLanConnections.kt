/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.lan

import app.morphe.patches.protonvpn.shared.fingerprints.LanConnectionsViewStateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.lanConnectionsRestrictionFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.unlockUserSetting

internal fun unlockLanConnections() {
    unlockUserSetting(
        LanConnectionsViewStateFingerprint,
        lanConnectionsRestrictionFingerprint(),
    )
    println("[protonvpn] lan: unlocked")
}
