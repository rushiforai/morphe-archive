/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.posts

import app.crimera.patches.instagram.utils.Constants.ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS
import app.morphe.patcher.Fingerprint

internal object FeedReplaceAudioDialogHelperFingerprint : Fingerprint(
    strings = listOf("FeedReplaceAudioDialogHelper"),
)

internal object AddReelButtonExtensionFingerprint : Fingerprint(
    definingClass = ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS,
    name = "addReelButton",
)
