/*
 * Originally from Akshayykadam/Pixel-Camera (https://github.com/Akshayykadam/Pixel-Camera),
 * commit 10b75fab7c4036a836061d3619aea1a9c0845bec, licensed GPL-3.0.
 * Modified for pixel10pro-camera-patches (2026-11-25): compatibility narrowed to shared Constants; fail-loud lookups.
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pixelcamera.portrait

import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils.requireClass
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val portraitModeFixPatch = bytecodePatch(
    name = "Permanent Portrait Mode Fix",
    description = "Fixes front camera total blur and rear camera flat/bokeh-less portraits by routing portrait processing to Google's pure-TFLite monocular depth pipeline across all cameras.",
    default = true
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)
    execute {
        // Replaces portrait processing and device configuration classes with verified pure-TFLite implementations:
        // - qge: Routes all portrait captures unconditionally to zzd.e (kMonocular), enables matting, disables lancet upscaler
        // - qfz: Loads monocular depth model (midasnet) unconditionally on all cameras
        // - qfr: Forces Gouda EdgeTPU flags (n, o, p, q, r) to false
        // - qgh: Hardened PortraitSegmenterManager (synchronous init in a(), 1c33 fallback in b(), CPU/GPU retry)
        // - kov: EdgeTPU PD models nulled, gouda TPU flags disabled (was kic in 11.0)
        // - jex: Catshark bypass for portrait capture looks (was ioy in 11.0)
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "PortraitControllers.dex")

        // Hook klm feature flags and model routing via TomteInitHelper
        requireClass("Lksf;").let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
            PixelCameraPatchUtils.hookKlmFlagH(clazz)
            PixelCameraPatchUtils.hookKlmFlagR(clazz)
        }
    }
}
