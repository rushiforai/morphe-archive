/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java
 */

package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.tiktok.privacy.StoreIdentity;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.ChoicePreference;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.ProfileShortcutChecklistPreference;
import app.morphe.extension.tiktok.settings.preference.SectionHeadingPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;

/**
 * The app around the feed: its layout, search, the profile, posting and the system it runs on. The
 * feed's own buttons and gestures are on Feed screen, the player's rows on Playback and Duet
 * and Stitch on Share sheet, beside the rows they belong with.
 */
@SuppressWarnings("deprecation")
public class ExtensionPreferenceCategory extends ConditionalPreferenceCategory {
    public ExtensionPreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("App");
    }

    /**
     * Whether this page has anything on it. The row into it asks the same question.
     *
     * <p>Every row below belongs to a patch, so with none of them in the bundle this page is its
     * heading and nothing else. The home screen used to ask a copy of this question kept in
     * {@code TikTokPreferenceFragment}, and the copy fell one flag behind: a bundle carrying
     * Settings and Hide the launcher shortcuts and nothing else built the switch here and no row
     * into the page, so the only way to that switch was the settings search. One list, here,
     * next to the rows it is a list of.
     */
    public static boolean isAvailable() {
        return SettingsStatus.foldableSplitViewEnabled
                || SettingsStatus.systemFontEnabled
                || SettingsStatus.turnOffHapticsEnabled
                || SettingsStatus.screenTransitionsEnabled
                || SettingsStatus.nonPersonalizedSearchEnabled
                || SettingsStatus.liveSearchEnabled
                || SettingsStatus.hideSearchSuggestionsEnabled
                || SettingsStatus.searchAutoplayEnabled
                || SettingsStatus.keepFavoritesTabEnabled
                || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.profileShortcutsEnabled
                || SettingsStatus.followStatusEnabled
                || SettingsStatus.copyIdsEnabled
                || SettingsStatus.hdUploadEnabled
                || SettingsStatus.refreshRateEnabled
                || SettingsStatus.launcherShortcutsEnabled
                || SettingsStatus.firstLaunchSetupEnabled
                || SettingsStatus.screenCaptureEnabled
                || SettingsStatus.videoOverlaysEnabled
                || SettingsStatus.storeIdentityEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.foldableSplitViewEnabled) {
            addPreference(new SectionHeadingPreference(context, "Layout"));
            addPreference(new TogglePreference(context, "Comments beside the video",
                    "Use the split layout on wider screens. Restart TikTok to apply this. If the old layout is still there, unfold again.", Settings.FOLDABLE_SPLIT_VIEW));
            addPreference(new app.morphe.extension.tiktok.settings.preference.NumberInputPreference(context,
                    "Split comment minimum width", "Window width needed to enable the layout. Restart TikTok to apply this.",
                    Settings.FOLDABLE_SPLIT_VIEW_MIN_WIDTH_DP, "%1$s dp", "%1$s dp"));
        }
        if (SettingsStatus.systemFontEnabled || SettingsStatus.turnOffHapticsEnabled
                || SettingsStatus.screenTransitionsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Appearance"));
        }
        if (SettingsStatus.systemFontEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Use system font",
                    "Shows TikTok's text in your phone's font instead of TikTok Sans. Icons and "
                            + "gift animations keep their own fonts. Restart TikTok to see the "
                            + "change.",
                    Settings.SYSTEM_FONT
            ));
            // Its own hook, in androidx EmojiCompat rather than the font engine, but the same
            // patch: picking Use system font brings both switches.
            addPreference(new TogglePreference(
                    context,
                    "Use system emoji",
                    "Shows every emoji in your phone's own emoji font. The newest emoji your "
                            + "phone doesn't have yet may show as a box or in pieces.",
                    Settings.SYSTEM_EMOJI
            ));
        }
        if (SettingsStatus.turnOffHapticsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Turn off haptics",
                    "Stop the short vibrations TikTok plays on its own taps and gestures. Your "
                            + "keyboard and your phone's own haptics stay as they are.",
                    Settings.TURN_OFF_HAPTICS
            ));
        }
        if (SettingsStatus.screenTransitionsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Turn off screen transitions",
                    "Open and close TikTok's screens without their slide. Swipes inside a screen "
                            + "still follow your finger.",
                    Settings.TURN_OFF_SCREEN_TRANSITIONS
            ));
        }
        boolean hasSearch = SettingsStatus.nonPersonalizedSearchEnabled || SettingsStatus.liveSearchEnabled
                || SettingsStatus.hideSearchSuggestionsEnabled || SettingsStatus.searchAutoplayEnabled;
        if (hasSearch) {
            addPreference(new SectionHeadingPreference(context, "Search"));
        }
        if (SettingsStatus.nonPersonalizedSearchEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Use non-personalized search",
                    "Ask TikTok for search results that aren't personalized to your account. This changes results, not search buttons or suggestions.",
                    Settings.ENABLE_NON_PERSONALIZED_SEARCH
            ));
        }
        if (SettingsStatus.liveSearchEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show search in LIVE",
                    "Show the search entry inside TikTok's LIVE drawer, where available. This doesn't add a search box to video comments.",
                    Settings.ENABLE_LIVE_SEARCH
            ));
        }
        if (SettingsStatus.hideSearchSuggestionsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide suggestions on the search page",
                    "Hide recommended searches before you type on TikTok's search page. Your search history stays. This doesn't hide suggestions above comments.",
                    Settings.HIDE_SEARCH_SUGGESTIONS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide search rewards",
                    "Hide the points banner under the search box and the coin counter floating over search results, which TikTok shows in some regions. Searching works as before.",
                    Settings.HIDE_SEARCH_REWARDS
            ));
        }
        if (SettingsStatus.searchAutoplayEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Stop search results playing on their own",
                    "Videos in search results show their cover and play when you open them. The feed and the videos you open play as usual.",
                    Settings.STOP_SEARCH_AUTOPLAY
            ));
        }
        if (SettingsStatus.keepFavoritesTabEnabled || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.profileShortcutsEnabled || SettingsStatus.followStatusEnabled
                || SettingsStatus.copyIdsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Profile"));
        }
        if (SettingsStatus.keepFavoritesTabEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep the Favorites tab",
                    "TikTok sometimes tests a change that empties the Favorites tab on your "
                            + "profile. This keeps the tab and your saved videos.",
                    Settings.KEEP_FAVORITES_TAB
            ));
        }
        if (SettingsStatus.followStatusEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show follow status",
                    "Under the @username on a profile, say whether it follows you or doesn't follow "
                            + "you back. Follower and following lists mark the accounts you follow "
                            + "that don't follow you back.",
                    Settings.SHOW_FOLLOW_STATUS
            ));
        }
        if (SettingsStatus.copyIdsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Copy bio and IDs",
                    "Long-press a bio to copy it. A profile's share sheet gets buttons that copy its "
                            + "username and user ID, and a video's share sheet one that copies the video ID.",
                    Settings.COPY_IDS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Account facts on profiles",
                    "A profile's share sheet gets an Account facts button. It shows what TikTok already "
                            + "sent about the account: when it joined, its region and language, when its "
                            + "username and display name last changed, whether it's private and whether "
                            + "its liked videos are public. Nothing extra is fetched.",
                    Settings.ACCOUNT_FACTS
            ));
        }
        if (SettingsStatus.promotionalBannersEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the rewards shortcut",
                    "Hide the purple rewards button beside Add friends on your profile.",
                    Settings.HIDE_PROFILE_REWARDS_SHORTCUT
            ));
        }
        if (SettingsStatus.profileShortcutsEnabled) {
            addPreference(new ProfileShortcutChecklistPreference(context));
            addPreference(new InputTextPreference(
                    context,
                    "Hide profile shortcuts by name",
                    "Comma separated names exactly as the row under a profile's bio shows them, "
                            + "such as TikTok Studio or Your orders. Restart TikTok to apply this.",
                    Settings.HIDDEN_PROFILE_SHORTCUTS
            ));
            if (SettingsStatus.profileThoughtsEnabled) {
                addPreference(new TogglePreference(
                        context,
                        "Hide Thoughts on profiles",
                        "Hide the Thoughts bubble TikTok shows above a profile picture, and the "
                                + "prompt to share one on your own profile. Restart TikTok to apply this.",
                        Settings.HIDE_PROFILE_THOUGHTS
                ));
            }
        }
        if (SettingsStatus.hdUploadEnabled) {
            addPreference(new SectionHeadingPreference(context, "Posting"));
            addPreference(new TogglePreference(
                    context,
                    "Always upload in HD",
                    "Post every video as if you'd turned on TikTok's own HD upload on the post page. "
                            + "A clip TikTok doesn't count as high quality posts as before.",
                    Settings.ALWAYS_UPLOAD_HD
            ));
        }
        // The whole app, not the feed: screenshots and the status bar used to be on Feed screen and
        // the store check on Privacy, under a heading of its own.
        if (SettingsStatus.screenCaptureEnabled || SettingsStatus.videoOverlaysEnabled
                || SettingsStatus.refreshRateEnabled || SettingsStatus.launcherShortcutsEnabled
                || SettingsStatus.firstLaunchSetupEnabled || SettingsStatus.storeIdentityEnabled) {
            addPreference(new SectionHeadingPreference(context, "System"));
        }
        if (SettingsStatus.screenCaptureEnabled) {
            addPreference(new TogglePreference(context, "Allow screenshots and Circle to Search",
                    "Let screenshots, screen recording and Circle to Search work on TikTok again. Restart TikTok to apply this.", Settings.ALLOW_SCREEN_CAPTURE));
        }
        if (SettingsStatus.videoOverlaysEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the status bar",
                    "Keep the clock and status icons off the screen while TikTok is open. "
                            + "Swipe down from the top to peek at them.",
                    Settings.HIDE_STATUS_BAR
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide the status bar in LIVE rooms",
                    "Let a LIVE fill the screen up to the top edge. The status bar comes back when "
                            + "you leave the LIVE. Swipe down from the top to peek at it.",
                    Settings.HIDE_STATUS_BAR_IN_LIVE
            ));
        }
        if (SettingsStatus.refreshRateEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep the screen's refresh rate",
                    "Stops TikTok from slowing your screen to match each video's frame rate. On "
                            + "a 90 or 120 Hz phone, that request makes the whole app, "
                            + "scrolling too, run slower.",
                    Settings.UNCAP_REFRESH_RATE
            ));
        }
        if (SettingsStatus.launcherShortcutsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the launcher shortcuts",
                    "Empty the menu that opens when you press and hold TikTok's icon on the home "
                            + "screen. Turning this off asks TikTok to build them again. Tapping "
                            + "the icon still opens the app, and a shortcut you pinned yourself "
                            + "stays where you put it.",
                    Settings.HIDE_LAUNCHER_SHORTCUTS
            ));
        }
        if (SettingsStatus.firstLaunchSetupEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Skip TikTok's setup screens",
                    "Leave out the interest picker, the language and gender questions, the creators "
                            + "to follow, the swipe up tutorial and TikTok's notification page when TikTok "
                            + "runs its setup. Consent, age and sign-in screens still show.",
                    Settings.SKIP_FIRST_LAUNCH_SETUP
            ));
        }
        if (SettingsStatus.storeIdentityEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Pass TikTok's install checks",
                    "TikTok checks how it was signed and installed. This answers those checks "
                            + "the way the Play Store version would. Try it if follows or likes "
                            + "undo themselves after a refresh. It may not help, since TikTok "
                            + "has other checks.",
                    Settings.STORE_IDENTITY
            ));
            addPreference(new ChoicePreference(context, "Store TikTok thinks it came from",
                    Settings.STORE_IDENTITY_INSTALLER,
                    new String[]{"Play Store", "Galaxy Store", "AppGallery", "Amazon Appstore"},
                    StoreIdentity.installers()));
        }
    }
}
