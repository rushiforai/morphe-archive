/*
 * Originally from Akshayykadam/Pixel-Camera (https://github.com/Akshayykadam/Pixel-Camera),
 * commit 10b75fab7c4036a836061d3619aea1a9c0845bec, licensed GPL-3.0.
 * Modified for pixel10pro-camera-patches (2026-11-25): compatibility narrowed to shared Constants; fail-loud lookups.
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pixelcamera.photosaving

import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils.requireClass
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val photoSavingFixPatch = bytecodePatch(
    name = "Pixel 10 Photo Saving Fix",
    description = "Resolves Pixel 10 & Pro 12MP photos not saving by disabling failing Flare Removal (ceftazidime) and Eclipse AE, mapping binned RAW stream dimensions, and guarding telephoto streams.",
    default = true
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)
    execute {
        // Hook feature flags (ceftazidime, lasagna, use_eclipse) and binned RAW dimension fallbacks

        // Hook klm feature flags and binned RAW dimension fallbacks
        requireClass("Lksf;").let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
        }

        // Patch Lvfa to synchronize CLOCK_BOOTTIME vs CLOCK_MONOTONIC and enforce >= 8.33ms tolerance
        requireClass("Lvfa;").let { clazz ->
            PixelCameraPatchUtils.patchVfaTimestampSync(clazz)
        }

        // Patch Lwst to pass 8.33ms tolerance (v14, v15) instead of 0 to Lvfa
        requireClass("Lwst;").let { clazz ->
            PixelCameraPatchUtils.patchWstTolerance(clazz)
        }
    }
}
