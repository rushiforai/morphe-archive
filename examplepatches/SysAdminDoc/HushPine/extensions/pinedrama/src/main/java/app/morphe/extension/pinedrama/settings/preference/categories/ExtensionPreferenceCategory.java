/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java
 */

package app.morphe.extension.pinedrama.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.pinedrama.privacy.StoreIdentity;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.ChoicePreference;
import app.morphe.extension.pinedrama.settings.preference.ImportedFontPreference;
import app.morphe.extension.pinedrama.settings.preference.InputTextPreference;
import app.morphe.extension.pinedrama.settings.preference.ProfileShortcutChecklistPreference;
import app.morphe.extension.pinedrama.settings.preference.SectionHeadingPreference;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;

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
     * {@code PineDramaPreferenceFragment}, and the copy fell one flag behind: a bundle carrying
     * Settings and Hide the launcher shortcuts and nothing else built the switch here and no row
     * into the page, so the only way to that switch was the settings search. One list, here,
     * next to the rows it is a list of.
     */
    public static boolean isAvailable() {
        return SettingsStatus.systemFontEnabled
                || SettingsStatus.turnOffHapticsEnabled
                || SettingsStatus.screenTransitionsEnabled
                || SettingsStatus.nonPersonalizedSearchEnabled
                || SettingsStatus.liveSearchEnabled
                || SettingsStatus.hideSearchSuggestionsEnabled
                || SettingsStatus.searchAutoplayEnabled
                || SettingsStatus.keepFavoritesTabEnabled
                || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.profileShortcutsEnabled
                || SettingsStatus.profileBackgroundEnabled
                || SettingsStatus.aiCastEntranceEnabled
                || SettingsStatus.refreshRateEnabled
                || SettingsStatus.launcherShortcutsEnabled
                || SettingsStatus.firstLaunchSetupEnabled
                || SettingsStatus.screenCaptureEnabled
                || SettingsStatus.storeIdentityEnabled
                || SettingsStatus.passkeySignInEnabled
                || SettingsStatus.appLanguageEnabled
                || hasPerformance();
    }

    /** The four Performance patches, each with one switch in front of its hooks. */
    private static boolean hasPerformance() {
        return SettingsStatus.skipSplashAdEnabled
                || SettingsStatus.skipUpdateChecksEnabled
                || SettingsStatus.limitBackgroundTrafficEnabled
                || SettingsStatus.animatedImageCacheEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.systemFontEnabled || SettingsStatus.turnOffHapticsEnabled
                || SettingsStatus.screenTransitionsEnabled) {
            addPreference(new SectionHeadingPreference(context, "Appearance"));
        }
        if (SettingsStatus.systemFontEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Use system font",
                    "Shows PineDrama's text in your phone's font instead of TikTok Sans. Icons and "
                            + "gift animations keep their own fonts. Restart PineDrama to see the "
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
            // The same hook again: the font engine's exit asks one question, imported font
            // first, then the system font, then PineDrama's own.
            addPreference(new TogglePreference(
                    context,
                    "Use an imported font",
                    "Shows PineDrama's text in the font file you import below. While both are on, "
                            + "this one wins over Use system font. If the file is removed or "
                            + "can't be read, the text goes back to what Use system font shows.",
                    Settings.IMPORTED_FONT
            ));
            addPreference(ImportedFontPreference.pickRow(context));
            addPreference(ImportedFontPreference.removeRow(context));
        }
        if (SettingsStatus.turnOffHapticsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Turn off haptics",
                    "Stop the short vibrations PineDrama plays on its own taps and gestures. Your "
                            + "keyboard and your phone's own haptics stay as they are.",
                    Settings.TURN_OFF_HAPTICS
            ));
        }
        if (SettingsStatus.screenTransitionsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Turn off screen transitions",
                    "Open and close PineDrama's screens without their slide. Swipes inside a screen "
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
                    "Ask PineDrama for search results that aren't personalized to your account. This changes results, not search buttons or suggestions.",
                    Settings.ENABLE_NON_PERSONALIZED_SEARCH
            ));
        }
        if (SettingsStatus.liveSearchEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Show search in LIVE",
                    "Show the search entry inside PineDrama's LIVE drawer, where available. This doesn't add a search box to video comments.",
                    Settings.ENABLE_LIVE_SEARCH
            ));
        }
        if (SettingsStatus.hideSearchSuggestionsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide suggestions on the search page",
                    "Hide recommended searches before you type on PineDrama's search page. Your search history stays. This doesn't hide suggestions above comments.",
                    Settings.HIDE_SEARCH_SUGGESTIONS
            ));
            addPreference(new TogglePreference(
                    context,
                    "Hide search rewards",
                    "Hide the points banner under the search box and the coin counter floating over search results, which PineDrama shows in some regions. Searching works as before.",
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
                || SettingsStatus.profileShortcutsEnabled || SettingsStatus.profileBackgroundEnabled) {
            addPreference(new SectionHeadingPreference(context, "Profile"));
        }
        if (SettingsStatus.keepFavoritesTabEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep the Favorites tab",
                    "PineDrama sometimes tests a change that empties the Favorites tab on your "
                            + "profile. This keeps the tab and your saved videos.",
                    Settings.KEEP_FAVORITES_TAB
            ));
            addPreference(new TogglePreference(
                    context,
                    "Dark Favorites popup",
                    "When PineDrama is in dark mode, the list of collections you get by holding "
                            + "the Favorites button is dark too instead of white.",
                    Settings.DARK_QUICK_FAVORITES
            ));
        }
        if (SettingsStatus.promotionalBannersEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the rewards shortcut",
                    "Hide the rewards button on your profile, if PineDrama shows you one.",
                    Settings.HIDE_PROFILE_REWARDS_SHORTCUT
            ));
        }
        if (SettingsStatus.profileShortcutsEnabled) {
            addPreference(new ProfileShortcutChecklistPreference(context));
            addPreference(new InputTextPreference(
                    context,
                    "Hide profile shortcuts by name",
                    "Comma separated names, exactly as PineDrama shows them under a profile's bio. "
                            + "Restart PineDrama to apply this.",
                    Settings.HIDDEN_PROFILE_SHORTCUTS
            ));
            if (SettingsStatus.profileThoughtsEnabled) {
                addPreference(new TogglePreference(
                        context,
                        "Hide Thoughts on profiles",
                        "Hide the Thoughts bubble PineDrama shows above a profile picture, and the "
                                + "prompt to share one on your own profile. Restart PineDrama to apply this.",
                        Settings.HIDE_PROFILE_THOUGHTS
                ));
            }
            if (SettingsStatus.thoughtsSwitchEnabled) {
                addPreference(new TogglePreference(
                        context,
                        "Turn on Thoughts",
                        "Show Thoughts on profiles and in your inbox, and the prompt to share one, "
                                + "for accounts PineDrama hasn't turned them on for. PineDrama's servers may "
                                + "still refuse to post one. Restart PineDrama to apply this.",
                        Settings.ENABLE_THOUGHTS
                ));
            }
        }
        if (SettingsStatus.profileBackgroundEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Profile background",
                    "Opens PineDrama's own profile background editor in Edit profile, and shows the "
                            + "backgrounds other profiles have set. PineDrama's servers may still refuse "
                            + "to save one for an account PineDrama hasn't offered it to yet.",
                    Settings.PROFILE_BACKGROUND
            ));
        }
        if (SettingsStatus.aiCastEntranceEnabled) {
            addPreference(new SectionHeadingPreference(context, "Posting"));
        }
        if (SettingsStatus.aiCastEntranceEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the AI Cast button",
                    "Takes PineDrama's AI Cast button off the camera's side toolbar. Open the camera "
                            + "again to see the change.",
                    Settings.HIDE_AI_CAST
            ));
        }
        // The whole app, not the feed: screenshots and the status bar used to be on Feed screen and
        // the store check on Privacy, under a heading of its own.
        if (SettingsStatus.screenCaptureEnabled
                || SettingsStatus.refreshRateEnabled
                || SettingsStatus.launcherShortcutsEnabled || SettingsStatus.firstLaunchSetupEnabled
                || SettingsStatus.storeIdentityEnabled || SettingsStatus.passkeySignInEnabled
                || SettingsStatus.appLanguageEnabled) {
            addPreference(new SectionHeadingPreference(context, "System"));
        }
        if (SettingsStatus.screenCaptureEnabled) {
            addPreference(new TogglePreference(context, "Allow screenshots and Circle to Search",
                    "Let screenshots, screen recording and Circle to Search work on PineDrama again. Restart PineDrama to apply this.", Settings.ALLOW_SCREEN_CAPTURE));
        }
        if (SettingsStatus.refreshRateEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep the screen's refresh rate",
                    "Stops PineDrama from slowing your screen to match each video's frame rate. On "
                            + "a 90 or 120 Hz phone, that request makes the whole app, "
                            + "scrolling too, run slower.",
                    Settings.UNCAP_REFRESH_RATE
            ));
        }
        if (SettingsStatus.launcherShortcutsEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide the launcher shortcuts",
                    "Empty the menu that opens when you press and hold PineDrama's icon on the home "
                            + "screen. Turning this off asks PineDrama to build them again. Tapping "
                            + "the icon still opens the app, and a shortcut you pinned yourself "
                            + "stays where you put it.",
                    Settings.HIDE_LAUNCHER_SHORTCUTS
            ));
        }
        addPreference(new TogglePreference(
                context,
                "Hide the HushPine row",
                "Take HushPine out of PineDrama's Settings and privacy. To open these settings, press "
                        + "and hold any tab at the top of the feed.",
                Settings.HIDE_SETTINGS_ROW
        ));
        if (SettingsStatus.firstLaunchSetupEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Skip PineDrama's setup screens",
                    "Leave out the interest picker, the language and gender questions, the creators "
                            + "to follow, the swipe up tutorial and PineDrama's notification page when PineDrama "
                            + "runs its setup. Consent, age and sign-in screens still show.",
                    Settings.SKIP_FIRST_LAUNCH_SETUP
            ));
        }
        if (SettingsStatus.storeIdentityEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Pass PineDrama's install checks",
                    "PineDrama checks how it was signed and installed. This answers those checks "
                            + "the way the Play Store version would. Try it if follows or likes "
                            + "undo themselves after a refresh. It may not help, since PineDrama "
                            + "has other checks.",
                    Settings.STORE_IDENTITY
            ));
            addPreference(new ChoicePreference(context, "Store PineDrama thinks it came from",
                    Settings.STORE_IDENTITY_INSTALLER,
                    new String[]{"Play Store", "Galaxy Store", "AppGallery", "Amazon Appstore"},
                    StoreIdentity.installers()));
        }
        if (SettingsStatus.passkeySignInEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Sign in without a passkey",
                    "PineDrama treats your phone as one without passkeys, so signing in asks for your "
                            + "password or a code by email or text instead. Password managers won't "
                            + "hand a passkey to a patched app. If PineDrama's 2-step check still wants "
                            + "only a passkey, add email or text as a way to verify on tiktok.com or "
                            + "another phone first.",
                    Settings.SKIP_PASSKEY_SIGN_IN
            ));
        }
        if (SettingsStatus.appLanguageEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Keep the language picked in PineDrama",
                    "When PineDrama starts and decides the phone's language changed, it forgets the "
                            + "language you picked in its settings and follows the phone. With this "
                            + "on, your pick stays. Counts from PineDrama's next start.",
                    Settings.KEEP_APP_LANGUAGE
            ));
        }
        // Each of these used to change PineDrama the moment it was patched in, with no switch. They
        // start off now, so a row here is the only way any of them does anything.
        if (hasPerformance()) {
            addPreference(new SectionHeadingPreference(context, "Performance"));
        }
        if (SettingsStatus.skipSplashAdEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Skip the splash ad",
                    "Stop the full-screen ad PineDrama can show while it starts up.",
                    Settings.SKIP_SPLASH_AD
            ));
        }
        if (SettingsStatus.skipUpdateChecksEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Skip update checks",
                    "Stop the two background tasks PineDrama uses to check for updates, one of them "
                            + "when your phone starts. Some in-app update prompts may stop. Play "
                            + "Store updates still work.",
                    Settings.SKIP_UPDATE_CHECKS
            ));
        }
        if (SettingsStatus.limitBackgroundTrafficEnabled) {
            // Patched with Skip notification setup, the same switch stops push setup as well.
            addPreference(new TogglePreference(
                    context,
                    "Limit background traffic",
                    SettingsStatus.skipPushSetupEnabled
                            ? "Stop PineDrama loading upcoming videos ahead of time and setting up "
                                    + "notifications. You won't get notifications, messages "
                                    + "included, while this is on. Videos may take a moment "
                                    + "longer to start."
                            : "Stop PineDrama loading upcoming videos ahead of time. It uses less "
                                    + "data, but videos may take a moment longer to start.",
                    Settings.LIMIT_BACKGROUND_TRAFFIC
            ));
        }
        if (SettingsStatus.animatedImageCacheEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Don't decode animated frames ahead",
                    "Animated stickers and GIFs decode each frame as it's shown instead of a few "
                            + "ahead, so they use a little less memory. Applies to the next ones "
                            + "that load.",
                    Settings.DROP_ANIMATED_IMAGE_CACHE
            ));
        }
    }
}
