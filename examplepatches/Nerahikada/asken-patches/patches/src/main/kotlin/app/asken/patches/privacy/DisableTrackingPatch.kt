package app.asken.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Blocks analytics and tracking SDKs (Repro, Firebase Analytics, Facebook) to prevent user profiling."
) {
    compatibleWith(ASKEN_COMPATIBILITY)

    execute {
        ReproSetUserProfileFingerprint.method.addInstruction(0, "return-void")
        ReproPushRegistrationFingerprint.method.addInstruction(0, "return-void")
        ReproTrackFingerprint.method.addInstruction(0, "return-void")
        ReproTrackWithPropertiesFingerprint.method.addInstruction(0, "return-void")
        ReproSetIntUserProfileFingerprint.method.addInstruction(0, "return-void")
        ReproSetUserIDFingerprint.method.addInstruction(0, "return-void")
        ReproEnableInAppMessagesFingerprint.method.addInstruction(0, "return-void")

        ReproHandlePushBundleFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        ReproHandlePushMapFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        ReproGetRemoteConfigFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)

        FirebaseAnalyticsLogEventFingerprint.method.addInstruction(0, "return-void")
        FirebaseAnalyticsSetUserPropertyFingerprint.method.addInstruction(0, "return-void")
        FirebaseAnalyticsSetUserIdFingerprint.method.addInstruction(0, "return-void")

        FacebookLogEventFingerprint.method.addInstruction(0, "return-void")
    }
}
