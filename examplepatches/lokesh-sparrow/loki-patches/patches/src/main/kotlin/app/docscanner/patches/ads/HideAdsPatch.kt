/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.ads

import app.docscanner.patches.shared.Constants.COMPATIBILITY_DOCSCANNER
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.loki.patches.universal.stopAdSdks
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val hideAdsFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.hideads") }
    }
}

/**
 * Doc Scanner shows AdMob ads, mediated through ironSource LevelPlay, and builds its ad views in code. Stopping both
 * SDKs from starting or loading means no ad ever reaches a slot, whether or not premium is on.
 */
@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads (Doc Scanner)",
    description = "Removes Doc Scanner's ads (Google AdMob and ironSource): banners, full-screen ads and rewarded " +
        "ads. Works on its own, with or without premium.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOCSCANNER)
    dependsOn(menuPatch, hideAdsFlag)

    execute {
        stopAdSdks()
    }
}
