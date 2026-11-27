/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXACT_POST_TIME
import app.fakh.patches.linkedin.shared.Constants.EXPAND_POSTS
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.FOCUS_MODE
import app.fakh.patches.linkedin.shared.Constants.HIDE_CELEBRATIONS
import app.fakh.patches.linkedin.shared.Constants.HIDE_DEGREE
import app.fakh.patches.linkedin.shared.Constants.HIDE_FEED_JOBS
import app.fakh.patches.linkedin.shared.Constants.HIDE_GAMES
import app.fakh.patches.linkedin.shared.Constants.HIDE_NEW_POSTS_PILL
import app.fakh.patches.linkedin.shared.Constants.HIDE_POST_FOLLOW
import app.fakh.patches.linkedin.shared.Constants.HIDE_PREMIUM
import app.fakh.patches.linkedin.shared.Constants.HIDE_PROMOTED_JOBS
import app.fakh.patches.linkedin.shared.Constants.HIDE_RECOMMENDATIONS
import app.fakh.patches.linkedin.shared.Constants.HIDE_REPOSTS
import app.fakh.patches.linkedin.shared.Constants.HIDE_SUGGESTED
import app.fakh.patches.linkedin.shared.Constants.HIDE_TRANSLATION
import app.fakh.patches.linkedin.shared.Constants.HIDE_VIDEO_POSTS
import app.fakh.patches.linkedin.shared.Constants.MUTED_AUTHORS_LIST
import app.fakh.patches.linkedin.shared.Constants.MUTED_WORDS_LIST
import app.fakh.patches.linkedin.shared.Constants.NEWEST_COMMENTS
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.fakh.patches.shared.Feature
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"

// The filtering itself lives in the extension's SduiComponentFilter; these patches switch it on.

@Suppress("unused")
val hideSuggestedPostsPatch = patch(
    name = "Hide suggested posts",
    description = "Removes \"Suggested\" posts from outside your network from the feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Ads & promotions")
    dependsOn(sduiComponentFilterPatch)
    execute { register(HIDE_SUGGESTED) }
}

@Suppress("unused")
val hidePromotedJobsPatch = patch(
    name = "Hide promoted jobs",
    description = "Removes promoted job listings from the Jobs tab and job search.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Ads & promotions")
    dependsOn(sduiComponentFilterPatch)
    execute { register(HIDE_PROMOTED_JOBS) }
}

@Suppress("unused")
val expandPostsPatch = patch(
    name = "Expand posts",
    description = "Shows posts expanded by default. Tapping the text collapses them.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Posts")
    dependsOn(sduiComponentFilterPatch)
    execute { register(EXPAND_POSTS) }
}

/** A patch that adds one switch of the SDUI filter to the Fakh Patches page [category]. */
private fun filterSwitchPatch(name: String, description: String, category: String, feature: Feature) =
    patch(name = name, description = description, default = true) {
        compatibleWith(COMPATIBILITY_LINKEDIN)
        category(category)
        dependsOn(sduiComponentFilterPatch)
        execute { register(feature) }
    }

@Suppress("unused")
val mutedWordsPatch = filterSwitchPatch(
    "Muted words",
    "Hides posts with the words or phrases you list.",
    "Feed",
    MUTED_WORDS_LIST,
)

@Suppress("unused")
val mutedAuthorsPatch = filterSwitchPatch(
    "Muted authors",
    "Hides posts by the people and pages you list.",
    "Feed",
    MUTED_AUTHORS_LIST,
)

@Suppress("unused")
val hideCelebrationsPatch = filterSwitchPatch(
    "Hide celebration posts",
    "Hides work anniversaries and new jobs from the feed.",
    "Feed",
    HIDE_CELEBRATIONS,
)

@Suppress("unused")
val hideFeedJobsPatch = filterSwitchPatch(
    "Hide job posts",
    "Hides job cards from the feed.",
    "Feed",
    HIDE_FEED_JOBS,
)

