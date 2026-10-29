/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.patches.terabox.misc.recommendations

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.apppatches.patches.shared.Constants
import app.apppatches.patches.terabox.misc.fix.signature.spoofSignaturePatch

@Suppress("unused")
val hideVideoRecommendationsPatch = bytecodePatch(
    name = "Hide video recommendations",
    description = "Hides the recommended videos below the video player.",
) {
    compatibleWith(Constants.TERABOX_COMPATIBILITY)
    dependsOn(spoofSignaturePatch)

    execute {
        VideoRecommendationsFingerprint.matchAll(2..2).forEach { it.method.returnEarly() }
    }
}
