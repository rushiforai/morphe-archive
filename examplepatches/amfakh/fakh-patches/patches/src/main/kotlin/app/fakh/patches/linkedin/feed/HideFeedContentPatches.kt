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
import app.fakh.patches.linkedin.shared.Constants.NEWEST_COMMENTS
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
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
    category("Feed")
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
    category("Ads")
    dependsOn(sduiComponentFilterPatch)
    execute { register(HIDE_PROMOTED_JOBS) }
}

@Suppress("unused")
val expandPostsPatch = patch(
    name = "Expand posts",
    description = "Adds an option in Fakh Patches (off by default) to show posts expanded by default. Tapping the text collapses them.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    dependsOn(sduiComponentFilterPatch)
    execute { register(EXPAND_POSTS) }
}

@Suppress("unused")
val feedFiltersPatch = patch(
    name = "Feed filters",
    description = "Adds feed filters to Fakh Patches, such as muted words, celebrations, job posts and video posts. " +
        "All off by default.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    dependsOn(sduiComponentFilterPatch)
    execute { register(FOCUS_MODE, HIDE_CELEBRATIONS, HIDE_FEED_JOBS, HIDE_REPOSTS, HIDE_VIDEO_POSTS, HIDE_RECOMMENDATIONS, HIDE_GAMES, HIDE_NEW_POSTS_PILL, HIDE_TRANSLATION, HIDE_POST_FOLLOW, HIDE_DEGREE, EXACT_POST_TIME, NEWEST_COMMENTS) }
}

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
    category("Ads")
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
