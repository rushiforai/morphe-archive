package semicoloncolonel.mobilestream.patches.kouponai.misc

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.disableCodePushPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.enableWebFilter
import semicoloncolonel.mobilestream.patches.kouponai.shared.kouponWebFilterPatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Hide pop-ups.
//
// Koupon is a React Native app, and its screens are Hermes bytecode (version
// 96) in assets/index.android.bundle. These functions now render nothing or
// answer no:
//
//   WalkThroughStartDrawer   "Ready for verified codes and deals? Take a quick
//                            tour", which starts the tour after 3 seconds.
//   CopilotModal2            the tour's step-by-step tooltips over the feed.
//   WalkThroughEndDrawer     "Congratulations on receiving 100 points, sign
//                            up to claim".
//   shouldPromptNotification the check that decides when to show the
//                            "Enable notifications" sheet.
//   GoogleSurvey, SearchSurvey, RcmdSurveyCard, RcmdSurveyDrawer,
//   shouldShowSurvey         the in-feed and pop-up surveys, and the check
//                            that adds the interests survey after sign-up.
//   Nps                      "How likely are you to recommend Koupon".
//   AppStoreRatingCard       the "Enjoying saving with Koupon? Support Koupon
//                            by rating us" card on the Me screen.
//
// NotificationPrompt and ColdSurvey are left as they are: they are also whole
// steps of the welcome flow after sign-up (LoginScreen's "notification" and
// "cold-survey"), and a step that renders nothing leaves a new account on an
// empty screen. The two checks above keep them from opening on their own.
//
// Deal pages are web pages, and they show their own tips ("New to using
// promo codes on Amazon? Tap here for a quick guide." and a copy-code tip)
// when the page's app-walkthrough status says so. KouponWebFilter fails
// that one request on deal pages, so the page shows neither tip.
//
// Koupon's over-the-air updates are turned off so that the patched bundle
// stays in use (DisableCodePushPatch).
// ─────────────────────────────────────────────────────────────────────────────

private val hidePopupsInBundlePatch = rawResourcePatch {
    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "popUps")) return@execute
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        listOf(
            "WalkThroughStartDrawer",
            "CopilotModal2",
            "WalkThroughEndDrawer",
            "GoogleSurvey",
            "SearchSurvey",
            "RcmdSurveyCard",
            "RcmdSurveyDrawer",
            "Nps",
            "AppStoreRatingCard",
        ).forEach { bundle.returnAtStart(it, HermesBundle.Value.NULL) }
        bundle.returnAtStart("shouldPromptNotification", HermesBundle.Value.FALSE)
        bundle.returnAtStart("shouldShowSurvey", HermesBundle.Value.FALSE)
        file.writeBytes(bundle.toByteArray())
    }
}

private val hideDealPageTipsPatch = bytecodePatch {
    dependsOn(kouponWebFilterPatch)

    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "popUps")) return@execute
        enableWebFilter("hideTips")
    }
}

// Part of hidePromptsAndPopupsPatch: runs only when its "popUps" option is on.
internal val hidePopupsPatch = resourcePatch {
    dependsOn(requireNativeLibsPatch)

    dependsOn(hidePopupsInBundlePatch, hideDealPageTipsPatch, disableCodePushPatch)
}
