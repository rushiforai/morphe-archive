package dev.materialtidal.extension.tidal.settings;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.InputType;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import dev.materialtidal.extension.tidal.crossfade.CrossfadeBottomSheet;
import dev.materialtidal.extension.tidal.crossfade.CrossfadeTidalBridge;
import dev.materialtidal.extension.tidal.gestures.TrackSwipeConfig;
import dev.materialtidal.extension.tidal.linn.LinnConfig;
import dev.materialtidal.extension.tidal.navbar.ExpressiveScaffoldBridge;
import dev.materialtidal.extension.tidal.player.ExpressivePlayerBridge;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.Choice;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.ExpressiveChipWrapLayout;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.ExpressiveSegmentedControl;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.ExpressiveSliderView;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.ExpressiveSwitchView;
import dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.Palette;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.applyGroupedCardBg;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.createRoundedDrawable;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.dp;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.dpf;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.withAlpha;
import static dev.materialtidal.extension.tidal.settings.PatchSettingsWidgets.wrapRipple;

/**
 * Full-screen Instagram-style Material 3 Expressive Settings screen accessible from TIDAL's
 * main Settings menu. Features flat surfaces (zero gradients, zero top drop shadow), quiet
 * section headers, bare monochrome vector icons, clean root-to-subpage navigation, and
 * spring-animated Material 3 Expressive toggles and segmented controls.
 */
@SuppressWarnings("unused")
public final class PatchSettingsBottomSheet {

    private static final int PAGE_ROOT = 0;
    private static final int PAGE_THEME_COLORS = 101;
    private static final int PAGE_THEME_GLASS = 102;
    private static final int PAGE_PLAYER_NOW = 201;
    private static final int PAGE_PLAYER_WAVEFORM = 202;
    private static final int PAGE_PLAYER_LYRICS = 203;
    private static final int PAGE_NAV_DOCK = 301;
    private static final int PAGE_NAV_SWIPE = 302;
    private static final int PAGE_SCREEN_HOME = 401;
    private static final int PAGE_SCREEN_PLAYLIST = 402;
    private static final int PAGE_SCREEN_MEDIA = 403;
    private static final int PAGE_SCREEN_SEARCH = 404;
    private static final int PAGE_SCREEN_SHEETS = 405;
    private static final int PAGE_LINN = 501;

    private static final int RELOAD_NONE = 0;
    private static final int RELOAD_ACTIVITY = 1;
    private static final int RELOAD_APP_RESTART = 2;

    private static final int[] OPT_IDS_THEME_COLORS = {
            PatchSettingsPrefs.OPT_THEME_MODE,
            PatchSettingsPrefs.OPT_AMOLED_PURE_BLACK,
            PatchSettingsPrefs.OPT_MONET_PALETTE_STYLE,
            PatchSettingsPrefs.OPT_EXPRESSIVE_SHAPES,
    };
    private static final int[] OPT_IDS_THEME_GLASS = {
            PatchSettingsPrefs.OPT_EXPRESSIVE_GLASS_BLUR,
            PatchSettingsPrefs.OPT_BLUR_INTENSITY,
    };
    private static final int[] OPT_IDS_PLAYER_NOW = {
            PatchSettingsPrefs.OPT_PLAYER_COLOR_STYLE,
            PatchSettingsPrefs.OPT_PLAYER_COVER_SWIPE,
            PatchSettingsPrefs.OPT_PLAYER_SQUIGGLY_SEEKBAR,
            PatchSettingsPrefs.OPT_EXPRESSIVE_PLAY_QUEUE,
            PatchSettingsPrefs.OPT_PLAYER_TABLET_DESKTOP_LAYOUT,
    };
    private static final int[] OPT_IDS_PLAYER_WAVEFORM = {
            PatchSettingsPrefs.OPT_WAVEFORM_ENABLED,
            PatchSettingsPrefs.OPT_WAVEFORM_STYLE,
            PatchSettingsPrefs.OPT_WAVEFORM_BAR_DENSITY,
            PatchSettingsPrefs.OPT_WAVEFORM_LIVE_REACTIVE,
    };
    private static final int[] OPT_IDS_PLAYER_LYRICS = {
            PatchSettingsPrefs.OPT_SYLLABLE_LYRICS_ENABLED,
            PatchSettingsPrefs.OPT_LYRICS_PROGRESSIVE_BLUR,
            PatchSettingsPrefs.OPT_LYRICS_BLUR_STRENGTH,
    };
    private static final int[] OPT_IDS_NAV_DOCK = {
            PatchSettingsPrefs.OPT_NAVBAR_COLOR_STYLE,
            PatchSettingsPrefs.OPT_HIDE_UPLOAD_TAB,
            PatchSettingsPrefs.OPT_MINI_PLAYER_SWIPE,
            PatchSettingsPrefs.OPT_NAVBAR_PROGRESSIVE_BLUR,
    };
    private static final int[] OPT_IDS_NAV_SWIPE = {
            PatchSettingsPrefs.OPT_SWIPE_RIGHT_ACTION,
            PatchSettingsPrefs.OPT_SWIPE_LEFT_ACTION,
            PatchSettingsPrefs.OPT_SWIPE_HAPTIC,
            PatchSettingsPrefs.OPT_SWIPE_THRESHOLD_DP,
    };
    private static final int[] OPT_IDS_SCREEN_HOME = {
            PatchSettingsPrefs.OPT_HOME_COVER_RADIUS_DP,
            PatchSettingsPrefs.OPT_HOME_PULL_TO_REFRESH,
            PatchSettingsPrefs.OPT_HIDE_HOME_HEADLINERS,
            PatchSettingsPrefs.OPT_HIDE_HOME_PROMO,
            PatchSettingsPrefs.OPT_HIDE_HOME_MERCH,
    };
    private static final int[] OPT_IDS_SCREEN_PLAYLIST = {
            PatchSettingsPrefs.OPT_PLAYLIST_ACCENT_MODE,
            PatchSettingsPrefs.OPT_PLAYLIST_HERO_FADE,
            PatchSettingsPrefs.OPT_PLAYLIST_TRACK_ROW_POLISH,
            PatchSettingsPrefs.OPT_HIDE_PLAYLIST_ACTION_BUTTONS,
    };
    private static final int[] OPT_IDS_SCREEN_MEDIA = {
            PatchSettingsPrefs.OPT_EXPRESSIVE_ALBUMS,
            PatchSettingsPrefs.OPT_EXPRESSIVE_ARTISTS,
            PatchSettingsPrefs.OPT_EXPRESSIVE_MY_TRACKS,
            PatchSettingsPrefs.OPT_EXPRESSIVE_COLLECTION,
    };
    private static final int[] OPT_IDS_SCREEN_SEARCH = {
            PatchSettingsPrefs.OPT_SEARCH_BAR_STYLE,
            PatchSettingsPrefs.OPT_EXPRESSIVE_SEARCH_CARDS,
            PatchSettingsPrefs.OPT_EXPRESSIVE_SEARCH_HEADER_BLUR,
    };
    private static final int[] OPT_IDS_SCREEN_SHEETS = {
            PatchSettingsPrefs.OPT_SHEET_CORNER_STYLE,
            PatchSettingsPrefs.OPT_GROUPED_CONTEXT_MENU_CARDS,
            PatchSettingsPrefs.OPT_EXPRESSIVE_POPUP_MENUS,
            PatchSettingsPrefs.OPT_EXPRESSIVE_DIALOGS,
    };
    private static final int[] OPT_IDS_LINN = {
            PatchSettingsPrefs.OPT_LINN_AUDIO_QUALITY,
            PatchSettingsPrefs.OPT_LINN_STREAM_MODE,
            PatchSettingsPrefs.OPT_LINN_AUTO_WAKE,
            PatchSettingsPrefs.OPT_LINN_MANUAL_IP,
    };

    private static WeakReference<Dialog> activeDialogRef = new WeakReference<>(null);

    private PatchSettingsBottomSheet() {
    }

    private interface BoolGetter {
        boolean get();
    }

    private interface BoolSetter {
        void set(boolean value);
    }

    private interface IntGetter {
        int get();
    }

    private interface IntSetter {
        void set(int value);
    }

    private static final class ScreenController {
        final Activity activity;
        final Dialog dialog;
        final Palette palette;
        final float density;
        final boolean de;

        int currentPage = PAGE_ROOT;
        int rootScrollY = 0;
        int pendingReloadLevel = RELOAD_NONE;

        FrameLayout rootContainer;
        LinearLayout topAppBar;
        FrameLayout backBtn;
        ImageView backIconView;
        TextView titleView;
        FrameLayout resetBtn;
        ImageView resetIconView;

        ScrollView scrollView;
        LinearLayout contentContainer;

        LinearLayout reloadBanner;
        ImageView reloadIconView;
        TextView reloadHintView;
        TextView reloadActionBtn;

        ScreenController(Activity activity, Dialog dialog, Palette palette, float density) {
            this.activity = activity;
            this.dialog = dialog;
            this.palette = palette;
            this.density = density;
            this.de = isGermanLocale();
        }

        boolean handleBackNavigation() {
            if (currentPage != PAGE_ROOT) {
                currentPage = PAGE_ROOT;
                renderChrome();
                rebuildContent();
                if (scrollView != null) {
                    final int restoreY = rootScrollY;
                    scrollView.post(() -> scrollView.scrollTo(0, restoreY));
                }
                animateContentTransition(-1);
                return true;
            }
            return false;
        }

        void openSubPage(int pageId) {
            if (scrollView != null && currentPage == PAGE_ROOT) {
                rootScrollY = scrollView.getScrollY();
            }
            currentPage = pageId;
            renderChrome();
            rebuildContent();
            if (scrollView != null) {
                scrollView.scrollTo(0, 0);
            }
            animateContentTransition(1);
        }

        void animateContentTransition(int slideDir) {
            if (contentContainer == null) {
                return;
            }
            contentContainer.animate().cancel();
            float startDx = slideDir == 0 ? 0f : slideDir * dpf(density, 28f);
            contentContainer.setTranslationX(startDx);
            contentContainer.setAlpha(0.15f);
            contentContainer.animate()
                    .translationX(0f)
                    .alpha(1f)
                    .setDuration(190L)
                    .setInterpolator(new PathInterpolator(0.05f, 0.7f, 0.1f, 1.0f))
                    .start();
        }

        void onLiveOptionUpdated(int reloadLevel) {
            if (reloadLevel > pendingReloadLevel) {
                pendingReloadLevel = reloadLevel;
            }
            try {
                ExpressiveScaffoldBridge.refreshActiveViews();
            } catch (Throwable ignored) {
            }
            try {
                ExpressivePlayerBridge.refreshActivePlayer();
            } catch (Throwable ignored) {
            }
            PatchSettingsBridge.notifySettingsItemChanged();
            renderChrome();
        }

        void onPaletteOrResetChanged(int reloadLevel, boolean refreshPalette) {
            int savedScrollY = scrollView != null ? scrollView.getScrollY() : 0;
            if (reloadLevel > pendingReloadLevel) {
                pendingReloadLevel = reloadLevel;
            }
            if (refreshPalette) {
                try {
                    MaterialYouColorEngine.refreshAfterConfigChange(activity);
                } catch (Throwable ignored) {
                }
                palette.reload(activity);
                Window window = dialog.getWindow();
                if (window != null) {
                    window.setBackgroundDrawable(new ColorDrawable(palette.surfaceBase));
                    try {
                        MaterialYouColorEngine.applySystemBarAppearance(window, palette.lightMode);
                    } catch (Throwable ignored) {
                    }
                }
            } else {
                try {
                    ExpressiveScaffoldBridge.refreshActiveViews();
                } catch (Throwable ignored) {
                }
                try {
                    ExpressivePlayerBridge.refreshActivePlayer();
                } catch (Throwable ignored) {
                }
            }
            PatchSettingsBridge.notifySettingsItemChanged();
            renderChrome();
            rebuildContent();
            if (scrollView != null && savedScrollY > 0) {
                scrollView.post(() -> scrollView.scrollTo(0, savedScrollY));
            }
        }

        void onWindowRegainedFocus() {
            renderChrome();
            if (currentPage == PAGE_ROOT) {
                int savedY = scrollView != null ? scrollView.getScrollY() : 0;
                rebuildContent();
                if (scrollView != null && savedY > 0) {
                    scrollView.post(() -> scrollView.scrollTo(0, savedY));
                }
            }
        }

