/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-11-16
 */

package app.morphe.extension.youtube.patches.components;

import static app.morphe.extension.youtube.utils.ExtendedUtils.IS_20_31_OR_GREATER;
import static app.morphe.extension.youtube.utils.ExtendedUtils.isSpoofingToLessThan;

import app.morphe.extension.shared.patches.components.ByteArrayFilterGroup;
import app.morphe.extension.shared.patches.components.ByteArrayFilterGroupList;
import app.morphe.extension.shared.patches.components.LazyBufferFilter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.utils.ByteTrieSearch;
import app.morphe.extension.shared.utils.StringTrieSearch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.ShortsPlayerState;

import java.util.Arrays;

@SuppressWarnings("unused")
public final class PlayerFlyoutMenuFilter extends LazyBufferFilter {
    private static boolean topFlyoutMenuVisible;
    public static boolean getTopFlyoutMenuVisible() {
        return topFlyoutMenuVisible;
    }
    public static void resetTopFlyoutMenuVisible() {
        topFlyoutMenuVisible = false;
    }

    private final ByteArrayFilterGroupList flyoutFilterGroupList = new ByteArrayFilterGroupList();

    private final ByteArrayFilterGroup videoPlayerSettingsQualityButton = new ByteArrayFilterGroup(
            null,
            "quality_sheet_header.e"
    );
    private final ByteArrayFilterGroup shortsPlayerSettingsCaptionsButton = new ByteArrayFilterGroup(
            null,
            "closed_captions"
    );
    private final ByteArrayFilterGroup premiumUpsell = new ByteArrayFilterGroup(
            null,
            "premium_upsell"
    );
    private final ByteArrayFilterGroup onTheGoUpsellParameters = new ByteArrayFilterGroup(
            null,
            // Base64 protobuf field 145.1 = 15 identifies this upsell; omit URL/base64 padding.
            "igkCCA8"
    );
    private final ByteArrayFilterGroup flyoutLoopVideoButton;
    private final ByteArrayFilterGroup qualityMenuButton;
    private final ByteArrayFilterGroup additionalSettingsMenu;
    private final ByteArrayFilterGroup byteArrayException;
    private final StringTrieSearch pathBuilderException = new StringTrieSearch();
    private final StringFilterGroup playerFlyoutMenu;
    private final StringFilterGroup divider;
    private final StringFilterGroup qualityFooter;

