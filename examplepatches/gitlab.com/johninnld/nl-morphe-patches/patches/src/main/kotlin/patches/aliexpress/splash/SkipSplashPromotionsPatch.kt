/*
 * Copyright (C) 2026 Quantro100
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from Quantro100/Morphe-patches:
 * https://github.com/Quantro100/Morphe-patches/commit/f384d233384d2bc3d63d9f5011507f774d586b6f
 * Commit f384d233384d2bc3d63d9f5011507f774d586b6f (2026-06-02),
 * patches/src/main/kotlin/app/morphe/patches/aliexpress/splash/DisableSplashScreenPatch.kt
 */
package patches.aliexpress.splash

import patches.aliexpress.ALIEXPRESS

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import patches.aliexpress.settings.markPatchApplied
import patches.aliexpress.settings.returnWhenEnabled
import patches.aliexpress.signin.spoofSignaturePatch

private const val PATCH_SETTINGS_CLASS = "Lnl/johninnl/aliexpress/PatchSettings;"

private const val DESCRIPTION = "Skips the full-screen promotion shown at launch."

@Suppress("unused")
val skipSplashPromotionsPatch = bytecodePatch(
    name = "Skip splash promotions",
    description = DESCRIPTION,
) {
    compatibleWith(ALIEXPRESS)
    dependsOn(spoofSignaturePatch)

    execute {
        markPatchApplied("skipSplashPromotions", DESCRIPTION)
        SplashPromotionFingerprint.matchSingle().method.returnWhenEnabled("$PATCH_SETTINGS_CLASS->skipSplashPromotions()Z")
    }
}
