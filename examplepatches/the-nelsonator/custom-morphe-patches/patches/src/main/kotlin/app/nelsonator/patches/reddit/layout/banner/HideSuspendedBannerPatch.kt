package app.nelsonator.patches.reddit.layout.banner

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.nelsonator.patches.shared.Constants.COMPATIBILITY_REDDIT

@Suppress("unused")
val hideSuspendedBannerPatch = bytecodePatch(
    name = "Hide suspended account banner",
    description = "Hides the red suspended/locked account banner on the Home and Inbox screens.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        SuspendedAccountBannerFingerprint.method.addInstruction(0, "return-void")
    }
}
