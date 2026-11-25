package dev.materialtidal.extension.tidal.theme;

import dev.materialtidal.extension.tidal.settings.PatchSettingsPrefs;

/**
 * Runtime configuration flags for Material You dynamic colors and Material 3 Expressive patches.
 *
 * <p>Build/patch-time option values are written into {@code default*()} and
 * {@code is*PatchInstalled()} methods via {@code returnEarly(...)}. Public getters consult
 * {@link PatchSettingsPrefs} so users can toggle and customize installed patches live inside
 * TIDAL's Settings screen.
 */
@SuppressWarnings("unused")
public final class MaterialYouConfig {

    public static final int STYLE_DARK_TONAL = 0;
    public static final int STYLE_PASTEL_SCREENSHOT = 1;
    public static final int STYLE_HIGH_CONTRAST = 2;

    public static final int PLAYER_STYLE_COVER_PASTEL = 0;
    public static final int PLAYER_STYLE_DARK_BLUR = 1;
    public static final int PLAYER_STYLE_RAW_COVER_BLUR = 2;

    public static final int MONET_STYLE_EXPRESSIVE = 0;
    public static final int MONET_STYLE_VIBRANT = 1;
    public static final int MONET_STYLE_SUBTLE = 2;

    public static final int PLAYLIST_ACCENT_ADAPTIVE = 0;
    public static final int PLAYLIST_ACCENT_MONET = 1;

    public static final int THEME_MODE_DARK = 0;
    public static final int THEME_MODE_SYSTEM = 1;
    public static final int THEME_MODE_LIGHT = 2;

    public static final int SHEET_CORNER_EXPRESSIVE = 0;
    public static final int SHEET_CORNER_EXTRA_EXPRESSIVE = 1;
    public static final int SHEET_CORNER_ROUNDED = 2;

    public static final int LYRICS_BLUR_SUBTLE = 0;
    public static final int LYRICS_BLUR_BALANCED = 1;
    public static final int LYRICS_BLUR_STRONG = 2;

    public static final int WAVEFORM_STYLE_CENTERED_BARS = 0;
    public static final int WAVEFORM_STYLE_BOTTOM_SPECTRUM = 1;
    public static final int WAVEFORM_STYLE_FILLED_RIBBON = 2;

    public static final int WAVEFORM_DENSITY_BOLD = 0;
    public static final int WAVEFORM_DENSITY_BALANCED = 1;
    public static final int WAVEFORM_DENSITY_FINE = 2;

    public static final int BLUR_INTENSITY_SUBTLE = 0;
    public static final int BLUR_INTENSITY_BALANCED = 1;
    public static final int BLUR_INTENSITY_RICH = 2;

    public static final int SEARCH_BAR_STYLE_PILL = 0;
    public static final int SEARCH_BAR_STYLE_SQUIRCLE = 1;

    private MaterialYouConfig() {
    }

    // ---- Installed Patch Markers (patched to true by each corresponding patch) ----

    public static boolean isPatchSettingsInstalled() {
        return false;
    }

    public static boolean isMaterialYouPatchInstalled() {
        return false;
    }

    public static boolean isExpressiveNavbarPatchInstalled() {
        return false;
    }

    public static boolean isExpressivePlayerPatchInstalled() {
        return false;
    }

    public static boolean isWaveformSeekbarPatchInstalled() {
        return false;
    }

    public static boolean isSyllableLyricsPatchInstalled() {
        return false;
    }

    public static boolean isExpressiveHomePatchInstalled() {
        return false;
    }

    public static boolean isExpressivePlaylistPatchInstalled() {
        return false;
    }

    public static boolean isExpressiveMediaPagesPatchInstalled() {
        return false;
    }

    public static boolean isExpressiveSearchPatchInstalled() {
        return false;
    }

    public static boolean isExpressiveSheetsPatchInstalled() {
        return false;
    }

    public static boolean isTrackSwipePatchInstalled() {
        return false;
    }

    public static boolean isCrossfadePatchInstalled() {
        return false;
    }

    public static boolean isLinnDsmPatchInstalled() {
        return false;
    }

    // ---- Material You Theme & Blur ----

    public static boolean isMaterialYouEnabled() {
        return true;
    }

    public static boolean defaultAmoledPureBlack() {
        return false;
    }

