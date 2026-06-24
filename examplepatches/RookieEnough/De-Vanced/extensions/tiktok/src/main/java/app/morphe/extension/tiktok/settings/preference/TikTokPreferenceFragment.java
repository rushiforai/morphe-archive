/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/TikTokPreferenceFragment.java
 */

package app.morphe.extension.tiktok.settings.preference;

import android.preference.Preference;
import android.preference.PreferenceScreen;

import androidx.annotation.NonNull;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.tiktok.settings.preference.categories.DownloadsPreferenceCategory;
import app.morphe.extension.tiktok.settings.preference.categories.ExtensionPreferenceCategory;
import app.morphe.extension.tiktok.settings.preference.categories.FeedFilterPreferenceCategory;
import app.morphe.extension.tiktok.settings.preference.categories.SimSpoofPreferenceCategory;

@SuppressWarnings("deprecation")
public class TikTokPreferenceFragment extends AbstractPreferenceFragment {

    @Override
    protected void syncSettingWithPreference(
            @NonNull Preference pref,
            @NonNull Setting setting,
            boolean applySettingToPreference
    ) {
        if (pref instanceof RangeValuePreference) {
            RangeValuePreference rangeValuePref = (RangeValuePreference) pref;
            Setting.privateSetValueFromString(setting, rangeValuePref.getValue());
        } else if (pref instanceof DownloadPathPreference) {
            DownloadPathPreference downloadPathPref = (DownloadPathPreference) pref;
            Setting.privateSetValueFromString(setting, downloadPathPref.getValue());
        } else {
            super.syncSettingWithPreference(pref, setting, applySettingToPreference);
        }
    }

    @Override
    protected void initialize() {
        final var context = getActivity();

        // Currently no resources can be compiled for TikTok (fails with aapt error).
        // So all TikTok Strings are hard coded in the extension.
        restartDialogTitle = "Restart required";
        restartDialogMessage = "Restart the app for this change to take effect.";
        restartDialogButtonText = "Restart";
        confirmDialogTitle = "Do you wish to proceed?";

        // App does not use dark mode.
        Utils.setIsDarkModeEnabled(false);

        PreferenceScreen preferenceScreen = getPreferenceManager().createPreferenceScreen(context);
        setPreferenceScreen(preferenceScreen);

        // Custom categories reference app specific Settings class.
        new FeedFilterPreferenceCategory(context, preferenceScreen);
        new DownloadsPreferenceCategory(context, preferenceScreen);
        new SimSpoofPreferenceCategory(context, preferenceScreen);
        new ExtensionPreferenceCategory(context, preferenceScreen);
    }
}