@Suppress("unused")
val hideRepostsPatch = filterSwitchPatch(
    "Hide network activity",
    "Hides the likes, comments and reposts of people you know from the feed.",
    "Feed",
    HIDE_REPOSTS,
)

@Suppress("unused")
val hideVideoPostsPatch = filterSwitchPatch(
    "Hide video posts",
    "Hides video posts from the feed.",
    "Feed",
    HIDE_VIDEO_POSTS,
)

@Suppress("unused")
val hideRecommendationsPatch = filterSwitchPatch(
    "Hide \"Recommended for you\"",
    "Hides the lists of people and pages to follow from the feed.",
    "Feed",
    HIDE_RECOMMENDATIONS,
)

@Suppress("unused")
val hideGamesPatch = filterSwitchPatch(
    "Hide puzzle games",
    "Hides the puzzle games from the feed.",
    "Feed",
    HIDE_GAMES,
)

@Suppress("unused")
val hideNewPostsPillPatch = filterSwitchPatch(
    "Hide the \"New posts\" button",
    "Hides the \"New posts\" button above the feed.",
    "Feed",
    HIDE_NEW_POSTS_PILL,
)

@Suppress("unused")
val hideTranslationPatch = filterSwitchPatch(
    "Hide \"Show translation\"",
    "Hides \"Show translation\" under posts and comments.",
    "Posts",
    HIDE_TRANSLATION,
)

@Suppress("unused")
val hideEngagementCountsPatch = filterSwitchPatch(
    "Hide engagement counts",
    "Hides the like, comment and repost counts of posts.",
    "Posts",
    FOCUS_MODE,
)

@Suppress("unused")
val hidePostFollowPatch = filterSwitchPatch(
    "Hide Follow and Connect",
    "Hides the Follow and Connect buttons on posts and comments.",
    "Posts",
    HIDE_POST_FOLLOW,
)

@Suppress("unused")
val hideDegreePatch = filterSwitchPatch(
    "Hide connection degree",
    "Hides the 1st, 2nd and 3rd next to names.",
    "Posts",
    HIDE_DEGREE,
)

@Suppress("unused")
val exactPostTimePatch = filterSwitchPatch(
    "Show exact post time",
    "Shows the date and time of a post instead of 3d or 5h.",
    "Posts",
    EXACT_POST_TIME,
)

@Suppress("unused")
val newestCommentsPatch = filterSwitchPatch(
    "Most recent comments first",
    "Opens comments sorted by Most recent.",
    "Posts",
    NEWEST_COMMENTS,
)

/**
 * The HomeNavPanelFeature lambda that reads HomeNavPanelAggregateResponse.upsellSlotContent and builds the
 * "Try Premium" card in the native "Me" panel (inlined there from HomeNavPanelTransformer.toPremiumViewData
 * in 4.1.1264). With a null slot it shows nothing for free members (and still shows "Access my Premium" for
 * actual Premium members).
 */
private object NavPanelPremiumFingerprint : Fingerprint(
    name = "invoke",
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelAggregateResponse;",
            name = "upsellSlotContent",
        ),
    )
)

@Suppress("unused")
val hidePremiumUpsellsPatch = patch(
    name = "Hide Premium upsells",
    description = "Removes Premium and AI upsell cards and banners, including on profiles and the profile menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Ads & promotions")
    dependsOn(sduiComponentFilterPatch)
    execute {
        register(HIDE_PREMIUM)

        NavPanelPremiumFingerprint.let {
            val index = it.instructionMatches.first().index
            val register = it.method.getInstruction<TwoRegisterInstruction>(index).registerA
            it.method.addInstructions(
                index + 1,
                """
                    invoke-static { v$register }, $SETTINGS_CLASS->navPanelUpsell(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, Lcom/linkedin/android/pegasus/dash/gen/voyager/dash/premium/PremiumUpsellSlotContent;
                """
            )
        }
    }
}
