package dev.materialtidal.extension.tidal.settings;

import android.content.Context;
import android.content.SharedPreferences;

import dev.materialtidal.extension.tidal.gestures.TrackSwipeConfig;
import dev.materialtidal.extension.tidal.linn.LinnConfig;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Lock-free runtime preference overrides for MaterialTidal patch options.
 *
 * <p>Reads use a single volatile snapshot reference and primitive array indexing so hot render
 * and audio paths incur zero allocations. All Android {@link SharedPreferences} access is isolated
 * inside {@link Store} so pure-JVM unit tests can load config classes without Android stubs.
 */
@SuppressWarnings("unused")
public final class PatchSettingsPrefs {

    public static final int OPT_THEME_MODE = 0;
    public static final int OPT_AMOLED_PURE_BLACK = 1;
    public static final int OPT_MONET_PALETTE_STYLE = 2;
    public static final int OPT_EXPRESSIVE_SHAPES = 3;
    public static final int OPT_EXPRESSIVE_GLASS_BLUR = 4;
    public static final int OPT_BLUR_INTENSITY = 5;

    public static final int OPT_NAVBAR_COLOR_STYLE = 6;
    public static final int OPT_HIDE_UPLOAD_TAB = 7;
    public static final int OPT_MINI_PLAYER_SWIPE = 8;
    public static final int OPT_NAVBAR_PROGRESSIVE_BLUR = 9;

    public static final int OPT_PLAYER_COLOR_STYLE = 10;
    public static final int OPT_PLAYER_COVER_SWIPE = 11;
    public static final int OPT_PLAYER_SQUIGGLY_SEEKBAR = 12;
    public static final int OPT_EXPRESSIVE_PLAY_QUEUE = 13;
    public static final int OPT_PLAYER_TABLET_DESKTOP_LAYOUT = 14;

    public static final int OPT_WAVEFORM_ENABLED = 15;
    public static final int OPT_WAVEFORM_STYLE = 16;
    public static final int OPT_WAVEFORM_BAR_DENSITY = 17;
    public static final int OPT_WAVEFORM_LIVE_REACTIVE = 18;

    public static final int OPT_SYLLABLE_LYRICS_ENABLED = 19;
    public static final int OPT_LYRICS_PROGRESSIVE_BLUR = 20;
    public static final int OPT_LYRICS_BLUR_STRENGTH = 21;

    public static final int OPT_SWIPE_RIGHT_ACTION = 22;
    public static final int OPT_SWIPE_LEFT_ACTION = 23;
    public static final int OPT_SWIPE_HAPTIC = 24;
    public static final int OPT_SWIPE_THRESHOLD_DP = 25;

    public static final int OPT_HOME_COVER_RADIUS_DP = 26;
    public static final int OPT_HOME_PULL_TO_REFRESH = 27;
    public static final int OPT_HIDE_HOME_HEADLINERS = 28;
    public static final int OPT_HIDE_HOME_PROMO = 29;
    public static final int OPT_HIDE_HOME_MERCH = 30;

    public static final int OPT_PLAYLIST_ACCENT_MODE = 31;
    public static final int OPT_PLAYLIST_HERO_FADE = 32;
    public static final int OPT_PLAYLIST_TRACK_ROW_POLISH = 33;
    public static final int OPT_HIDE_PLAYLIST_ACTION_BUTTONS = 34;

    public static final int OPT_EXPRESSIVE_ALBUMS = 35;
    public static final int OPT_EXPRESSIVE_ARTISTS = 36;
    public static final int OPT_EXPRESSIVE_MY_TRACKS = 37;
    public static final int OPT_EXPRESSIVE_COLLECTION = 38;

    public static final int OPT_SEARCH_BAR_STYLE = 39;
    public static final int OPT_EXPRESSIVE_SEARCH_CARDS = 40;
    public static final int OPT_EXPRESSIVE_SEARCH_HEADER_BLUR = 41;

    public static final int OPT_SHEET_CORNER_STYLE = 42;
    public static final int OPT_GROUPED_CONTEXT_MENU_CARDS = 43;
    public static final int OPT_EXPRESSIVE_POPUP_MENUS = 44;
    public static final int OPT_EXPRESSIVE_DIALOGS = 45;

    public static final int OPT_LINN_AUDIO_QUALITY = 46;
    public static final int OPT_LINN_STREAM_MODE = 47;
    public static final int OPT_LINN_AUTO_WAKE = 48;
    public static final int OPT_LINN_MANUAL_IP = 49;

