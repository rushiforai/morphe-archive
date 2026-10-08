/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java
 */

package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.ProfileShortcutChecklistPreference;
import app.morphe.extension.tiktok.settings.preference.SectionHeadingPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;

/**
 * The app around the feed: its layout, search, the profile and the system it runs on. The
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
                || SettingsStatus.nonPersonalizedSearchEnabled
                || SettingsStatus.liveSearchEnabled
                || SettingsStatus.hideSearchSuggestionsEnabled
                || SettingsStatus.keepFavoritesTabEnabled
                || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.profileShortcutsEnabled
                || SettingsStatus.followStatusEnabled
                || SettingsStatus.copyIdsEnabled
                || SettingsStatus.refreshRateEnabled
                || SettingsStatus.launcherShortcutsEnabled
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
        if (SettingsStatus.systemFontEnabled) {
            addPreference(new SectionHeadingPreference(context, "Appearance"));
            addPreference(new TogglePreference(
                    context,
                    "Use system font",
                    "Draw TikTok's text in your device's font instead of TikTok Sans. Icons, gift "
                            + "animations and the @ and # glyphs keep their own fonts. Restart TikTok to apply this.",
                    Settings.SYSTEM_FONT
            ));
        }
        boolean hasSearch = SettingsStatus.nonPersonalizedSearchEnabled || SettingsStatus.liveSearchEnabled
                || SettingsStatus.hideSearchSuggestionsEnabled;
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
        if (SettingsStatus.keepFavoritesTabEnabled || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.profileShortcutsEnabled || SettingsStatus.followStatusEnabled
                || SettingsStatus.copyIdsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Profile"));
        }
        if (SettingsStatus.keepFavoritesTabEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep the Favorites tab",
                    "TikTok's server can put an account into an experiment that empties the Favorites tab on your profile. Keep the tab and its saved videos.",
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
        }
        // The whole app, not the feed: screenshots and the status bar used to be on Feed screen and
        // the store check on Privacy, under a heading of its own.
        if (SettingsStatus.screenCaptureEnabled || SettingsStatus.videoOverlaysEnabled
                || SettingsStatus.refreshRateEnabled || SettingsStatus.launcherShortcutsEnabled
                || SettingsStatus.storeIdentityEnabled) {
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
                    "Stop TikTok asking the screen to run at the frame rate of the video it's "
                            + "playing. On a 90 or 120 Hz phone that ask slows the whole app down "
                            + "to the video's rate, scrolling included.",
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
        if (SettingsStatus.storeIdentityEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Look like the store app to TikTok's checks",
                    "Answer TikTok's own checks of how it was signed and installed the way the Play "
                            + "Store app would. For follows or likes that undo themselves on a refresh. "
                            + "TikTok can also check from native code this doesn't reach, so it may not help.",
                    Settings.STORE_IDENTITY
            ));
        }
    }
}
