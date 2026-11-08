/*
 * Copyright (C) 2026 Hoo-dles
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from hoo-dles/morphe-patches:
 * https://github.com/hoo-dles/morphe-patches/commit/ef804d67c346ee40f6430b80962896df4f9b880e
 * Commit ef804d67c346ee40f6430b80962896df4f9b880e (2026-09-02),
 * patches/src/main/kotlin/hoodles/morphe/patches/protonvpn/splittunneling/UnlockSplitTunnelingPatch.kt
 */
package app.sqzass.patches.protonvpn.misc.splittunneling

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.restrictions.unlockUserSetting
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities
import app.sqzass.patches.shared.misc.proton.markPatchApplied

@Suppress("unused")
val unlockSplitTunnelingPatch: BytecodePatch = bytecodePatch(
    name = "Unlock split tunneling",
    description = "Unlocks split tunneling on free plans.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch)

    execute {
        markPatchApplied("unlockSplitTunneling", unlockSplitTunnelingPatch)
        unlockUserSetting(
            SplitTunnelingViewStateFingerprint,
            splitTunnelingRestrictionFingerprint(),
        )
    }
}