    public static final int OPT_COUNT = 50;

    private static final int TYPE_NONE = 0;
    private static final int TYPE_BOOL = 1;
    private static final int TYPE_INT = 2;
    private static final int TYPE_STRING = 3;

    private static final String PREFS_NAME = "materialtidal_patch_settings";

    private static final String[] KEY_NAMES = new String[]{
            "theme_mode",
            "amoled_pure_black",
            "monet_palette_style",
            "expressive_shapes",
            "expressive_glass_blur",
            "blur_intensity",
            "navbar_color_style",
            "hide_upload_tab",
            "mini_player_swipe",
            "navbar_progressive_blur",
            "player_color_style",
            "player_cover_swipe",
            "player_squiggly_seekbar",
            "expressive_play_queue",
            "player_tablet_desktop_layout",
            "waveform_enabled",
            "waveform_style",
            "waveform_bar_density",
            "waveform_live_reactive",
            "syllable_lyrics_enabled",
            "lyrics_progressive_blur",
            "lyrics_blur_strength",
            "swipe_right_action",
            "swipe_left_action",
            "swipe_haptic",
            "swipe_threshold_dp",
            "home_cover_radius_dp",
            "home_pull_to_refresh",
            "hide_home_headliners",
            "hide_home_promo",
            "hide_home_merch",
            "playlist_accent_mode",
            "playlist_hero_fade",
            "playlist_track_row_polish",
            "hide_playlist_action_buttons",
            "expressive_albums",
            "expressive_artists",
            "expressive_my_tracks",
            "expressive_collection",
            "search_bar_style",
            "expressive_search_cards",
            "expressive_search_header_blur",
            "sheet_corner_style",
            "grouped_context_menu_cards",
            "expressive_popup_menus",
            "expressive_dialogs",
            "linn_audio_quality",
            "linn_stream_mode",
            "linn_auto_wake",
            "linn_manual_ip",
    };

    private static final int[] KEY_TYPES = new int[]{
            TYPE_INT,    // 0  theme_mode
            TYPE_BOOL,   // 1  amoled_pure_black
            TYPE_INT,    // 2  monet_palette_style
            TYPE_BOOL,   // 3  expressive_shapes
            TYPE_BOOL,   // 4  expressive_glass_blur
            TYPE_INT,    // 5  blur_intensity
            TYPE_INT,    // 6  navbar_color_style
            TYPE_BOOL,   // 7  hide_upload_tab
            TYPE_BOOL,   // 8  mini_player_swipe
            TYPE_BOOL,   // 9  navbar_progressive_blur
            TYPE_INT,    // 10 player_color_style
            TYPE_BOOL,   // 11 player_cover_swipe
            TYPE_BOOL,   // 12 player_squiggly_seekbar
            TYPE_BOOL,   // 13 expressive_play_queue
            TYPE_BOOL,   // 14 player_tablet_desktop_layout
            TYPE_BOOL,   // 15 waveform_enabled
            TYPE_INT,    // 16 waveform_style
            TYPE_INT,    // 17 waveform_bar_density
            TYPE_BOOL,   // 18 waveform_live_reactive
            TYPE_BOOL,   // 19 syllable_lyrics_enabled
            TYPE_BOOL,   // 20 lyrics_progressive_blur
            TYPE_INT,    // 21 lyrics_blur_strength
            TYPE_INT,    // 22 swipe_right_action
            TYPE_INT,    // 23 swipe_left_action
            TYPE_BOOL,   // 24 swipe_haptic
            TYPE_INT,    // 25 swipe_threshold_dp
            TYPE_INT,    // 26 home_cover_radius_dp
            TYPE_BOOL,   // 27 home_pull_to_refresh
            TYPE_BOOL,   // 28 hide_home_headliners
            TYPE_BOOL,   // 29 hide_home_promo
            TYPE_BOOL,   // 30 hide_home_merch
            TYPE_INT,    // 31 playlist_accent_mode
            TYPE_BOOL,   // 32 playlist_hero_fade
            TYPE_BOOL,   // 33 playlist_track_row_polish
            TYPE_BOOL,   // 34 hide_playlist_action_buttons
            TYPE_BOOL,   // 35 expressive_albums
            TYPE_BOOL,   // 36 expressive_artists
            TYPE_BOOL,   // 37 expressive_my_tracks
            TYPE_BOOL,   // 38 expressive_collection
            TYPE_INT,    // 39 search_bar_style
            TYPE_BOOL,   // 40 expressive_search_cards
            TYPE_BOOL,   // 41 expressive_search_header_blur
            TYPE_INT,    // 42 sheet_corner_style
            TYPE_BOOL,   // 43 grouped_context_menu_cards
            TYPE_BOOL,   // 44 expressive_popup_menus
            TYPE_BOOL,   // 45 expressive_dialogs
            TYPE_INT,    // 46 linn_audio_quality
            TYPE_INT,    // 47 linn_stream_mode
            TYPE_BOOL,   // 48 linn_auto_wake
            TYPE_STRING, // 49 linn_manual_ip
    };

