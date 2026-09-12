/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/FeedFilterPreferenceCategory.java
 */

package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.tiktok.settings.AdvancedFeedSettings;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.ClearSeenVideoHistoryPreference;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.NumberInputPreference;
import app.morphe.extension.tiktok.settings.preference.RangeValuePreference;
import app.morphe.extension.tiktok.settings.preference.SeenVideoRetentionPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;

@SuppressWarnings("deprecation")
public class FeedFilterPreferenceCategory extends ConditionalPreferenceCategory {
    public FeedFilterPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Feed filter");
    }

    @Override
    public boolean getSettingsStatus() {
        return SettingsStatus.feedFilterEnabled;
    }

    @Override
    public void addPreferences(Context context) {
        addPreference(new TogglePreference(
                context,
                "Remove feed ads", "Remove ads from feed.",
                Settings.REMOVE_ADS
        ));
        addPreference(new TogglePreference(
                context,
                "Hide TikTok Shop", "Hide TikTok shop from feed.",
                Settings.HIDE_SHOP
        ));
        addPreference(new TogglePreference(
                context,
                "Hide livestreams", "Hide livestreams from feed.",
                Settings.HIDE_LIVE
        ));
        addPreference(new TogglePreference(
                context,
                "Hide story", "Hide story from feed.",
                Settings.HIDE_STORY
        ));
        addPreference(new TogglePreference(
                context,
                "Hide image video", "Hide image video from feed.",
                Settings.HIDE_IMAGE
        ));
        if (SettingsStatus.seenVideoFilterEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide already seen videos",
                    "Filter locally remembered video ids when TikTok loads them again.",
                    Settings.HIDE_SEEN_VIDEOS
            ));
            addPreference(new SeenVideoRetentionPreference(
                    context,
                    Settings.SEEN_VIDEO_RETENTION_DAYS
            ));
            addPreference(new ClearSeenVideoHistoryPreference(context));
        }
        if (SettingsStatus.advancedFeedFilterEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide promotional music",
                    "Hide feed items TikTok marks as using promotional music.",
                    Settings.HIDE_PROMOTIONAL_MUSIC
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide LIVE replays",
                    "Hide replay items from previous TikTok LIVE streams.",
                    Settings.HIDE_LIVE_REPLAYS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide AI-generated content",
                    "Hide feed items TikTok marks as AI-generated or AIGC.",
                    Settings.HIDE_AI_GENERATED_CONTENT
            ));
            addPreference(new NumberInputPreference(
                    context,
                    "Maximum views per like",
                    "Hide videos with a worse like/view ratio. Example: 40 means at least about 1 like per 40 views. 0 disables the rule.",
                    Settings.MAX_VIEWS_PER_LIKE,
                    0,
                    10000,
                    "views/like"
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Blocked keywords / hashtags",
                    "Comma or line separated. Case-insensitive substring match against video text and available hashtag metadata.",
                    AdvancedFeedSettings.BLOCKED_KEYWORDS
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Blocked creators",
                    "Comma or line separated TikTok usernames or creator IDs. A leading @ is optional.",
                    AdvancedFeedSettings.BLOCKED_CREATORS
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Blocked sounds",
                    "Comma or line separated sound IDs, titles, or sound-author names.",
                    AdvancedFeedSettings.BLOCKED_SOUNDS
            ));
            addPreference(new RangeValuePreference(
                    context,
                    "Min/Max duration (seconds)",
                    "Hide videos outside this duration range. Example: 5-120.",
                    AdvancedFeedSettings.DURATION_SECONDS
            ));
        }
        addPreference(new RangeValuePreference(
                context,
                "Min/Max views", "The minimum or maximum views of a video to show.",
                Settings.MIN_MAX_VIEWS
        ));
        addPreference(new RangeValuePreference(
                context,
                "Min/Max likes", "The minimum or maximum likes of a video to show.",
                Settings.MIN_MAX_LIKES
        ));
    }
}