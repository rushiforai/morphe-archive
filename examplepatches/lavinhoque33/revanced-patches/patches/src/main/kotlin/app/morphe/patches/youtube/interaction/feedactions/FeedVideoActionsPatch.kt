/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3758
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24
 */

package app.morphe.patches.youtube.interaction.feedactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.general.downloads.downloadActionsPatch
import app.morphe.patches.youtube.utils.commandrouter.commandRouterHookPatch
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.feedcards.feedVideoCardsHookPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.patch.PatchList.FEED_VIDEO_ACTIONS
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/FeedVideoActionsPatch;"
private const val HOST_CLASS = "Lcom/facebook/litho/ComponentHost;"
private const val ACCESSIBILITY_NODE_INFO = "Landroid/view/accessibility/AccessibilityNodeInfo;"

/** Shares the same layout and touch callbacks even when only Add to queue is selected. */
internal val feedVideoActionsHookPatch = bytecodePatch(
    description = "Hooks the thumbnail actions of feed video cards.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        // Feed cards are Litho components. Draw their actions after the host's layout.
        FeedComponentHostLayoutFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_VOID).forEach { index ->
                addInstruction(
                    index,
                    "invoke-static { p0 }, $EXTENSION_CLASS->" +
                            "onComponentHostLayout(Lcom/facebook/litho/ComponentHost;)V"
                )
            }
        }

        // Only gestures that an extension action handles are withheld from the native card.
        FeedComponentHostTouchFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION_CLASS->onComponentHostTouch(Lcom/facebook/litho/ComponentHost;Landroid/view/MotionEvent;)Z
                move-result v0
                if-eqz v0, :original
                return v0
                :original
                nop
            """
        )
    }
}

/**
 * The AndroidX Litho provider builds its host node through View.onInitializeAccessibilityNodeInfo
 * and dispatches host actions through View.performAccessibilityAction. Keep the real and virtual
 * node tree and the existing delegate intact; only add a custom action on the bound host.
 */
context(context: BytecodePatchContext)
internal fun hookThumbnailQueueAccessibility(): Boolean {
    val host = context.mutableClassDefBy(FeedComponentHostTouchFingerprint.method.definingClass)
    val superclass = host.superclass ?: return false
    val initialize = "onInitializeAccessibilityNodeInfo"
    val parameters = listOf(ACCESSIBILITY_NODE_INFO)
    if (host.methods.any { it.name == initialize && it.parameterTypes == parameters }) {
        return false
    }

    val perform = host.methods.singleOrNull {
        it.name == "performAccessibilityAction" &&
                it.parameterTypes == listOf("I", "Landroid/os/Bundle;") && it.returnType == "Z"
    } ?: return false
    // p0 and p1 must fit the 35c invoke and v0 must be a local. All supported hosts have five registers.
    if ((perform.implementation?.registerCount ?: 0) !in 4..16) return false

    host.methods.add(
        ImmutableMethod(
            host.type,
            initialize,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            val action = "addQueueAccessibilityAction($HOST_CLASS$ACCESSIBILITY_NODE_INFO)V"
            addInstructionsWithLabels(
                0,
                """
                    invoke-super { p0, p1 }, $superclass->$initialize($ACCESSIBILITY_NODE_INFO)V
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->$action
                    return-void
                """,
            )
        },
    )

    perform.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1 }, $EXTENSION_CLASS->performQueueAccessibilityAction(${HOST_CLASS}I)Z
            move-result v0
            if-eqz v0, :original
            return v0
            :original
            nop
        """,
    )
    return true
}

@Suppress("unused")
val feedVideoActionsPatch = bytecodePatch(
    name = "Feed video actions",
    description = "Adds a Watch later button to video thumbnails in feeds, " +
            "and opens the video menu by tapping and holding anywhere on a video.",
) {
    dependsOn(
        feedVideoActionsHookPatch,
        settingsPatch,
        // Finds the video id of the menu, to learn the description of the menu button.
        downloadActionsPatch,
        // Runs the commands of the Watch later button.
        commandRouterHookPatch,
        // Finds the video of each card, to hide the button while it plays in the feed.
        feedVideoCardsHookPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf("PREFERENCE_SCREEN: FEED", "SETTINGS: FEED_VIDEO_ACTIONS"),
            FEED_VIDEO_ACTIONS,
        )
        setExtensionIsPatchIncluded(EXTENSION_CLASS)
    }
}
