/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 * https://github.com/MorpheApp/morphe-patches/pull/3451
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-25
 */

package app.morphe.patches.youtube.player.icons

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

internal const val TOUCH_IMAGE_VIEW_CLASS =
    "Lcom/google/android/libraries/youtube/common/ui/TouchImageView;"

/**
 * Sets the icon of the play, pause and replay button for a new player state.
 */
internal object PlayPauseButtonStateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "accessibility_play"),
        resourceLiteral(ResourceType.STRING, "accessibility_pause"),
        resourceLiteral(ResourceType.STRING, "accessibility_replay"),
        resourceLiteral(ResourceType.DRAWABLE, "player_replay"),
        methodCall(definingClass = "Landroid/widget/ImageView;", name = "setImageDrawable"),
    )
)

/**
 * In the class that sets the player overlay icons from code.
 */
internal object PlayerOverlayControlsFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.ID, "player_control_previous_button"),
        resourceLiteral(ResourceType.ID, "player_control_next_button"),
    )
)

/**
 * Loads and tints an icon of the player controls.
 */
internal object PlayerControlIconLoaderFingerprint : Fingerprint(
    returnType = "Landroid/graphics/drawable/Drawable;",
    parameters = listOf(
        TOUCH_IMAGE_VIEW_CLASS,
        "I",
        "Landroid/graphics/drawable/Drawable;",
        "I",
    ),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/res/Resources;", name = "getDrawable"),
    )
)

/**
 * In the class that sets the icon of the captions button.
 */
internal object PlayerCaptionsButtonFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.DRAWABLE, "quantum_ic_closed_caption_white_24"),
        resourceLiteral(ResourceType.DRAWABLE, "quantum_ic_closed_caption_off_white_24"),
    )
)

/**
 * Sets the icon of the miniplayer's play, pause and replay button for a new player state.
 * The icon goes to a method of its own together with the content description it belongs to.
 * The states are set in the order replay, play, pause.
 */
internal object MiniplayerActionButtonStateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/Runnable;"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "accessibility_replay"),
        resourceLiteral(ResourceType.STRING, "accessibility_play"),
        resourceLiteral(ResourceType.STRING, "accessibility_pause"),
    )
)

/**
 * The getter of the miniplayer's close button, for a version where the parent view class
 * or the access flags of the fingerprint in the miniplayer patch changed.
 * The getter finds the close view, loads its icon and tints it before it is shown.
 */
internal object MiniplayerCloseButtonFallbackFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "modern_miniplayer_close"),
        checkCast("Landroid/widget/ImageView;"),
        methodCall(definingClass = "Landroid/graphics/drawable/Drawable;", name = "setTint"),
    )
)
