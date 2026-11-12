package io.github.bryceaspringfield.morphe.extension.youtube;

import android.content.Context;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.preference.MultiSelectListPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.text.InputType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * Adds the bundle's screen, YouTube Extras, to Morphe's settings (Settings > Morphe). Called by the patch at the end
 * of Morphe's YouTubePreferenceFragment.initialize, once Morphe's own screens exist. Switches, text fields, and
 * lists keep the setting's key, so Morphe's preference listener saves them; the two multiple-choice lists save
 * through their own listener, since Morphe's listener handles no multiple choice.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class SettingsUi {

    private SettingsUi() {
    }

    private static java.lang.ref.WeakReference<Object> fragmentRef = new java.lang.ref.WeakReference<>(null);

    /** Saved at the start of initialize, since the compiled method may reuse the register of this before it returns. */
    public static void setFragment(Object fragment) {
        fragmentRef = new java.lang.ref.WeakReference<>(fragment);
    }

    public static void addSettings() {
        Object f = fragmentRef.get();
        if (f != null) addSettings(f);
    }

    public static void addSettings(Object fragmentObject) {
        try {
            XSettings.load();
            PreferenceFragment fragment = (PreferenceFragment) fragmentObject;
            PreferenceScreen root = fragment.getPreferenceScreen();
            if (root == null || root.findPreference("yx_screen") != null) return;
            Context ctx = fragment.getContext();
            PreferenceScreen screen = fragment.getPreferenceManager().createPreferenceScreen(ctx);
            screen.setKey("yx_screen");
            screen.setTitle(Strings.get("screen"));
            screen.setSummary(Strings.get("screen_summary"));
            root.addPreference(screen);

            PreferenceCategory filters = category(ctx, screen, "cat_filters");
            text(ctx, filters, XSettings.CHANNEL_RULES, "channel_rules", "channel_rules_summary", true);
            text(ctx, filters, XSettings.MIN_LENGTH, "min_length", "length_summary", false);
            text(ctx, filters, XSettings.MAX_LENGTH, "max_length", "length_summary", false);
            toggle(ctx, filters, XSettings.HIDE_HOME_PLAYLISTS, "home_playlists", "home_playlists_summary");
            String[] topicLabels = new String[Topics.KEYS.length];
            for (int i = 0; i < topicLabels.length; i++) topicLabels[i] = Topics.label(i);
            multi(ctx, filters, XSettings.TOPICS, "yx_topics_list", "topics", "topics_summary", topicLabels, Topics.KEYS);
            text(ctx, filters, XSettings.HIDDEN_CHANNELS, "hidden_channels", "hidden_channels_summary", true);
            multi(ctx, filters, XSettings.HIDDEN_CATEGORIES, "yx_categories_list", "categories", "categories_summary",
                    Categories.ALL, Categories.ALL);

            PreferenceCategory where = category(ctx, screen, "cat_where");
            toggle(ctx, where, XSettings.APPLY_HOME, "apply_home", null);
            toggle(ctx, where, XSettings.APPLY_SUBSCRIPTIONS, "apply_subscriptions", null);
            toggle(ctx, where, XSettings.APPLY_SEARCH, "apply_search", null);
            toggle(ctx, where, XSettings.APPLY_RELATED, "apply_related", null);

            PreferenceCategory auto = category(ctx, screen, "cat_auto");
            toggle(ctx, auto, XSettings.AUTO_DISLIKE_FILTERED, "auto_dislike", "auto_dislike_summary");
            ListPreference watched = new ListPreference(ctx);
            watched.setKey(XSettings.AUTO_WATCHED.key);
            watched.setTitle(Strings.get("auto_watched"));
            watched.setDialogTitle(Strings.get("auto_watched"));
            watched.setEntries(new String[]{Strings.get("auto_watched_off"), Strings.get("auto_watched_partly"),
                    Strings.get("auto_watched_fully")});
            watched.setEntryValues(new String[]{"off", "partly", "fully"});
            watched.setValue(XSettings.AUTO_WATCHED.get());
            watched.setSummary(Strings.get("auto_watched_summary"));
            auto.addPreference(watched);
            toggle(ctx, auto, XSettings.AUTO_LIKE, "auto_like", "auto_like_summary");
            toggle(ctx, auto, XSettings.LIVE_CATCH_UP, "live_catch_up", "live_catch_up_summary");
            text(ctx, auto, XSettings.LIVE_CATCH_UP_SPEED, "live_catch_up_speed", "live_catch_up_speed_summary", false);

            PreferenceCategory playback = category(ctx, screen, "cat_playback");
            toggle(ctx, playback, XSettings.KEEP_PLAYING_SCREEN_OFF, "keep_playing", "keep_playing_summary");
            toggle(ctx, playback, XSettings.AUDIO_ONLY_SCREEN_OFF, "audio_only_off", "audio_only_off_summary");

            PreferenceCategory layout = category(ctx, screen, "cat_layout");
            toggle(ctx, layout, XSettings.SAVE_OPENS_CHOOSER, "save_chooser", "save_chooser_summary");
            toggle(ctx, layout, XSettings.HIDE_COMMENTS_COMMUNITY, "hide_community", "hide_community_summary");
            toggle(ctx, layout, XSettings.HIDE_CHANNEL_BAR_DOTS, "hide_dots", null);
            toggle(ctx, layout, XSettings.LIVE_CHAT_ALL_MESSAGES, "live_chat_all", "live_chat_all_summary");
            toggle(ctx, layout, XSettings.DEARROW_TAP, "dearrow_tap", "dearrow_tap_summary");
            toggle(ctx, layout, XSettings.DEARROW_SUGGEST, "dearrow_suggest", "dearrow_suggest_summary");
            toggle(ctx, layout, XSettings.CHAT_AVATAR_CHANNEL, "chat_avatar", "chat_avatar_summary");
            ListPreference votes = new ListPreference(ctx);
            votes.setKey(XSettings.VOTE_FORMAT.key);
            votes.setTitle(Strings.get("vote_format"));
            votes.setDialogTitle(Strings.get("vote_format"));
            votes.setEntries(new String[]{Strings.get("vote_format_count"), Strings.get("vote_format_percent"),
                    Strings.get("vote_format_both")});
            votes.setEntryValues(new String[]{"count", "percent", "both"});
            votes.setValue(XSettings.VOTE_FORMAT.get());
            votes.setSummary(Strings.get("vote_format_summary"));
            layout.addPreference(votes);

            PreferenceCategory fixes = category(ctx, screen, "cat_fixes");
            toggle(ctx, fixes, XSettings.FIX_NAVIGATION_TAPS, "fix_nav", null);
            toggle(ctx, fixes, XSettings.FIX_NETWORK_RECOVERY, "fix_network", "fix_network_summary");
            toggle(ctx, fixes, XSettings.DEBUG, "debug", "debug_summary");
        } catch (Exception e) {
            Logger.printException(() -> "YouTube Extras: settings screen failed", e);
        }
    }

    private static PreferenceCategory category(Context ctx, PreferenceGroup parent, String titleKey) {
        PreferenceCategory c = new PreferenceCategory(ctx);
        c.setTitle(Strings.get(titleKey));
        parent.addPreference(c);
        return c;
    }

    private static void toggle(Context ctx, PreferenceGroup parent, BooleanSetting s, String titleKey, String summaryKey) {
        SwitchPreference p = new SwitchPreference(ctx);
        p.setKey(s.key);
        p.setTitle(Strings.get(titleKey));
        if (summaryKey != null) p.setSummary(Strings.get(summaryKey));
        p.setDefaultValue(s.defaultValue);
        p.setChecked(s.get());
        parent.addPreference(p);
    }

    private static void text(Context ctx, PreferenceGroup parent, StringSetting s, String titleKey, String summaryKey,
                             boolean multiline) {
        EditTextPreference p = new EditTextPreference(ctx);
        p.setKey(s.key);
        p.setTitle(Strings.get(titleKey));
        p.setDialogTitle(Strings.get(titleKey));
        p.setSummary(Strings.get(summaryKey));
        p.setText(s.get());
        p.getEditText().setInputType(InputType.TYPE_CLASS_TEXT | (multiline
                ? InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS : 0));
        if (multiline) p.getEditText().setMinLines(4);
        parent.addPreference(p);
    }

    private static void multi(Context ctx, PreferenceGroup parent, StringSetting s, String key, String titleKey,
                              String summaryKey, String[] labels, String[] values) {
        MultiSelectListPreference p = new MultiSelectListPreference(ctx);
        p.setKey(key);
        p.setPersistent(false);
        p.setTitle(Strings.get(titleKey));
        p.setDialogTitle(Strings.get(titleKey));
        p.setEntries(labels);
        p.setEntryValues(values);
        Set<String> chosen = new HashSet<>();
        for (String v : s.get().split(",")) if (!v.trim().isEmpty()) chosen.add(v.trim());
        p.setValues(chosen);
        p.setSummary(summary(summaryKey, chosen));
        p.setOnPreferenceChangeListener((pref, value) -> {
            @SuppressWarnings("unchecked") Set<String> set = (Set<String>) value;
            String[] ordered = set.toArray(new String[0]);
            Arrays.sort(ordered);
            s.save(String.join(",", ordered));
            pref.setSummary(summary(summaryKey, set));
            return true;
        });
        parent.addPreference(p);
    }

    private static String summary(String summaryKey, Set<String> chosen) {
        return chosen.isEmpty() ? Strings.get(summaryKey) : String.join(", ", chosen);
    }
}