    private static final class OverrideSnapshot {
        final boolean[] hasOverride = new boolean[OPT_COUNT];
        final boolean[] boolValues = new boolean[OPT_COUNT];
        final int[] intValues = new int[OPT_COUNT];
        final String[] stringValues = new String[OPT_COUNT];

        OverrideSnapshot copy() {
            OverrideSnapshot c = new OverrideSnapshot();
            System.arraycopy(hasOverride, 0, c.hasOverride, 0, OPT_COUNT);
            System.arraycopy(boolValues, 0, c.boolValues, 0, OPT_COUNT);
            System.arraycopy(intValues, 0, c.intValues, 0, OPT_COUNT);
            System.arraycopy(stringValues, 0, c.stringValues, 0, OPT_COUNT);
            return c;
        }
    }

    private static volatile OverrideSnapshot overrides = new OverrideSnapshot();
    private static volatile Object prefsRef;
    private static volatile boolean initialized;

    private PatchSettingsPrefs() {
    }

    public static void init(Object contextObj) {
        if (contextObj == null) {
            return;
        }
        synchronized (PatchSettingsPrefs.class) {
            if (initialized && prefsRef != null) {
                return;
            }
            Store.loadFromContext(contextObj);
            initialized = true;
        }
    }

    public static void ensureInitialized(Object contextObj) {
        if (!initialized && contextObj != null) {
            init(contextObj);
        }
    }

