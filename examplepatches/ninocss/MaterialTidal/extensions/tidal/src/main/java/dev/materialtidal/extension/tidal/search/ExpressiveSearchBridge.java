package dev.materialtidal.extension.tidal.search;

import android.view.View;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Pure Android-SDK-only Dalvik bridge for the Material 3 Expressive Search redesign
 * across the Search/Explore landing page, default XML UnifiedSearchView, and refactored
 * Jetpack Compose Wave 2 SearchScreen.
 */
@SuppressWarnings("unused")
public final class ExpressiveSearchBridge {

    private ExpressiveSearchBridge() {
    }

    /**
     * Converts a 32-bit Android ARGB color int to Compose's packed 64-bit {@code Color.value}.
     */
    public static long argbToComposeColor(int argb) {
        return ((long) argb) << 32;
    }

    // ---- Compose Wave 2 Search Tokens ----

    public static float getSearchBarCornerRadiusDp() {
        if (!MaterialYouConfig.isExpressiveSearchEnabled()) {
            return 8f;
        }
        return MaterialYouConfig.getSearchBarCornerStyle() == MaterialYouConfig.SEARCH_BAR_STYLE_SQUIRCLE
                ? 18f
                : 28f;
    }

    public static float getFilterChipCornerRadiusDp() {
        return MaterialYouConfig.isExpressiveSearchEnabled() ? 1000f : 12f;
    }

    public static long getSearchBarContainerColorCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getSurfaceContainerHigh());
    }

    public static long getSearchBarCursorColorCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getPrimaryAccent());
    }

    public static long getFilterChipSelectedBgColorCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getPrimaryAccent());
    }

    public static long getFilterChipSelectedTextColorCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getOnPrimary());
    }

    public static long getFilterChipUnselectedBgColorCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getSurfaceContainerHigh());
    }

    public static long getFilterChipUnselectedTextColorCompose() {
        return argbToComposeColor(MaterialYouColorEngine.getOnSurfaceVariant());
    }

    // ---- XML Search Lifecycle & Component Hooks ----

    public static void onTidalSearchViewInit(View searchView) {
        if (!MaterialYouConfig.isExpressiveSearchEnabled() || searchView == null) {
            return;
        }
        ExpressiveSearchStyler.styleTidalSearchView(searchView, false);
    }

    public static void onSearchLandingViewCreated(Object fragment, View rootView) {
        if (!MaterialYouConfig.isExpressiveSearchEnabled()) {
            return;
        }
        ExpressiveSearchPageController.onSearchLandingViewCreated(fragment, rootView);
    }

    public static void onSearchLandingDestroyView(Object fragment) {
        ExpressiveSearchPageController.onDestroyView(fragment);
    }

    public static void onUnifiedSearchViewCreated(Object fragment, View rootView) {
        if (!MaterialYouConfig.isExpressiveSearchEnabled()) {
            return;
        }
        ExpressiveSearchPageController.onUnifiedSearchViewCreated(fragment, rootView);
    }

    public static void onUnifiedSearchDestroyView(Object fragment) {
        ExpressiveSearchPageController.onDestroyView(fragment);
    }

    public static void onSearchFilterChipBound(View itemView, boolean selected) {
        if (!MaterialYouConfig.isExpressiveSearchEnabled() || itemView == null) {
            return;
        }
        ExpressiveSearchStyler.styleFilterChip(itemView, selected);
    }

    public static void onSearchSuggestionBound(View itemView) {
        if (!MaterialYouConfig.isExpressiveSearchEnabled() || itemView == null) {
            return;
        }
        ExpressiveSearchStyler.styleSuggestionRow(itemView);
    }
}
