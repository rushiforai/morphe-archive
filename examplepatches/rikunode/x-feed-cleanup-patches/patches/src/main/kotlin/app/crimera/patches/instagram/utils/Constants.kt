/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.utils

object Constants {
    // Instagram classes.
    const val EDIT_MEDIA_INFO_FRAGMENT_CLASS = "Linstagram/features/creation/fragment/EditMediaInfoFragment;"
    const val EXTENDED_IMAGE_URL_CLASS = "Lcom/instagram/model/mediasize/ExtendedImageUrl;"
    const val MEDIA_OPTIONS_CLASS = "Lcom/instagram/feed/media/mediaoption/MediaOption\$Option;"
    const val USER_SESSION_CLASS = "Lcom/instagram/common/session/UserSession;"
    const val ORIGINAL_SOUND_DATA_INTF = "Lcom/instagram/api/schemas/OriginalSoundDataIntf;"
    const val MUSIC_INFO_CLASS = "Lcom/instagram/api/schemas/MusicInfo;"

    // Extension classes.
    private const val INTEGRATIONS_PACKAGE = "Lapp/morphe/extension/instagram"
    const val ENTITY_CLASS = "$INTEGRATIONS_PACKAGE/entity"
    const val PATCHES_DESCRIPTOR = "$INTEGRATIONS_PACKAGE/patches"
    const val DOWNLOAD_DESCRIPTOR = "$PATCHES_DESCRIPTOR/download"
    const val ACTIONBAR_DESCRIPTOR = "$PATCHES_DESCRIPTOR/actionbar/ActionBarPatch;"

    private const val OVERFLOW_MENU_BUTTON_CLASS = "$PATCHES_DESCRIPTOR/overflowMenuButton"
    const val ADD_REEL_BTN_OVERFLOW_MENU_BUTTON_CLASS = "$OVERFLOW_MENU_BUTTON_CLASS/reels/AddReelButton;"
    const val FEED_OVERFLOW_MENU_BUTTON_CLASS = "$OVERFLOW_MENU_BUTTON_CLASS/FeedButton;"
    const val ACTIVITY_SETTINGS_STATUS_CLASS = "$INTEGRATIONS_PACKAGE/settings/SettingsStatus;"
    const val SSTS_DESCRIPTOR = "invoke-static {}, $ACTIVITY_SETTINGS_STATUS_CLASS->%s()V"
    const val HOOK_FLAGS_DESCRIPTOR = "$PATCHES_DESCRIPTOR/devFlags/HookFlags;"
    const val LOAD_FLAGS_DESCRIPTOR = "invoke-static {}, $HOOK_FLAGS_DESCRIPTOR->%s()V"
}
