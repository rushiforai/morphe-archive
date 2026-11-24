/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.NO_SCREENSHOT_SHARE
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

/** UpdateScreenCaptureManagerImpl.register(UpdateProvider, int), which starts listening for screenshots of a post. */
private object RegisterScreenCaptureFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/feed/pages/shareactions/UpdateScreenCaptureManagerImpl;",
    name = "register",
    returnType = "V",
)

/** The screenshot callback of an SDUI screen, which is what the feed is: SduiFragment's own ScreenCaptureCallback. */
private object SduiScreenCaptureFingerprint : Fingerprint(
    name = "onScreenCaptured",
    returnType = "V",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/linkedin/android/infra/sdui/view/SduiFragment") },
)

@Suppress("unused")
val screenshotSharePatch = patch(
    name = "Disable screenshot share sheet",
    description = "Stops the Share sheet from opening when you take a screenshot of a post. " +
        "Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    dependsOn(settingsPatch)

    execute {
        register(NO_SCREENSHOT_SHARE)

        // At method entry v0 is free.
        RegisterScreenCaptureFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $EXTENSION_PACKAGE/Settings;->blockScreenshotShare()Z
                move-result v0
                if-eqz v0, :register
                return-void
            """,
            ExternalLabel("register", RegisterScreenCaptureFingerprint.method.getInstruction(0)),
        )

        SduiScreenCaptureFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $EXTENSION_PACKAGE/Settings;->blockScreenshotShare()Z
                move-result v0
                if-eqz v0, :capture
                return-void
            """,
            ExternalLabel("capture", SduiScreenCaptureFingerprint.method.getInstruction(0)),
        )
    }
}