    public static boolean getBoolean(int optId, boolean fallback) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return fallback;
        }
        OverrideSnapshot snap = overrides;
        return snap.hasOverride[optId] ? snap.boolValues[optId] : fallback;
    }

    public static void setBoolean(int optId, boolean value) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return;
        }
        synchronized (PatchSettingsPrefs.class) {
            OverrideSnapshot next = overrides.copy();
            next.hasOverride[optId] = true;
            next.boolValues[optId] = value;
            overrides = next;
            Object sp = prefsRef;
            if (sp != null) {
                Store.putBoolean(sp, KEY_NAMES[optId], value);
            }
        }
    }

    public static int getInt(int optId, int fallback) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return fallback;
        }
        OverrideSnapshot snap = overrides;
        return snap.hasOverride[optId] ? snap.intValues[optId] : fallback;
    }

    public static void setInt(int optId, int value) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return;
        }
        synchronized (PatchSettingsPrefs.class) {
            OverrideSnapshot next = overrides.copy();
            next.hasOverride[optId] = true;
            next.intValues[optId] = value;
            overrides = next;
            Object sp = prefsRef;
            if (sp != null) {
                Store.putInt(sp, KEY_NAMES[optId], value);
            }
        }
    }

    public static String getString(int optId, String fallback) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return fallback;
        }
        OverrideSnapshot snap = overrides;
        if (!snap.hasOverride[optId]) {
            return fallback;
        }
        String val = snap.stringValues[optId];
        return val != null ? val : "";
    }

    public static void setString(int optId, String value) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return;
        }
        String sanitized = value != null ? value : "";
        synchronized (PatchSettingsPrefs.class) {
            OverrideSnapshot next = overrides.copy();
            next.hasOverride[optId] = true;
            next.stringValues[optId] = sanitized;
            overrides = next;
            Object sp = prefsRef;
            if (sp != null) {
                Store.putString(sp, KEY_NAMES[optId], sanitized);
            }
        }
    }

    public static boolean hasOverride(int optId) {
        if (optId < 0 || optId >= OPT_COUNT) {
            return false;
        }
        return overrides.hasOverride[optId];
    }

    public static void clearOption(int optId) {
        clearOptions(optId);
    }

    public static void clearOptions(int... optIds) {
        if (optIds == null || optIds.length == 0) {
            return;
        }
        synchronized (PatchSettingsPrefs.class) {
            OverrideSnapshot next = overrides.copy();
            int validCount = 0;
            String[] keys = new String[optIds.length];
            for (int optId : optIds) {
                if (optId >= 0 && optId < OPT_COUNT) {
                    next.hasOverride[optId] = false;
                    next.boolValues[optId] = false;
                    next.intValues[optId] = 0;
                    next.stringValues[optId] = null;
                    keys[validCount++] = KEY_NAMES[optId];
                }
            }
            if (validCount == 0) {
                return;
            }
            overrides = next;
            Object sp = prefsRef;
            if (sp != null) {
                String[] trimmed = new String[validCount];
                System.arraycopy(keys, 0, trimmed, 0, validCount);
                Store.removeKeys(sp, trimmed);
            }
        }
    }

    public static int countOverriddenIn(int... optIds) {
        if (optIds == null || optIds.length == 0) {
            return 0;
        }
        OverrideSnapshot snap = overrides;
        int count = 0;
        for (int optId : optIds) {
            if (optId >= 0 && optId < OPT_COUNT && snap.hasOverride[optId]) {
                count++;
            }
        }
        return count;
    }

    public static void resetAll() {
        synchronized (PatchSettingsPrefs.class) {
            overrides = new OverrideSnapshot();
            Object sp = prefsRef;
            if (sp != null) {
                Store.clearAll(sp);
            }
        }
    }

    /**
     * Counts how many installed patch options currently differ from their build-time defaults.
     */
    public static int getModifiedCount() {
        int count = 0;
        if (MaterialYouConfig.isSystemThemeModeEnabled()) {
            if (MaterialYouConfig.getThemeMode() != MaterialYouConfig.defaultThemeMode()) count++;
        }
        if (MaterialYouConfig.isMaterialYouPatchInstalled()) {
            if (MaterialYouConfig.isAmoledPureBlack() != MaterialYouConfig.defaultAmoledPureBlack()) count++;
            if (MaterialYouConfig.getMonetPaletteStyle() != MaterialYouConfig.defaultMonetPaletteStyle()) count++;
            if (MaterialYouConfig.isExpressiveShapesEnabled() != MaterialYouConfig.defaultExpressiveShapesEnabled()) count++;
            if (MaterialYouConfig.isExpressiveBlurEnabled() != MaterialYouConfig.defaultExpressiveBlurEnabled()) count++;
            if (MaterialYouConfig.getBlurIntensity() != MaterialYouConfig.defaultBlurIntensity()) count++;
        }
        if (MaterialYouConfig.isExpressiveNavbarPatchInstalled()) {
            if (MaterialYouConfig.getNavbarColorStyle() != MaterialYouConfig.defaultNavbarColorStyle()) count++;
            if (MaterialYouConfig.isHideUploadTab() != MaterialYouConfig.defaultHideUploadTab()) count++;
            if (MaterialYouConfig.isMiniPlayerSwipeEnabled() != MaterialYouConfig.defaultMiniPlayerSwipeEnabled()) count++;
            if (MaterialYouConfig.isNavbarProgressiveBlurEnabled() != MaterialYouConfig.defaultNavbarProgressiveBlurEnabled()) count++;
        }
        if (MaterialYouConfig.isExpressivePlayerPatchInstalled()) {
            if (MaterialYouConfig.getPlayerColorStyle() != MaterialYouConfig.defaultPlayerColorStyle()) count++;
            if (MaterialYouConfig.isPlayerCoverSwipeEnabled() != MaterialYouConfig.defaultPlayerCoverSwipeEnabled()) count++;
            if (MaterialYouConfig.isPlayerSquigglySeekbarEnabled() != MaterialYouConfig.defaultPlayerSquigglySeekbarEnabled()) count++;
            if (MaterialYouConfig.isExpressivePlayQueueEnabled() != MaterialYouConfig.defaultExpressivePlayQueueEnabled()) count++;
            if (MaterialYouConfig.isPlayerTabletDesktopLayoutEnabled() != MaterialYouConfig.defaultPlayerTabletDesktopLayoutEnabled()) count++;
        }
        if (MaterialYouConfig.isWaveformSeekbarPatchInstalled()) {
            if (MaterialYouConfig.isPlayerWaveformSeekbarEnabled() != MaterialYouConfig.defaultPlayerWaveformSeekbarEnabled()) count++;
            if (MaterialYouConfig.getPlayerWaveformStyle() != MaterialYouConfig.defaultPlayerWaveformStyle()) count++;
            if (MaterialYouConfig.getPlayerWaveformBarDensity() != MaterialYouConfig.defaultPlayerWaveformBarDensity()) count++;
            if (MaterialYouConfig.isPlayerWaveformLiveReactiveEnabled() != MaterialYouConfig.defaultPlayerWaveformLiveReactiveEnabled()) count++;
        }
        if (MaterialYouConfig.isSyllableLyricsPatchInstalled()) {
            if (MaterialYouConfig.isSyllableLyricsEnabled() != MaterialYouConfig.defaultSyllableLyricsEnabled()) count++;
            if (MaterialYouConfig.isLyricsProgressiveBlurEnabled() != MaterialYouConfig.defaultLyricsProgressiveBlurEnabled()) count++;
            if (MaterialYouConfig.getLyricsBlurStrength() != MaterialYouConfig.defaultLyricsBlurStrength()) count++;
        }
        if (MaterialYouConfig.isTrackSwipePatchInstalled()) {
            if (TrackSwipeConfig.getSwipeRightAction() != TrackSwipeConfig.defaultSwipeRightAction()) count++;
            if (TrackSwipeConfig.getSwipeLeftAction() != TrackSwipeConfig.defaultSwipeLeftAction()) count++;
            if (TrackSwipeConfig.isHapticEnabled() != TrackSwipeConfig.defaultHapticEnabled()) count++;
            if (TrackSwipeConfig.getSwipeThresholdDp() != TrackSwipeConfig.defaultSwipeThresholdDp()) count++;
        }
        if (MaterialYouConfig.isExpressiveHomePatchInstalled()) {
            if (MaterialYouConfig.getHomeCoverCornerRadiusInt() != MaterialYouConfig.defaultHomeCoverCornerRadiusInt()) count++;
            if (MaterialYouConfig.isHomePullToRefreshEnabled() != MaterialYouConfig.defaultHomePullToRefreshEnabled()) count++;
            if (MaterialYouConfig.isHideHomeHeadlinersBanner() != MaterialYouConfig.defaultHideHomeHeadlinersBanner()) count++;
            if (MaterialYouConfig.isHideHomePromoModules() != MaterialYouConfig.defaultHideHomePromoModules()) count++;
            if (MaterialYouConfig.isHideHomeMerchModules() != MaterialYouConfig.defaultHideHomeMerchModules()) count++;
        }
        if (MaterialYouConfig.isExpressivePlaylistPatchInstalled()) {
            if (MaterialYouConfig.getPlaylistAccentMode() != MaterialYouConfig.defaultPlaylistAccentMode()) count++;
            if (MaterialYouConfig.isPlaylistHeroCoverFadeEnabled() != MaterialYouConfig.defaultPlaylistHeroCoverFadeEnabled()) count++;
            if (MaterialYouConfig.isPlaylistTrackRowPolishEnabled() != MaterialYouConfig.defaultPlaylistTrackRowPolishEnabled()) count++;
            if (MaterialYouConfig.isHidePlaylistActionButtonsEnabled() != MaterialYouConfig.defaultHidePlaylistActionButtonsEnabled()) count++;
        }
        if (MaterialYouConfig.isExpressiveMediaPagesPatchInstalled()) {
            if (MaterialYouConfig.isExpressiveAlbumsEnabled() != MaterialYouConfig.defaultExpressiveAlbumsEnabled()) count++;
            if (MaterialYouConfig.isExpressiveArtistsEnabled() != MaterialYouConfig.defaultExpressiveArtistsEnabled()) count++;
            if (MaterialYouConfig.isExpressiveMyTracksEnabled() != MaterialYouConfig.defaultExpressiveMyTracksEnabled()) count++;
            if (MaterialYouConfig.isExpressiveCollectionEnabled() != MaterialYouConfig.defaultExpressiveCollectionEnabled()) count++;
        }
        if (MaterialYouConfig.isExpressiveSearchPatchInstalled()) {
            if (MaterialYouConfig.getSearchBarCornerStyle() != MaterialYouConfig.defaultSearchBarCornerStyle()) count++;
            if (MaterialYouConfig.isExpressiveSearchCardsEnabled() != MaterialYouConfig.defaultExpressiveSearchCardsEnabled()) count++;
            if (MaterialYouConfig.isExpressiveSearchHeaderBlurEnabled() != MaterialYouConfig.defaultExpressiveSearchHeaderBlurEnabled()) count++;
        }
        if (MaterialYouConfig.isExpressiveSheetsPatchInstalled()) {
            if (MaterialYouConfig.getSheetCornerStyle() != MaterialYouConfig.defaultSheetCornerStyle()) count++;
            if (MaterialYouConfig.isGroupedContextMenuCardsEnabled() != MaterialYouConfig.defaultGroupedContextMenuCardsEnabled()) count++;
            if (MaterialYouConfig.isExpressivePopupMenusEnabled() != MaterialYouConfig.defaultExpressivePopupMenusEnabled()) count++;
            if (MaterialYouConfig.isExpressiveDialogsEnabled() != MaterialYouConfig.defaultExpressiveDialogsEnabled()) count++;
        }
        if (MaterialYouConfig.isLinnDsmPatchInstalled()) {
            if (LinnConfig.getAudioQualityMode() != LinnConfig.defaultAudioQualityMode()) count++;
            if (LinnConfig.getStreamDeliveryMode() != LinnConfig.defaultStreamDeliveryMode()) count++;
            if (LinnConfig.isAutoWakeAndSwitchEnabled() != LinnConfig.defaultAutoWakeAndSwitchEnabled()) count++;
            String defIp = LinnConfig.defaultManualDeviceIp();
            String curIp = LinnConfig.getManualDeviceIp();
            if (curIp == null) curIp = "";
            if (defIp == null) defIp = "";
            if (!curIp.equals(defIp)) count++;
        }
        return count;
    }

    /**
     * Isolates Android {@link SharedPreferences} references from outer class initialization.
     */
    private static final class Store {
        static void loadFromContext(Object contextObj) {
            if (!(contextObj instanceof Context)) {
                return;
            }
            Context context = (Context) contextObj;
            Context appCtx = context.getApplicationContext();
            if (appCtx == null) {
                appCtx = context;
            }
            SharedPreferences sp = appCtx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            prefsRef = sp;
            OverrideSnapshot snap = new OverrideSnapshot();
            for (int i = 0; i < OPT_COUNT; i++) {
                String key = KEY_NAMES[i];
                if (!sp.contains(key)) {
                    continue;
                }
                try {
                    switch (KEY_TYPES[i]) {
                        case TYPE_BOOL:
                            snap.boolValues[i] = sp.getBoolean(key, false);
                            snap.hasOverride[i] = true;
                            break;
                        case TYPE_INT:
                            snap.intValues[i] = sp.getInt(key, 0);
                            snap.hasOverride[i] = true;
                            break;
                        case TYPE_STRING:
                            snap.stringValues[i] = sp.getString(key, "");
                            snap.hasOverride[i] = true;
                            break;
                        default:
                            break;
                    }
                } catch (Throwable ignored) {
                }
            }
            overrides = snap;
        }

        static void putBoolean(Object spObj, String key, boolean value) {
            try {
                ((SharedPreferences) spObj).edit().putBoolean(key, value).apply();
            } catch (Throwable ignored) {
            }
        }

        static void putInt(Object spObj, String key, int value) {
            try {
                ((SharedPreferences) spObj).edit().putInt(key, value).apply();
            } catch (Throwable ignored) {
            }
        }

        static void putString(Object spObj, String key, String value) {
            try {
                ((SharedPreferences) spObj).edit().putString(key, value).apply();
            } catch (Throwable ignored) {
            }
        }

        static void remove(Object spObj, String key) {
            try {
                ((SharedPreferences) spObj).edit().remove(key).apply();
            } catch (Throwable ignored) {
            }
        }

        static void removeKeys(Object spObj, String[] keys) {
            if (keys == null || keys.length == 0) {
                return;
            }
            try {
                SharedPreferences.Editor editor = ((SharedPreferences) spObj).edit();
                for (String key : keys) {
                    if (key != null) {
                        editor.remove(key);
                    }
                }
                editor.apply();
            } catch (Throwable ignored) {
            }
        }

        static void clearAll(Object spObj) {
            try {
                ((SharedPreferences) spObj).edit().clear().apply();
            } catch (Throwable ignored) {
            }
        }
    }
}
