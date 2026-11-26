/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.customdns

import app.morphe.patches.protonvpn.shared.fingerprints.CustomDnsViewStateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.customDnsRestrictionFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.unlockUserSetting

internal fun unlockCustomDns() {
    unlockUserSetting(
        CustomDnsViewStateFingerprint,
        customDnsRestrictionFingerprint(),
    )
    println("[protonvpn] customdns: unlocked")
}
