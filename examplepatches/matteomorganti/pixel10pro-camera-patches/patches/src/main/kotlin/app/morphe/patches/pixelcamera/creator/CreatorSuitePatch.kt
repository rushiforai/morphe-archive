/*
 * Originally from Akshayykadam/Pixel-Camera (https://github.com/Akshayykadam/Pixel-Camera),
 * commit 10b75fab7c4036a836061d3619aea1a9c0845bec, licensed GPL-3.0.
 * Modified for pixel10pro-camera-patches (2026-11-25): compatibility narrowed to shared Constants; fail-loud lookups.
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pixelcamera.creator

import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils.requireClass
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val creatorSuitePatch = bytecodePatch(
    name = "Pixel Camera Creator Suite",
    description = "Enables Teleprompter HUD (Biotite), Live Audio VU Meter (Mica), and Social Framing Guides (Slate).",
    default = true
) {
    dependsOn(cameraLooksPatch)
    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)
    execute {
        // ── 1. Unlock Creator Suite feature getters in kow.smali ─────────────────────────
        requireClass("Lkow;").let { clazz ->
            for (m in listOf("a", "b", "c", "d", "e", "f", "g")) {
                PixelCameraPatchUtils.forceReturnTrue(clazz, m)
            }
        }

        // ── 2. Neutralize 'Save to a project' button in kww.smali to prevent cloud crash ──
        requireClass("Lkww;").let { clazz ->
            PixelCameraPatchUtils.forceReturnFalse(clazz, "q")
            PixelCameraPatchUtils.forceReturnFalse(clazz, "u")
            PixelCameraPatchUtils.forceReturnVoid(clazz, "l")
            PixelCameraPatchUtils.forceReturnVoid(clazz, "k")
        }
    }
}
