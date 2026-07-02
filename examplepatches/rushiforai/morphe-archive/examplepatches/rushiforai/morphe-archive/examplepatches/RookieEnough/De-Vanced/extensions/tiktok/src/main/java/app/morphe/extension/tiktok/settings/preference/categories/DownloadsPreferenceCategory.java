/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/DownloadsPreferenceCategory.java
 */

package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.DownloadPathPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;

@SuppressWarnings("deprecation")
public class DownloadsPreferenceCategory extends ConditionalPreferenceCategory {
    public DownloadsPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Downloads");
    }

    @Override
    public boolean getSettingsStatus() {
        return SettingsStatus.downloadEnabled;
    }

    @Override
    public void addPreferences(Context context) {
        addPreference(new DownloadPathPreference(
                context,
                "Download path",
                Settings.DOWNLOAD_PATH
        ));
        addPreference(new TogglePreference(
                context,
                "Remove watermark", "",
                Settings.DOWNLOAD_WATERMARK
        ));
    }
}

