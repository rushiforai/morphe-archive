/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.category;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.info;
import static app.morphe.extension.facebook.settings.HushfacebookPreferenceFragment.toggle;

import android.content.Context;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;

import androidx.annotation.Nullable;

import java.util.Set;

import app.morphe.extension.facebook.notifications.NotificationSound;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;

/**
 * The category pages for the rest of Facebook: Chats, Menu, Search, Marketplace, Notifications
 * and Links. Each method adds its section to the page
 * {@link HushfacebookPreferenceFragment#initialize} builds, and leaves it out when the build has none of
 * its patches, but for the sections every build has.
 */
@SuppressWarnings("deprecation")
final class AppPages {
    private AppPages() {
    }

    /** Chats: the Get Messenger card and the Messenger icon. */
    static void chats(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.MESSENGER_CARD) || build.contains(PatchFamily.MESSENGER_ICON)) {
            PreferenceCategory chats = category(screen, L10n.t("Chats"));
            if (build.contains(PatchFamily.MESSENGER_CARD)) {
                chats.addPreference(toggle(context, Settings.HIDE_GET_MESSENGER_CARD,
                        L10n.t("The card at the top of Chats that asks you to get the Messenger app goes while Messenger "
                                + "is installed. Without Messenger it stays, so you can still install it from there.")));
            }
            if (build.contains(PatchFamily.MESSENGER_ICON)) {
                chats.addPreference(toggle(context, Settings.OPEN_MESSENGER_APP,
                        L10n.t("A tap on the Messenger icon at the top of Facebook opens the Messenger app instead "
                                + "of Chats. Without Messenger installed, Chats opens as before.")));
            }
        }
    }

    /** Menu: the sections of Facebook's Menu that sell something. */
    static void menu(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        PreferenceCategory menu = category(screen, L10n.t("Menu"));
        SwitchPreference saved = toggle(context, Settings.SAVED_SHORTCUT, build.contains(PatchFamily.MENU_SETTINGS_ROW)
                ? L10n.t("Adds Saved to Facebook's icon menu when there's room, and a Saved row at the end of Settings and privacy in the Menu. Existing shortcuts stay.")
                : L10n.t("Adds Saved to Facebook's icon menu when there's room. Existing shortcuts stay."));
        saved.setOnPreferenceChangeListener((preference, value) -> {
            Settings.SAVED_SHORTCUT.save((Boolean) value);
            SavedShortcut.changed(context);
            return true;
        });
        menu.addPreference(saved);
        if (build.contains(PatchFamily.MENU_PROMOTIONS)) {
            menu.addPreference(toggle(context, Settings.HIDE_MENU_UPGRADES,
                    L10n.t("The Upgrades section and its offers leave Facebook's Menu. Settings, Help and support "
                            + "and the rest of the Menu stay.")));
            menu.addPreference(toggle(context, Settings.HIDE_MENU_ALSO_FROM_META,
                    L10n.t("The Also from Meta section leaves Facebook's Menu, with its links to Meta's other apps "
                            + "and its ads for Meta's devices. Your own shortcuts stay.")));
        }
        if (build.contains(PatchFamily.GAME_ADS)) {
            menu.addPreference(toggle(context, Settings.BLOCK_GAME_ADS,
                    L10n.t("Games you play in Facebook get no ads. A game asking for one hears there's none to show, "
                            + "so rewarded ads give no reward.")));
        }
    }

    /** Search. */
    static void search(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (build.contains(PatchFamily.META_AI_SEARCH) || build.contains(PatchFamily.SPONSORED_SEARCH)) {
            PreferenceCategory search = category(screen, L10n.t("Search"));
            if (build.contains(PatchFamily.META_AI_SEARCH)) {
                search.addPreference(toggle(context, Settings.HIDE_META_AI_IN_SEARCH,
                        L10n.t("Search results lose the Meta AI answer and the Ask Meta AI prompts, and a suggestion no "
                                + "longer sends your search to Meta AI. People, groups, pages and posts stay, and the Meta "
                                + "AI button still opens Meta AI.")));
            }
            if (build.contains(PatchFamily.SPONSORED_SEARCH)) {
                search.addPreference(toggle(context, Settings.HIDE_SPONSORED_SEARCH_RESULTS,
                        L10n.t("Ads between the results when you search Facebook. What you searched for stays.")));
            }
        }
    }

    /** Marketplace. */
    static void marketplace(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (!build.contains(PatchFamily.SPONSORED_MARKETPLACE) && !build.contains(PatchFamily.SELLER_VIEW_PROFILE)) return;
        PreferenceCategory marketplace = category(screen, L10n.t("Marketplace"));
        if (build.contains(PatchFamily.SPONSORED_MARKETPLACE)) {
            marketplace.addPreference(toggle(context, Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS,
                    L10n.t("Ads and boosted listings in Marketplace's feed and search results. The other "
                            + "listings stay.")));
        }
        if (build.contains(PatchFamily.SELLER_VIEW_PROFILE)) {
            // Read as a seller's page opens, so a change shows on the next one.
            marketplace.addPreference(toggle(context, Settings.SHOW_SELLER_VIEW_PROFILE,
                    L10n.t("A seller's Marketplace page always has View profile, which opens their regular Facebook "
                            + "profile. Facebook shows it to only some accounts.")));
        }
    }

    /** The row that puts Facebook's chime in the phone's notification sounds. */
    static final String SAVE_NOTIFICATION_SOUND = "action_save_notification_sound";

    /**
     * Notifications: the kinds of notification that can be blocked, what always comes through, and
     * Facebook's chime for a category Android set to None. The section is in every build, since the
     * chime needs no patch.
     */
    static void notifications(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        PreferenceCategory notifications = category(screen, L10n.t("Notifications"));
        if (build.contains(PatchFamily.PROMO_NOTIFICATIONS)) {
            notifications.addPreference(toggle(context, Settings.BLOCK_TRENDING_VIDEO_NOTIFICATIONS,
                    L10n.t("Trending videos and the reels Facebook picked for you stop showing up in your "
                            + "notifications.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_MEMORY_NOTIFICATIONS,
                    L10n.t("Facebook's \"On this day\" memories stop showing up in your notifications.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_BIRTHDAY_NOTIFICATIONS,
                    L10n.t("No more reminders that it's a friend's birthday.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_HIGHLIGHT_NOTIFICATIONS,
                    L10n.t("Digests of what's going on in groups, Pages and creators you follow stop. Comments, "
                            + "replies and mentions still come through.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS,
                    L10n.t("Friend suggestions stop showing up in your notifications. Friend requests still come "
                            + "through.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_NEARBY_NOTIFICATIONS,
                    L10n.t("Alerts about places near you and about the weather stop.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_ACCOUNT_SETUP_NOTIFICATIONS,
                    L10n.t("Reminders to finish setting up a Facebook account stop. Login and security alerts "
                            + "still come through.")));
            notifications.addPreference(info(context, L10n.t("What always comes through"),
                    L10n.t("Messages, friend requests, comments, mentions, calls and login alerts, and any kind "
                            + "Hushfacebook doesn't know. Android's own settings for Facebook's notification "
                            + "categories work too, since Facebook drops a notification whose category you turned "
                            + "off. Facebook's server decides which categories you get, though, so they may not "
                            + "split these kinds out.")));
        }
        notifications.addPreference(notificationSoundRow(context));
    }

    /**
     * A tap copies Facebook's chime into the phone's notification sounds, off the main thread, and
     * a toast says how it went. Android's picker then lists it for a category that came up as
     * None, which no app can set back (#83).
     */
    static Preference notificationSoundRow(Context context) {
        SettingsRows.Row row = new SettingsRows.Row(context);
        row.setKey(SAVE_NOTIFICATION_SOUND);
        row.setPersistent(false);
        row.actsAtOnce = true;
        row.setTitle(L10n.t("Save Facebook's notification sound"));
        row.setSummary(L10n.t("Puts Facebook's chime in your phone's notification sounds, for a category that Android set "
                + "to None. Then pick it under Android's notification settings for Facebook: a category, then Sound."));
        Context app = context.getApplicationContext();
        row.setOnPreferenceClickListener(p -> {
            boolean accepted = Utils.runOnBackgroundThread(() ->
                    Utils.showToastLong(notificationSoundMessage(NotificationSound.save(app))));
            if (!accepted) Utils.showToastLong(notificationSoundMessage(NotificationSound.Outcome.FAILED, null));
            return true;
        });
        return row;
    }

    static String notificationSoundMessage(NotificationSound.Result result) {
        return notificationSoundMessage(result.outcome, result.name);
    }

    /** What the row's toast says for each way a save can go; the name is the file's, for the two that have one. */
    static String notificationSoundMessage(NotificationSound.Outcome outcome, @Nullable String name) {
        switch (outcome) {
            case SAVED:
                return L10n.f("Saved as %1$s in the Notifications folder. Pick it under Sound in Android's notification "
                        + "settings for Facebook.", L10n.isolate(name));
            case ALREADY_THERE:
                return L10n.f("%1$s is already in your notification sounds.", L10n.isolate(name));
            case NO_SOUND:
                return L10n.t("This build has no notification sound to save.");
            default:
                return L10n.t("Couldn't save the sound. Try again.");
        }
    }

    /** Links, in every build. */
    static void links(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        // In every build: Android checks Facebook's links against Meta's signing key, which no
        // re-signed build has, whatever its patches.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        if (build.contains(PatchFamily.EXTERNAL_BROWSER)) {
            links.addPreference(toggle(context, Settings.OPEN_LINKS_EXTERNALLY,
                    L10n.t("Open web links in your browser. Facebook's own pages stay in the app.")));
        }
        if (build.contains(PatchFamily.SANITIZE_SHARING_LINKS)) {
            links.addPreference(toggle(context, Settings.SANITIZE_SHARING_LINKS,
                    L10n.t("Takes tracking tags such as mibextid off the links you share or copy. A "
                            + "facebook.com/share/ link is made for one share, so Facebook can still trace it back to you.")));
        }
        links.addPreference(page.supportedLinksRow(context));
        for (Preference holder : page.linkHolderRows(context)) links.addPreference(holder);
        links.addPreference(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android checks Facebook's links against Meta's signing key, which a re-signed build doesn't have. "
                        + "Selecting the addresses sends their links here again. It doesn't restore Meta's verification, "
                        + "and your other link settings stay as they are.")));
    }

    /** Privacy: what Facebook sends home in the background, and what it shows others while you write and read. */
    static void privacy(HushfacebookPreferenceFragment page, PreferenceScreen screen, Context context,
            Set<PatchFamily> build) {
        if (!build.contains(PatchFamily.ANALYTICS_UPLOADS) && !build.contains(PatchFamily.SCREENSHOTS)
                && !build.contains(PatchFamily.SCREENSHOT_DETECTION) && !build.contains(PatchFamily.TYPING_INDICATOR)
                && !build.contains(PatchFamily.READ_RECEIPTS)) {
            return;
        }
        PreferenceCategory privacy = category(screen, L10n.t("Privacy"));
        if (build.contains(PatchFamily.ANALYTICS_UPLOADS)) {
            // XAnalytics resumes its uploader once, as Facebook starts.
            privacy.addPreference(toggle(context, Settings.HOLD_ANALYTICS_UPLOADS,
                    L10n.t("Facebook stops uploading its app analytics in the background and skips its on-device "
                            + "learning jobs. Restart Facebook after changing it.")));
        }
        if (build.contains(PatchFamily.SCREENSHOT_DETECTION)) {
            privacy.addPreference(toggle(context, Settings.BLOCK_SCREENSHOT_DETECTION,
                    L10n.t("Facebook doesn't notice when you take a screenshot or record the screen, so nothing it does "
                            + "in response happens.")));
        }
        if (build.contains(PatchFamily.SCREENSHOTS)) {
            privacy.addPreference(toggle(context, Settings.ALLOW_SCREENSHOTS,
                    L10n.t("Screenshots and screen recordings show the pages Facebook blocks them on. A page that's "
                            + "already open changes when you open it again.")));
        }
        if (build.contains(PatchFamily.TYPING_INDICATOR)) {
            privacy.addPreference(toggle(context, Settings.HIDE_CHAT_TYPING,
                    L10n.t("People you chat with in a chat that opens inside Facebook don't see that you're typing. "
                            + "Your messages send as usual.")));
            privacy.addPreference(toggle(context, Settings.HIDE_COMMENT_TYPING,
                    L10n.t("People looking at a post don't see that you're writing a comment.")));
        }
        if (build.contains(PatchFamily.READ_RECEIPTS)) {
            privacy.addPreference(toggle(context, Settings.HIDE_READ_RECEIPTS,
                    L10n.t("People you chat with in a chat that opens inside Facebook don't see that you've read their "
                            + "messages. The chat can stay unread on this phone.")));
        }
    }
}
