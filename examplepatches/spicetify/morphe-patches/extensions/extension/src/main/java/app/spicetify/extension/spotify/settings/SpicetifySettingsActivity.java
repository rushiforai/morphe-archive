package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.text.TextUtils;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import app.spicetify.extension.spotify.home.HomePins;
import java.util.ArrayList;
import java.util.List;

public final class SpicetifySettingsActivity extends Activity {
    public static final String EXTRA_PAGE = "app.spicetify.extension.spotify.settings.page";
    public static final String PAGE_ADS = "ads";
    public static final String PAGE_HOME = "home";
    public static final String PAGE_SHARING = "sharing";
    public static final String PAGE_APPEARANCE = "appearance";
    public static final String PAGE_SERVER = "server";

    private View restartBar;

    public static void open(Activity activity) {
        activity.startActivity(new Intent(activity, SpicetifySettingsActivity.class));
    }

    public static Intent page(Context context, String page) {
        return new Intent(context, SpicetifySettingsActivity.class).putExtra(EXTRA_PAGE, page);
    }

    @Override
    protected void onCreate(Bundle state) {
        setTheme(android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        LinearLayout content = SpotifyStyle.column(this);
        String page = getIntent().getStringExtra(EXTRA_PAGE);
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
        } else {
            title = "Spicetify";
            buildRoot(content);
        }
        setTitle(title);
        restartBar = SpotifyStyle.restartBar(this, view -> SpotifyRestart.restart(this));
        setContentView(SpotifyStyle.screen(this, title, content, restartBar));
        refreshRestartBar();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshRestartBar();
    }

    /** Shows the restart bar while a setting read at startup is waiting for Spotify to restart. */
    void refreshRestartBar() {
        if (restartBar != null) restartBar.setVisibility(PatchSettings.restartRequired() ? View.VISIBLE : View.GONE);
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
        if (!any) {
            TextView empty = SpotifyStyle.body(this, "No configurable Spicetify patches are installed.");
            empty.setPadding(SpotifyStyle.dp(this, 16), SpotifyStyle.dp(this, 16), SpotifyStyle.dp(this, 16), 0);
            content.addView(empty);
        }
    }

    private boolean category(LinearLayout content, String icon, String title, List<String> items, String page) {
        if (items.isEmpty()) return false;
        SpotifyStyle.categoryRow(content, icon, title, TextUtils.join(" \u2022 ", items),
                view -> startActivity(page(this, page)));
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
        if (InstalledPatches.homePins()) {
            SpotifyStyle.actionRow(content, "Pinned Home shortcuts",
                    "Choose which shortcuts appear first when Spotify includes them on Home. "
                            + "Return to Home once to load the choices.",
                    view -> chooseHomePins());
        }
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

    private void chooseHomePins() {
        List<HomePins.Choice> choices = HomePins.choices();
        if (choices.isEmpty()) {
            new SpotifySheet(this, "No Home shortcuts loaded",
                    "Return to Home and let its shortcuts load, then open this menu again.")
                    .primary("OK", () -> true).show();
            return;
        }
        String[] labels = new String[choices.size()];
        boolean[] selected = new boolean[choices.size()];
        for (int i = 0; i < choices.size(); i++) {
            HomePins.Choice choice = choices.get(i);
            boolean duplicate = false;
            for (HomePins.Choice other : choices) {
                if (!other.id.equals(choice.id) && other.label.equals(choice.label)) duplicate = true;
            }
            labels[i] = duplicate ? choice.label + "\n" + choice.id : choice.label;
            selected[i] = choice.pinned;
        }
        new SpotifySheet(this, "Pinned Home shortcuts", null)
                .choices(labels, selected)
                .primary("Save", () -> {
                    List<String> ids = new ArrayList<>();
                    for (int i = 0; i < choices.size(); i++) if (selected[i]) ids.add(choices.get(i).id);
                    try {
                        HomePins.setPinned(ids);
                    } catch (IllegalArgumentException changedSelection) {
                        Toast.makeText(this, changedSelection.getMessage(), Toast.LENGTH_LONG).show();
                        return false;
                    }
                    PatchSettings.markRestartRequired();
                    refreshRestartBar();
                    SpotifyRestart.prompt(this, "Restart Spotify to update Home?");
                    return true;
                })
                .secondary("Cancel")
                .show();
    }

}
