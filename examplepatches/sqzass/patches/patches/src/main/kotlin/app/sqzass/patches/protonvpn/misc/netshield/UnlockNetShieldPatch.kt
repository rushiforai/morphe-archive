/*
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.sqzass.patches.protonvpn.misc.netshield

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.restrictions.clearFreeUserCheck
import app.sqzass.patches.protonvpn.misc.restrictions.clearFreeUserChecks
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities
import app.sqzass.patches.shared.misc.proton.markPatchApplied

@Suppress("unused")
val unlockNetShieldPatch: BytecodePatch = bytecodePatch(
    name = "Unlock NetShield",
    description = "Unlocks NetShield ad and tracker blocking on free plans.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        markPatchApplied("unlockNetShield", unlockNetShieldPatch)
        clearFreeUserChecks(netShieldAvailabilityFingerprint())
        clearFreeUserCheck(netShieldResetFingerprint())
    }
}
