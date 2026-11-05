package app.linkedin.patches.tracking

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/**
 * ProfileTrackingFeatureImpl.sendCustomProfileViewEvent(viewee, networkDistance, privacySettings, bundle): sends
 * the ProfileViewEvent, with the viewer's privacy mode, when a profile or a search hero card is opened.
 */
private object SendProfileViewEventFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/profile/components/tracking/ProfileTrackingFeatureImpl;",
    name = "sendCustomProfileViewEvent",
    returnType = "V",
)

@Suppress("unused")
val anonymousProfileViewingPatch = bytecodePatch(
    name = "Anonymous profile viewing",
    description = "Adds an option (off by default, experimental) to visit profiles without sending the profile " +
        "view event, while you keep seeing who viewed your own profile.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isAnonymousProfileViewingIncluded")

        SendProfileViewEventFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_PACKAGE/LokiPatches;->skipProfileViewEvent()Z
                    move-result v0
                    if-eqz v0, :send
                    return-void
                """,
                ExternalLabel("send", getInstruction(0))
            )
        }
    }
}
