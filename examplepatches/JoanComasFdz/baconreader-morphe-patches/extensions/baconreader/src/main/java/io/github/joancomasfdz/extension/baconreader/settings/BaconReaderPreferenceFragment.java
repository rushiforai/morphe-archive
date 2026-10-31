// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.settings;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.os.Bundle;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.text.InputType;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.StringSetting;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * The settings of the patches: one screen with a section for images and videos, links and comments.
 * Only the settings of the applied patches are shown. Titles and summaries are string resources
 * named after the setting key: "_title", "_summary", "_summary_on", "_summary_off" and "_entry_N".
 */
@SuppressWarnings("deprecation")
public class BaconReaderPreferenceFragment extends PreferenceFragment {
    /** Preferences that depend on another setting, enabled only when it allows them. */
    private final List<Preference> dependentPreferences = new ArrayList<>();
    private final List<Setting<?>> dependentSettings = new ArrayList<>();

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            getPreferenceManager().setSharedPreferencesName(Setting.preferences.name);
            Context context = getActivity();
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(context);
            setPreferenceScreen(screen);

            PreferenceCategory images = category(screen, "revanced_settings_baconreader_screen_1_images_title");
            if (IncludedPatches.embedCommentImages()) {
                images.addPreference(switchPreference(context, Settings.SHOW_IMAGES));
                images.addPreference(switchPreference(context, Settings.IMAGES_FULL_WIDTH));
                images.addPreference(switchPreference(context, Settings.IMAGES_LONG_PRESS_DOWNLOAD));
                images.addPreference(switchPreference(context, Settings.IMAGES_WIFI_ONLY));
                images.addPreference(switchPreference(context, Settings.SHOW_VIDEOS));
                images.addPreference(textPreference(context, "revanced_baconreader_images_gestures"));
            }

            if (IncludedPatches.videoAutoplayInDetailView()) {
                images.addPreference(switchPreference(context, Settings.AUTOPLAY_VIDEOS_IN_DETAIL_VIEW));
            }

            PreferenceCategory links = category(screen, "revanced_settings_baconreader_screen_2_links_title");
            if (IncludedPatches.embedCommentImages()) {
                links.addPreference(switchPreference(context, Settings.YOUTUBE_TITLES));
                links.addPreference(switchPreference(context, Settings.YOUTUBE_THUMBNAILS));
                links.addPreference(switchPreference(context, Settings.X_POSTS));
                links.addPreference(switchPreference(context, Settings.BLUESKY_POSTS));
            }
            if (IncludedPatches.improvePostMediaLoading()) {
                links.addPreference(switchPreference(context, Settings.LINK_PREVIEW_JAVASCRIPT));
                links.addPreference(multiLineTextPreference(context, Settings.LINK_PREVIEW_JAVASCRIPT_BLOCKED));
                links.addPreference(multiLineTextPreference(context, Settings.LINK_PREVIEW_JAVASCRIPT_ALLOWED));
            }
            if (IncludedPatches.promptToOpenRedditLinks()) {
                addCustomPreference(context, links,
                        "io.github.joancomasfdz.extension.baconreader.openlinks.OpenLinksPreference");
            }

            PreferenceCategory comments = category(screen, "revanced_settings_baconreader_screen_3_comments_title");
            if (IncludedPatches.loadMoreComments()) {
                addCustomPreference(context, comments,
                        "io.github.joancomasfdz.extension.baconreader.comments.CommentLimitPreference");
                comments.addPreference(listPreference(context, Settings.AUTO_LOAD_MORE_COMMENTS, 6));
            }
            if (IncludedPatches.userAvatars()) {
                comments.addPreference(switchPreference(context, Settings.USER_AVATARS));
                comments.addPreference(listPreference(context, Settings.USER_AVATAR_SIZE, 4));
                comments.addPreference(switchPreference(context, Settings.USER_AVATAR_BACKGROUND));
            }

            PreferenceCategory chat = category(screen, "revanced_settings_baconreader_screen_4_chat_title");
            if (IncludedPatches.redditChat()) {
                chat.addPreference(switchPreference(context, Settings.CHECK_CHAT_MESSAGES));
            }

