/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.privacy.BenchmarkRuns;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.preference.ChoicePreference;
import app.morphe.extension.tiktok.settings.preference.GhostModePreference;
import app.morphe.extension.tiktok.settings.preference.HookStatusPreference;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.SectionHeadingPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;

/**
 * Everything that decides what TikTok learns: tracking, what it may read off the phone, and
 * what a link carries. Before this page the two tracking switches sat at the bottom of App
 * behavior and the seven device-access patches had no switch at all.
 */
@SuppressWarnings("deprecation")
public final class PrivacyPreferenceCategory extends ConditionalPreferenceCategory {
    public PrivacyPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Privacy");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.appLockEnabled || hasTracking() || hasDeviceAccess() || hasLinks();
    }

    private static boolean hasTracking() {
        return SettingsStatus.disableTelemetryEnabled || SettingsStatus.ghostModeEnabled
                || SettingsStatus.searchHistoryEnabled || SettingsStatus.watchHistoryEnabled;
    }

    private static boolean hasDeviceAccess() {
        return SettingsStatus.contactListBlockerEnabled
                || SettingsStatus.installedAppsBlockerEnabled
                || SettingsStatus.locationGovernorEnabled
                || SettingsStatus.devicePrivacyGuardEnabled
                || SettingsStatus.resourceGovernorEnabled
                || SettingsStatus.cameraMicIndicatorEnabled;
    }

    private static boolean hasLinks() {
        return SettingsStatus.sanitizeShareUrlsEnabled
                || SettingsStatus.externalBrowserEnabled
                || SettingsStatus.browserPrivacyGuardEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.appLockEnabled) {
            addPreference(new SectionHeadingPreference(context, "App lock"));
            addPreference(new TogglePreference(
                    context,
                    "Lock TikTok",
                    "Ask for the unlock your phone uses, like a fingerprint or a PIN, when TikTok "
                            + "starts and when you come back to it. A link you open from another app "
                            + "still goes to its video once you unlock. While this is on, TikTok's "
                            + "preview in recent apps stays blank. Needs a screen lock on the phone.",
                    Settings.APP_LOCK
            ));
            addPreference(new ChoicePreference(context, "Lock again after", Settings.APP_LOCK_TIMEOUT,
                    new String[]{"Right away", "After 1 minute", "After 5 minutes", "After 15 minutes"},
                    new String[]{"0", "1", "5", "15"}));
        }
        if (hasTracking()) {
            addPreference(new SectionHeadingPreference(context, "Tracking"));
        }
        if (SettingsStatus.disableTelemetryEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Stop analytics and tracking",
                    "Stop ByteDance AppLog events, AppsFlyer attribution, explicit Firebase screen reports and "
                            + "crash reporting from being sent. TikTok's own diagnostics go quiet with them.",
                    Settings.DISABLE_ANALYTICS
            ));
        }
        if (SettingsStatus.ghostModeEnabled) {
            addPreference(new GhostModePreference(context));
            addPreference(new TogglePreference(
                    context,
                    "Hide online status",
                    "Stop sending TikTok's activity reports, so friends don't see a green dot or "
                            + "Active now while you're in the app. It works only while Ghost mode is "
                            + "on. The same report brings back your friends' status, so theirs may "
                            + "stop updating for you while it's on. Your last status can stay "
                            + "visible for a while.",
                    Settings.GHOST_HIDE_ONLINE_STATUS
            ));
            HookStatusPreference diagnostics = new HookStatusPreference(context);
            diagnostics.setKey("action_ghost_mode_diagnostics");
            diagnostics.setTitle(L10n.t(context, "Ghost mode diagnostics"));
            addPreference(diagnostics);
        }
        if (SettingsStatus.searchHistoryEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Don't save new searches",
                    "Keep what you search for out of the search history TikTok saves on this phone. "
                            + "Searches already there stay until you delete them, and TikTok's servers "
                            + "may still keep their own record.",
                    Settings.STOP_SEARCH_HISTORY
            ));
        }
        if (SettingsStatus.watchHistoryEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep videos out of Watch history",
                    "Stops the view report TikTok sends for each video you watch, which is how videos get "
                            + "into Activity center > Watch history. Your views stop adding to view counts and "
                            + "For You has less to learn from. Videos already there stay, and TikTok still sees "
                            + "likes, follows, searches and its usage logs.",
                    Settings.STOP_WATCH_HISTORY
            ));
        }

        if (hasDeviceAccess()) {
            addPreference(new SectionHeadingPreference(context, "Device access"));
        }
        if (SettingsStatus.contactListBlockerEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Block contact list access",
                    "Answer TikTok's reads of your contacts with an empty list. Find Friends and "
                            + "People you may know lose access to your contact list.",
                    Settings.BLOCK_CONTACT_LIST
            ));
        }
        if (SettingsStatus.installedAppsBlockerEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Block installed app scanning",
                    "Answer TikTok's scan of the apps on this phone with an empty list. A check "
                            + "for one named app, which TikTok also uses to open an app you tap, is "
                            + "left alone.",
                    Settings.BLOCK_INSTALLED_APPS
            ));
        }
        if (SettingsStatus.locationGovernorEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Block location",
                    "Answer TikTok's location requests with nothing. The region settings change "
                            + "the locale and timezone. This switch stops the coordinates.",
                    Settings.BLOCK_LOCATION
            ));
        }
        if (SettingsStatus.devicePrivacyGuardEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Block clipboard reads",
                    "Stop TikTok reading what you copied. Copying a link from TikTok still works.",
                    Settings.BLOCK_CLIPBOARD_READS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide a VPN connection",
                    "Keep TikTok from telling you're on a VPN. Only the VPN shows as off to it, and "
                            + "your other connections read as they really are. Leave this off if you "
                            + "need a feature that checks for a VPN.",
                    Settings.HIDE_VPN
            ));
            addPreference(new TogglePreference(
                    context,
                    "Block the advertising id",
                    "Hand TikTok a blank advertising id, the same one Android gives after you reset "
                            + "yours, so this device can't be matched across apps by it.",
                    Settings.BLOCK_ADVERTISING_ID
            ));
        }
        if (SettingsStatus.resourceGovernorEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Block motion sensors",
                    "Stop TikTok listening to the accelerometer, gyroscope, magnetometer and the "
                            + "other motion sensors it uses to fingerprint the phone.",
                    Settings.BLOCK_MOTION_SENSORS
            ));
            TogglePreference benchmark = new TogglePreference(
                    context,
                    "Stop TikTok's benchmark runs",
                    "TikTok sometimes tests how fast your phone is in a background process of its "
                            + "own, which can hold a lot of memory. This keeps that process from "
                            + "starting. One that's already running stops when TikTok restarts.",
                    Settings.STOP_BENCHMARK_RUNS
            );
            benchmark.setOnPreferenceChangeListener((preference, value) -> {
                BenchmarkRuns.settingsChanged(context, Boolean.TRUE.equals(value));
                return true;
            });
            addPreference(benchmark);
        }
        if (SettingsStatus.cameraMicIndicatorEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show when the camera or microphone is in use",
                    "A green square in the top corner while TikTok has the camera open, and an "
                            + "orange diamond while it records sound. They go when the access ends.",
                    Settings.CAMERA_MIC_INDICATOR
            ));
        }

        if (hasLinks()) {
            addPreference(new SectionHeadingPreference(context, "Links"));
        }
        if (SettingsStatus.sanitizeShareUrlsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Sanitize sharing links",
                    "Remove tracking parameters from shared links.",
                    BaseSettings.SANITIZE_SHARING_LINKS
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Share links through another host",
                    "A host to put in place of tiktok.com when you share or copy a link, like "
                            + "vxtiktok.com. Leave it empty to share TikTok's own links. Only TikTok "
                            + "links are changed, and only the host: nothing is sent anywhere new.",
                    Settings.CUSTOM_SHARE_DOMAIN
            ).withNameKeyboard());
            addPreference(new TogglePreference(
                    context,
                    "Copy the full link for short links",
                    "When Copy link gives you a short vt.tiktok.com or vm.tiktok.com link, Hushfeed "
                            + "opens it once in the background to read the full video link and puts "
                            + "that on your clipboard instead. TikTok sees that open, the same as when "
                            + "anyone taps the link. A link you send to another app goes out as it was.",
                    Settings.EXPAND_SHORT_SHARE_LINKS
            ));
        }
        if (SettingsStatus.externalBrowserEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Open external links directly",
                    "Open profile and story website links in your system browser instead of TikTok's in-app browser.",
                    Settings.OPEN_EXTERNAL_LINKS
            ));
        }
        if (SettingsStatus.browserPrivacyGuardEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Protect external pages in TikTok's browser",
                    "Keep websites outside TikTok from using its connection back into the app. "
                            + "TikTok pages such as Activity center, Watch history, shop checkout "
                            + "and CAPTCHA keep working.",
                    Settings.BLOCK_WEBVIEW_JS_INTERFACES
            ));
        }

    }
}
