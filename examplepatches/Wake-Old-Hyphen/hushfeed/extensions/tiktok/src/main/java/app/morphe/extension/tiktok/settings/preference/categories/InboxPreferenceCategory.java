/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.inbox.AutoStreak;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.ClockTimePreference;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.SectionHeadingPreference;
import app.morphe.extension.tiktok.settings.preference.SendStreakNowPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;

@SuppressWarnings("deprecation")
public final class InboxPreferenceCategory extends ConditionalPreferenceCategory {
    public InboxPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Inbox");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.inboxFilterEnabled
                || SettingsStatus.hideSuggestedAccountsEnabled
                || SettingsStatus.hideInboxStoriesEnabled
                || SettingsStatus.expandActivityListEnabled
                || SettingsStatus.notificationControlsEnabled
                || SettingsStatus.autoStreakEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.inboxFilterEnabled) {
            addPreference(new SectionHeadingPreference(context, "Rows"));
            addPreference(new TogglePreference(
                    context,
                    "Hide new followers",
                    "The New followers row leaves the top of the Inbox. The accounts still follow you.",
                    Settings.HIDE_INBOX_NEW_FOLLOWERS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide activity",
                    "The Activity row of likes and comments on your posts leaves the Inbox. Notifications about them still arrive.",
                    Settings.HIDE_INBOX_ACTIVITY
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide archive",
                    "The Archive row leaves the Inbox. Archived chats are kept.",
                    Settings.HIDE_INBOX_ARCHIVE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide the Tako chat",
                    "The Tako assistant's conversation leaves the Inbox list. The Tako bubble on the feed has its own switch under Feed tabs.",
                    Settings.HIDE_INBOX_TAKO
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide TikTok Shop",
                    "Shop order updates and coupon messages no longer take up rows in the Inbox. Your orders are unchanged.",
                    Settings.HIDE_INBOX_SHOP
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide message requests",
                    "The Message requests row leaves the Inbox. Requests keep arriving and wait there until you turn this off.",
                    Settings.HIDE_INBOX_MESSAGE_REQUESTS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide conversations",
                    "Hide every direct message conversation. Leaves the Inbox empty apart from "
                            + "whatever else is still turned on.",
                    Settings.HIDE_INBOX_CONVERSATIONS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide the add people icon",
                    "The add people icon leaves the Inbox header. Only the shortcut goes, so friend suggestions elsewhere are unchanged.",
                    Settings.HIDE_INBOX_ADD_PEOPLE
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide the Inbox search button",
                    "Hide the magnifying glass at the top of Inbox. Search on the feed and in comments is unchanged.",
                    Settings.HIDE_INBOX_SEARCH
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide activity status",
                    "The activity status control leaves the Inbox header. Whether others see you as active is unchanged.",
                    Settings.HIDE_INBOX_ACTIVITY_STATUS
            ));
            addPreference(new InputTextPreference(
                    context,
                    "Hide rows by title",
                    "Comma separated list of any other Inbox row titles to hide, matched exactly. "
                            + "Use this for anything not listed above.",
                    Settings.HIDE_INBOX_CUSTOM_TITLES
            ));
        }
        if (SettingsStatus.inboxFilterEnabled || SettingsStatus.hideInboxStoriesEnabled) {
        addPreference(new TogglePreference(
                context,
                "Hide stories tray",
                "The row of story avatars across the top of the Inbox goes. Stories still play from the feed and from profiles.",
                Settings.HIDE_INBOX_STORIES
        ));
        }
        if (SettingsStatus.inboxFilterEnabled || SettingsStatus.hideSuggestedAccountsEnabled) {
        addPreference(new TogglePreference(
                context,
                "Hide suggested accounts",
                "The accounts TikTok suggests you follow no longer take up rows in the Inbox.",
                Settings.HIDE_INBOX_SUGGESTED_ACCOUNTS
        ));
        }
        if (SettingsStatus.notificationControlsEnabled || SettingsStatus.expandActivityListEnabled) {
            addPreference(new SectionHeadingPreference(context, "Controls"));
        }
        if (SettingsStatus.notificationControlsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide new follower notifications",
                    "Hide the notification saying somebody new followed you before it reaches "
                            + "the drawer. Every other notification is left alone, and the "
                            + "follower still appears in the Inbox.",
                    Settings.HIDE_FOLLOWER_NOTIFICATIONS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide message streaks",
                    "Hide the streak button in a chat and the reminder message that goes "
                            + "with it.",
                    Settings.HIDE_MESSAGE_STREAKS
            ));
        }
        if (SettingsStatus.expandActivityListEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Expand activity list",
                    "Show the whole Activity and New followers lists instead of stopping at a "
                            + "View all button.",
                    Settings.EXPAND_ACTIVITY_LIST
            ));
        }
        if (SettingsStatus.autoStreakEnabled) {
            addStreakRows(context);
        }
    }

    private void addStreakRows(Context context) {
        addPreference(new SectionHeadingPreference(context, "Streak"));
        TogglePreference keep = new TogglePreference(
                context,
                "Keep a streak going",
                "Sends one message a day to the person below at the time below, so a streak with them keeps going on a day you don't open TikTok.",
                Settings.AUTO_STREAK
        );
        Runnable refresh = () -> keep.showExtraLine(AutoStreak.statusLine(context));
        refresh.run();
        // Each listener runs before the change is saved, so the work waits for the next turn of
        // the main thread, by which time the setting holds the new value.
        keep.setOnPreferenceChangeListener((preference, value) -> {
            boolean on = Boolean.TRUE.equals(value);
            Utils.runOnMainThread(() -> {
                AutoStreak.settingsChanged(context, on);
                refresh.run();
            });
            return true;
        });
        addPreference(keep);

        InputTextPreference who = new InputTextPreference(
                context,
                "Who to message",
                "Their username, like @name. It has to be someone you already have a chat with.",
                Settings.AUTO_STREAK_RECIPIENT
        ).withNameKeyboard().withNote(value -> AutoStreak.recipientNote(context, value));
        who.setOnPreferenceChangeListener((preference, value) -> {
            String before = Settings.AUTO_STREAK_RECIPIENT.get();
            Utils.runOnMainThread(() -> {
                AutoStreak.recipientChanged(context, before);
                refresh.run();
            });
            return true;
        });
        addPreference(who);

        ClockTimePreference when = new ClockTimePreference(
                context,
                "When to send",
                "The time of day the message goes out.",
                Settings.AUTO_STREAK_MINUTE
        );
        when.setOnPreferenceChangeListener((preference, value) -> {
            Utils.runOnMainThread(() -> {
                AutoStreak.settingsChanged(context, true);
                refresh.run();
            });
            return true;
        });
        addPreference(when);

        addPreference(new InputTextPreference(
                context,
                "Message",
                "What gets sent each day.",
                Settings.AUTO_STREAK_MESSAGE
        ));
        addPreference(new SendStreakNowPreference(context, refresh));
    }
}
