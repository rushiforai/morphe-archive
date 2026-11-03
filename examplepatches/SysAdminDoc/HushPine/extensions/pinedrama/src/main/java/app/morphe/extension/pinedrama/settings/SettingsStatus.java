/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/SettingsStatus.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/SettingsStatus.java
 */

package app.morphe.extension.pinedrama.settings;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

public class SettingsStatus {
    public static boolean regionSpoofEnabled;
    public static void enableRegionSpoof() { regionSpoofEnabled = true; }
    public static boolean networkProxyEnabled;
    public static void enableNetworkProxy() { networkProxyEnabled = true; }
    public static boolean screenCaptureEnabled;
    public static void enableScreenCapture() { screenCaptureEnabled = true; }
    // Volatile because FeatureGateLearnMode reads it before taking its monitor, on PineDrama's own
    // gate threads, to decide whether the monitor is needed at all.
    public static volatile boolean featureGateRecorderEnabled;
    public static void enableFeatureGateRecorder() { featureGateRecorderEnabled = true; }
    public static boolean automaticClearDisplayEnabled;
    public static void enableAutomaticClearDisplay() { automaticClearDisplayEnabled = true; }
    public static boolean playbackQualityEnabled;
    public static boolean playbackSpeedEnabled;
    public static void enablePlaybackSpeed() { playbackSpeedEnabled = true; }
    public static boolean autoAdvanceEnabled;
    public static void enableAutoAdvance() { autoAdvanceEnabled = true; }
    public static void enablePlaybackQuality() { playbackQualityEnabled = true; }
    public static boolean sdrPlaybackEnabled;
    public static void enableSdrPlayback() { sdrPlaybackEnabled = true; }
    public static boolean h264PlaybackEnabled;
    public static void enableH264Playback() { h264PlaybackEnabled = true; }
    public static boolean advancedDownloadsEnabled;
    public static void enableAdvancedDownloads() { advancedDownloadsEnabled = true; }
    public static boolean feedFilterEnabled = false;
    /** The LIVE feed's page handler was found, so its rows have something to act on. */
    public static boolean liveFeedFilterEnabled = false;
    public static boolean commentTranslationEnabled = false;
    public static boolean hideCommentQuickReactionsEnabled = false;
    public static boolean copyCommentsWithoutUsernameEnabled = false;
    public static boolean downloadEnabled = false;
    public static boolean customOfflineVideosEnabled = false;
    public static boolean simSpoofEnabled = false;
    public static boolean promotionalBannersEnabled = false;
    public static boolean profileShortcutsEnabled = false;
    /** Playback speed found the on-screen player's progress report, so a strip can drag the speed. */
    public static boolean liveSpeedEnabled = false;
    public static boolean longPressSpeedLockEnabled = false;
    public static boolean disableLongPressQuickShareEnabled = false;
    public static boolean disableLongPressRepostEnabled = false;
    public static boolean nonPersonalizedSearchEnabled = false;
    public static boolean hideSearchSuggestionsEnabled = false;
    public static boolean searchAutoplayEnabled = false;
    /** Feed filter found the camera's AI Cast gate, so Hide the AI Cast button has a hook. */
    public static boolean aiCastEntranceEnabled = false;
    public static boolean liveSearchEnabled = false;
    public static boolean seekbarThumbnailEnabled = false;
    public static boolean fullScreenHoldEnabled = false;
    public static boolean keepPulledSoundsEnabled = false;
    public static boolean resumeVideoAfterScrollEnabled = false;
    public static boolean externalBrowserEnabled = false;
    public static boolean alwaysShowPublishDateEnabled = false;
    public static boolean systemFontEnabled = false;
    public static boolean turnOffHapticsEnabled = false;
    public static boolean screenTransitionsEnabled = false;
    public static boolean diagnosticsEnabled = false;
    public static boolean sensitiveWarningsEnabled = false;
    /** Skip content warnings found Aweme's risk model getter, so the unverified notices switch works. */
    public static boolean unverifiedNoticesEnabled = false;
    /** Skip content warnings found the Know the facts banner gate and share prompt, so the Check your sources switch works. */
    public static boolean checkYourSourcesEnabled = false;

    public static boolean backgroundPlayEnabled = false;

