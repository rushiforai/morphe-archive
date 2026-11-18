// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.capture

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The method that protects the window of a screen.
 *
 * The screen-protection manager of the security library sets a flag on the
 * window of every screen the application opens. The library and the manager are
 * both renamed by the shrinker, so the class and the signature together
 * identify the method.
 */
private object ScreenProtectionFingerprint : Fingerprint(
    definingClass = "Lo/notifySurfaceUpdate;",
    name = "AnimatedBarCharthGBTI10",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
)

/**
 * Lets the application be screenshotted and recorded.
 *
 * The application embeds a security library that watches every screen it
 * opens and sets the secure flag on its window, which is what tells the system
 * to keep the screen out of screenshots and out of screen recordings. The
 * library also checks the device for root, for a developer build, for USB
 * debugging, for an emulator, for a hooking framework and for screen recording.
 *
 * The patch answers the method that sets the flag with an early return, so the
 * window is left as the application made it and the system takes a screenshot
 * or a recording when the user asks for one.
 *
 * Only the flag is touched. The device checks of the library are left as they
 * are, so a device the library does not accept still behaves as it does in the
 * stock build.
 */
@Suppress("unused")
val allowScreenCapturePatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Stops the app hiding its screens from screenshots and screen recordings.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.INTERFACE.label)

    execute {
        ScreenProtectionFingerprint.method.returnEarly()
    }
}
