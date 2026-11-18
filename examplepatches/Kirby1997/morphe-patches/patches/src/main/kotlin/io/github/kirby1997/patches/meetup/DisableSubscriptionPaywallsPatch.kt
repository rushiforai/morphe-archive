package io.github.kirby1997.patches.meetup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Every Meetup+ subscription paywall surface. Three mechanisms:
//   * a settings-flag getter forced false (intro paywall),
//   * Activity onCreate rewritten to super + finish() (StepUp / MemberSub),
//   * a launcher/composable short-circuited with return-void (profile / trial).
// Each remains a distinct, independently selectable patch.

// --- Intro paywall -----------------------------------------------------------
object IsIntroPaywallEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    definingClass = "Lcom/meetup/base/settings/AppSettings;",
    name = "isIntroPaywallEnabled",
)

@Suppress("unused")
val disableIntroPaywallPatch = bytecodePatch(
    name = "Disable intro paywall",
    description = "Suppresses the Meetup+ intro paywall that pops up on fresh login.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        IsIntroPaywallEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}

// --- Legacy step-up paywall Activity -----------------------------------------
// StepUpActivity is the single destination for every Meetup+ paywall popup the
// app surfaces outside the dedicated subscription screen. onCreate → super + finish().
object StepUpOnCreateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    definingClass = "Lcom/meetup/subscription/stepup/StepUpActivity;",
    name = "onCreate",
)

@Suppress("unused")
val disableStepUpPaywallPatch = bytecodePatch(
    name = "Disable step-up paywalls",
    description = "Closes the Meetup+ step-up paywall Activity before it renders, blocking every popup that routes through it (RSVP, messaging, attendees, waitlist, group members, profile).",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        val method = StepUpOnCreateFingerprint.method
        val instructionCount = method.implementation!!.instructions.size
        method.removeInstructions(0, instructionCount)
        method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Lcom/meetup/subscription/stepup/Hilt_StepUpActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Lcom/meetup/subscription/stepup/StepUpActivity;->finish()V
                return-void
            """,
        )
    }
}

// --- Compose-era MemberSub paywall Activities --------------------------------
// Newer Compose-driven paywall flows land on MemberSubActivity (Compose) and
// MemberSubWebViewActivity (WebView fallback). Same super + finish() technique.
// Leaves MemberSubManageSubscriptionActivity alone (that's "Manage membership").
object MemberSubOnCreateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    definingClass = "Lcom/meetup/feature/membersub/MemberSubActivity;",
    name = "onCreate",
)

object MemberSubWebViewOnCreateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    definingClass = "Lcom/meetup/feature/membersub/MemberSubWebViewActivity;",
    name = "onCreate",
)

@Suppress("unused")
val disableMemberSubPaywallPatch = bytecodePatch(
    name = "Disable MemberSub paywalls",
    description = "Closes the Compose-era Meetup+ paywall activities (MemberSubActivity and MemberSubWebViewActivity) before they render, blocking the popups that profile views, message composition, and other upsells now route through.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        val memberSub = MemberSubOnCreateFingerprint.method
        memberSub.removeInstructions(0, memberSub.implementation!!.instructions.size)
        memberSub.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Lcom/meetup/feature/membersub/Hilt_MemberSubActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Lcom/meetup/feature/membersub/MemberSubActivity;->finish()V
                return-void
            """,
        )

        val webView = MemberSubWebViewOnCreateFingerprint.method
        webView.removeInstructions(0, webView.implementation!!.instructions.size)
        webView.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Lcom/meetup/feature/membersub/Hilt_MemberSubWebViewActivity;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Lcom/meetup/feature/membersub/MemberSubWebViewActivity;->finish()V
                return-void
            """,
        )
    }
}

// --- Profile paywall launcher ------------------------------------------------
// All "tap a profile" / "see full profile" paywall popups funnel through a single
// static accessor on the profile-feature interface. No-oping it kills them at source.
object ProfilePaywallLauncherFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/meetup/feature/profile/e;",
        "Lcom/meetup/shared/meetupplus/MeetupPlusPaywallType;",
        "Lcom/meetup/library/tracking/data/conversion/OriginType;",
        "Lcom/meetup/shared/groupstart/z;",
        "Lln/a;",
        "I",
    ),
    definingClass = "Lcom/meetup/feature/profile/e;",
    name = "a",
)

@Suppress("unused")
val disableProfilePaywallPatch = bytecodePatch(
    name = "Disable profile paywall",
    description = "Stops the Meetup+ subscription popup from appearing when tapping a member's name or 'See full profile'.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        ProfilePaywallLauncherFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}

// --- Meetup+ trial banner composable -----------------------------------------
// "Try Meetup+ free for 7 days" panel — a single Compose function embedded by every
// screen. Returning at offset 0 skips startRestartGroup, which Compose treats as
// "rendered nothing" — the banner disappears everywhere.
object MeetupPlusTrialBannerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "I",
        "Landroidx/compose/runtime/Composer;",
        "Landroidx/compose/ui/Modifier;",
        "Lln/a;",
    ),
    definingClass = "Lcom/meetup/feature/home/composables/x0;",
    name = "d",
)

@Suppress("unused")
val disableTrialBannerPatch = bytecodePatch(
    name = "Disable Meetup+ trial panels",
    description = "Removes the 'Try Meetup+ free for 7 days' banner composable from every screen that embeds it.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        MeetupPlusTrialBannerFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
