// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.capture

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The base activity's answer, which the stock build already fixes at false.
 *
 * It is declared once on the shared activity base and overridden by the three
 * screens that want a secure window. The override, not the base, is what decides
 * the answer for those screens.
 */
private object BaseSecureModeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/o;",
    name = "shouldUseSecureMode",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/** The main screen, which stays resident behind most of the application. */
private object MainSecureModeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/main/MainActivity;",
    name = "shouldUseSecureMode",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/** The fullscreen live radio screen. */
private object LiveRadioSecureModeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/stories/live_radio/LiveRadioFullscreenVideoActivity;",
    name = "shouldUseSecureMode",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/** The video player screen. */
private object VideoSecureModeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/player/video/VideoPlayerActivity;",
    name = "shouldUseSecureMode",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Lets the system capture every screen the application marks as secure.
 *
 * The window flag is applied by one method on the shared activity base. It asks
 * `shouldUseSecureMode()` on the running activity, and only the three overrides
 * above answer true; the base declaration answers false. Every other activity
 * therefore already leaves capture alone.
 *
 * The patch answers false on all four declarations. That covers the three
 * overrides and keeps the base honest if a future build inherits a true from
 * somewhere else. Nothing else changes: the method that adds and clears the flag
 * still runs, still sees false, and still clears the flag, so a window that was
 * marked secure earlier in the process is released rather than left behind.
 *
 * Screens that never asked for secure mode are untouched, because their answer
 * was already false.
 */
@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Stops the player, the live radio screen and the main screen from marking their windows as secure, so screenshots and screen recording capture them.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.INTERFACE.label)

    execute {
        listOf(
            BaseSecureModeFingerprint,
            MainSecureModeFingerprint,
            LiveRadioSecureModeFingerprint,
            VideoSecureModeFingerprint,
        ).forEach { fingerprint -> fingerprint.method.returnEarly(false) }
    }
}
