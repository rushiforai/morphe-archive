/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.netshield

import app.morphe.patches.protonvpn.shared.fingerprints.netShieldAvailabilityFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.netShieldResetFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.clearFreeUserCheck
import app.morphe.patches.protonvpn.shared.restrictions.clearFreeUserChecks

internal fun unlockNetShield() {
    clearFreeUserChecks(netShieldAvailabilityFingerprint())
    clearFreeUserCheck(netShieldResetFingerprint())
    println("[protonvpn] netshield: unlocked")
}
