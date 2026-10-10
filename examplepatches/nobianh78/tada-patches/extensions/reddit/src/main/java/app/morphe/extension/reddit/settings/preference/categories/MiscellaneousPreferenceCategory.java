/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.reddit.settings.preference.categories;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceScreen;

import app.morphe.extension.reddit.patches.AppIconPatch;
import app.morphe.extension.reddit.patches.OpenLinksDirectlyPatch;
import app.morphe.extension.reddit.patches.OpenLinksExternallyPatch;
import app.morphe.extension.reddit.patches.SanitizeSharingLinksPatch;
import app.morphe.extension.reddit.patches.VersionCheckPatch;
import app.morphe.extension.reddit.settings.Settings;
import app.morphe.extension.reddit.settings.preference.BooleanSettingPreference;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.preference.ImportExportPreference;
import app.morphe.extension.shared.settings.preference.SortedListPreference;
import app.morphe.extension.shared.settings.preference.URLLinkPreference;
import app.morphe.extension.shared.settings.preference.about.TADaAboutPreference;

@SuppressWarnings("deprecation")
public class MiscellaneousPreferenceCategory extends ConditionalPreferenceCategory {
    public MiscellaneousPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle(str("tada_screen_miscellaneous_title"));
    }

    @Override
    public boolean getSettingsStatus() {
        return AppIconPatch.isPatchIncluded() ||
                OpenLinksDirectlyPatch.isPatchIncluded() ||
                OpenLinksExternallyPatch.isPatchIncluded() ||
                SanitizeSharingLinksPatch.isPatchIncluded();
    }

    @Override
    public void addPreferences(Context context) {
        TADaAboutPreference.showVancedAsPastContributor(false);
        Preference about = new TADaAboutPreference(context);
        about.setTitle(str("tada_about_title"));
        about.setSummary(str("tada_about_summary"));
        addPreference(about);

        ImportExportPreference importPref = new ImportExportPreference(context);
        importPref.setTitle(str("tada_pref_import_export_title"));
        importPref.setSummary(str("tada_pref_import_export_summary"));
        addPreference(importPref);

        addPreference(new SortedListPreference(context, BaseSettings.MORPHE_LANGUAGE));

        if (AppIconPatch.isPatchIncluded()) {
            addPreference(AppIconPatch.getIconPreference(context));
        }
        if (OpenLinksDirectlyPatch.isPatchIncluded()) {
            addPreference(new BooleanSettingPreference(
                    context,
                    Settings.OPEN_LINKS_DIRECTLY
            ));
        }
        if (OpenLinksExternallyPatch.isPatchIncluded()) {
            addPreference(new BooleanSettingPreference(
                    context,
                    Settings.OPEN_LINKS_EXTERNALLY
            ));
        }
        if (SanitizeSharingLinksPatch.isPatchIncluded()) {
            addPreference(new BooleanSettingPreference(
                    context,
                    Settings.SANITIZE_SHARING_LINKS
            ));
        }

        // Include original privacy policy link that was changed to open TADa settings.
        if (VersionCheckPatch.is_2026_25_or_greater) {
            URLLinkPreference preference = new URLLinkPreference(context);
            preference.setTitle(str("reddit_privacy_policy"));
            preference.externalURL = ResourceUtils.getString("privacy_policy_uri");
            addPreference(preference);
        }
    }
}
