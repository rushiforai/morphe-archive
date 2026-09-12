package app.morphe.extension.tiktok.settings.preference;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.Preference;
import android.view.View;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.Utils;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

@SuppressWarnings("deprecation")
public final class BlueITProfilesPreference extends Preference {
    private static final String[] PROFILE_NAMES = {
            "Clean TikTok",
            "Focused feed",
            "Privacy & control",
            "Reset BlueIT profile settings"
    };

    public BlueITProfilesPreference(Context context) {
        super(context);
        setTitle("BlueIT profiles");
        setSummary("Apply a curated group of BlueIT settings in one step.");
        setOnPreferenceClickListener(preference -> {
            new AlertDialog.Builder(context)
                    .setTitle("BlueIT profiles")
                    .setItems(PROFILE_NAMES, (dialog, which) -> applyProfile(context, which))
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
            return true;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }

    private static void applyProfile(Context context, int profile) {
        switch (profile) {
            case 0:
                applyCleanTikTok();
                break;
            case 1:
                applyFocusedFeed();
                break;
            case 2:
                applyPrivacyAndControl();
                break;
            case 3:
                resetManagedSettings();
                break;
            default:
                return;
        }

        String name = PROFILE_NAMES[profile];
        new AlertDialog.Builder(context)
                .setTitle(name + " applied")
                .setMessage("The profile was saved. Restart TikTok so every reboot-required patch setting is applied consistently.")
                .setNegativeButton("Later", null)
                .setPositiveButton("Restart", (dialog, which) -> app.morphe.extension.shared.Utils.restartApp(context))
                .show();
    }

    private static void applyCleanTikTok() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_SHOP.save(true);
        Settings.HIDE_HOMEPAGE_COIN.save(true);
        Settings.HIDE_CAPTCHA_POPUPS.save(true);
        Settings.HIDE_COMMENT_QUICK_REACTIONS.save(true);
        Settings.HIDE_TAKO_AI.save(true);
        Settings.DISABLE_LONG_PRESS_QUICK_SHARE.save(true);
        BaseSettings.SANITIZE_SHARING_LINKS.save(true);
        if (SettingsStatus.advancedFeedFilterEnabled) {
            Settings.HIDE_PROMOTIONAL_MUSIC.save(true);
            Settings.HIDE_LIVE_REPLAYS.save(true);
        }
    }

    private static void applyFocusedFeed() {
        Settings.REMOVE_ADS.save(true);
        Settings.HIDE_SHOP.save(true);
        Settings.HIDE_LIVE.save(true);
        Settings.HIDE_STORY.save(true);
        Settings.HIDE_IMAGE.save(false);
        if (SettingsStatus.seenVideoFilterEnabled) {
            Settings.HIDE_SEEN_VIDEOS.save(true);
            Settings.SEEN_VIDEO_RETENTION_DAYS.save("30");
        }
        if (SettingsStatus.advancedFeedFilterEnabled) {
            Settings.HIDE_PROMOTIONAL_MUSIC.save(true);
            Settings.HIDE_LIVE_REPLAYS.save(true);
        }
    }

    private static void applyPrivacyAndControl() {
        BaseSettings.SANITIZE_SHARING_LINKS.save(true);
        Settings.OPEN_EXTERNAL_LINKS.save(true);
        Settings.ENABLE_NON_PERSONALIZED_SEARCH.save(true);
        Settings.DISABLE_LONG_PRESS_QUICK_SHARE.save(true);
        Settings.HIDE_CAPTCHA_POPUPS.save(true);
        Settings.HIDE_HOMEPAGE_COIN.save(true);
    }

    private static void resetManagedSettings() {
        Settings.REMOVE_ADS.resetToDefault();
        Settings.HIDE_SHOP.resetToDefault();
        Settings.HIDE_LIVE.resetToDefault();
        Settings.HIDE_STORY.resetToDefault();
        Settings.HIDE_IMAGE.resetToDefault();
        Settings.HIDE_HOMEPAGE_COIN.resetToDefault();
        Settings.HIDE_CAPTCHA_POPUPS.resetToDefault();
        Settings.HIDE_COMMENT_QUICK_REACTIONS.resetToDefault();
        Settings.HIDE_TAKO_AI.resetToDefault();
        Settings.DISABLE_LONG_PRESS_QUICK_SHARE.resetToDefault();
        Settings.OPEN_EXTERNAL_LINKS.resetToDefault();
        Settings.ENABLE_NON_PERSONALIZED_SEARCH.resetToDefault();
        Settings.HIDE_SEEN_VIDEOS.resetToDefault();
        Settings.SEEN_VIDEO_RETENTION_DAYS.resetToDefault();
        Settings.HIDE_PROMOTIONAL_MUSIC.resetToDefault();
        Settings.HIDE_LIVE_REPLAYS.resetToDefault();
        Settings.MAX_VIEWS_PER_LIKE.resetToDefault();
        BaseSettings.SANITIZE_SHARING_LINKS.resetToDefault();
    }
}
