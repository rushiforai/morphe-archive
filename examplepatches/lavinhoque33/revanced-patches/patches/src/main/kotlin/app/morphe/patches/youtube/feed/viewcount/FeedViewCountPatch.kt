/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3862
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24 and 2026-11-20
 */

package app.morphe.patches.youtube.feed.viewcount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.litho.context.conversionContextPatch
import app.morphe.patches.shared.textcomponent.hookTextComponent
import app.morphe.patches.shared.textcomponent.textComponentPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.Constants.FEED_PATH
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.feedcards.feedVideoCardsHookPatch
import app.morphe.patches.youtube.utils.patch.PatchList.FEED_VIEW_COUNT
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "$FEED_PATH/FeedViewCountPatch;"

private const val ON_FEED_SUBTITLE_CREATED =
    "$EXTENSION_CLASS->onFeedSubtitleCreated(Landroid/text/SpannableString;)Landroid/text/SpannableString;"

@Suppress("unused")
val feedViewCountPatch = bytecodePatch(
    name = FEED_VIEW_COUNT.title,
    description = FEED_VIEW_COUNT.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        // Finds the video cards. The view count is drawn by the extension.
        feedVideoCardsHookPatch,
        // Identifies the visible subtitle without editing the card's accessibility text.
        conversionContextPatch,
        textComponentPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        if (!hookFeedSubtitle()) {
            printWarn("Feed view count: the subtitle text hook was not found; keeping the original subtitles.")
            return@execute
        }

        hookTextComponent(EXTENSION_CLASS)
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: FEED",
                "SETTINGS: FEED_VIEW_COUNT",
                "SETTINGS: HIDE_FEED_SUBTITLE_METADATA"
            ),
            FEED_VIEW_COUNT
        )
    }
}

/**
 * The shortened view count is attached as a span to the text below the title when the text is created,
 * such as "Channel - 4.7M views - 2 days ago", so the card that draws the text knows its view count.
 */
context(_: BytecodePatchContext)
private fun hookFeedSubtitle(): Boolean {
    val fingerprint = FeedSubtitleFingerprint
    val subtitleMethod = fingerprint.methodOrNull ?: return false

    // The string passed to the final span call is the returned string, before its height is applied.
    val subtitleRegister = fingerprint.instructionMatches.last().getInstruction<FiveRegisterInstruction>().registerC
    val applyDimensionIndex = fingerprint.instructionMatches[2].index

    subtitleMethod.addInstructions(
        applyDimensionIndex,
        """
            invoke-static { v$subtitleRegister }, $ON_FEED_SUBTITLE_CREATED
            move-result-object v$subtitleRegister
        """
    )
    return true
}
