/*
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.sqzass.patches.protonvpn.misc.theme

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.sqzass.patches.shared.compat.AppCompatibilities
import app.sqzass.patches.shared.misc.proton.CORE_BRAND_COLORS
import app.sqzass.patches.shared.misc.proton.accentOverlayPatch
import app.sqzass.patches.shared.misc.proton.markPatchMetadata
import app.sqzass.patches.shared.misc.proton.transformBrandColors

@Suppress("unused")
val accentColorPatch: BytecodePatch = bytecodePatch(
    name = "Custom accent color",
    description = "Changes the accent color. Choose a color in the patches menu.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch, accentOverlayPatch)

    execute {
        markPatchMetadata("accentColor", accentColorPatch)
        transformBrandColors(CORE_BRAND_COLORS)
    }
}