    public static boolean isAmoledPureBlack() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_AMOLED_PURE_BLACK, defaultAmoledPureBlack());
    }

    public static int defaultMonetPaletteStyle() {
        return MONET_STYLE_EXPRESSIVE;
    }

    public static int getMonetPaletteStyle() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_MONET_PALETTE_STYLE, defaultMonetPaletteStyle());
    }

    public static boolean isSystemThemeModeEnabled() {
        return false;
    }

    public static int defaultThemeMode() {
        return THEME_MODE_DARK;
    }

    public static int getThemeMode() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_THEME_MODE, defaultThemeMode());
    }

    public static String getWave2FieldMap() {
        return "";
    }

    public static String getWave2StaticColorsClass() {
        return "";
    }

    public static String getWave2StaticFieldMap() {
        return "";
    }

    public static boolean defaultExpressiveShapesEnabled() {
        return true;
    }

    public static boolean isExpressiveShapesEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_SHAPES, defaultExpressiveShapesEnabled());
    }

    public static boolean defaultExpressiveBlurEnabled() {
        return true;
    }

    public static boolean isExpressiveBlurEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_GLASS_BLUR, defaultExpressiveBlurEnabled());
    }

    public static int defaultBlurIntensity() {
        return BLUR_INTENSITY_BALANCED;
    }

    public static int getBlurIntensity() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_BLUR_INTENSITY, defaultBlurIntensity());
    }

    public static float getBlurIntensityMultiplier() {
        int intensity = getBlurIntensity();
        if (intensity == BLUR_INTENSITY_SUBTLE) {
            return 0.65f;
        }
        if (intensity == BLUR_INTENSITY_RICH) {
            return 1.35f;
        }
        return 1.0f;
    }

    // ---- Navbar & Mini-Player ----

    public static int defaultNavbarColorStyle() {
        return STYLE_DARK_TONAL;
    }

    public static int getNavbarColorStyle() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_NAVBAR_COLOR_STYLE, defaultNavbarColorStyle());
    }

    public static boolean defaultHideUploadTab() {
        return true;
    }

    public static boolean isHideUploadTab() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_HIDE_UPLOAD_TAB, defaultHideUploadTab());
    }

    public static boolean defaultMiniPlayerSwipeEnabled() {
        return true;
    }

    public static boolean isMiniPlayerSwipeEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_MINI_PLAYER_SWIPE, defaultMiniPlayerSwipeEnabled());
    }

    public static boolean defaultNavbarProgressiveBlurEnabled() {
        return true;
    }

    public static boolean isNavbarProgressiveBlurEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_NAVBAR_PROGRESSIVE_BLUR, defaultNavbarProgressiveBlurEnabled());
    }

    // ---- Full Player ----

    public static int defaultPlayerColorStyle() {
        return PLAYER_STYLE_COVER_PASTEL;
    }

    public static int getPlayerColorStyle() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_PLAYER_COLOR_STYLE, defaultPlayerColorStyle());
    }

    public static boolean defaultPlayerCoverSwipeEnabled() {
        return true;
    }

    public static boolean isPlayerCoverSwipeEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_PLAYER_COVER_SWIPE, defaultPlayerCoverSwipeEnabled());
    }

    public static boolean defaultPlayerSquigglySeekbarEnabled() {
        return true;
    }

    public static boolean isPlayerSquigglySeekbarEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_PLAYER_SQUIGGLY_SEEKBAR, defaultPlayerSquigglySeekbarEnabled());
    }

    public static boolean defaultExpressivePlayQueueEnabled() {
        return true;
    }

    public static boolean isExpressivePlayQueueEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_PLAY_QUEUE, defaultExpressivePlayQueueEnabled());
    }

    public static boolean defaultPlayerTabletDesktopLayoutEnabled() {
        return true;
    }

    public static boolean isPlayerTabletDesktopLayoutEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_PLAYER_TABLET_DESKTOP_LAYOUT, defaultPlayerTabletDesktopLayoutEnabled());
    }

    // ---- Waveform Seekbar ----

    /** Replaced by WaveformSeekbarPatch when enabled by the user. */
    public static boolean defaultPlayerWaveformSeekbarEnabled() {
        return false;
    }

    public static boolean isPlayerWaveformSeekbarEnabled() {
        return isWaveformSeekbarPatchInstalled()
                && PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_WAVEFORM_ENABLED, defaultPlayerWaveformSeekbarEnabled());
    }

    public static int defaultPlayerWaveformStyle() {
        return WAVEFORM_STYLE_CENTERED_BARS;
    }

    public static int getPlayerWaveformStyle() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_WAVEFORM_STYLE, defaultPlayerWaveformStyle());
    }

    public static int defaultPlayerWaveformBarDensity() {
        return WAVEFORM_DENSITY_BALANCED;
    }

    public static int getPlayerWaveformBarDensity() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_WAVEFORM_BAR_DENSITY, defaultPlayerWaveformBarDensity());
    }

    public static boolean defaultPlayerWaveformLiveReactiveEnabled() {
        return true;
    }

    public static boolean isPlayerWaveformLiveReactiveEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_WAVEFORM_LIVE_REACTIVE, defaultPlayerWaveformLiveReactiveEnabled());
    }

    public static int getPlayerWaveformBarCount() {
        switch (getPlayerWaveformBarDensity()) {
            case WAVEFORM_DENSITY_BOLD:
                return 36;
            case WAVEFORM_DENSITY_FINE:
                return 76;
            case WAVEFORM_DENSITY_BALANCED:
            default:
                return 56;
        }
    }

    // ---- Syllable Karaoke Lyrics ----

    public static boolean defaultSyllableLyricsEnabled() {
        return false;
    }

    public static boolean isSyllableLyricsEnabled() {
        return isSyllableLyricsPatchInstalled()
                && PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_SYLLABLE_LYRICS_ENABLED, defaultSyllableLyricsEnabled());
    }

    public static boolean defaultLyricsProgressiveBlurEnabled() {
        return false;
    }

    public static boolean isLyricsProgressiveBlurEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_LYRICS_PROGRESSIVE_BLUR, defaultLyricsProgressiveBlurEnabled());
    }

    public static int defaultLyricsBlurStrength() {
        return LYRICS_BLUR_BALANCED;
    }

    public static int getLyricsBlurStrength() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_LYRICS_BLUR_STRENGTH, defaultLyricsBlurStrength());
    }

    public static float getLyricsBlurMultiplier() {
        int s = getLyricsBlurStrength();
        if (s == LYRICS_BLUR_SUBTLE) {
            return 0.65f;
        }
        if (s == LYRICS_BLUR_STRONG) {
            return 1.45f;
        }
        return 1.0f;
    }

    // ---- Homepage ----

    public static boolean isExpressiveHomeEnabled() {
        return true;
    }

    public static int defaultHomeCoverCornerRadiusInt() {
        return 20;
    }

    public static int getHomeCoverCornerRadiusInt() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_HOME_COVER_RADIUS_DP, defaultHomeCoverCornerRadiusInt());
    }

    public static float getHomeCoverCornerRadiusDp() {
        return (float) getHomeCoverCornerRadiusInt();
    }

    public static int defaultHomeShortcutCornerRadiusInt() {
        return 20;
    }

    public static int getHomeShortcutCornerRadiusInt() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_HOME_COVER_RADIUS_DP, defaultHomeShortcutCornerRadiusInt());
    }

    public static float getHomeShortcutCornerRadiusDp() {
        return (float) getHomeShortcutCornerRadiusInt();
    }

    public static int getHomeShortcutHeightInt() {
        return 66;
    }

    public static float getHomeShortcutHeightDp() {
        return (float) getHomeShortcutHeightInt();
    }

    public static boolean defaultHomePullToRefreshEnabled() {
        return true;
    }

    public static boolean isHomePullToRefreshEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_HOME_PULL_TO_REFRESH, defaultHomePullToRefreshEnabled());
    }

    public static boolean defaultHideHomeHeadlinersBanner() {
        return true;
    }

    public static boolean isHideHomeHeadlinersBanner() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_HIDE_HOME_HEADLINERS, defaultHideHomeHeadlinersBanner());
    }

    public static boolean defaultHideHomePromoModules() {
        return true;
    }

    public static boolean isHideHomePromoModules() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_HIDE_HOME_PROMO, defaultHideHomePromoModules());
    }

    public static boolean defaultHideHomeMerchModules() {
        return true;
    }

    public static boolean isHideHomeMerchModules() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_HIDE_HOME_MERCH, defaultHideHomeMerchModules());
    }

    // ---- Playlist ----

    public static boolean isExpressivePlaylistEnabled() {
        return true;
    }

    public static int defaultPlaylistAccentMode() {
        return PLAYLIST_ACCENT_ADAPTIVE;
    }

    public static int getPlaylistAccentMode() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_PLAYLIST_ACCENT_MODE, defaultPlaylistAccentMode());
    }

    public static boolean defaultPlaylistHeroCoverFadeEnabled() {
        return true;
    }

    public static boolean isPlaylistHeroCoverFadeEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_PLAYLIST_HERO_FADE, defaultPlaylistHeroCoverFadeEnabled());
    }

    public static boolean defaultPlaylistTrackRowPolishEnabled() {
        return true;
    }

    public static boolean isPlaylistTrackRowPolishEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_PLAYLIST_TRACK_ROW_POLISH, defaultPlaylistTrackRowPolishEnabled());
    }

    public static boolean defaultHidePlaylistActionButtonsEnabled() {
        return false;
    }

    public static boolean isHidePlaylistActionButtonsEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_HIDE_PLAYLIST_ACTION_BUTTONS, defaultHidePlaylistActionButtonsEnabled());
    }

    // ---- Media Pages & Collection ----

    public static boolean defaultExpressiveAlbumsEnabled() {
        return true;
    }

    public static boolean isExpressiveAlbumsEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_ALBUMS, defaultExpressiveAlbumsEnabled());
    }

    public static boolean defaultExpressiveArtistsEnabled() {
        return true;
    }

    public static boolean isExpressiveArtistsEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_ARTISTS, defaultExpressiveArtistsEnabled());
    }

    public static boolean defaultExpressiveMyTracksEnabled() {
        return true;
    }

    public static boolean isExpressiveMyTracksEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_MY_TRACKS, defaultExpressiveMyTracksEnabled());
    }

    public static boolean defaultExpressiveCollectionEnabled() {
        return true;
    }

    public static boolean isExpressiveCollectionEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_COLLECTION, defaultExpressiveCollectionEnabled());
    }

    // ---- Sheets & Menus ----

    public static boolean isExpressiveSheetsEnabled() {
        return true;
    }

    public static int defaultSheetCornerStyle() {
        return SHEET_CORNER_EXPRESSIVE;
    }

    public static int getSheetCornerStyle() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_SHEET_CORNER_STYLE, defaultSheetCornerStyle());
    }

    public static boolean defaultGroupedContextMenuCardsEnabled() {
        return true;
    }

    public static boolean isGroupedContextMenuCardsEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_GROUPED_CONTEXT_MENU_CARDS, defaultGroupedContextMenuCardsEnabled());
    }

    public static boolean defaultExpressivePopupMenusEnabled() {
        return true;
    }

    public static boolean isExpressivePopupMenusEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_POPUP_MENUS, defaultExpressivePopupMenusEnabled());
    }

    public static boolean defaultExpressiveDialogsEnabled() {
        return true;
    }

    public static boolean isExpressiveDialogsEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_DIALOGS, defaultExpressiveDialogsEnabled());
    }

    // ---- Search ----

    public static boolean isExpressiveSearchEnabled() {
        return true;
    }

    public static int defaultSearchBarCornerStyle() {
        return SEARCH_BAR_STYLE_PILL;
    }

    public static int getSearchBarCornerStyle() {
        return PatchSettingsPrefs.getInt(PatchSettingsPrefs.OPT_SEARCH_BAR_STYLE, defaultSearchBarCornerStyle());
    }

    public static boolean defaultExpressiveSearchCardsEnabled() {
        return true;
    }

    public static boolean isExpressiveSearchCardsEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_SEARCH_CARDS, defaultExpressiveSearchCardsEnabled());
    }

    public static boolean defaultExpressiveSearchHeaderBlurEnabled() {
        return true;
    }

    public static boolean isExpressiveSearchHeaderBlurEnabled() {
        return PatchSettingsPrefs.getBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_SEARCH_HEADER_BLUR, defaultExpressiveSearchHeaderBlurEnabled());
    }
}
