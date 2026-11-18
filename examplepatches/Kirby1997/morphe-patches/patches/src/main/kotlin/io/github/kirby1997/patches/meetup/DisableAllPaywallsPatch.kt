package io.github.kirby1997.patches.meetup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.kirby1997.patches.shared.Constants

// Umbrella "one toggle" over every Meetup+ paywall patch. Self-contained: re-applies
// each individual paywall patch's injection here (reusing the same public Fingerprint
// objects), every one wrapped in runCatching so a single drifted fingerprint can't
// abort the rest.
//
// IMPORTANT — default = false. The individual paywall patches are default-on; leaving
// this on too would double-inject the same methods and corrupt them. Keep it OFF for
// the normal all-on build; turn it ON only to apply everything from a SINGLE
// selection (on-device Morphe Manager / morphe-cli --exclusive), where the individual
// patches are not selected and there is no collision.
//
// Scope is paywalls only — does NOT touch unblur/Maps/OneTrust/Rokt (separate).

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_VOID = """
    return-void
"""

@Suppress("unused")
val disableAllMeetupPaywallsPatch = bytecodePatch(
    name = "Disable all Meetup paywalls",
    description = "Single toggle that applies every Meetup+ paywall patch at once (intro, step-up, " +
        "MemberSub, profile, trial panels, unprompted, and attendees paywall panels). Default-off: enable " +
        "this on its own instead of the individual patches, not alongside them.",
    default = false,
) {
    compatibleWith(Constants.MEETUP)

    execute {
        // Settings-flag getters → false.
        runCatching { IsIntroPaywallEnabledFingerprint.method.addInstructions(0, RETURN_FALSE) }
        runCatching { ShouldShowUnpromptedPaywallFingerprint.method.addInstructions(0, RETURN_FALSE) }
        runCatching { ShouldShowEventUnpromptedPaywallFingerprint.method.addInstructions(0, RETURN_FALSE) }

        // Paywall Activities → super.onCreate + finish().
        runCatching {
            val m = StepUpOnCreateFingerprint.method
            m.removeInstructions(0, m.implementation!!.instructions.size)
            m.addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Lcom/meetup/subscription/stepup/Hilt_StepUpActivity;->onCreate(Landroid/os/Bundle;)V
                    invoke-virtual {p0}, Lcom/meetup/subscription/stepup/StepUpActivity;->finish()V
                    return-void
                """,
            )
        }
        runCatching {
            val m = MemberSubOnCreateFingerprint.method
            m.removeInstructions(0, m.implementation!!.instructions.size)
            m.addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Lcom/meetup/feature/membersub/Hilt_MemberSubActivity;->onCreate(Landroid/os/Bundle;)V
                    invoke-virtual {p0}, Lcom/meetup/feature/membersub/MemberSubActivity;->finish()V
                    return-void
                """,
            )
        }
        runCatching {
            val m = MemberSubWebViewOnCreateFingerprint.method
            m.removeInstructions(0, m.implementation!!.instructions.size)
            m.addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Lcom/meetup/feature/membersub/Hilt_MemberSubWebViewActivity;->onCreate(Landroid/os/Bundle;)V
                    invoke-virtual {p0}, Lcom/meetup/feature/membersub/MemberSubWebViewActivity;->finish()V
                    return-void
                """,
            )
        }

        // Launcher + composables → return at offset 0.
        runCatching { ProfilePaywallLauncherFingerprint.method.addInstructions(0, RETURN_VOID) }
        runCatching { MeetupPlusTrialBannerFingerprint.method.addInstructions(0, RETURN_VOID) }
        runCatching { EventInsightsComponentFingerprint.method.addInstructions(0, RETURN_VOID) }
        runCatching { AttendeeListUpsellFingerprint.method.addInstructions(0, RETURN_VOID) }
    }
}