    public static void enableBackgroundPlay() {
        backgroundPlayEnabled = true;
    }
    public static boolean inboxFilterEnabled = false;
    public static boolean videoFitEnabled = false;
    public static boolean refreshRateEnabled = false;
    public static boolean launcherShortcutsEnabled = false;
    public static boolean firstLaunchSetupEnabled = false;
    public static boolean duetStitchEnabled = false;
    public static boolean notificationControlsEnabled = false;
    public static boolean suggestedVideoPushBlockEnabled = false;
    public static boolean autoStreakEnabled = false;
    public static boolean hideSuggestedAccountsEnabled = false;
    public static boolean chatDeclutterEnabled = false;
    public static boolean expandActivityListEnabled = false;
    public static boolean hideCommentEggsEnabled = false;
    public static boolean commentSortControlsEnabled = false;
    public static boolean commentsFullHeightEnabled = false;
    public static boolean ghostModeEnabled = false;
    public static boolean hideFeedFollowButtonEnabled = false;
    public static boolean hideFeedSaveButtonEnabled = false;
    public static boolean keepFavoritesTabEnabled = false;
    public static boolean hideFeedSearchButtonEnabled = false;
    public static boolean showSeekbarEnabled = false;
    /** Show the progress bar's extras, which a build other than the declared one can leave out
     *  while the bar itself still applies: the time and the bigger handle, the story seek bar and
     *  the sound preview seek bar. */
    public static boolean seekbarExtrasEnabled = false;
    public static boolean storySeekbarEnabled = false;
    public static boolean soundSeekbarEnabled = false;
    public static boolean sanitizeShareUrlsEnabled = false;
    public static boolean contactListBlockerEnabled = false;
    public static boolean searchHistoryEnabled = false;
    public static boolean watchHistoryEnabled = false;
    public static boolean installedAppsBlockerEnabled = false;
    public static boolean locationGovernorEnabled = false;
    public static boolean devicePrivacyGuardEnabled = false;
    public static boolean resourceGovernorEnabled = false;
    public static boolean browserPrivacyGuardEnabled = false;
    public static boolean cameraMicIndicatorEnabled = false;
    public static boolean storeIdentityEnabled = false;

    public static void enableContactListBlocker() {
        contactListBlockerEnabled = true;
    }

    public static void enableSearchHistory() {
        searchHistoryEnabled = true;
    }

    public static void enableWatchHistory() {
        watchHistoryEnabled = true;
    }

    public static void enableInstalledAppsBlocker() {
        installedAppsBlockerEnabled = true;
    }

    public static void enableLocationGovernor() {
        locationGovernorEnabled = true;
    }

    public static void enableDevicePrivacyGuard() {
        devicePrivacyGuardEnabled = true;
    }

    public static void enableResourceGovernor() {
        resourceGovernorEnabled = true;
    }

    public static void enableBrowserPrivacyGuard() {
        browserPrivacyGuardEnabled = true;
    }

    public static void enableCameraMicIndicator() {
        cameraMicIndicatorEnabled = true;
    }

    public static void enableStoreIdentity() {
        storeIdentityEnabled = true;
    }

    public static void enableFeedFilter() {
        feedFilterEnabled = true;
    }

    public static void enableLiveFeedFilter() {
        liveFeedFilterEnabled = true;
    }

    public static void enableCommentTranslation() {
        commentTranslationEnabled = true;
    }

    /** Translate comments found the seven places PineDrama reads its Don't translate list and hooked them. */
    public static boolean doNotAutoTranslateEnabled = false;

    public static void enableDoNotAutoTranslate() {
        doNotAutoTranslateEnabled = true;
    }

    /** Translate comments hooked the translation service's answer to which language to translate into. */
    public static boolean translateIntoEnabled = false;

    public static void enableTranslateInto() {
        translateIntoEnabled = true;
    }

    /** Translate comments hooked the gates and toggle behind PineDrama's translate button in the comment header. */
    public static boolean commentTranslateButtonEnabled = false;

    public static void enableCommentTranslateButton() {
        commentTranslateButtonEnabled = true;
    }

    /** Translate comments hooked the two gates that hide the translation rows on PineDrama's Language page. */
    public static boolean languagePageTranslationsEnabled = false;

    public static void enableLanguagePageTranslations() {
        languagePageTranslationsEnabled = true;
    }

