/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.splittunneling

import app.morphe.patches.protonvpn.shared.fingerprints.SplitTunnelingViewStateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.splitTunnelingRestrictionFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.unlockUserSetting

internal fun unlockSplitTunneling() {
    unlockUserSetting(
        SplitTunnelingViewStateFingerprint,
        splitTunnelingRestrictionFingerprint(),
    )
    println("[protonvpn] splittunneling: unlocked")
}
