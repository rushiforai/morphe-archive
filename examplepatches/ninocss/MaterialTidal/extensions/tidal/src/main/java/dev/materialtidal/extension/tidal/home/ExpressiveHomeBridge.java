package dev.materialtidal.extension.tidal.home;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Pure Android-SDK-only bridge for Material 3 Expressive Homepage customization.
 * Provides geometry constants, Monet tonal colors, native Compose color longs,
 * pull-to-refresh enablement, and homepage declutter toggles.
 */
@SuppressWarnings("unused")
public final class ExpressiveHomeBridge {

    private ExpressiveHomeBridge() {
    }

    /**
     * Converts a standard 32-bit Android ARGB color int to Compose's packed 64-bit
     * {@code Color.value} representation ({@code ColorKt.Color(int)} shifts left by 32).
     */
    public static long argbToComposeColor(int argb) {
        return ((long) argb) << 32;
    }

    // ---- Shortcut Cards (2-column quick access row at top of Home) ----

    public static float getShortcutCardHeightDp() {
        return MaterialYouConfig.isExpressiveHomeEnabled()
                ? MaterialYouConfig.getHomeShortcutHeightDp()
                : 60f;
    }

    public static float getShortcutCardCornerRadiusDp() {
        return MaterialYouConfig.isExpressiveHomeEnabled()
                ? MaterialYouConfig.getHomeShortcutCornerRadiusDp()
                : 8f;
    }

    public static float getShortcutArtworkCornerRadiusDp() {
        if (!MaterialYouConfig.isExpressiveHomeEnabled()) {
            return 4f;
        }
        return Math.max(8f, MaterialYouConfig.getHomeShortcutCornerRadiusDp() - 6f);
    }

    public static long getShortcutCardBgCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getHomeShortcutCardBg());
    }

    // ---- Grid & Carousel Album / Playlist / Mix Artwork Corners ----

    public static float getGridCoverCornerRadiusDp() {
        return MaterialYouConfig.isExpressiveHomeEnabled()
                ? MaterialYouConfig.getHomeCoverCornerRadiusDp()
                : 2f;
    }

    // ---- Vibe Picker Filter Chips ----

    public static long getVibeChipSelectedBgCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getHomeVibeSelectedBg());
    }

    public static int getVibeChipSelectedTextArgb() {
        return MaterialYouColorEngine.getHomeVibeSelectedText();
    }

    public static long getVibeChipUnselectedBgCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getHomeVibeUnselectedBg());
    }

    public static int getVibeChipUnselectedTextArgb() {
        return MaterialYouColorEngine.getHomeVibeUnselectedText();
    }

    // ---- Homepage Top App Bar ----

    public static long getHomeTopBarBgCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getHomeTopBarBg());
    }

    public static long getHomeTopBarContentCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getHomeTopBarContent());
    }

    // ---- Native Pull-to-Refresh & Homepage Decluttering ----

    public static boolean isPullToRefreshEnabled() {
        return MaterialYouConfig.isHomePullToRefreshEnabled();
    }

    public static boolean shouldHideHeadlinersBanner() {
        return MaterialYouConfig.isHideHomeHeadlinersBanner();
    }

    public static boolean shouldHidePromoModules() {
        return MaterialYouConfig.isHideHomePromoModules();
    }

    public static boolean shouldHideMerchModules() {
        return MaterialYouConfig.isHideHomeMerchModules();
    }
}