    /** Translate comments hooked the read that takes translation off videos for some accounts. */
    public static boolean feedTranslationsEnabled = false;

    public static void enableFeedTranslations() {
        feedTranslationsEnabled = true;
    }

    /** Translate comments hooked the read of PineDrama's Always translate that every video decision asks. */
    public static boolean videoAutoTranslateEnabled = false;

    public static void enableVideoAutoTranslate() {
        videoAutoTranslateEnabled = true;
    }

    public static void enableHideCommentQuickReactions() {
        hideCommentQuickReactionsEnabled = true;
    }

    public static void enableCopyCommentsWithoutUsername() {
        copyCommentsWithoutUsernameEnabled = true;
    }

    public static void enableDownload() {
        downloadEnabled = true;
    }

    /** Downloads found the Share to sheet PineDrama opens after its own saves and hooked it. */
    public static boolean postDownloadShareSheetEnabled = false;

    public static void enablePostDownloadShareSheet() {
        postDownloadShareSheetEnabled = true;
    }

    public static void enableCustomOfflineVideos() {
        customOfflineVideosEnabled = true;
    }

    /** Custom offline videos limit found the offline lifetime on this build and hooked it. */
    public static boolean keepOfflineVideosEnabled = false;

    public static void enableKeepOfflineVideos() {
        keepOfflineVideosEnabled = true;
    }

    public static void enableSimSpoof() {
        simSpoofEnabled = true;
    }

    public static void enablePromotionalBanners() {
        promotionalBannersEnabled = true;
    }

    public static void enableProfileShortcuts() {
        profileShortcutsEnabled = true;
    }

    public static void enableLiveSpeed() {
        liveSpeedEnabled = true;
    }

    /** The hold gesture's touch listener and apply call were found, so sliding can change its speed. */
    public static boolean holdSpeedSlideEnabled = false;

    public static void enableHoldSpeedSlide() {
        holdSpeedSlideEnabled = true;
    }

    public static void enableLongPressSpeedLock() {
        longPressSpeedLockEnabled = true;
    }

    public static void enableDisableLongPressQuickShare() {
        disableLongPressQuickShareEnabled = true;
    }

    public static void enableDisableLongPressRepost() {
        disableLongPressRepostEnabled = true;
    }

    public static void enableNonPersonalizedSearch() {
        nonPersonalizedSearchEnabled = true;
    }

    public static void enableHideSearchSuggestions() {
        hideSearchSuggestionsEnabled = true;
    }

    public static void enableSearchAutoplay() {
        searchAutoplayEnabled = true;
    }

    public static void enableAiCastEntrance() {
        aiCastEntranceEnabled = true;
    }

    public static void enableLiveSearch() {
        liveSearchEnabled = true;
    }

    public static void enableSeekbarThumbnail() {
        seekbarThumbnailEnabled = true;
    }

    public static void enableShowSeekbar() {
        showSeekbarEnabled = true;
    }

    public static void enableSeekbarExtras() {
        seekbarExtrasEnabled = true;
    }

    public static void enableStorySeekbar() {
        storySeekbarEnabled = true;
    }

    public static void enableSoundSeekbar() {
        soundSeekbarEnabled = true;
    }

    public static void enableSanitizeShareUrls() {
        sanitizeShareUrlsEnabled = true;
    }

    public static void enableKeepPulledSounds() {
        keepPulledSoundsEnabled = true;
    }

    public static void enableFullScreenHold() {
        fullScreenHoldEnabled = true;
    }

    public static void enableResumeVideoAfterScroll() {
        resumeVideoAfterScrollEnabled = true;
    }

    public static void enableExternalBrowser() {
        externalBrowserEnabled = true;
    }

    public static void enableSystemFont() {
        systemFontEnabled = true;
    }

    public static void enableTurnOffHaptics() {
        turnOffHapticsEnabled = true;
    }

    public static void enableScreenTransitions() {
        screenTransitionsEnabled = true;
    }

    public static void enableAlwaysShowPublishDate() {
        alwaysShowPublishDateEnabled = true;
    }

    public static void enableDiagnostics() {
        diagnosticsEnabled = true;
    }

    public static void enableSensitiveWarnings() {
        sensitiveWarningsEnabled = true;
    }

    public static void enableUnverifiedNotices() {
        unverifiedNoticesEnabled = true;
    }