        void renderChrome() {
            if (rootContainer != null) {
                rootContainer.setBackgroundColor(palette.surfaceBase);
            }
            if (topAppBar != null) {
                topAppBar.setBackgroundColor(palette.surfaceBase);
                topAppBar.setElevation(0f);
                topAppBar.setOutlineProvider(null);
            }

            if (backBtn != null && backIconView != null) {
                backIconView.setImageDrawable(
                        PatchSettingsIcons.create(PatchSettingsIcons.ICON_BACK, dp(density, 22f), palette.onSurface)
                );
                backBtn.setBackground(wrapRipple(
                        new ColorDrawable(Color.TRANSPARENT),
                        palette.onSurface,
                        dpf(density, 22f)
                ));
            }

            if (titleView != null) {
                titleView.setText(getPageTitle(currentPage));
                titleView.setTextColor(palette.onSurface);
            }

            int scopeCount = currentPage == PAGE_ROOT
                    ? PatchSettingsPrefs.getModifiedCount()
                    : countModifiedInPage(currentPage);
            if (resetBtn != null && resetIconView != null) {
                resetBtn.setVisibility(scopeCount > 0 ? View.VISIBLE : View.GONE);
                resetIconView.setImageDrawable(
                        PatchSettingsIcons.create(PatchSettingsIcons.ICON_RESET, dp(density, 20f), palette.onSurfaceVar)
                );
                resetBtn.setBackground(wrapRipple(
                        new ColorDrawable(Color.TRANSPARENT),
                        palette.onSurface,
                        dpf(density, 22f)
                ));
            }

            renderReloadBanner();
        }

        void renderReloadBanner() {
            if (reloadBanner == null) {
                return;
            }
            if (pendingReloadLevel == RELOAD_NONE) {
                reloadBanner.setVisibility(View.GONE);
                return;
            }
            reloadBanner.setVisibility(View.VISIBLE);
            boolean restart = pendingReloadLevel >= RELOAD_APP_RESTART;

            reloadBanner.setBackground(createRoundedDrawable(
                    palette.surfaceHigh,
                    0,
                    dpf(density, 20f),
                    0f
            ));
            reloadBanner.setElevation(0f);

            if (reloadIconView != null) {
                reloadIconView.setImageDrawable(PatchSettingsIcons.create(
                        restart ? PatchSettingsIcons.ICON_RESTART : PatchSettingsIcons.ICON_RELOAD,
                        dp(density, 20f),
                        palette.primary
                ));
            }
            if (reloadHintView != null) {
                reloadHintView.setText(restart
                        ? (de ? "App-Neustart nötig für alle Änderungen" : "App restart needed for all changes")
                        : (de ? "Ansicht neu laden für volle Wirkung" : "Reload UI to apply everywhere"));
                reloadHintView.setTextColor(palette.onSurface);
            }
            if (reloadActionBtn != null) {
                reloadActionBtn.setText(restart
                        ? (de ? "Neu starten" : "Restart")
                        : (de ? "Neu laden" : "Reload"));
                reloadActionBtn.setTextColor(palette.onPrimary);
                GradientDrawable btnBg = createRoundedDrawable(palette.primary, 0, dpf(density, 100f), 0f);
                reloadActionBtn.setBackground(wrapRipple(btnBg, palette.onPrimary, dpf(density, 100f)));
                reloadActionBtn.setOnClickListener(v -> {
                    v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                    if (restart) {
                        restartTidalApp(activity, dialog);
                    } else {
                        reloadActivityUi(activity, dialog);
                    }
                });
            }
        }

        void rebuildContent() {
            if (contentContainer == null) {
                return;
            }
            contentContainer.removeAllViews();

            switch (currentPage) {
                case PAGE_ROOT:
                    populateRootPage();
                    break;
                case PAGE_THEME_COLORS:
                    populateThemeColorsPage();
                    break;
                case PAGE_THEME_GLASS:
                    populateThemeGlassPage();
                    break;
                case PAGE_PLAYER_NOW:
                    populatePlayerNowPage();
                    break;
                case PAGE_PLAYER_WAVEFORM:
                    populatePlayerWaveformPage();
                    break;
                case PAGE_PLAYER_LYRICS:
                    populatePlayerLyricsPage();
                    break;
                case PAGE_NAV_DOCK:
                    populateNavDockPage();
                    break;
                case PAGE_NAV_SWIPE:
                    populateNavSwipePage();
                    break;
                case PAGE_SCREEN_HOME:
                    populateScreenHomePage();
                    break;
                case PAGE_SCREEN_PLAYLIST:
                    populateScreenPlaylistPage();
                    break;
                case PAGE_SCREEN_MEDIA:
                    populateScreenMediaPage();
                    break;
                case PAGE_SCREEN_SEARCH:
                    populateScreenSearchPage();
                    break;
                case PAGE_SCREEN_SHEETS:
                    populateScreenSheetsPage();
                    break;
                case PAGE_LINN:
                    populateLinnPage();
                    break;
                default:
                    populateRootPage();
                    break;
            }

            TextView footnote = new TextView(contentContainer.getContext());
            footnote.setText(de
                    ? "Lokal gespeichert · Patch-Optionen bleiben als Standardwerte erhalten"
                    : "Saved locally · Patch build options remain your reset defaults");
            footnote.setTextColor(withAlpha(palette.onSurfaceVar, 0x99));
            footnote.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            footnote.setGravity(Gravity.CENTER_HORIZONTAL);
            footnote.setPadding(dp(density, 6f), dp(density, 10f), dp(density, 6f), dp(density, 8f));
            contentContainer.addView(footnote);
        }

        // ---- ROOT PAGE (Instagram Settings Style) ----

