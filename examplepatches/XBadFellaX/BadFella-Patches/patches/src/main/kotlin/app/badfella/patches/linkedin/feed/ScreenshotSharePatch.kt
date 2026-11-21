package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
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
val screenshotSharePatch = bytecodePatch(
    name = "Disable screenshot share sheet",
    description = "Stops LinkedIn from opening its share sheet when you take a screenshot of a post.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isScreenshotShareIncluded")

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