            PreferenceCategory about = category(screen, "revanced_settings_baconreader_screen_0_about_title");
            Preference version = new Preference(context);
            version.setTitle("BaconReader Patches");
            version.setSummary(Utils.getPatchesReleaseVersion());
            version.setSelectable(false);
            about.addPreference(version);

            // Sections without settings, because their patches were not applied.
            for (PreferenceCategory category : new PreferenceCategory[]{images, links, comments, chat}) {
                if (category.getPreferenceCount() == 0) screen.removePreference(category);
            }

            updateDependentPreferences();
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not create the settings of the patches", ex);
        }
    }

    private static PreferenceCategory category(PreferenceScreen screen, String titleKey) {
        PreferenceCategory category = new PreferenceCategory(screen.getContext());
        category.setTitle(str(titleKey));
        screen.addPreference(category);
        return category;
    }

    private SwitchPreference switchPreference(Context context, BooleanSetting setting) {
        SwitchPreference preference = new SwitchPreference(context);
        preference.setKey(setting.key);
        preference.setPersistent(false);
        preference.setTitle(str(setting.key + "_title"));
        preference.setSummaryOn(str(setting.key + "_summary_on"));
        preference.setSummaryOff(str(setting.key + "_summary_off"));
        preference.setChecked(setting.get());
        preference.setOnPreferenceChangeListener((pref, newValue) -> {
            setting.save((Boolean) newValue);
            updateDependentPreferences();
            return true;
        });
        track(preference, setting);
        return preference;
    }

    private EditTextPreference multiLineTextPreference(Context context, StringSetting setting) {
        EditTextPreference preference = new EditTextPreference(context);
        preference.setKey(setting.key);
        preference.setPersistent(false);
        preference.setTitle(str(setting.key + "_title"));
        preference.setSummary(str(setting.key + "_summary"));
        preference.setDialogTitle(str(setting.key + "_title"));
        preference.setText(setting.get());
        preference.getEditText().setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        preference.setOnPreferenceChangeListener((pref, newValue) -> {
            setting.save((String) newValue);
            return true;
        });
        track(preference, setting);
        return preference;
    }

    /** A list whose values are 0 to entryCount - 1, with the titles "_entry_0", "_entry_1"... */
    private ListPreference listPreference(Context context, IntegerSetting setting, int entryCount) {
        CharSequence[] entries = new CharSequence[entryCount];
        CharSequence[] values = new CharSequence[entryCount];
        for (int i = 0; i < entryCount; i++) {
            entries[i] = str(setting.key + "_entry_" + i);
            values[i] = String.valueOf(i);
        }

        ListPreference preference = new ListPreference(context);
        preference.setKey(setting.key);
        preference.setPersistent(false);
        preference.setTitle(str(setting.key + "_title"));
        preference.setDialogTitle(str(setting.key + "_title"));
        preference.setEntries(entries);
        preference.setEntryValues(values);
        preference.setValue(String.valueOf(setting.get()));
        preference.setSummary("%s");
        preference.setOnPreferenceChangeListener((pref, newValue) -> {
            setting.save(Integer.parseInt((String) newValue));
            return true;
        });
        track(preference, setting);
        return preference;
    }

    /** A preference that only shows a title and a summary. */
    private static Preference textPreference(Context context, String key) {
        Preference preference = new Preference(context);
        preference.setTitle(str(key + "_title"));
        preference.setSummary(str(key + "_summary"));
        preference.setSelectable(false);
        return preference;
    }

    /** A preference class of a patch that reads and saves its setting itself. */
    private static void addCustomPreference(Context context, PreferenceCategory category, String className) {
        try {
            category.addPreference((Preference) Class.forName(className)
                    .getConstructor(Context.class).newInstance(context));
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not create " + className, ex);
        }
    }

    private void track(Preference preference, Setting<?> setting) {
        dependentPreferences.add(preference);
        dependentSettings.add(setting);
    }

    private void updateDependentPreferences() {
        for (int i = 0; i < dependentPreferences.size(); i++) {
            dependentPreferences.get(i).setEnabled(dependentSettings.get(i).isAvailable());
        }
    }
}