    public static void enableCheckYourSources() {
        checkYourSourcesEnabled = true;
    }

    public static void enableHideSuggestedAccounts() {
        hideSuggestedAccountsEnabled = true;
    }

    public static void enableChatDeclutter() {
        chatDeclutterEnabled = true;
    }

    public static void enableExpandActivityList() {
        expandActivityListEnabled = true;
    }

    public static void enableDuetStitch() {
        duetStitchEnabled = true;
    }

    public static void enableRefreshRate() {
        refreshRateEnabled = true;
    }

    public static void enableLauncherShortcuts() {
        launcherShortcutsEnabled = true;
    }

    public static void enableFirstLaunchSetup() {
        firstLaunchSetupEnabled = true;
    }

    public static void enableVideoFit() {
        videoFitEnabled = true;
    }

    public static void enableNotificationControls() {
        notificationControlsEnabled = true;
    }

    public static void enableSuggestedVideoPushBlock() {
        suggestedVideoPushBlockEnabled = true;
    }

    public static void enableAutoStreak() {
        autoStreakEnabled = true;
    }

    public static void enableInboxFilter() {
        inboxFilterEnabled = true;
    }

    public static void enableHideCommentEggs() {
        hideCommentEggsEnabled = true;
    }

    public static void enableCommentSortControls() {
        commentSortControlsEnabled = true;
    }

    public static void enableCommentsFullHeight() {
        commentsFullHeightEnabled = true;
    }

    public static void enableGhostMode() {
        ghostModeEnabled = true;
    }

    public static void enableHideFeedFollowButton() {
        hideFeedFollowButtonEnabled = true;
    }

    public static void enableHideFeedSaveButton() {
        hideFeedSaveButtonEnabled = true;
    }

    public static void enableKeepFavoritesTab() {
        keepFavoritesTabEnabled = true;
        app.morphe.extension.pinedrama.favorites.FavoritesTab.installed();
    }

    /** The profile grid adapter was found and hooked to sort its loaded videos (#180). */
    public static boolean gridSortEnabled = false;

    public static void enableGridSort() {
        gridSortEnabled = true;
    }

    /** The grid adapter hands over its tab number, so the Liked tab can have its own order (#180). */
    public static boolean likedGridSortEnabled = false;

    public static void enableLikedGridSort() {
        likedGridSortEnabled = true;
    }

    public static void enableHideFeedSearchButton() {
        hideFeedSearchButtonEnabled = true;
    }

    /** Hide inbox items found the group chat banner's update on this build and hooked it. */
    public static boolean groupChatBannerEnabled = false;

    public static void enableGroupChatBanner() {
        groupChatBannerEnabled = true;
    }

    /** Hide profile shortcuts found the profile picture's Thoughts bubble on this build and hooked it. */
    public static boolean profileThoughtsEnabled = false;

    public static void enableProfileThoughts() {
        profileThoughtsEnabled = true;
    }

    /** Hide profile shortcuts found PineDrama's two Thoughts gates on this build and put the switch in front. */
    public static boolean thoughtsSwitchEnabled = false;

    public static void enableThoughtsSwitch() {
        thoughtsSwitchEnabled = true;
    }

    /** Skip the splash ad put its switch in front of the splash tasks and gates. */
    public static boolean skipSplashAdEnabled = false;

    public static void enableSkipSplashAd() {
        skipSplashAdEnabled = true;
    }

    /** Skip update checks put its switch in front of the two update check tasks. */
    public static boolean skipUpdateChecksEnabled = false;

    public static void enableSkipUpdateChecks() {
        skipUpdateChecksEnabled = true;
    }

    /** Limit background traffic put its switch in front of the buffer preload gate. */
    public static boolean limitBackgroundTrafficEnabled = false;

    public static void enableLimitBackgroundTraffic() {
        limitBackgroundTrafficEnabled = true;
    }

    /**
     * Limit background traffic was patched with Skip notification setup, so its switch stops
     * push setup too, and the row says so. Only ever set alongside the flag above.
     */
    public static boolean skipPushSetupEnabled = false;

    public static void enableSkipPushSetup() {
        skipPushSetupEnabled = true;
    }

    /** Drop the animated image cache put its switch in front of Fresco's cache choice. */
    public static boolean animatedImageCacheEnabled = false;