        private void populateRootPage() {
            // 1. Schnellzugriff (direct quick toggles & theme switcher)
            List<View> quickRows = new ArrayList<>();
            if (MaterialYouConfig.isSystemThemeModeEnabled()) {
                quickRows.add(createThemeModeRow());
            }
            if (MaterialYouConfig.isMaterialYouPatchInstalled()) {
                quickRows.add(createAmoledRow(null));
            }
            if (MaterialYouConfig.isWaveformSeekbarPatchInstalled()) {
                quickRows.add(createWaveformEnabledRow(null));
            }
            if (MaterialYouConfig.isSyllableLyricsPatchInstalled()) {
                quickRows.add(createSyllableLyricsEnabledRow(null));
            }
            if (!quickRows.isEmpty()) {
                addSectionHeader(de ? "Schnellzugriff" : "Quick controls");
                addGroupedSection(quickRows);
            }

            // 2. Darstellung / Appearance
            List<View> themeRows = new ArrayList<>();
            if (MaterialYouConfig.isSystemThemeModeEnabled() || MaterialYouConfig.isMaterialYouPatchInstalled()) {
                themeRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_PALETTE,
                        de ? "Design & Monet" : "Theme & Monet",
                        null,
                        getSummaryForPage(PAGE_THEME_COLORS),
                        () -> openSubPage(PAGE_THEME_COLORS)
                ));
            }
            if (MaterialYouConfig.isMaterialYouPatchInstalled()) {
                themeRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_BLUR,
                        de ? "Glas & Unschärfe" : "Glass & Blur",
                        null,
                        getSummaryForPage(PAGE_THEME_GLASS),
                        () -> openSubPage(PAGE_THEME_GLASS)
                ));
            }
            if (!themeRows.isEmpty()) {
                addSectionHeader(de ? "Darstellung" : "Appearance");
                addGroupedSection(themeRows);
            }

            // 3. Player & Audio
            List<View> playerRows = new ArrayList<>();
            if (MaterialYouConfig.isExpressivePlayerPatchInstalled()) {
                playerRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_PLAYER,
                        "Now Playing",
                        null,
                        getSummaryForPage(PAGE_PLAYER_NOW),
                        () -> openSubPage(PAGE_PLAYER_NOW)
                ));
            }
            if (MaterialYouConfig.isWaveformSeekbarPatchInstalled()) {
                playerRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_WAVEFORM,
                        de ? "Song-Waveform" : "Song Waveform",
                        null,
                        getSummaryForPage(PAGE_PLAYER_WAVEFORM),
                        () -> openSubPage(PAGE_PLAYER_WAVEFORM)
                ));
            }
            if (MaterialYouConfig.isSyllableLyricsPatchInstalled()) {
                playerRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_LYRICS,
                        de ? "Karaoke-Lyrics" : "Karaoke Lyrics",
                        null,
                        getSummaryForPage(PAGE_PLAYER_LYRICS),
                        () -> openSubPage(PAGE_PLAYER_LYRICS)
                ));
            }
            if (MaterialYouConfig.isCrossfadePatchInstalled()) {
                String badge = "Crossfade";
                try {
                    badge = CrossfadeTidalBridge.readDurationSeconds() + " s";
                } catch (Throwable ignored) {
                }
                playerRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_CROSSFADE,
                        "Crossfade",
                        null,
                        badge,
                        () -> {
                            try {
                                CrossfadeBottomSheet.show(activity);
                            } catch (Throwable ignored) {
                            }
                        }
                ));
            }
            if (!playerRows.isEmpty()) {
                addSectionHeader(de ? "Player & Audio" : "Player & Audio");
                addGroupedSection(playerRows);
            }

            // 4. Navigation & Bedienung
            List<View> navRows = new ArrayList<>();
            if (MaterialYouConfig.isExpressiveNavbarPatchInstalled()) {
                navRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_NAVBAR,
                        de ? "Navbar & Mini-Player" : "Navbar & Mini-Player",
                        null,
                        getSummaryForPage(PAGE_NAV_DOCK),
                        () -> openSubPage(PAGE_NAV_DOCK)
                ));
            }
            if (MaterialYouConfig.isTrackSwipePatchInstalled()) {
                navRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_SWIPE,
                        de ? "Track-Wischgesten" : "Track Swipe Gestures",
                        null,
                        getSummaryForPage(PAGE_NAV_SWIPE),
                        () -> openSubPage(PAGE_NAV_SWIPE)
                ));
            }
            if (!navRows.isEmpty()) {
                addSectionHeader(de ? "Navigation & Bedienung" : "Navigation & Gestures");
                addGroupedSection(navRows);
            }

            // 5. App-Ansichten
            List<View> screenRows = new ArrayList<>();
            if (MaterialYouConfig.isExpressiveHomePatchInstalled()) {
                screenRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_HOME,
                        de ? "Startseite" : "Home",
                        null,
                        getSummaryForPage(PAGE_SCREEN_HOME),
                        () -> openSubPage(PAGE_SCREEN_HOME)
                ));
            }
            if (MaterialYouConfig.isExpressivePlaylistPatchInstalled()) {
                screenRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_PLAYLIST,
                        "Playlist",
                        null,
                        getSummaryForPage(PAGE_SCREEN_PLAYLIST),
                        () -> openSubPage(PAGE_SCREEN_PLAYLIST)
                ));
            }
            if (MaterialYouConfig.isExpressiveMediaPagesPatchInstalled()) {
                screenRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_MEDIA,
                        de ? "Alben, Künstler & Sammlung" : "Albums, Artists & Library",
                        null,
                        getSummaryForPage(PAGE_SCREEN_MEDIA),
                        () -> openSubPage(PAGE_SCREEN_MEDIA)
                ));
            }
            if (MaterialYouConfig.isExpressiveSearchPatchInstalled()) {
                screenRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_SEARCH,
                        de ? "Suche & Entdecken" : "Search & Explore",
                        null,
                        getSummaryForPage(PAGE_SCREEN_SEARCH),
                        () -> openSubPage(PAGE_SCREEN_SEARCH)
                ));
            }
            if (MaterialYouConfig.isExpressiveSheetsPatchInstalled()) {
                screenRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_SHEETS,
                        de ? "Bottom Sheets & Menüs" : "Bottom Sheets & Menus",
                        null,
                        getSummaryForPage(PAGE_SCREEN_SHEETS),
                        () -> openSubPage(PAGE_SCREEN_SHEETS)
                ));
            }
            if (!screenRows.isEmpty()) {
                addSectionHeader(de ? "App-Ansichten" : "App Screens");
                addGroupedSection(screenRows);
            }

            // 6. Audio-Geräte
            if (MaterialYouConfig.isLinnDsmPatchInstalled()) {
                addSectionHeader(de ? "Audio-Geräte" : "Audio Devices");
                List<View> linnRows = new ArrayList<>();
                linnRows.add(createNavigationRow(
                        PatchSettingsIcons.ICON_SPEAKER_WIFI,
                        "Linn Majik DSM",
                        null,
                        getSummaryForPage(PAGE_LINN),
                        () -> openSubPage(PAGE_LINN)
                ));
                addGroupedSection(linnRows);
            }

            if (contentContainer.getChildCount() == 0) {
                addSingleInfoCard(
                        PatchSettingsIcons.ICON_SPARKLE,
                        de ? "Keine konfigurierbaren Patches aktiv" : "No configurable patches active",
                        de ? "Aktiviere beim Patchen in Morphe weitere MaterialTidal-Patches, um sie hier live anzupassen."
                                : "Enable additional MaterialTidal patches in Morphe to customize them live here."
                );
            }
        }

        // ---- SUB-PAGES ----

        private void populateThemeColorsPage() {
            if (MaterialYouConfig.isSystemThemeModeEnabled()) {
                addSectionHeader(de ? "Erscheinungsbild" : "Appearance");
                List<View> modeGroup = new ArrayList<>();
                modeGroup.add(createThemeModeRow());
                addGroupedSection(modeGroup);
            }
            if (MaterialYouConfig.isMaterialYouPatchInstalled()) {
                addSectionHeader("Material You & Monet");
                List<View> monetGroup = new ArrayList<>();
                monetGroup.add(createAmoledRow(null));
                monetGroup.add(createChoiceRow(
                        PatchSettingsIcons.ICON_PALETTE,
                        de ? "Monet-Farbintensität" : "Monet palette intensity",
                        null,
                        new Choice[]{
                                new Choice(MaterialYouConfig.MONET_STYLE_EXPRESSIVE, de ? "Expressiv" : "Expressive"),
                                new Choice(MaterialYouConfig.MONET_STYLE_VIBRANT, de ? "Kräftig" : "Vibrant"),
                                new Choice(MaterialYouConfig.MONET_STYLE_SUBTLE, de ? "Dezent" : "Subtle"),
                        },
                        MaterialYouConfig::getMonetPaletteStyle,
                        v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_MONET_PALETTE_STYLE, v),
                        RELOAD_ACTIVITY,
                        true
                ));
                monetGroup.add(createToggleRow(
                        PatchSettingsIcons.ICON_SHAPES,
                        de ? "Expressive runde Formen" : "Expressive rounded shapes",
                        de ? "Weichere M3-Squircle- & Pill-Ecken (Neustart empfohlen)"
                                : "Softer M3 squircle & pill radii (restart recommended)",
                        MaterialYouConfig::isExpressiveShapesEnabled,
                        v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_SHAPES, v),
                        RELOAD_APP_RESTART,
                        false,
                        null
                ));
                addGroupedSection(monetGroup);
            }
        }

        private void populateThemeGlassPage() {
            addSectionHeader(de ? "GPU-Unschärfe & Milchglas" : "GPU Blur & Frosted Glass");
            final LinearLayout childHolder = new LinearLayout(contentContainer.getContext());
            childHolder.setOrientation(LinearLayout.VERTICAL);

            List<View> master = new ArrayList<>();
            master.add(createToggleRow(
                    PatchSettingsIcons.ICON_BLUR,
                    de ? "GPU-Unschärfe & Milchglas" : "Expressive GPU blur & glass",
                    de ? "Hardware-RenderEffect für Hero-Fades, Toolbars, Sheets & Menüs"
                            : "Hardware RenderEffect for hero fades, toolbars, sheets & menus",
                    MaterialYouConfig::isExpressiveBlurEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_GLASS_BLUR, v),
                    RELOAD_NONE,
                    false,
                    enabled -> childHolder.setAlpha(enabled ? 1f : 0.45f)
            ));
            addGroupedSection(master);

            List<View> details = new ArrayList<>();
            details.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SLIDER,
                    de ? "Unschärfe-Intensität" : "Blur intensity",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.BLUR_INTENSITY_SUBTLE, de ? "Dezent" : "Subtle"),
                            new Choice(MaterialYouConfig.BLUR_INTENSITY_BALANCED, de ? "Ausgewogen" : "Balanced"),
                            new Choice(MaterialYouConfig.BLUR_INTENSITY_RICH, de ? "Stark" : "Rich"),
                    },
                    MaterialYouConfig::getBlurIntensity,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_BLUR_INTENSITY, v),
                    RELOAD_NONE,
                    false
            ));
            addGroupedSectionInto(childHolder, details);
            childHolder.setAlpha(MaterialYouConfig.isExpressiveBlurEnabled() ? 1f : 0.45f);
            contentContainer.addView(childHolder);
        }

        private void populatePlayerNowPage() {
            addSectionHeader(de ? "Darstellung" : "Visuals");
            List<View> lookGroup = new ArrayList<>();
            lookGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_PALETTE,
                    de ? "Player-Hintergrund" : "Player backdrop style",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.PLAYER_STYLE_COVER_PASTEL, de ? "Pastell" : "Pastel"),
                            new Choice(MaterialYouConfig.PLAYER_STYLE_DARK_BLUR, de ? "Tonal" : "Tonal"),
                            new Choice(MaterialYouConfig.PLAYER_STYLE_RAW_COVER_BLUR, de ? "Blur" : "Heavy Blur"),
                    },
                    MaterialYouConfig::getPlayerColorStyle,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_PLAYER_COLOR_STYLE, v),
                    RELOAD_NONE,
                    false
            ));
            lookGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_SQUIGGLY,
                    de ? "Wellen-Fortschrittsleiste" : "Squiggly sine-wave seekbar",
                    de ? "Animierte M3-Sinuswelle (wenn Song-Waveform aus ist)"
                            : "Animated M3 wave while playing (when Song Waveform is off)",
                    MaterialYouConfig::isPlayerSquigglySeekbarEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_PLAYER_SQUIGGLY_SEEKBAR, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(lookGroup);

            addSectionHeader(de ? "Bedienung & Layout" : "Controls & Layout");
            List<View> layoutGroup = new ArrayList<>();
            layoutGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_COVER_SWIPE,
                    de ? "Cover wischen zum Überspringen" : "Swipe cover to skip tracks",
                    de ? "Horizontale Wischgeste auf dem Albumcover mit Federphysik"
                            : "Horizontal artwork swipe with spring tilt physics",
                    MaterialYouConfig::isPlayerCoverSwipeEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_PLAYER_COVER_SWIPE, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            layoutGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_QUEUE,
                    de ? "Expressive Warteschlange" : "Expressive Play Queue",
                    de ? "Monet-Tabs, Spotlight-Karte & expressive Zeilen in der Queue"
                            : "Monet pill tabs, spotlight card & expressive queue rows",
                    MaterialYouConfig::isExpressivePlayQueueEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_PLAY_QUEUE, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            layoutGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_TABLET,
                    de ? "Desktop-Layout für Tablets" : "Desktop-style tablet layout",
                    de ? "Zweispaltiges Player-Layout mit seitlicher Queue & Lyrics (>= 600dp)"
                            : "Two-pane player with side-by-side Queue & Lyrics (>= 600dp)",
                    MaterialYouConfig::isPlayerTabletDesktopLayoutEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_PLAYER_TABLET_DESKTOP_LAYOUT, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(layoutGroup);
        }

        private void populatePlayerWaveformPage() {
            addSectionHeader(de ? "Song-Waveform" : "Song Waveform");
            final LinearLayout detailsHolder = new LinearLayout(contentContainer.getContext());
            detailsHolder.setOrientation(LinearLayout.VERTICAL);

            List<View> master = new ArrayList<>();
            master.add(createWaveformEnabledRow(enabled -> detailsHolder.setAlpha(enabled ? 1f : 0.45f)));
            addGroupedSection(master);

            List<View> details = new ArrayList<>();
            details.add(createChoiceRow(
                    PatchSettingsIcons.ICON_WAVEFORM,
                    de ? "Waveform-Stil" : "Waveform shape",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.WAVEFORM_STYLE_CENTERED_BARS, de ? "Gespiegelt" : "Mirrored"),
                            new Choice(MaterialYouConfig.WAVEFORM_STYLE_BOTTOM_SPECTRUM, de ? "Unten" : "Bottom"),
                            new Choice(MaterialYouConfig.WAVEFORM_STYLE_FILLED_RIBBON, de ? "Kurve" : "Smooth"),
                    },
                    MaterialYouConfig::getPlayerWaveformStyle,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_WAVEFORM_STYLE, v),
                    RELOAD_NONE,
                    false
            ));
            details.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SLIDER,
                    de ? "Waveform-Detail" : "Waveform detail",
                    de ? "Anzahl der Balken entlang der Leiste" : "Number of bars along the seekbar",
                    new Choice[]{
                            new Choice(MaterialYouConfig.WAVEFORM_DENSITY_BOLD, de ? "Kräftig (36)" : "Chunky (36)"),
                            new Choice(MaterialYouConfig.WAVEFORM_DENSITY_BALANCED, de ? "Ausgewogen (56)" : "Balanced (56)"),
                            new Choice(MaterialYouConfig.WAVEFORM_DENSITY_FINE, de ? "Fein (76)" : "Fine (76)"),
                    },
                    MaterialYouConfig::getPlayerWaveformBarDensity,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_WAVEFORM_BAR_DENSITY, v),
                    RELOAD_NONE,
                    false
            ));
            details.add(createToggleRow(
                    PatchSettingsIcons.ICON_PULSE,
                    de ? "Live-Beat-Puls" : "Live beat pulse at playhead",
                    null,
                    MaterialYouConfig::isPlayerWaveformLiveReactiveEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_WAVEFORM_LIVE_REACTIVE, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSectionInto(detailsHolder, details);
            detailsHolder.setAlpha(MaterialYouConfig.isPlayerWaveformSeekbarEnabled() ? 1f : 0.45f);
            contentContainer.addView(detailsHolder);
        }

        private void populatePlayerLyricsPage() {
            addSectionHeader(de ? "Karaoke-Lyrics" : "Karaoke Lyrics");
            final LinearLayout detailsHolder = new LinearLayout(contentContainer.getContext());
            detailsHolder.setOrientation(LinearLayout.VERTICAL);

            List<View> master = new ArrayList<>();
            master.add(createSyllableLyricsEnabledRow(enabled -> detailsHolder.setAlpha(enabled ? 1f : 0.45f)));
            addGroupedSection(master);

            List<View> details = new ArrayList<>();
            details.add(createToggleRow(
                    PatchSettingsIcons.ICON_BLUR,
                    de ? "Tiefenunschärfe auf inaktiven Zeilen" : "Progressive blur on inactive lines",
                    null,
                    MaterialYouConfig::isLyricsProgressiveBlurEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_LYRICS_PROGRESSIVE_BLUR, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            details.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SLIDER,
                    de ? "Stärke der Lyrics-Unschärfe" : "Lyrics blur intensity",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.LYRICS_BLUR_SUBTLE, de ? "Dezent" : "Subtle"),
                            new Choice(MaterialYouConfig.LYRICS_BLUR_BALANCED, de ? "Ausgewogen" : "Balanced"),
                            new Choice(MaterialYouConfig.LYRICS_BLUR_STRONG, de ? "Stark" : "Strong"),
                    },
                    MaterialYouConfig::getLyricsBlurStrength,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_LYRICS_BLUR_STRENGTH, v),
                    RELOAD_NONE,
                    false
            ));
            addGroupedSectionInto(detailsHolder, details);
            detailsHolder.setAlpha(MaterialYouConfig.isSyllableLyricsEnabled() ? 1f : 0.45f);
            contentContainer.addView(detailsHolder);
        }

        private void populateNavDockPage() {
            addSectionHeader(de ? "Floating Dock & Mini-Player" : "Floating Dock & Mini-Player");
            List<View> navGroup = new ArrayList<>();
            navGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_PALETTE,
                    de ? "Navbar & Mini-Player Stil" : "Navbar & mini-player style",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.STYLE_DARK_TONAL, "Dark Tonal"),
                            new Choice(MaterialYouConfig.STYLE_PASTEL_SCREENSHOT, de ? "Pastell" : "Pastel"),
                            new Choice(MaterialYouConfig.STYLE_HIGH_CONTRAST, de ? "Kontrast" : "Vibrant"),
                    },
                    MaterialYouConfig::getNavbarColorStyle,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_NAVBAR_COLOR_STYLE, v),
                    RELOAD_NONE,
                    true
            ));
            navGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_EYE_OFF,
                    de ? "Uploads-Tab ausblenden" : "Keep 3 core tabs in pill",
                    de ? "Zeigt Home, Entdecken & Sammlung in der Pill-Leiste"
                            : "Shows Home, Explore & Library in the dock (hides Uploads)",
                    MaterialYouConfig::isHideUploadTab,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_HIDE_UPLOAD_TAB, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            navGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_SWIPE,
                    de ? "Mini-Player Wischgesten" : "Mini-player swipe gestures",
                    de ? "Horizontal wischen zum Skippen, nach oben ziehen öffnet den Player"
                            : "Swipe left/right to skip, pull up to expand player",
                    MaterialYouConfig::isMiniPlayerSwipeEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_MINI_PLAYER_SWIPE, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            navGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_BLUR,
                    de ? "Progressive Dock-Unschärfe" : "Progressive navbar blur",
                    de ? "Mehrstufige GPU-Unschärfe hinter Navbar & Mini-Player"
                            : "Multi-tier GPU blur behind floating navbar & mini-player",
                    MaterialYouConfig::isNavbarProgressiveBlurEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_NAVBAR_PROGRESSIVE_BLUR, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(navGroup);
        }

        private void populateNavSwipePage() {
            addSectionHeader(de ? "Wischrichtungen" : "Swipe actions");
            List<View> actions = new ArrayList<>();
            actions.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SWIPE,
                    de ? "Nach rechts wischen" : "Swipe right action",
                    null,
                    getSwipeChoices(),
                    TrackSwipeConfig::getSwipeRightAction,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_SWIPE_RIGHT_ACTION, v),
                    RELOAD_NONE,
                    false
            ));
            actions.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SWIPE,
                    de ? "Nach links wischen" : "Swipe left action",
                    null,
                    getSwipeChoices(),
                    TrackSwipeConfig::getSwipeLeftAction,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_SWIPE_LEFT_ACTION, v),
                    RELOAD_NONE,
                    false
            ));
            addGroupedSection(actions);

            addSectionHeader(de ? "Feinabstimmung" : "Sensitivity & feedback");
            List<View> feel = new ArrayList<>();
            feel.add(createToggleRow(
                    PatchSettingsIcons.ICON_HAPTIC,
                    de ? "Haptisches Feedback" : "Haptic feedback",
                    de ? "Kurze Vibration beim Überschreiten der Auslöseschwelle"
                            : "Subtle vibration when crossing the swipe threshold",
                    TrackSwipeConfig::isHapticEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_SWIPE_HAPTIC, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            feel.add(createSliderRow(
                    PatchSettingsIcons.ICON_SLIDER,
                    de ? "Wisch-Auslöseschwelle" : "Swipe threshold",
                    36,
                    160,
                    4,
                    " dp",
                    TrackSwipeConfig::getSwipeThresholdDp,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_SWIPE_THRESHOLD_DP, v)
            ));
            addGroupedSection(feel);
        }

        private void populateScreenHomePage() {
            addSectionHeader(de ? "Layout & Interaktion" : "Layout & interaction");
            List<View> shapeGroup = new ArrayList<>();
            shapeGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SHAPES,
                    de ? "Cover- & Shortcut-Ecken" : "Cover & shortcut corners",
                    de ? "Neustart empfohlen für Compose-Tokens" : "Restart recommended for Compose tokens",
                    new Choice[]{
                            new Choice(20, "Squircle (20dp)"),
                            new Choice(14, de ? "Abgerundet (14dp)" : "Rounded (14dp)"),
                            new Choice(8, de ? "Dezent (8dp)" : "Subtle (8dp)"),
                    },
                    MaterialYouConfig::getHomeCoverCornerRadiusInt,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_HOME_COVER_RADIUS_DP, v),
                    RELOAD_APP_RESTART,
                    false
            ));
            shapeGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_REFRESH,
                    de ? "Pull-to-Refresh freischalten" : "Homepage pull-to-refresh",
                    null,
                    MaterialYouConfig::isHomePullToRefreshEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_HOME_PULL_TO_REFRESH, v),
                    RELOAD_ACTIVITY,
                    false,
                    null
            ));
            addGroupedSection(shapeGroup);

            addSectionHeader(de ? "Module ausblenden" : "Hide sections");
            List<View> hideGroup = new ArrayList<>();
            hideGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_EYE_OFF,
                    de ? "Headliners-Banner ausblenden" : "Hide Headliners banner",
                    null,
                    MaterialYouConfig::isHideHomeHeadlinersBanner,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_HIDE_HOME_HEADLINERS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            hideGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_EYE_OFF,
                    de ? "Promo-Module ausblenden" : "Hide promo modules",
                    null,
                    MaterialYouConfig::isHideHomePromoModules,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_HIDE_HOME_PROMO, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            hideGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_EYE_OFF,
                    de ? "Merch-Module ausblenden" : "Hide merch modules",
                    null,
                    MaterialYouConfig::isHideHomeMerchModules,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_HIDE_HOME_MERCH, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(hideGroup);
        }

        private void populateScreenPlaylistPage() {
            addSectionHeader("Playlist");
            List<View> playlistGroup = new ArrayList<>();
            playlistGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_PALETTE,
                    de ? "Akzent-Farbpalette" : "Playlist accent palette",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.PLAYLIST_ACCENT_ADAPTIVE, "Cover + Monet"),
                            new Choice(MaterialYouConfig.PLAYLIST_ACCENT_MONET, "System Monet"),
                    },
                    MaterialYouConfig::getPlaylistAccentMode,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_PLAYLIST_ACCENT_MODE, v),
                    RELOAD_NONE,
                    false
            ));
            playlistGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_BLUR,
                    de ? "Randloses Hero-Cover mit Fade" : "Full-bleed fading hero cover",
                    null,
                    MaterialYouConfig::isPlaylistHeroCoverFadeEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_PLAYLIST_HERO_FADE, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            playlistGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_PLAYLIST,
                    de ? "Expressive Track-Zeilen" : "Expressive track rows",
                    null,
                    MaterialYouConfig::isPlaylistTrackRowPolishEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_PLAYLIST_TRACK_ROW_POLISH, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            playlistGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_EYE_OFF,
                    de ? "Playlist-Aktionsleiste ausblenden" : "Hide playlist action buttons",
                    de ? "Blendet Favorit, Bearbeiten, Download, Privat & Teilen aus"
                            : "Hides Favorite, Edit, Download, Privacy & Share row",
                    MaterialYouConfig::isHidePlaylistActionButtonsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_HIDE_PLAYLIST_ACTION_BUTTONS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(playlistGroup);
        }

        private void populateScreenMediaPage() {
            addSectionHeader(de ? "Medienseiten" : "Media pages");
            List<View> mediaGroup = new ArrayList<>();
            mediaGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_MEDIA,
                    de ? "Expressive Album-Seiten" : "Expressive Album pages",
                    null,
                    MaterialYouConfig::isExpressiveAlbumsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_ALBUMS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            mediaGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_ARTIST,
                    de ? "Expressive Künstler-Seiten" : "Expressive Artist pages",
                    null,
                    MaterialYouConfig::isExpressiveArtistsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_ARTISTS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            mediaGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_HEART,
                    de ? "Expressive Lieblingssongs" : "Expressive My Tracks",
                    null,
                    MaterialYouConfig::isExpressiveMyTracksEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_MY_TRACKS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            mediaGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_GRID,
                    de ? "Expressives Sammlungs-Kachelgrid" : "Expressive Collection tile grid",
                    de ? "Bento-Kachelgrid in der Sammlung (Neu laden empfohlen)"
                            : "Bento tile grid in Library (reload recommended)",
                    MaterialYouConfig::isExpressiveCollectionEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_COLLECTION, v),
                    RELOAD_ACTIVITY,
                    false,
                    null
            ));
            addGroupedSection(mediaGroup);
        }

        private void populateScreenSearchPage() {
            addSectionHeader(de ? "Suche & Entdecken" : "Search & Explore");
            List<View> searchGroup = new ArrayList<>();
            searchGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SEARCH,
                    de ? "Suchleisten-Form" : "Search bar shape",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.SEARCH_BAR_STYLE_PILL, "Pill (28dp)"),
                            new Choice(MaterialYouConfig.SEARCH_BAR_STYLE_SQUIRCLE, "Squircle (18dp)"),
                    },
                    MaterialYouConfig::getSearchBarCornerStyle,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_SEARCH_BAR_STYLE, v),
                    RELOAD_NONE,
                    false
            ));
            searchGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_GRID,
                    de ? "Expressive Genre-Karten" : "Expressive Genre & Explore cards",
                    null,
                    MaterialYouConfig::isExpressiveSearchCardsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_SEARCH_CARDS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            searchGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_BLUR,
                    de ? "Frosted Header-Unschärfe" : "Frosted glass Search header",
                    null,
                    MaterialYouConfig::isExpressiveSearchHeaderBlurEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_SEARCH_HEADER_BLUR, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(searchGroup);
        }

        private void populateScreenSheetsPage() {
            addSectionHeader(de ? "Bottom Sheets & Menüs" : "Bottom Sheets & Menus");
            List<View> sheetGroup = new ArrayList<>();
            sheetGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_SHAPES,
                    de ? "Eckenradius für Sheets & Menüs" : "Sheet & menu corner style",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.SHEET_CORNER_EXPRESSIVE, "Expressive (28dp)"),
                            new Choice(MaterialYouConfig.SHEET_CORNER_EXTRA_EXPRESSIVE, "Extra (32dp)"),
                            new Choice(MaterialYouConfig.SHEET_CORNER_ROUNDED, de ? "Dezent (20dp)" : "Subtle (20dp)"),
                    },
                    MaterialYouConfig::getSheetCornerStyle,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_SHEET_CORNER_STYLE, v),
                    RELOAD_NONE,
                    false
            ));
            sheetGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_SHEETS,
                    de ? "Gruppierte Kontextmenü-Karten" : "Grouped context menu cards",
                    null,
                    MaterialYouConfig::isGroupedContextMenuCardsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_GROUPED_CONTEXT_MENU_CARDS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            sheetGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_GRID,
                    de ? "Expressive Popup- & Overflow-Menüs" : "Expressive popup & overflow menus",
                    null,
                    MaterialYouConfig::isExpressivePopupMenusEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_POPUP_MENUS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            sheetGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_SPARKLE,
                    de ? "Expressive Material 3 Dialoge" : "Expressive Material 3 dialogs",
                    null,
                    MaterialYouConfig::isExpressiveDialogsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_EXPRESSIVE_DIALOGS, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            addGroupedSection(sheetGroup);
        }

        private void populateLinnPage() {
            addSectionHeader(de ? "Audio & Streaming" : "Audio & streaming");
            List<View> audioGroup = new ArrayList<>();
            audioGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_WAVEFORM,
                    de ? "Bevorzugte Audioqualität" : "Preferred audio quality",
                    null,
                    new Choice[]{
                            new Choice(LinnConfig.QUALITY_HI_RES, "Hi-Res FLAC"),
                            new Choice(LinnConfig.QUALITY_LOSSLESS, "Lossless"),
                            new Choice(LinnConfig.QUALITY_HIGH, "High AAC"),
                    },
                    LinnConfig::getAudioQualityMode,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_LINN_AUDIO_QUALITY, v),
                    RELOAD_NONE,
                    false
            ));
            audioGroup.add(createChoiceRow(
                    PatchSettingsIcons.ICON_NETWORK,
                    de ? "Stream-Übertragungsmodus" : "Stream delivery mode",
                    null,
                    new Choice[]{
                            new Choice(LinnConfig.STREAM_MODE_PROXY_ALL, de ? "Lokaler Proxy" : "Local HTTP Proxy"),
                            new Choice(LinnConfig.STREAM_MODE_HYBRID, de ? "Direkt + Hi-Res Proxy" : "Direct + Hi-Res Proxy"),
                    },
                    LinnConfig::getStreamDeliveryMode,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_LINN_STREAM_MODE, v),
                    RELOAD_NONE,
                    false
            ));
            addGroupedSection(audioGroup);

            addSectionHeader(de ? "Gerät & Netzwerk" : "Device & network");
            List<View> deviceGroup = new ArrayList<>();
            deviceGroup.add(createToggleRow(
                    PatchSettingsIcons.ICON_POWER,
                    de ? "Standby automatisch wecken" : "Auto-wake & switch input",
                    de ? "Weckt Linn DSM aus Standby & wählt Playlist-Eingang"
                            : "Wakes Linn DSM from standby and switches input to Playlist",
                    LinnConfig::isAutoWakeAndSwitchEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_LINN_AUTO_WAKE, v),
                    RELOAD_NONE,
                    false,
                    null
            ));
            String curIp = LinnConfig.getManualDeviceIp();
            String badge = (curIp != null && !curIp.isEmpty())
                    ? curIp
                    : (de ? "Auto (SSDP)" : "Auto (SSDP)");
            deviceGroup.add(createNavigationRow(
                    PatchSettingsIcons.ICON_NETWORK,
                    de ? "Manuelle Linn DSM IP" : "Manual Linn DSM IP",
                    de ? "Fallback-LAN-IP (z. B. 192.168.1.50)" : "Fallback LAN IP (e.g. 192.168.1.50)",
                    badge,
                    this::showLinnIpInputDialog
            ));
            addGroupedSection(deviceGroup);
        }

        // ---- Shared Control Row Factories ----

        private View createThemeModeRow() {
            return createChoiceRow(
                    PatchSettingsIcons.ICON_SUN_MOON,
                    de ? "App-Designmodus" : "App theme mode",
                    null,
                    new Choice[]{
                            new Choice(MaterialYouConfig.THEME_MODE_SYSTEM, "System"),
                            new Choice(MaterialYouConfig.THEME_MODE_LIGHT, de ? "Hell" : "Light"),
                            new Choice(MaterialYouConfig.THEME_MODE_DARK, de ? "Dunkel" : "Dark"),
                    },
                    MaterialYouConfig::getThemeMode,
                    v -> PatchSettingsPrefs.setInt(PatchSettingsPrefs.OPT_THEME_MODE, v),
                    RELOAD_ACTIVITY,
                    true
            );
        }

        private View createAmoledRow(BoolSetter onExtraToggle) {
            return createToggleRow(
                    PatchSettingsIcons.ICON_AMOLED,
                    de ? "AMOLED Reinschwarz" : "AMOLED pure black",
                    de ? "Nutzt #000000 im Dunkelmodus bei dynamischen Akzenten"
                            : "Uses pure #000000 background in Dark mode with Monet accents",
                    MaterialYouConfig::isAmoledPureBlack,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_AMOLED_PURE_BLACK, v),
                    RELOAD_ACTIVITY,
                    true,
                    onExtraToggle
            );
        }

        private View createWaveformEnabledRow(BoolSetter onExtraToggle) {
            return createToggleRow(
                    PatchSettingsIcons.ICON_WAVEFORM,
                    de ? "Song-Waveform-Leiste" : "Song waveform seekbar",
                    de ? "Ersetzt die Suchleiste durch eine echte Song-Wellenform"
                            : "Replaces the player seekbar with a song-derived waveform",
                    MaterialYouConfig::isPlayerWaveformSeekbarEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_WAVEFORM_ENABLED, v),
                    RELOAD_NONE,
                    false,
                    onExtraToggle
            );
        }

        private View createSyllableLyricsEnabledRow(BoolSetter onExtraToggle) {
            return createToggleRow(
                    PatchSettingsIcons.ICON_LYRICS,
                    de ? "Silben-Karaoke-Lyrics" : "Syllable-synced karaoke lyrics",
                    de ? "Wortgenauer Leuchtverlauf, Lift-Physik & Community-Provider"
                            : "Word sweep progress, lift physics & open lyric providers",
                    MaterialYouConfig::isSyllableLyricsEnabled,
                    v -> PatchSettingsPrefs.setBoolean(PatchSettingsPrefs.OPT_SYLLABLE_LYRICS_ENABLED, v),
                    RELOAD_NONE,
                    false,
                    onExtraToggle
            );
        }

        private Choice[] getSwipeChoices() {
            return new Choice[]{
                    new Choice(TrackSwipeConfig.ACTION_ADD_TO_QUEUE, de ? "Warteschlange" : "Queue"),
                    new Choice(TrackSwipeConfig.ACTION_PLAY_NEXT, de ? "Als Nächstes" : "Play Next"),
                    new Choice(TrackSwipeConfig.ACTION_TOGGLE_FAVORITE, de ? "Favorit" : "Favorite"),
                    new Choice(TrackSwipeConfig.ACTION_ADD_TO_PLAYLIST, de ? "Playlist" : "Playlist"),
                    new Choice(TrackSwipeConfig.ACTION_NONE, de ? "Aus" : "Off"),
            };
        }

        // ---- Instagram-Style Flat Grouped Rows ----

        private void addSectionHeader(String title) {
            Context ctx = contentContainer.getContext();
            TextView tv = new TextView(ctx);
            tv.setText(title);
            tv.setTextColor(palette.onSurfaceVar);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            tv.setPadding(dp(density, 6f), dp(density, 8f), dp(density, 6f), dp(density, 7f));
            contentContainer.addView(tv);
        }

        private void addGroupedSection(List<View> rows) {
            addGroupedSectionInto(contentContainer, rows);
        }

        private void addGroupedSectionInto(LinearLayout target, List<View> rows) {
            if (rows == null || rows.isEmpty()) {
                return;
            }
            int total = rows.size();
            for (int i = 0; i < total; i++) {
                View row = rows.get(i);
                boolean clickable = row.isClickable();
                applyGroupedCardBg(row, i, total, palette, density, clickable, false);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                );
                lp.bottomMargin = (i == total - 1) ? dp(density, 14f) : dp(density, 2f);
                target.addView(row, lp);
            }
        }

        private View createNavigationRow(
                int iconId,
                String title,
                String subtitle,
                String trailingValue,
                Runnable onClick
        ) {
            Context ctx = contentContainer.getContext();
            LinearLayout row = new LinearLayout(ctx);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setClickable(true);
            row.setFocusable(true);
            row.setPadding(dp(density, 16f), dp(density, 14f), dp(density, 14f), dp(density, 14f));

            int iconSize = dp(density, 22f);
            ImageView iconView = new ImageView(ctx);
            iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iconView.setImageDrawable(PatchSettingsIcons.create(iconId, iconSize, palette.onSurfaceVar));
            LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            ivLp.setMarginEnd(dp(density, 14f));
            row.addView(iconView, ivLp);

            LinearLayout textCol = new LinearLayout(ctx);
            textCol.setOrientation(LinearLayout.VERTICAL);

            TextView titleTv = new TextView(ctx);
            titleTv.setText(title);
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            titleTv.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
            textCol.addView(titleTv);

            if (subtitle != null && !subtitle.isEmpty()) {
                TextView subTv = new TextView(ctx);
                subTv.setText(subtitle);
                subTv.setTextColor(palette.onSurfaceVar);
                subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
                subTv.setPadding(0, dp(density, 2f), dp(density, 8f), 0);
                textCol.addView(subTv);
            }
            row.addView(textCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            if (trailingValue != null && !trailingValue.isEmpty()) {
                TextView valTv = new TextView(ctx);
                valTv.setText(trailingValue);
                valTv.setTextColor(palette.onSurfaceVar);
                valTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                valTv.setMaxLines(1);
                valTv.setEllipsize(TextUtils.TruncateAt.END);
                LinearLayout.LayoutParams vLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                );
                vLp.setMarginStart(dp(density, 8f));
                vLp.setMarginEnd(dp(density, 4f));
                row.addView(valTv, vLp);
            }

            int chevSize = dp(density, 18f);
            ImageView chev = new ImageView(ctx);
            chev.setImageDrawable(PatchSettingsIcons.create(
                    PatchSettingsIcons.ICON_CHEVRON_RIGHT,
                    chevSize,
                    withAlpha(palette.onSurfaceVar, 0xB0)
            ));
            row.addView(chev, new LinearLayout.LayoutParams(chevSize, chevSize));

            row.setOnClickListener(v -> {
                v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                onClick.run();
            });
            return row;
        }

        private View createToggleRow(
                int iconId,
                String title,
                String subtitle,
                BoolGetter getter,
                BoolSetter setter,
                int reloadLevel,
                boolean refreshPalette,
                BoolSetter onExtraToggle
        ) {
            Context ctx = contentContainer.getContext();
            boolean checked = getter.get();

            LinearLayout row = new LinearLayout(ctx);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setClickable(true);
            row.setFocusable(true);
            row.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 15f), dp(density, 13f));

            int iconSize = dp(density, 22f);
            final PatchSettingsIcons.SettingsVectorDrawable iconDrawable =
                    PatchSettingsIcons.create(iconId, iconSize, checked ? palette.primary : palette.onSurfaceVar);
            ImageView iconView = new ImageView(ctx);
            iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iconView.setImageDrawable(iconDrawable);
            LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            ivLp.setMarginEnd(dp(density, 14f));
            row.addView(iconView, ivLp);

            LinearLayout textCol = new LinearLayout(ctx);
            textCol.setOrientation(LinearLayout.VERTICAL);

            TextView titleTv = new TextView(ctx);
            titleTv.setText(title);
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            titleTv.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
            textCol.addView(titleTv);

            if (subtitle != null && !subtitle.isEmpty()) {
                TextView subTv = new TextView(ctx);
                subTv.setText(subtitle);
                subTv.setTextColor(palette.onSurfaceVar);
                subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
                subTv.setPadding(0, dp(density, 2f), dp(density, 8f), 0);
                textCol.addView(subTv);
            }
            row.addView(textCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            final ExpressiveSwitchView sw = new ExpressiveSwitchView(ctx, palette, density, checked);
            sw.setClickable(false);
            LinearLayout.LayoutParams swLp = new LinearLayout.LayoutParams(dp(density, 52f), dp(density, 32f));
            swLp.setMarginStart(dp(density, 8f));
            row.addView(sw, swLp);

            row.setOnTouchListener((v, ev) -> {
                switch (ev.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        sw.setPressedVisual(true);
                        break;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        sw.setPressedVisual(false);
                        break;
                }
                return false;
            });

            row.setOnClickListener(v -> {
                v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                boolean next = !getter.get();
                setter.set(next);
                sw.setChecked(next, true);
                iconDrawable.setTintColor(next ? palette.primary : palette.onSurfaceVar);
                if (onExtraToggle != null) {
                    onExtraToggle.set(next);
                }
                if (refreshPalette) {
                    onPaletteOrResetChanged(reloadLevel, true);
                } else {
                    onLiveOptionUpdated(reloadLevel);
                }
            });

            return row;
        }

        private View createChoiceRow(
                int iconId,
                String title,
                String subtitle,
                Choice[] choices,
                IntGetter getter,
                IntSetter setter,
                int reloadLevel,
                boolean refreshPalette
        ) {
            Context ctx = contentContainer.getContext();
            int current = getter.get();

            LinearLayout row = new LinearLayout(ctx);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setClickable(false);
            row.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 16f), dp(density, 14f));

            LinearLayout header = new LinearLayout(ctx);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.CENTER_VERTICAL);

            int iconSize = dp(density, 22f);
            ImageView iconView = new ImageView(ctx);
            iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iconView.setImageDrawable(PatchSettingsIcons.create(iconId, iconSize, palette.onSurfaceVar));
            LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            ivLp.setMarginEnd(dp(density, 14f));
            header.addView(iconView, ivLp);

            LinearLayout textCol = new LinearLayout(ctx);
            textCol.setOrientation(LinearLayout.VERTICAL);

            TextView titleTv = new TextView(ctx);
            titleTv.setText(title);
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            titleTv.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
            textCol.addView(titleTv);

            if (subtitle != null && !subtitle.isEmpty()) {
                TextView subTv = new TextView(ctx);
                subTv.setText(subtitle);
                subTv.setTextColor(palette.onSurfaceVar);
                subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
                subTv.setPadding(0, dp(density, 2f), 0, 0);
                textCol.addView(subTv);
            }
            header.addView(textCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            row.addView(header);

            LinearLayout.LayoutParams ctrlLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            ctrlLp.topMargin = dp(density, 11f);

            PatchSettingsWidgets.IntSelectionListener onPick = picked -> {
                if (getter.get() != picked) {
                    setter.set(picked);
                    if (refreshPalette) {
                        onPaletteOrResetChanged(reloadLevel, true);
                    } else {
                        onLiveOptionUpdated(reloadLevel);
                    }
                }
            };

            if (choices.length <= 3) {
                ExpressiveSegmentedControl seg = new ExpressiveSegmentedControl(ctx, palette, density, choices, current, onPick);
                row.addView(seg, ctrlLp);
            } else {
                ExpressiveChipWrapLayout wrap = new ExpressiveChipWrapLayout(ctx, palette, density, choices, current, onPick);
                row.addView(wrap, ctrlLp);
            }

            return row;
        }

        private View createSliderRow(
                int iconId,
                String title,
                int minVal,
                int maxVal,
                int step,
                String unitSuffix,
                IntGetter getter,
                IntSetter setter
        ) {
            Context ctx = contentContainer.getContext();
            int initialVal = getter.get();

            LinearLayout row = new LinearLayout(ctx);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setClickable(false);
            row.setPadding(dp(density, 16f), dp(density, 13f), dp(density, 16f), dp(density, 13f));

            LinearLayout header = new LinearLayout(ctx);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.CENTER_VERTICAL);

            int iconSize = dp(density, 22f);
            ImageView iconView = new ImageView(ctx);
            iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iconView.setImageDrawable(PatchSettingsIcons.create(iconId, iconSize, palette.onSurfaceVar));
            LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            ivLp.setMarginEnd(dp(density, 14f));
            header.addView(iconView, ivLp);

            TextView titleTv = new TextView(ctx);
            titleTv.setText(title);
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            titleTv.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
            header.addView(titleTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            final TextView valTv = new TextView(ctx);
            valTv.setText(initialVal + unitSuffix);
            valTv.setTextColor(palette.onSurfaceVar);
            valTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            valTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            header.addView(valTv);
            row.addView(header);

            ExpressiveSliderView slider = new ExpressiveSliderView(
                    ctx,
                    palette,
                    density,
                    minVal,
                    maxVal,
                    step,
                    initialVal,
                    (value, fromUser) -> {
                        valTv.setText(value + unitSuffix);
                        if (fromUser) {
                            setter.set(value);
                            onLiveOptionUpdated(RELOAD_NONE);
                        }
                    }
            );
            LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    dp(density, 42f)
            );
            sLp.topMargin = dp(density, 8f);
            row.addView(slider, sLp);

            return row;
        }

        private void addSingleInfoCard(int iconId, String title, String subtitle) {
            Context ctx = contentContainer.getContext();
            LinearLayout row = new LinearLayout(ctx);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setClickable(false);
            row.setPadding(dp(density, 16f), dp(density, 15f), dp(density, 16f), dp(density, 15f));

            int iconSize = dp(density, 22f);
            ImageView iconView = new ImageView(ctx);
            iconView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iconView.setImageDrawable(PatchSettingsIcons.create(iconId, iconSize, palette.onSurfaceVar));
            LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(iconSize, iconSize);
            ivLp.setMarginEnd(dp(density, 14f));
            row.addView(iconView, ivLp);

            LinearLayout col = new LinearLayout(ctx);
            col.setOrientation(LinearLayout.VERTICAL);

            TextView titleTv = new TextView(ctx);
            titleTv.setText(title);
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            col.addView(titleTv);

            TextView subTv = new TextView(ctx);
            subTv.setText(subtitle);
            subTv.setTextColor(palette.onSurfaceVar);
            subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
            subTv.setPadding(0, dp(density, 3f), 0, 0);
            col.addView(subTv);
            row.addView(col, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            List<View> single = new ArrayList<>();
            single.add(row);
            addGroupedSection(single);
        }

        // ---- Flat Dialogs (Reset Confirmation & Linn IP) ----

        void showResetConfirmationDialog() {
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            int totalMod = PatchSettingsPrefs.getModifiedCount();
            if (totalMod <= 0) {
                return;
            }
            final Dialog confirmDialog = new Dialog(activity);
            confirmDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            Context ctx = confirmDialog.getContext();

            LinearLayout box = new LinearLayout(ctx);
            box.setOrientation(LinearLayout.VERTICAL);
            box.setPadding(dp(density, 22f), dp(density, 20f), dp(density, 22f), dp(density, 18f));
            box.setBackground(createRoundedDrawable(palette.surfaceContainer, 0, dpf(density, 24f), 0f));

            TextView titleTv = new TextView(ctx);
            titleTv.setText(de ? "Einstellungen zurücksetzen?" : "Reset settings?");
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            box.addView(titleTv);

            int catMod = currentPage != PAGE_ROOT ? countModifiedInPage(currentPage) : 0;
            String pageTitle = getPageTitle(currentPage);

            TextView msgTv = new TextView(ctx);
            msgTv.setText(catMod > 0
                    ? (de
                        ? ("In \"" + pageTitle + "\" sind " + catMod + " Optionen angepasst (insgesamt " + totalMod + ").")
                        : (catMod + " options edited in \"" + pageTitle + "\" (" + totalMod + " total)."))
                    : (de
                        ? ("Alle " + totalMod + " angepassten Optionen werden auf deine Morphe-Patch-Vorgaben zurückgesetzt.")
                        : ("All " + totalMod + " edited options will revert to your Morphe patch defaults.")));
            msgTv.setTextColor(palette.onSurfaceVar);
            msgTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            msgTv.setPadding(0, dp(density, 6f), 0, dp(density, 16f));
            box.addView(msgTv);

            if (catMod > 0) {
                TextView catBtn = createDialogActionButton(
                        ctx,
                        de ? ("Nur \"" + pageTitle + "\" (" + catMod + ")") : ("Only \"" + pageTitle + "\" (" + catMod + ")"),
                        palette.primaryContainer,
                        palette.onPrimaryContainer,
                        palette.primary
                );
                catBtn.setOnClickListener(v -> {
                    v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                    PatchSettingsPrefs.clearOptions(getOptionIdsForPage(currentPage));
                    confirmDialog.dismiss();
                    boolean pal = (currentPage == PAGE_THEME_COLORS || currentPage == PAGE_NAV_DOCK);
                    onPaletteOrResetChanged(RELOAD_ACTIVITY, pal);
                });
                LinearLayout.LayoutParams cbLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                );
                cbLp.bottomMargin = dp(density, 8f);
                box.addView(catBtn, cbLp);
            }

            TextView allBtn = createDialogActionButton(
                    ctx,
                    de ? ("Alle zurücksetzen (" + totalMod + ")") : ("Reset all (" + totalMod + ")"),
                    palette.errorContainer,
                    palette.onErrorContainer,
                    palette.error
            );
            allBtn.setOnClickListener(v -> {
                v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                PatchSettingsPrefs.resetAll();
                confirmDialog.dismiss();
                onPaletteOrResetChanged(RELOAD_ACTIVITY, true);
            });
            LinearLayout.LayoutParams abLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            abLp.bottomMargin = dp(density, 8f);
            box.addView(allBtn, abLp);

            TextView cancelBtn = createDialogActionButton(
                    ctx,
                    de ? "Abbrechen" : "Cancel",
                    palette.surfaceHigh,
                    palette.onSurfaceVar,
                    palette.primary
            );
            cancelBtn.setOnClickListener(v -> confirmDialog.dismiss());
            box.addView(cancelBtn, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            confirmDialog.setContentView(box);
            Window w = confirmDialog.getWindow();
            if (w != null) {
                w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                int widthPx = Math.min(ctx.getResources().getDisplayMetrics().widthPixels - dp(density, 44f), dp(density, 400f));
                w.setLayout(widthPx, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            confirmDialog.show();
        }

        private void showLinnIpInputDialog() {
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            final Dialog ipDialog = new Dialog(activity);
            ipDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            Context ctx = ipDialog.getContext();

            LinearLayout box = new LinearLayout(ctx);
            box.setOrientation(LinearLayout.VERTICAL);
            box.setPadding(dp(density, 20f), dp(density, 18f), dp(density, 20f), dp(density, 16f));
            box.setBackground(createRoundedDrawable(palette.surfaceContainer, 0, dpf(density, 24f), 0f));

            TextView titleTv = new TextView(ctx);
            titleTv.setText(de ? "Manuelle Linn DSM IP" : "Manual Linn DSM IP");
            titleTv.setTextColor(palette.onSurface);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            box.addView(titleTv);

            TextView hintTv = new TextView(ctx);
            hintTv.setText(de
                    ? "LAN-IP (z. B. 192.168.1.50 oder 192.168.1.50:55178). Leer lassen für automatische SSDP-Erkennung."
                    : "LAN IP (e.g. 192.168.1.50 or 192.168.1.50:55178). Leave empty for automatic SSDP discovery.");
            hintTv.setTextColor(palette.onSurfaceVar);
            hintTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            hintTv.setPadding(0, dp(density, 6f), 0, dp(density, 12f));
            box.addView(hintTv);

            final EditText input = new EditText(ctx);
            input.setText(LinnConfig.getManualDeviceIp());
            input.setHint("192.168.1.50");
            input.setSingleLine(true);
            input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
            input.setTextColor(palette.onSurface);
            input.setHintTextColor(withAlpha(palette.onSurfaceVar, 0x80));
            input.setPadding(dp(density, 14f), dp(density, 10f), dp(density, 14f), dp(density, 10f));
            input.setBackground(createRoundedDrawable(palette.surfaceHigh, 0, dpf(density, 14f), 0f));
            box.addView(input, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));

            LinearLayout btnRow = new LinearLayout(ctx);
            btnRow.setOrientation(LinearLayout.HORIZONTAL);
            btnRow.setGravity(Gravity.END);
            LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            rowLp.topMargin = dp(density, 16f);

            TextView cancelBtn = createDialogActionButton(ctx, de ? "Abbrechen" : "Cancel", palette.surfaceHigh, palette.onSurfaceVar, palette.primary);
            cancelBtn.setPadding(dp(density, 16f), dp(density, 9f), dp(density, 16f), dp(density, 9f));
            cancelBtn.setOnClickListener(v -> ipDialog.dismiss());
            btnRow.addView(cancelBtn);

            TextView saveBtn = createDialogActionButton(ctx, de ? "Speichern" : "Save", palette.primary, palette.onPrimary, palette.onPrimary);
            saveBtn.setPadding(dp(density, 16f), dp(density, 9f), dp(density, 16f), dp(density, 9f));
            LinearLayout.LayoutParams saveLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            saveLp.setMarginStart(dp(density, 8f));
            saveBtn.setOnClickListener(v -> {
                String trimmed = input.getText() != null ? input.getText().toString().trim() : "";
                PatchSettingsPrefs.setString(PatchSettingsPrefs.OPT_LINN_MANUAL_IP, trimmed);
                ipDialog.dismiss();
                onPaletteOrResetChanged(RELOAD_NONE, false);
            });
            btnRow.addView(saveBtn, saveLp);

            box.addView(btnRow, rowLp);
            ipDialog.setContentView(box);
            Window w = ipDialog.getWindow();
            if (w != null) {
                w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                int widthPx = Math.min(ctx.getResources().getDisplayMetrics().widthPixels - dp(density, 40f), dp(density, 420f));
                w.setLayout(widthPx, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            ipDialog.show();
        }

        private TextView createDialogActionButton(Context ctx, String label, int bgColor, int textColor, int rippleColor) {
            TextView btn = new TextView(ctx);
            btn.setText(label);
            btn.setGravity(Gravity.CENTER);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            btn.setPadding(dp(density, 16f), dp(density, 11f), dp(density, 16f), dp(density, 11f));
            btn.setTextColor(textColor);
            GradientDrawable bg = createRoundedDrawable(bgColor, 0, dpf(density, 100f), 0f);
            btn.setBackground(wrapRipple(bg, rippleColor, dpf(density, 100f)));
            return btn;
        }

        // ---- Page Titles, Summaries & Reset Scopes ----

        private String getPageTitle(int pageId) {
            switch (pageId) {
                case PAGE_ROOT:
                    return "MaterialTidal";
                case PAGE_THEME_COLORS:
                    return de ? "Design & Monet" : "Theme & Monet";
                case PAGE_THEME_GLASS:
                    return de ? "Glas & Unschärfe" : "Glass & Blur";
                case PAGE_PLAYER_NOW:
                    return "Now Playing";
                case PAGE_PLAYER_WAVEFORM:
                    return de ? "Song-Waveform" : "Song Waveform";
                case PAGE_PLAYER_LYRICS:
                    return de ? "Karaoke-Lyrics" : "Karaoke Lyrics";
                case PAGE_NAV_DOCK:
                    return de ? "Navbar & Mini-Player" : "Navbar & Mini-Player";
                case PAGE_NAV_SWIPE:
                    return de ? "Track-Wischgesten" : "Track Swipe Gestures";
                case PAGE_SCREEN_HOME:
                    return de ? "Startseite" : "Home";
                case PAGE_SCREEN_PLAYLIST:
                    return "Playlist";
                case PAGE_SCREEN_MEDIA:
                    return de ? "Alben, Künstler & Sammlung" : "Albums, Artists & Library";
                case PAGE_SCREEN_SEARCH:
                    return de ? "Suche & Entdecken" : "Search & Explore";
                case PAGE_SCREEN_SHEETS:
                    return de ? "Bottom Sheets & Menüs" : "Bottom Sheets & Menus";
                case PAGE_LINN:
                    return "Linn Majik DSM";
                default:
                    return "MaterialTidal";
            }
        }

        private String getSummaryForPage(int pageId) {
            switch (pageId) {
                case PAGE_THEME_COLORS: {
                    String mode = "System";
                    if (MaterialYouConfig.isSystemThemeModeEnabled()) {
                        int m = MaterialYouConfig.getThemeMode();
                        if (m == MaterialYouConfig.THEME_MODE_LIGHT) mode = de ? "Hell" : "Light";
                        else if (m == MaterialYouConfig.THEME_MODE_DARK) mode = de ? "Dunkel" : "Dark";
                    } else {
                        mode = de ? "Dunkel" : "Dark";
                    }
                    if (!MaterialYouConfig.isMaterialYouPatchInstalled()) {
                        return mode;
                    }
                    int s = MaterialYouConfig.getMonetPaletteStyle();
                    String style = s == MaterialYouConfig.MONET_STYLE_VIBRANT ? (de ? "Kräftig" : "Vibrant")
                            : (s == MaterialYouConfig.MONET_STYLE_SUBTLE ? (de ? "Dezent" : "Subtle") : (de ? "Expressiv" : "Expressive"));
                    return mode + " · " + style;
                }
                case PAGE_THEME_GLASS:
                    return MaterialYouConfig.isExpressiveBlurEnabled() ? (de ? "An" : "On") : (de ? "Aus" : "Off");
                case PAGE_PLAYER_NOW: {
                    int s = MaterialYouConfig.getPlayerColorStyle();
                    return s == MaterialYouConfig.PLAYER_STYLE_COVER_PASTEL ? (de ? "Pastell" : "Pastel")
                            : (s == MaterialYouConfig.PLAYER_STYLE_DARK_BLUR ? "Tonal" : "Blur");
                }
                case PAGE_PLAYER_WAVEFORM:
                    return MaterialYouConfig.isPlayerWaveformSeekbarEnabled() ? (de ? "An" : "On") : (de ? "Aus" : "Off");
                case PAGE_PLAYER_LYRICS:
                    return MaterialYouConfig.isSyllableLyricsEnabled() ? (de ? "An" : "On") : (de ? "Aus" : "Off");
                case PAGE_NAV_DOCK: {
                    int s = MaterialYouConfig.getNavbarColorStyle();
                    return s == MaterialYouConfig.STYLE_PASTEL_SCREENSHOT ? (de ? "Pastell" : "Pastel")
                            : (s == MaterialYouConfig.STYLE_HIGH_CONTRAST ? (de ? "Kontrast" : "Vibrant") : "Dark Tonal");
                }
                case PAGE_NAV_SWIPE:
                    return TrackSwipeConfig.getSwipeThresholdDp() + " dp";
                case PAGE_SCREEN_HOME:
                    return MaterialYouConfig.getHomeCoverCornerRadiusInt() + " dp";
                case PAGE_SCREEN_PLAYLIST:
                    return MaterialYouConfig.getPlaylistAccentMode() == MaterialYouConfig.PLAYLIST_ACCENT_ADAPTIVE
                            ? "Cover + Monet" : "System Monet";
                case PAGE_SCREEN_MEDIA: {
                    int enabled = 0;
                    if (MaterialYouConfig.isExpressiveAlbumsEnabled()) enabled++;
                    if (MaterialYouConfig.isExpressiveArtistsEnabled()) enabled++;
                    if (MaterialYouConfig.isExpressiveMyTracksEnabled()) enabled++;
                    if (MaterialYouConfig.isExpressiveCollectionEnabled()) enabled++;
                    return enabled + "/4";
                }
                case PAGE_SCREEN_SEARCH:
                    return MaterialYouConfig.getSearchBarCornerStyle() == MaterialYouConfig.SEARCH_BAR_STYLE_PILL
                            ? "Pill" : "Squircle";
                case PAGE_SCREEN_SHEETS: {
                    int s = MaterialYouConfig.getSheetCornerStyle();
                    return s == MaterialYouConfig.SHEET_CORNER_EXTRA_EXPRESSIVE ? "32 dp"
                            : (s == MaterialYouConfig.SHEET_CORNER_ROUNDED ? "20 dp" : "28 dp");
                }
                case PAGE_LINN: {
                    int q = LinnConfig.getAudioQualityMode();
                    return q == LinnConfig.QUALITY_HI_RES ? "Hi-Res"
                            : (q == LinnConfig.QUALITY_LOSSLESS ? "Lossless" : "High");
                }
                default:
                    return "";
            }
        }

        private int[] getOptionIdsForPage(int pageId) {
            switch (pageId) {
                case PAGE_THEME_COLORS: return OPT_IDS_THEME_COLORS;
                case PAGE_THEME_GLASS: return OPT_IDS_THEME_GLASS;
                case PAGE_PLAYER_NOW: return OPT_IDS_PLAYER_NOW;
                case PAGE_PLAYER_WAVEFORM: return OPT_IDS_PLAYER_WAVEFORM;
                case PAGE_PLAYER_LYRICS: return OPT_IDS_PLAYER_LYRICS;
                case PAGE_NAV_DOCK: return OPT_IDS_NAV_DOCK;
                case PAGE_NAV_SWIPE: return OPT_IDS_NAV_SWIPE;
                case PAGE_SCREEN_HOME: return OPT_IDS_SCREEN_HOME;
                case PAGE_SCREEN_PLAYLIST: return OPT_IDS_SCREEN_PLAYLIST;
                case PAGE_SCREEN_MEDIA: return OPT_IDS_SCREEN_MEDIA;
                case PAGE_SCREEN_SEARCH: return OPT_IDS_SCREEN_SEARCH;
                case PAGE_SCREEN_SHEETS: return OPT_IDS_SCREEN_SHEETS;
                case PAGE_LINN: return OPT_IDS_LINN;
                default: return new int[0];
            }
        }

        private int countModifiedInPage(int pageId) {
            switch (pageId) {
                case PAGE_THEME_COLORS: {
                    int c = 0;
                    if (MaterialYouConfig.isSystemThemeModeEnabled()
                            && MaterialYouConfig.getThemeMode() != MaterialYouConfig.defaultThemeMode()) c++;
                    if (MaterialYouConfig.isMaterialYouPatchInstalled()) {
                        if (MaterialYouConfig.isAmoledPureBlack() != MaterialYouConfig.defaultAmoledPureBlack()) c++;
                        if (MaterialYouConfig.getMonetPaletteStyle() != MaterialYouConfig.defaultMonetPaletteStyle()) c++;
                        if (MaterialYouConfig.isExpressiveShapesEnabled() != MaterialYouConfig.defaultExpressiveShapesEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_THEME_GLASS: {
                    int c = 0;
                    if (MaterialYouConfig.isMaterialYouPatchInstalled()) {
                        if (MaterialYouConfig.isExpressiveBlurEnabled() != MaterialYouConfig.defaultExpressiveBlurEnabled()) c++;
                        if (MaterialYouConfig.getBlurIntensity() != MaterialYouConfig.defaultBlurIntensity()) c++;
                    }
                    return c;
                }
                case PAGE_PLAYER_NOW: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressivePlayerPatchInstalled()) {
                        if (MaterialYouConfig.getPlayerColorStyle() != MaterialYouConfig.defaultPlayerColorStyle()) c++;
                        if (MaterialYouConfig.isPlayerCoverSwipeEnabled() != MaterialYouConfig.defaultPlayerCoverSwipeEnabled()) c++;
                        if (MaterialYouConfig.isPlayerSquigglySeekbarEnabled() != MaterialYouConfig.defaultPlayerSquigglySeekbarEnabled()) c++;
                        if (MaterialYouConfig.isExpressivePlayQueueEnabled() != MaterialYouConfig.defaultExpressivePlayQueueEnabled()) c++;
                        if (MaterialYouConfig.isPlayerTabletDesktopLayoutEnabled() != MaterialYouConfig.defaultPlayerTabletDesktopLayoutEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_PLAYER_WAVEFORM: {
                    int c = 0;
                    if (MaterialYouConfig.isWaveformSeekbarPatchInstalled()) {
                        if (MaterialYouConfig.isPlayerWaveformSeekbarEnabled() != MaterialYouConfig.defaultPlayerWaveformSeekbarEnabled()) c++;
                        if (MaterialYouConfig.getPlayerWaveformStyle() != MaterialYouConfig.defaultPlayerWaveformStyle()) c++;
                        if (MaterialYouConfig.getPlayerWaveformBarDensity() != MaterialYouConfig.defaultPlayerWaveformBarDensity()) c++;
                        if (MaterialYouConfig.isPlayerWaveformLiveReactiveEnabled() != MaterialYouConfig.defaultPlayerWaveformLiveReactiveEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_PLAYER_LYRICS: {
                    int c = 0;
                    if (MaterialYouConfig.isSyllableLyricsPatchInstalled()) {
                        if (MaterialYouConfig.isSyllableLyricsEnabled() != MaterialYouConfig.defaultSyllableLyricsEnabled()) c++;
                        if (MaterialYouConfig.isLyricsProgressiveBlurEnabled() != MaterialYouConfig.defaultLyricsProgressiveBlurEnabled()) c++;
                        if (MaterialYouConfig.getLyricsBlurStrength() != MaterialYouConfig.defaultLyricsBlurStrength()) c++;
                    }
                    return c;
                }
                case PAGE_NAV_DOCK: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressiveNavbarPatchInstalled()) {
                        if (MaterialYouConfig.getNavbarColorStyle() != MaterialYouConfig.defaultNavbarColorStyle()) c++;
                        if (MaterialYouConfig.isHideUploadTab() != MaterialYouConfig.defaultHideUploadTab()) c++;
                        if (MaterialYouConfig.isMiniPlayerSwipeEnabled() != MaterialYouConfig.defaultMiniPlayerSwipeEnabled()) c++;
                        if (MaterialYouConfig.isNavbarProgressiveBlurEnabled() != MaterialYouConfig.defaultNavbarProgressiveBlurEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_NAV_SWIPE: {
                    int c = 0;
                    if (MaterialYouConfig.isTrackSwipePatchInstalled()) {
                        if (TrackSwipeConfig.getSwipeRightAction() != TrackSwipeConfig.defaultSwipeRightAction()) c++;
                        if (TrackSwipeConfig.getSwipeLeftAction() != TrackSwipeConfig.defaultSwipeLeftAction()) c++;
                        if (TrackSwipeConfig.isHapticEnabled() != TrackSwipeConfig.defaultHapticEnabled()) c++;
                        if (TrackSwipeConfig.getSwipeThresholdDp() != TrackSwipeConfig.defaultSwipeThresholdDp()) c++;
                    }
                    return c;
                }
                case PAGE_SCREEN_HOME: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressiveHomePatchInstalled()) {
                        if (MaterialYouConfig.getHomeCoverCornerRadiusInt() != MaterialYouConfig.defaultHomeCoverCornerRadiusInt()) c++;
                        if (MaterialYouConfig.isHomePullToRefreshEnabled() != MaterialYouConfig.defaultHomePullToRefreshEnabled()) c++;
                        if (MaterialYouConfig.isHideHomeHeadlinersBanner() != MaterialYouConfig.defaultHideHomeHeadlinersBanner()) c++;
                        if (MaterialYouConfig.isHideHomePromoModules() != MaterialYouConfig.defaultHideHomePromoModules()) c++;
                        if (MaterialYouConfig.isHideHomeMerchModules() != MaterialYouConfig.defaultHideHomeMerchModules()) c++;
                    }
                    return c;
                }
                case PAGE_SCREEN_PLAYLIST: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressivePlaylistPatchInstalled()) {
                        if (MaterialYouConfig.getPlaylistAccentMode() != MaterialYouConfig.defaultPlaylistAccentMode()) c++;
                        if (MaterialYouConfig.isPlaylistHeroCoverFadeEnabled() != MaterialYouConfig.defaultPlaylistHeroCoverFadeEnabled()) c++;
                        if (MaterialYouConfig.isPlaylistTrackRowPolishEnabled() != MaterialYouConfig.defaultPlaylistTrackRowPolishEnabled()) c++;
                        if (MaterialYouConfig.isHidePlaylistActionButtonsEnabled() != MaterialYouConfig.defaultHidePlaylistActionButtonsEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_SCREEN_MEDIA: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressiveMediaPagesPatchInstalled()) {
                        if (MaterialYouConfig.isExpressiveAlbumsEnabled() != MaterialYouConfig.defaultExpressiveAlbumsEnabled()) c++;
                        if (MaterialYouConfig.isExpressiveArtistsEnabled() != MaterialYouConfig.defaultExpressiveArtistsEnabled()) c++;
                        if (MaterialYouConfig.isExpressiveMyTracksEnabled() != MaterialYouConfig.defaultExpressiveMyTracksEnabled()) c++;
                        if (MaterialYouConfig.isExpressiveCollectionEnabled() != MaterialYouConfig.defaultExpressiveCollectionEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_SCREEN_SEARCH: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressiveSearchPatchInstalled()) {
                        if (MaterialYouConfig.getSearchBarCornerStyle() != MaterialYouConfig.defaultSearchBarCornerStyle()) c++;
                        if (MaterialYouConfig.isExpressiveSearchCardsEnabled() != MaterialYouConfig.defaultExpressiveSearchCardsEnabled()) c++;
                        if (MaterialYouConfig.isExpressiveSearchHeaderBlurEnabled() != MaterialYouConfig.defaultExpressiveSearchHeaderBlurEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_SCREEN_SHEETS: {
                    int c = 0;
                    if (MaterialYouConfig.isExpressiveSheetsPatchInstalled()) {
                        if (MaterialYouConfig.getSheetCornerStyle() != MaterialYouConfig.defaultSheetCornerStyle()) c++;
                        if (MaterialYouConfig.isGroupedContextMenuCardsEnabled() != MaterialYouConfig.defaultGroupedContextMenuCardsEnabled()) c++;
                        if (MaterialYouConfig.isExpressivePopupMenusEnabled() != MaterialYouConfig.defaultExpressivePopupMenusEnabled()) c++;
                        if (MaterialYouConfig.isExpressiveDialogsEnabled() != MaterialYouConfig.defaultExpressiveDialogsEnabled()) c++;
                    }
                    return c;
                }
                case PAGE_LINN: {
                    int c = 0;
                    if (MaterialYouConfig.isLinnDsmPatchInstalled()) {
                        if (LinnConfig.getAudioQualityMode() != LinnConfig.defaultAudioQualityMode()) c++;
                        if (LinnConfig.getStreamDeliveryMode() != LinnConfig.defaultStreamDeliveryMode()) c++;
                        if (LinnConfig.isAutoWakeAndSwitchEnabled() != LinnConfig.defaultAutoWakeAndSwitchEnabled()) c++;
                        String defIp = LinnConfig.defaultManualDeviceIp();
                        String curIp = LinnConfig.getManualDeviceIp();
                        if (curIp == null) curIp = "";
                        if (defIp == null) defIp = "";
                        if (!curIp.equals(defIp)) c++;
                    }
                    return c;
                }
                default:
                    return 0;
            }
        }
    }

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        PatchSettingsPrefs.ensureInitialized(activity);

        Dialog existing = activeDialogRef.get();
        if (existing != null && existing.isShowing()) {
            try {
                existing.dismiss();
            } catch (Throwable ignored) {
            }
        }

        final ScreenController[] ctrlHolder = new ScreenController[1];
        final FrameLayout[] rootHolder = new FrameLayout[1];

        final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar) {
            @Override
            public void onBackPressed() {
                ScreenController ctrl = ctrlHolder[0];
                if (ctrl != null && ctrl.handleBackNavigation()) {
                    return;
                }
                animateScreenDismiss(this, rootHolder[0]);
            }

            @Override
            public void onWindowFocusChanged(boolean hasFocus) {
                super.onWindowFocusChanged(hasFocus);
                ScreenController ctrl = ctrlHolder[0];
                if (hasFocus && ctrl != null) {
                    ctrl.onWindowRegainedFocus();
                }
            }
        };
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCanceledOnTouchOutside(false);

        Context ctx = dialog.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        Palette palette = new Palette(ctx);
        final ScreenController ctrl = new ScreenController(activity, dialog, palette, density);
        ctrlHolder[0] = ctrl;

        FrameLayout rootContainer = new FrameLayout(ctx);
        rootContainer.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        rootContainer.setElevation(0f);
        rootContainer.setOutlineProvider(null);
        rootContainer.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        ctrl.rootContainer = rootContainer;
        rootHolder[0] = rootContainer;

        LinearLayout mainColumn = new LinearLayout(ctx);
        mainColumn.setOrientation(LinearLayout.VERTICAL);
        mainColumn.setElevation(0f);
        mainColumn.setOutlineProvider(null);
        mainColumn.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        final int padH = dp(density, 16f);

        // Minimal Instagram-style flat Top App Bar (zero drop shadow, zero divider)
        LinearLayout topBar = new LinearLayout(ctx);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        topBar.setElevation(0f);
        topBar.setOutlineProvider(null);
        topBar.setPadding(dp(density, 8f), dp(density, 8f), dp(density, 8f), dp(density, 6f));
        ctrl.topAppBar = topBar;

        FrameLayout backBtn = new FrameLayout(ctx);
        ImageView backIv = new ImageView(ctx);
        backIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        backBtn.addView(backIv, new FrameLayout.LayoutParams(dp(density, 22f), dp(density, 22f), Gravity.CENTER));
        backBtn.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            if (!ctrl.handleBackNavigation()) {
                animateScreenDismiss(dialog, rootContainer);
            }
        });
        LinearLayout.LayoutParams backLp = new LinearLayout.LayoutParams(dp(density, 44f), dp(density, 44f));
        backLp.setMarginEnd(dp(density, 6f));
        ctrl.backBtn = backBtn;
        ctrl.backIconView = backIv;
        topBar.addView(backBtn, backLp);

        TextView titleTv = new TextView(ctx);
        titleTv.setText("MaterialTidal");
        titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19.5f);
        titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        titleTv.setMaxLines(1);
        titleTv.setEllipsize(TextUtils.TruncateAt.END);
        ctrl.titleView = titleTv;
        topBar.addView(titleTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        FrameLayout resetBtn = new FrameLayout(ctx);
        ImageView resetIv = new ImageView(ctx);
        resetIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        resetBtn.addView(resetIv, new FrameLayout.LayoutParams(dp(density, 20f), dp(density, 20f), Gravity.CENTER));
        resetBtn.setOnClickListener(v -> {
            v.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            ctrl.showResetConfirmationDialog();
        });
        ctrl.resetBtn = resetBtn;
        ctrl.resetIconView = resetIv;
        topBar.addView(resetBtn, new LinearLayout.LayoutParams(dp(density, 44f), dp(density, 44f)));

        mainColumn.addView(topBar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // Clean ScrollView without edge fade shadows or overscroll glow
        int screenW = ctx.getResources().getDisplayMetrics().widthPixels;
        int maxContentWidth = Math.min(screenW, dp(density, 680f));

        ScrollView scrollView = new ScrollView(ctx);
        scrollView.setVerticalScrollBarEnabled(false);
        scrollView.setVerticalFadingEdgeEnabled(false);
        scrollView.setOverScrollMode(View.OVER_SCROLL_NEVER);
        ctrl.scrollView = scrollView;

        final LinearLayout content = new LinearLayout(ctx);
        content.setOrientation(LinearLayout.VERTICAL);
        final int basePadTop = dp(density, 4f);
        final int basePadBottom = dp(density, 84f);
        content.setPadding(padH, basePadTop, padH, basePadBottom);
        ctrl.contentContainer = content;

        FrameLayout.LayoutParams contentLp = new FrameLayout.LayoutParams(
                maxContentWidth,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER_HORIZONTAL
        );
        scrollView.addView(content, contentLp);

        mainColumn.addView(scrollView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1f
        ));

        rootContainer.addView(mainColumn);

        // Flat bottom Reload/Restart banner (zero elevation, zero gradient, zero border)
        LinearLayout reloadBanner = new LinearLayout(ctx);
        reloadBanner.setOrientation(LinearLayout.HORIZONTAL);
        reloadBanner.setGravity(Gravity.CENTER_VERTICAL);
        reloadBanner.setElevation(0f);
        reloadBanner.setPadding(dp(density, 14f), dp(density, 10f), dp(density, 10f), dp(density, 10f));
        reloadBanner.setVisibility(View.GONE);

        ImageView reloadIv = new ImageView(ctx);
        reloadIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        LinearLayout.LayoutParams rIvLp = new LinearLayout.LayoutParams(dp(density, 20f), dp(density, 20f));
        rIvLp.setMarginEnd(dp(density, 10f));
        ctrl.reloadIconView = reloadIv;
        reloadBanner.addView(reloadIv, rIvLp);

        TextView reloadHint = new TextView(ctx);
        reloadHint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        reloadHint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        ctrl.reloadHintView = reloadHint;
        reloadBanner.addView(reloadHint, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView reloadBtn = new TextView(ctx);
        reloadBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        reloadBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        reloadBtn.setPadding(dp(density, 14f), dp(density, 7.5f), dp(density, 14f), dp(density, 7.5f));
        ctrl.reloadActionBtn = reloadBtn;
        LinearLayout.LayoutParams rBtnLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        rBtnLp.setMarginStart(dp(density, 8f));
        reloadBanner.addView(reloadBtn, rBtnLp);

        FrameLayout.LayoutParams bannerLp = new FrameLayout.LayoutParams(
                Math.min(screenW - padH * 2, dp(density, 648f)),
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL
        );
        bannerLp.bottomMargin = dp(density, 14f);
        ctrl.reloadBanner = reloadBanner;
        rootContainer.addView(reloadBanner, bannerLp);

        if (Build.VERSION.SDK_INT >= 20) {
            final int topBarBasePadTop = dp(density, 8f);
            final int topBarPadH = dp(density, 8f);
            rootContainer.setOnApplyWindowInsetsListener((v, insets) -> {
                int topInset;
                int bottomInset;
                if (Build.VERSION.SDK_INT >= 30) {
                    topInset = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
                    bottomInset = insets.getInsets(WindowInsets.Type.navigationBars() | WindowInsets.Type.displayCutout()).bottom;
                } else {
                    topInset = insets.getSystemWindowInsetTop();
                    bottomInset = insets.getSystemWindowInsetBottom();
                }
                topBar.setPadding(topBarPadH, topBarBasePadTop + topInset, topBarPadH, dp(density, 6f));
                content.setPadding(padH, basePadTop, padH, basePadBottom + bottomInset);
                FrameLayout.LayoutParams bLp = (FrameLayout.LayoutParams) reloadBanner.getLayoutParams();
                bLp.bottomMargin = dp(density, 14f) + bottomInset;
                reloadBanner.setLayoutParams(bLp);
                return insets;
            });
        }

        ctrl.renderChrome();
        ctrl.rebuildContent();

        dialog.setContentView(rootContainer);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setBackgroundDrawable(new ColorDrawable(palette.surfaceBase));
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0f);
            window.setElevation(0f);
            window.setWindowAnimations(0);
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= 29) {
                window.setStatusBarContrastEnforced(false);
                window.setNavigationBarContrastEnforced(false);
            }
            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
            }
            View decor = window.getDecorView();
            if (decor != null) {
                decor.setElevation(0f);
                decor.setOutlineProvider(null);
            }
            try {
                MaterialYouColorEngine.applySystemBarAppearance(window, palette.lightMode);
            } catch (Throwable ignored) {
            }
        }

        activeDialogRef = new WeakReference<>(dialog);
        dialog.setOnDismissListener(d -> {
            if (activeDialogRef.get() == dialog) {
                activeDialogRef = new WeakReference<>(null);
            }
        });
        dialog.show();

        float startX = Math.max(dpf(density, 64f), screenW * 0.18f);
        rootContainer.setTranslationX(startX);
        rootContainer.setAlpha(0f);
        rootContainer.animate()
                .translationX(0f)
                .alpha(1f)
                .setDuration(240L)
                .setInterpolator(new PathInterpolator(0.05f, 0.7f, 0.1f, 1.0f))
                .start();
    }

    private static void reloadActivityUi(Activity activity, Dialog dialog) {
        try {
            if (dialog != null && dialog.isShowing()) {
                dialog.dismiss();
            }
        } catch (Throwable ignored) {
        }
        if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
            activity.recreate();
        }
    }

    private static void restartTidalApp(Activity activity, Dialog dialog) {
        try {
            if (dialog != null && dialog.isShowing()) {
                dialog.dismiss();
            }
        } catch (Throwable ignored) {
        }
        if (activity == null) {
            return;
        }
        try {
            Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
            if (launch != null) {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                activity.startActivity(launch);
            }
            activity.finishAffinity();
        } catch (Throwable ignored) {
        }
        Runtime.getRuntime().exit(0);
    }

    private static void animateScreenDismiss(final Dialog dialog, View rootView) {
        if (dialog == null || !dialog.isShowing()) {
            return;
        }
        if (rootView == null) {
            try {
                dialog.dismiss();
            } catch (Throwable ignored) {
            }
            return;
        }
        rootView.animate().cancel();
        float exitX = Math.max(rootView.getWidth() * 0.22f, 160f);
        rootView.animate()
                .translationX(exitX)
                .alpha(0f)
                .setDuration(190L)
                .setInterpolator(new PathInterpolator(0.3f, 0f, 0.8f, 0.15f))
                .setListener(new AnimatorListenerAdapter() {
                    @Override
                    public void onAnimationEnd(Animator animation) {
                        try {
                            if (dialog.isShowing()) {
                                dialog.dismiss();
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                })
                .start();
    }

    private static boolean isGermanLocale() {
        try {
            String lang = Locale.getDefault().getLanguage();
            return lang != null && lang.toLowerCase(Locale.ROOT).startsWith("de");
        } catch (Throwable ignored) {
            return false;
        }
    }
}
