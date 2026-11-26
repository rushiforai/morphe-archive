/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.feed

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

/** Registers the Activity screen-capture callback that opens the share sheet after a screenshot of a post. */
private val registerScreenCapture = Fingerprint(
    definingClass = "Lcom/linkedin/android/feed/pages/shareactions/UpdateScreenCaptureManagerImpl;",
    name = "register",
)

@Suppress("unused")
val disableScreenshotSheetPatch = bytecodePatch(
    name = "Disable screenshot share sheet",
    description = "Taking a screenshot of a post no longer opens LinkedIn's share sheet.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isDisableScreenshotSheetIncluded")

        registerScreenCapture.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $EXTENSION_PACKAGE/ScreenshotPatch;->skipRegistration()Z
                move-result v0
                if-eqz v0, :register
                return-void
                :register
                nop
            """
        )
    }
}