    public static void enableAnimatedImageCache() {
        animatedImageCacheEnabled = true;
    }

    /** Stop on-device AI profiling put its switch in front of the Pitaya start-up. */
    public static boolean aiProfilingEnabled = false;

    public static void enableAiProfiling() {
        aiProfilingEnabled = true;
    }

    /** Enable voice comments put its switch in front of PineDrama's voice comment gate. */
    public static boolean voiceCommentsEnabled = false;

    public static void enableVoiceComments() {
        voiceCommentsEnabled = true;
    }

    /** Allow photo comments put its switch in front of PineDrama's comment gallery check (#156). */
    public static boolean commentPhotosEnabled = false;

    public static void enableCommentPhotos() {
        commentPhotosEnabled = true;
    }

    /** Skip passkey sign-in put its switch in front of PineDrama's passkey support check. */
    public static boolean passkeySignInEnabled = false;

    public static void enablePasskeySignIn() {
        passkeySignInEnabled = true;
    }

    /** Keep the app language put its switch in front of PineDrama's language reset. */
    public static boolean appLanguageEnabled = false;

    public static void enableAppLanguage() {
        appLanguageEnabled = true;
    }

    /** Profile background put its switch in front of PineDrama's profile background gate. */
    public static boolean profileBackgroundEnabled = false;

    public static void enableProfileBackground() {
        profileBackgroundEnabled = true;
    }

    /** Show commenter handle and region hooked the comment cell's name, reply label and time. */
    public static boolean commenterDetailsEnabled = false;

    public static void enableCommenterDetails() {
        commenterDetailsEnabled = true;
    }

    // Patches with no settings row register too, so Build details can list every patch that
    // changed PineDrama's code. Each one registers last in its execute, after everything it checks.
    public static boolean settingsEnabled = false;
    public static void enableSettings() { settingsEnabled = true; }
    public static boolean noScreenCaptureDetectionEnabled = false;
    public static void enableNoScreenCaptureDetection() { noScreenCaptureDetectionEnabled = true; }
    public static boolean noLoginRequirementEnabled = false;
    public static void enableNoLoginRequirement() { noLoginRequirementEnabled = true; }
    public static boolean googleLoginFixEnabled = false;
    public static void enableGoogleLoginFix() { googleLoginFixEnabled = true; }
    public static boolean commentPublishDiagnosticsEnabled = false;
    public static void enableCommentPublishDiagnostics() { commentPublishDiagnosticsEnabled = true; }
    public static boolean commentSendFixEnabled = false;
    public static void enableCommentSendFix() { commentSendFixEnabled = true; }
    public static boolean savedStickersEnabled = false;
    public static void enableSavedStickers() { savedStickersEnabled = true; }
    public static boolean stickerCreatorEnabled = false;
    public static void enableStickerCreator() { stickerCreatorEnabled = true; }
    public static boolean stickerRecentsEnabled = false;
    public static void enableStickerRecents() { stickerRecentsEnabled = true; }
    public static boolean networkRequestReportEnabled = false;
    public static void enableNetworkRequestReport() { networkRequestReportEnabled = true; }
    public static boolean featureGateLabEnabled = false;
    public static void enableFeatureGateLab() { featureGateLabEnabled = true; }

    private static final String SWITCH_SUFFIX = "Enabled";

    /**
     * The patches that registered here, each named by its switch without the "Enabled" ending.
     * Only the patcher's registrations set these, so the list is what this APK was patched with.
     */
    static List<String> registered() {
        List<String> names = new ArrayList<>();
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            String name = field.getName();
            int modifiers = field.getModifiers();
            if (field.getType() != boolean.class || !Modifier.isStatic(modifiers)
                    || !Modifier.isPublic(modifiers) || !name.endsWith(SWITCH_SUFFIX)) continue;
            try {
                if (field.getBoolean(null)) names.add(name.substring(0, name.length() - SWITCH_SUFFIX.length()));
            } catch (IllegalAccessException unreachable) {
                // Public fields of this class always read.
                throw new IllegalStateException(unreachable);
            }
        }
        return names;
    }

    static {
        // The patcher fills load() with selected registrations. Runtime hooks can run before settings opens.
        // Keep this after field initializers so their default values cannot overwrite those registrations.
        load();
    }

    public static void load() {
    }
}
