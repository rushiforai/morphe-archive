package app.onlynazril.patches.tiktok.keepscreen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK

private const val BRIDGE = "Lapp/onlynazril/extension/tiktok/KeepScreenBridge;"

/**
 * Keeps the display awake while TikTok is open.
 *
 * Both lifecycle overrides are guarded at their first instruction with the activity itself, which
 * is `p0` on an instance method. The bridge reads the switch and sets or clears the window flag;
 * the pause side always clears it, so no screen that is not in front can hold the display awake.
 */
@Suppress("unused")
val keepScreenPatch = bytecodePatch(
    name = "Keep screen on",
    description = "Keeps the display awake while TikTok is open, so a video does not dim the " +
        "screen. Off returns the system screen timeout. On by default; the switch is in Tweaks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)
    extendWith("extensions/tiktok.mpe")

    execute {
        BaseActivityOnResumeFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $BRIDGE->onResume(Landroid/app/Activity;)V",
        )
        BaseActivityOnPauseFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $BRIDGE->onPause(Landroid/app/Activity;)V",
        )
    }
}
