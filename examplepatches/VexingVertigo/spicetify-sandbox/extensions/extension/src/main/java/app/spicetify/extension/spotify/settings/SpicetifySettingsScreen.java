package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.text.TextUtils;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/**
 * One Spicetify settings page, shown as a full-screen dialog over Spotify's activity.
 * <p>
 * A root mount install keeps Spotify's stock manifest, so an activity the patch adds never exists
 * there, and starting one threw {@code ActivityNotFoundException}. Pages stack the way activities
 * did: Back closes the top one, and the open pages come back when Spotify recreates its activity,
 * for example on rotation. Each page is a Material-themed context for its views, because Spotify's
 * own theme restyles framework widgets.
 */
public final class SpicetifySettingsScreen extends ContextThemeWrapper {
    public static final String PAGE_ADS = "ads";
    public static final String PAGE_HOME = "home";
    public static final String PAGE_SHARING = "sharing";
    public static final String PAGE_APPEARANCE = "appearance";
    public static final String PAGE_SERVER = "server";
    public static final String PAGE_MARKETPLACE = "marketplace";
    /** The Marketplace, opened on its Extensions tab. */
    public static final String PAGE_EXTENSIONS = "extensions";
    private static final String OPEN_PAGES = "app.spicetify.extension.spotify.settings.pages";
    private static final List<SpicetifySettingsScreen> shown = new ArrayList<>();
    private static Application tracked;

    private final Activity activity;
    private final String page;
    private final Dialog dialog;
    private final LinearLayout content;
    /** This is the root page, which a null or unknown page opens. */
    private boolean root;
    private View restartBar;

    public static void open(Activity activity) {
        open(activity, null);
    }

    /** Shows a page above the open ones; a null or unknown page is the root. */
    public static void open(Activity activity, String page) {
        // Showing a dialog on a finishing activity throws, which would crash Spotify.
        if (activity.isFinishing() || activity.isDestroyed()) return;
        track(activity.getApplication());
        SpicetifySettingsScreen screen = new SpicetifySettingsScreen(activity, page);
        screen.dialog.show();
        shown.add(screen);
    }

    private SpicetifySettingsScreen(Activity activity, String page) {
        super(activity, android.R.style.Theme_Material_NoActionBar);
        this.activity = activity;
        this.page = page;
        dialog = new Dialog(this, android.R.style.Theme_Material_NoActionBar);
        content = SpotifyStyle.column(this);
        String title;
        if (PAGE_ADS.equals(page)) {
            title = "Ads";
            buildAds(content);
        } else if (PAGE_HOME.equals(page)) {
            title = "Home and navigation";
            buildHome(content);
        } else if (PAGE_SHARING.equals(page)) {
            title = "Sharing";
            buildSharing(content);
        } else if (PAGE_APPEARANCE.equals(page)) {
            title = "Appearance";
            buildAppearance(content);
        } else if (PAGE_SERVER.equals(page)) {
            title = "Server files";
            buildServer(content);
        } else if (PAGE_MARKETPLACE.equals(page) || PAGE_EXTENSIONS.equals(page)) {
            title = "Spicetify Marketplace";
            buildMarketplace(content);
        } else {
            title = "Spicetify";
            root = true;
            buildRoot(content);
        }
        dialog.setTitle(title);
        restartBar = SpotifyStyle.restartBar(this, view -> SpotifyRestart.restart(this));
        // The Marketplace's list scrolls on its own.
        dialog.setContentView(SpotifyStyle.screen(dialog, title, content, restartBar,
                !PAGE_MARKETPLACE.equals(page) && !PAGE_EXTENSIONS.equals(page)));
        refreshRestartBar();
        dialog.setOnDismissListener(closed -> {
            shown.remove(this);
            // The page below shows again; refresh it as the activity did when it resumed.
            for (SpicetifySettingsScreen below : shown) below.refresh();
        });
    }

    /** Keeps the open pages when Spotify recreates its activity, for example on rotation. */
    private static void track(Application application) {
        if (tracked == application) return;
        tracked = application;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, Bundle state) {
                ArrayList<String> pages = state == null ? null : state.getStringArrayList(OPEN_PAGES);
                // Reopen them once Spotify has finished creating the new activity.
                if (pages != null) new Handler(Looper.getMainLooper()).post(() -> {
                    for (String page : pages) open(activity, page);
                });
            }

            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {
                ArrayList<String> pages = new ArrayList<>();
                for (SpicetifySettingsScreen screen : shown) if (screen.activity == activity) pages.add(screen.page);
                if (!pages.isEmpty()) state.putStringArrayList(OPEN_PAGES, pages);
            }

            @Override public void onActivityDestroyed(Activity activity) {
                // Close its pages before its windows go, so none of them leaks.
                for (SpicetifySettingsScreen screen : new ArrayList<>(shown)) {
                    if (screen.activity != activity) continue;
                    shown.remove(screen);
                    screen.dialog.dismiss();
                }
            }

