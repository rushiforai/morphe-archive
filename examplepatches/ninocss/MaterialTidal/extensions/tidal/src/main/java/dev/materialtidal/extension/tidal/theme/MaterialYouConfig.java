package dev.materialtidal.extension.tidal.theme;

/**
 * Runtime configuration flags for Material You dynamic colors and the
 * Material 3 Expressive navbar / floating mini-player redesign.
 * Getter bodies are patched at build/patch time via {@code returnEarly(...)}.
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

    private MaterialYouConfig() {
    }

    public static boolean isMaterialYouEnabled() {
        return true;
    }

    public static boolean isAmoledPureBlack() {
        return false;
    }

    public static int getMonetPaletteStyle() {
        return MONET_STYLE_EXPRESSIVE;
    }

    public static boolean isSystemThemeModeEnabled() {
        return false;
    }

    public static int getThemeMode() {
        return THEME_MODE_DARK;
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

    public static boolean isExpressiveShapesEnabled() {
        return true;
    }

    public static int getNavbarColorStyle() {
        return STYLE_DARK_TONAL;
    }

    public static boolean isHideUploadTab() {
        return true;
    }

    public static boolean isMiniPlayerSwipeEnabled() {
        return true;
    }

    public static int getPlayerColorStyle() {
        return PLAYER_STYLE_COVER_PASTEL;
    }

    public static boolean isPlayerCoverSwipeEnabled() {
        return true;
    }

    public static boolean isPlayerSquigglySeekbarEnabled() {
        return true;
    }

    public static boolean isExpressivePlayQueueEnabled() {
        return true;
    }

    public static boolean isExpressiveHomeEnabled() {
        return true;
    }

    public static int getHomeCoverCornerRadiusInt() {
        return 20;
    }

    public static float getHomeCoverCornerRadiusDp() {
        return (float) getHomeCoverCornerRadiusInt();
    }

    public static int getHomeShortcutCornerRadiusInt() {
        return 20;
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

    public static boolean isHomePullToRefreshEnabled() {
        return true;
    }

    public static boolean isHideHomeHeadlinersBanner() {
        return true;
    }

    public static boolean isHideHomePromoModules() {
        return true;
    }

    public static boolean isHideHomeMerchModules() {
        return true;
    }

    public static boolean isExpressivePlaylistEnabled() {
        return true;
    }

    public static int getPlaylistAccentMode() {
        return PLAYLIST_ACCENT_ADAPTIVE;
    }

    public static boolean isPlaylistHeroCoverFadeEnabled() {
        return true;
    }

    public static boolean isPlaylistTrackRowPolishEnabled() {
        return true;
    }

    public static boolean isExpressiveAlbumsEnabled() {
        return true;
    }

    public static boolean isExpressiveArtistsEnabled() {
        return true;
    }

    public static boolean isExpressiveMyTracksEnabled() {
        return true;
    }

    public static boolean isExpressiveCollectionEnabled() {
        return true;
    }

    public static boolean isExpressiveSheetsEnabled() {
        return true;
    }

    public static int getSheetCornerStyle() {
        return SHEET_CORNER_EXPRESSIVE;
    }

    public static boolean isGroupedContextMenuCardsEnabled() {
        return true;
    }

    public static boolean isExpressivePopupMenusEnabled() {
        return true;
    }

    public static boolean isExpressiveDialogsEnabled() {
        return true;
    }

    public static final int BLUR_INTENSITY_SUBTLE = 0;
    public static final int BLUR_INTENSITY_BALANCED = 1;
    public static final int BLUR_INTENSITY_RICH = 2;

    public static final int SEARCH_BAR_STYLE_PILL = 0;
    public static final int SEARCH_BAR_STYLE_SQUIRCLE = 1;

    public static boolean isExpressiveSearchEnabled() {
        return true;
    }

    public static int getSearchBarCornerStyle() {
        return SEARCH_BAR_STYLE_PILL;
    }

    public static boolean isExpressiveSearchCardsEnabled() {
        return true;
    }

    public static boolean isExpressiveSearchHeaderBlurEnabled() {
        return true;
    }

    public static boolean isExpressiveBlurEnabled() {
        return true;
    }

    public static boolean isNavbarProgressiveBlurEnabled() {
        return true;
    }

    public static int getBlurIntensity() {
        return BLUR_INTENSITY_BALANCED;
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
}