    public PlayerFlyoutMenuFilter() {
        flyoutLoopVideoButton = menuItemGroup(
                null,
                new int[]{444, 564}, // REPEAT1 outline / fill.
                "yt_outline_arrow_repeat_1_",
                "yt_fill_arrow_repeat_1_",
                "yt_outline_experimental_repeat1_",
                "yt_outline_experimental_play_circle_black_"
        );

        qualityMenuButton = menuItemGroup(
                null,
                new int[]{89}, // ADJUST.
                "yt_outline_adjust_",
                "quality_sheet_header.e",
                "yt_outline_experimental_adjust_"
        );

        additionalSettingsMenu = menuItemGroup(
                null,
                new int[]{173}, // GEAR, not More information's INFO_CIRCLE.
                "yt_outline_experimental_gear_",
                "yt_outline_gear_"
        );

        byteArrayException = new ByteArrayFilterGroup(
                null,
                "quality_sheet"
        );
        pathBuilderException.addPattern(
                "bottom_sheet_list_option.e"
        );

        divider = new StringFilterGroup(
                null,
                "|divider.e"
        );

        qualityFooter = new StringFilterGroup(
                Settings.HIDE_PLAYER_FLYOUT_MENU_QUALITY_FOOTER,
                "quality_sheet_footer.e"
        );

        playerFlyoutMenu = new StringFilterGroup(
                null,
                "overflow_menu_item.e"
        );

        // Using pathFilterGroupList due to new flyout panel(A/B)
        addPathCallbacks(
                divider,
                qualityFooter,
                playerFlyoutMenu
        );

        flyoutFilterGroupList.addAll(
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_AMBIENT,
                        new int[]{737}, // AMBIENT_MODE.
                        "yt_outline_experimental_ambient_mode_",
                        "yt_outline_screen_light_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_AUDIO_TRACK,
                        new int[]{322, 527}, // PERSON_AUDIO outline / fill.
                        "yt_outline_experimental_person_",
                        "yt_outline_person_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_CAPTIONS,
                        new int[]{314, 20}, // CLOSED_CAPTIONS outline / fill.
                        "closed_caption_",
                        "closed_captions_",
                        "yt_outline_experimental_closed_captions_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_HELP,
                        new int[]{181}, // HELP_CIRCLE.
                        "yt_outline_experimental_help_circle_",
                        "yt_outline_question_circle_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_LOCK_SCREEN,
                        new int[]{198}, // LOCK.
                        // Encoded /youtube/app/watch/lock_mode_state_entity_key in the root-row command.
                        "bG9ja19tb2RlX3N0YXRlX2VudGl0eV9rZXk",
                        "yt_outline_experimental_lock_",
                        "yt_outline_lock_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_ON_THE_GO,
                        new int[]{179, 630}, // HEADSET outline / fill.
                        "yt_outline_headset_",
                        "yt_outline_experimental_headset_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_MORE,
                        new int[]{189}, // INFO_CIRCLE, not the More submenu's GEAR.
                        "yt_outline_info_circle_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_PIP,
                        new int[]{546}, // PICTURE_IN_PICTURE.
                        "yt_fill_picture_in_picture_",
                        "yt_outline_picture_in_picture_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_PLAYBACK_SPEED,
                        new int[]{231}, // PLAY_CIRCLE_HALF_DASHED.
                        "yt_outline_play_arrow_half_circle_",
                        "playback_speed_sheet_content.e",
                        "playback_rate_selector_menu_sheet.e",
                        "yt_outline_experimental_play_circle_half_dashed_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_REPORT,
                        new int[]{169}, // FLAG.
                        "yt_outline_experimental_flag_",
                        "yt_outline_flag_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_STABLE_VOLUME,
                        new int[]{676, 677}, // STABLE_VOLUME outline / fill.
                        "yt_fill_experimental_stable_volume_",
                        "yt_outline_experimental_stable_volume_",
                        "volume_stable_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_SLEEP_TIMER,
                        new int[]{331, 305}, // SLEEP_TIMER outline / fill.
                        "yt_outline_experimental_sleep_timer_",
                        "yt_fill_experimental_sleep_timer_",
                        "sleep_timer_sheet_content.e",
                        "yt_outline_moon_z_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_STATS_FOR_NERDS,
                        new int[]{125}, // CHART_LINE.
                        "yt_outline_statistics_graph_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_WATCH_IN_VR,
                        new int[]{594}, // VR.
                        "yt_outline_experimental_vr_",
                        "yt_outline_vr_"
                ),
                menuItemGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_YT_MUSIC,
                        new int[]{292}, // YOUTUBE_MUSIC.
                        "yt_outline_experimental_youtube_music_",
                        "yt_outline_youtube_music_"
                ),
                new ByteArrayFilterGroup(
                        Settings.HIDE_PLAYER_FLYOUT_MENU_PREMIUM_CONTROLS,
                        "listen-first"
                )
        );
    }

    private static boolean shouldHideAdditionalSettings() {
        if (Settings.HIDE_PLAYER_FLYOUT_MENU_ADDITIONAL_SETTINGS.get()) {
            return true;
        }

        // Older spoofed flyouts share the quality and Additional settings icons.
        if (isSpoofingToLessThan("18.22.00")) {
            return false;
        }

        return Settings.HIDE_PLAYER_FLYOUT_MENU_LOOP.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_AMBIENT.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_STABLE_VOLUME.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_SLEEP_TIMER.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_YT_MUSIC.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_WATCH_IN_VR.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_HELP.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_STATS_FOR_NERDS.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_PIP.get()
                && Settings.HIDE_PLAYER_FLYOUT_MENU_PREMIUM_CONTROLS.get();
    }

    public static boolean hidePremiumControlsMenu(boolean original) {
        return original && !Settings.HIDE_PLAYER_FLYOUT_MENU_PREMIUM_CONTROLS.get();
    }

    static ByteArrayFilterGroup menuItemGroup(BooleanSetting setting, int[] icons, String... resourceNames) {
        byte[][] names = ByteTrieSearch.convertStringsToBytes(resourceNames);
        byte[][] patterns = Arrays.copyOf(names, names.length + icons.length);

        for (int index = 0; index < icons.length; index++) {
            patterns[names.length + index] = iconPattern(icons[index]);
        }

        return new ByteArrayFilterGroup(setting, patterns);
    }

    private static byte[] iconPattern(int icon) {
        int iconSize = 1;
        for (int remaining = icon >>> 7; remaining != 0; remaining >>>= 7) {
            iconSize++;
        }

        // Image.sources[1].customImageSource[6].youtubeIconSource[1002].clientResource[1].icon[1].
        // Match the complete source message, not a bare enum value or a localized title.
        byte[] pattern = new byte[10 + iconSize];
        pattern[0] = 0x0a;
        pattern[1] = (byte) (8 + iconSize);
        pattern[2] = 0x32;
        pattern[3] = (byte) (6 + iconSize);
        pattern[4] = (byte) 0xd2;
        pattern[5] = 0x3e;
        pattern[6] = (byte) (3 + iconSize);
        pattern[7] = 0x0a;
        pattern[8] = (byte) (1 + iconSize);
        pattern[9] = 0x08;

        for (int index = 10; index < pattern.length; index++, icon >>>= 7) {
            pattern[index] = (byte) ((icon & 0x7f) | (index + 1 < pattern.length ? 0x80 : 0));
        }

        return pattern;
    }

    @Override
    public boolean isFilteredLazy(String path, String identifier, String allValue, Buffer buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == playerFlyoutMenu) {
            // Overflow menu is always the start of the path.
            if (contentIndex != 0) {
                return false;
            }

            // Verify that the open flyout menu is the first one and not the 'others'
            // one, by checking the filtering of its first button (quality menu).
            // The path already starts with the overflow menu item, while the buffer
            // does not always contain it (20.21 keeps it in a separate buffer).
            boolean videoPlayerFlyout = PlayerType.getCurrent().isMaximizedOrFullscreen()
                    && videoPlayerSettingsQualityButton.check(buffer.get()).isFiltered();
            boolean shortsPlayerFlyout = ShortsPlayerState.getCurrent().isOpen()
                    && shortsPlayerSettingsCaptionsButton.check(buffer.get()).isFiltered();
            if (videoPlayerFlyout || shortsPlayerFlyout) {
                topFlyoutMenuVisible = true;
            }

            // Shorts also use this player flyout panel
            if (PlayerType.getCurrent().isNoneOrHidden() || ShortsPlayerState.getCurrent().isOpen()) {
                return Settings.HIDE_PLAYER_FLYOUT_MENU_CAPTIONS.get()
                        && shortsPlayerSettingsCaptionsButton.check(buffer.get()).isFiltered();
            }

            if (IS_20_31_OR_GREATER && pathBuilderException.matches(path)) {
                return false;
            }

            if (Settings.HIDE_PLAYER_FLYOUT_MENU_QUALITY.get()
                    && qualityMenuButton.check(buffer.get()).isFiltered()) {
                return true;
            }

            if (byteArrayException.check(buffer.get()).isFiltered()) {
                return false;
            }

            if (additionalSettingsMenu.check(buffer.get()).isFiltered() && shouldHideAdditionalSettings()) {
                return true;
            }

            if (Settings.HIDE_PLAYER_FLYOUT_ON_THE_GO.get()
                    && onTheGoUpsellParameters.check(buffer.get()).isFiltered()
                    && premiumUpsell.check(buffer.get()).isFiltered()) {
                return true;
            }

            if (Settings.HIDE_PLAYER_FLYOUT_MENU_LOOP.get() && flyoutLoopVideoButton.check(buffer.get()).isFiltered()) {
                return true;
            }

            return flyoutFilterGroupList.check(buffer.get()).isFiltered();
        } else if (matchedGroup == qualityFooter) {
            return true;
        } else if (matchedGroup == divider) {
            if (path.contains("captions_sheet_content.")) {
                return Settings.HIDE_PLAYER_FLYOUT_MENU_CAPTIONS_FOOTER.get();
            }

            if (path.contains("quick_quality_sheet_content.")
                    || path.contains("quality_sheet_content.")) {
                return Settings.HIDE_PLAYER_FLYOUT_MENU_QUALITY_FOOTER.get();
            }

            return path.contains("overflow_menu_item.e");
        }

        return false;
    }
}