            @Override public void onActivityStarted(Activity activity) {}
            @Override public void onActivityResumed(Activity activity) {}
            @Override public void onActivityPaused(Activity activity) {}
            @Override public void onActivityStopped(Activity activity) {}
        });
    }

    /** Shows the restart bar while a setting read at startup is waiting for Spotify to restart. */
    void refreshRestartBar() {
        if (restartBar != null) restartBar.setVisibility(PatchSettings.restartRequired() ? View.VISIBLE : View.GONE);
    }

    /**
     * The restart bar, on Appearance the theme in use, which the Marketplace above it can change, and
     * on the root page the extensions that are on, which the Marketplace and their sheets can change.
     */
    void refresh() {
        refreshRestartBar();
        if (PAGE_APPEARANCE.equals(page)) {
            content.removeAllViews();
            buildAppearance(content);
        } else if (root) {
            content.removeAllViews();
            buildRoot(content);
        }
    }

    /** Opens another page above this one. */
    void openPage(String page) {
        open(activity, page);
    }

    private void buildRoot(LinearLayout content) {
        content.setPadding(0, SpotifyStyle.dp(this, 8), 0, 0);
        boolean any = false;
        List<String> ads = new ArrayList<>();
        if (InstalledPatches.hideBrandAds()) ads.add("Home and Browse");
        if (InstalledPatches.hidePlayerAdCards()) ads.add("Now Playing");
        any |= category(content, "encore_icon_ad_free_24", "Ads", ads, PAGE_ADS);
        List<String> home = new ArrayList<>();
        if (InstalledPatches.hidePremiumTab()) home.add("Premium tab");
        if (InstalledPatches.homePins()) home.add("Home shortcuts");
        any |= category(content, "encore_icon_home_24", "Home and navigation", home, PAGE_HOME);
        any |= category(content, "encore_icon_share_android_24", "Sharing",
                InstalledPatches.cleanSharing() ? List.of("Clean sharing links") : List.of(), PAGE_SHARING);
        any |= category(content, "encore_icon_edit_24", "Appearance",
                InstalledPatches.themeColors() ? List.of("Theme colors") : List.of(), PAGE_APPEARANCE);
        any |= category(content, "encore_icon_folder_24", "Server files",
                InstalledPatches.serverFiles() ? List.of("WebDAV", "Jellyfin") : List.of(), PAGE_SERVER);
        if (InstalledPatches.extensions()) {
            any = true;
            ExtensionSettings.build(this, content);
        }
        if (!any) {
            TextView empty = SpotifyStyle.body(this, "No configurable Spicetify patches are installed.");
            empty.setPadding(SpotifyStyle.dp(this, 16), SpotifyStyle.dp(this, 16), SpotifyStyle.dp(this, 16), 0);
            content.addView(empty);
        }
    }

    private boolean category(LinearLayout content, String icon, String title, List<String> items, String page) {
        if (items.isEmpty()) return false;
        SpotifyStyle.categoryRow(content, icon, title, TextUtils.join(" \u2022 ", items),
                view -> open(activity, page));
        return true;
    }

    private void buildAds(LinearLayout content) {
        if (InstalledPatches.hideBrandAds()) {
            SpotifyStyle.toggleRow(content, "Hide Home and Browse ads",
                    "Hide image and video brand-ad sections on Home and Browse. Audio ads and upgrade prompts are unchanged.",
                    PatchSettings.hideBrandAdsEnabled(), (button, enabled) -> {
                        PatchSettings.setHideBrandAdsEnabled(enabled);
                        refreshRestartBar();
                    });
        }
        if (InstalledPatches.hidePlayerAdCards()) {
            SpotifyStyle.toggleRow(content, "Hide player ad cards",
                    "Hide brand-ad cards and ads that replace the cover art in Now Playing. Audio ads are unchanged.",
                    PatchSettings.hidePlayerAdCardsEnabled(), (button, enabled) -> {
                        PatchSettings.setHidePlayerAdCardsEnabled(enabled);
                        refreshRestartBar();
                    });
        }
    }

    private void buildHome(LinearLayout content) {
        if (InstalledPatches.hidePremiumTab()) {
            SpotifyStyle.toggleRow(content, "Hide Premium tab",
                    "Hide the Premium tab in navigation. Your subscription and other ads are unchanged.",
                    PatchSettings.hidePremiumTabEnabled(), (button, enabled) -> {
                        PatchSettings.setHidePremiumTabEnabled(enabled);
                        refreshRestartBar();
                    });
        }
        if (InstalledPatches.homePins()) HomePinsSettings.build(this, content);
    }

    private void buildSharing(LinearLayout content) {
        if (InstalledPatches.cleanSharing()) {
            SpotifyStyle.toggleRow(content, "Clean sharing links",
                    "Remove tracking parameters from Spotify links you share. "
                            + "Timestamps and playback context are preserved. Changes apply immediately.",
                    PatchSettings.cleanSharingEnabled(), (button, enabled) -> PatchSettings.setCleanSharingEnabled(enabled));
        }
    }

    private void buildAppearance(LinearLayout content) {
        if (InstalledPatches.themeColors()) ThemeSettings.build(this, content);
    }

    private void buildServer(LinearLayout content) {
        if (!InstalledPatches.serverFiles()) return;
        int padding = SpotifyStyle.dp(this, 16);
        content.setPadding(padding, 0, padding, 0);
        content.addView(new ServerFilesSettings(this));
    }

    private void buildMarketplace(LinearLayout content) {
        content.addView(new MarketplaceSettings(this, PAGE_EXTENSIONS.equals(page)),
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
    }

}
