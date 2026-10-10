/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/SettingsStatus.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/settings/SettingsStatus.java
 */

package app.morphe.extension.tiktok.settings;

public class SettingsStatus {
    public static boolean regionSpoofEnabled;
    public static void enableRegionSpoof() { regionSpoofEnabled = true; }
    public static boolean networkProxyEnabled;
    public static void enableNetworkProxy() { networkProxyEnabled = true; }
    public static boolean foldableSplitViewEnabled;
    public static void enableFoldableSplitView() { foldableSplitViewEnabled = true; }
    public static boolean subtitleToolsEnabled;
    public static void enableSubtitleTools() { subtitleToolsEnabled = true; }
    public static boolean screenCaptureEnabled;
    public static void enableScreenCapture() { screenCaptureEnabled = true; }
    // Volatile because FeatureGateLearnMode reads it before taking its monitor, on TikTok's own
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
    public static boolean doubleTapEnabled;
    public static void enableDoubleTap() { doubleTapEnabled = true; }
    public static boolean swipeLeftEnabled;
    public static void enableSwipeLeft() { swipeLeftEnabled = true; }
    public static boolean longPressEnabled;
    public static void enableLongPress() { longPressEnabled = true; }
    public static boolean confirmInteractionsEnabled;
    public static void enableConfirmInteractions() { confirmInteractionsEnabled = true; }
    public static boolean feedFilterEnabled = false;
    /** The LIVE feed's page handler was found, so its rows have something to act on. */
    public static boolean liveFeedFilterEnabled = false;
    public static boolean feedNavigationEnabled = false;
    public static boolean commentTranslationEnabled = false;
    public static boolean hideCommentQuickReactionsEnabled = false;
    public static boolean copyCommentsWithoutUsernameEnabled = false;
    public static boolean downloadEnabled = false;
    public static boolean customOfflineVideosEnabled = false;
    public static boolean simSpoofEnabled = false;
    public static boolean captchaPopupSuppressionEnabled = false;
    public static boolean promotionalBannersEnabled = false;
    public static boolean profileShortcutsEnabled = false;
    public static boolean popupLabelsEnabled = false;
    /** Block popups found the wind-down triggers' checks on this build and hooked them. */
    public static boolean windDownScreensEnabled = false;
    /** Feed tab navigation found the bottom tab icons' names on this build and hooked them. */
    public static boolean bottomTabLabelsEnabled = false;
    /** Playback speed found the on-screen player's progress report, so a strip can drag the speed. */
    public static boolean liveSpeedEnabled = false;
    public static boolean longPressSpeedLockEnabled = false;
    public static boolean disableLongPressQuickShareEnabled = false;
    public static boolean disableLongPressRepostEnabled = false;
    public static boolean nonPersonalizedSearchEnabled = false;
    public static boolean hideSearchSuggestionsEnabled = false;
    public static boolean searchAutoplayEnabled = false;
    public static boolean hdUploadEnabled = false;
    public static boolean liveSearchEnabled = false;
    public static boolean seekbarThumbnailEnabled = false;
    public static boolean stopVideoLoopingEnabled = false;
    public static boolean fullScreenHoldEnabled = false;
    public static boolean storyControlsEnabled = false;
    public static boolean liveControlsEnabled = false;
    public static boolean keepPulledSoundsEnabled = false;
    public static boolean pictureInPictureEnabled = false;
    public static boolean resumeVideoAfterScrollEnabled = false;
    public static boolean externalBrowserEnabled = false;
    public static boolean alwaysShowPublishDateEnabled = false;
    public static boolean systemFontEnabled = false;
    public static boolean turnOffHapticsEnabled = false;
    public static boolean screenTransitionsEnabled = false;
    public static boolean diagnosticsEnabled = false;
    public static boolean blockAuthorEnabled = false;
    public static boolean authorRegionEnabled = false;
    public static boolean sensitiveWarningsEnabled = false;
    /** Skip content warnings found Aweme's risk model getter, so the unverified notices switch works. */
    public static boolean unverifiedNoticesEnabled = false;
    public static boolean notInterestedEnabled = false;

    public static void enableNotInterested() {
        notInterestedEnabled = true;
    }
    public static boolean feedMuteEnabled = false;

    public static void enableFeedMute() {
        feedMuteEnabled = true;
    }
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
    public static boolean hideInboxStoriesEnabled = false;
    public static boolean chatDeclutterEnabled = false;
    public static boolean expandActivityListEnabled = false;
    public static boolean commentToolsEnabled = false;
    public static boolean hideCommentEggsEnabled = false;
    public static boolean commentSortControlsEnabled = false;
    public static boolean videoOverlaysEnabled = false;
    public static boolean feedTextSizeEnabled = false;
    public static boolean shareSheetEnabled = false;
    public static boolean seenVideoFilterEnabled = false;
    public static boolean ghostModeEnabled = false;
    public static boolean disableTelemetryEnabled = false;
    public static boolean hideFeedFollowButtonEnabled = false;
    public static boolean hideFeedSaveButtonEnabled = false;
    public static boolean exactCountsEnabled = false;
    public static boolean engagementRateEnabled = false;
    public static boolean avatarRingsEnabled = false;
    public static boolean lengthLimitsEnabled = false;
    public static boolean keepFavoritesTabEnabled = false;
    public static boolean followStatusEnabled = false;
    public static boolean copyIdsEnabled = false;
    public static boolean hideFeedLiveButtonEnabled = false;
    public static boolean hideFeedSearchButtonEnabled = false;
    public static boolean showSeekbarEnabled = false;
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
    public static boolean appLockEnabled = false;

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

    public static void enableAppLock() {
        appLockEnabled = true;
    }

    public static void enableFeedFilter() {
        feedFilterEnabled = true;
    }

    public static void enableLiveFeedFilter() {
        liveFeedFilterEnabled = true;
    }

    public static void enableFeedNavigation() {
        feedNavigationEnabled = true;
    }

    public static void enableCommentTranslation() {
        commentTranslationEnabled = true;
    }

    /** Translate comments found the seven places TikTok reads its Don't translate list and hooked them. */
    public static boolean doNotAutoTranslateEnabled = false;

    public static void enableDoNotAutoTranslate() {
        doNotAutoTranslateEnabled = true;
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

    public static void enableCaptchaPopupSuppression() {
        captchaPopupSuppressionEnabled = true;
        // Injected where the settings load, so this is where the gate says it is in the build.
        app.morphe.extension.tiktok.featurecontrols.CaptchaGate.installed();
    }

    public static void enablePromotionalBanners() {
        promotionalBannersEnabled = true;
    }

    public static void enableProfileShortcuts() {
        profileShortcutsEnabled = true;
    }

    public static void enablePopupLabels() {
        popupLabelsEnabled = true;
    }

    public static void enableWindDownScreens() {
        windDownScreensEnabled = true;
    }

    public static void enableBottomTabLabels() {
        bottomTabLabelsEnabled = true;
    }

    public static void enableLiveSpeed() {
        liveSpeedEnabled = true;
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

    public static void enableHdUpload() {
        hdUploadEnabled = true;
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

    public static void enableSanitizeShareUrls() {
        sanitizeShareUrlsEnabled = true;
    }

    public static void enableStoryControls() {
        storyControlsEnabled = true;
    }

    public static void enableLiveControls() {
        liveControlsEnabled = true;
    }

    public static void enableKeepPulledSounds() {
        keepPulledSoundsEnabled = true;
    }

    public static void enablePictureInPicture() {
        pictureInPictureEnabled = true;
    }

    public static void enableFullScreenHold() {
        fullScreenHoldEnabled = true;
    }

    public static void enableStopVideoLooping() {
        stopVideoLoopingEnabled = true;
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

    public static void enableAuthorRegion() {
        authorRegionEnabled = true;
    }

    public static void enableBlockAuthor() {
        blockAuthorEnabled = true;
    }

    public static void enableHideSuggestedAccounts() {
        hideSuggestedAccountsEnabled = true;
    }

    public static void enableHideInboxStories() {
        hideInboxStoriesEnabled = true;
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

    public static void enableCommentTools() {
        commentToolsEnabled = true;
    }

    public static void enableHideCommentEggs() {
        hideCommentEggsEnabled = true;
    }

    public static void enableCommentSortControls() {
        commentSortControlsEnabled = true;
    }

    public static void enableSeenVideoFilter() {
        seenVideoFilterEnabled = true;
    }

    public static void enableGhostMode() {
        ghostModeEnabled = true;
    }

    public static void enableDisableTelemetry() {
        disableTelemetryEnabled = true;
    }

    public static void enableHideFeedFollowButton() {
        hideFeedFollowButtonEnabled = true;
    }

    public static void enableHideFeedSaveButton() {
        hideFeedSaveButtonEnabled = true;
    }

    public static void enableExactCounts() {
        exactCountsEnabled = true;
    }

    public static void enableEngagementRate() {
        engagementRateEnabled = true;
    }

    public static void enableAvatarRings() {
        avatarRingsEnabled = true;
    }

    public static void enableLengthLimits() {
        lengthLimitsEnabled = true;
    }

    public static void enableKeepFavoritesTab() {
        keepFavoritesTabEnabled = true;
        app.morphe.extension.tiktok.favorites.FavoritesTab.installed();
    }

    public static void enableFollowStatus() {
        followStatusEnabled = true;
    }

    public static void enableCopyIds() {
        copyIdsEnabled = true;
    }

    public static void enableHideFeedLiveButton() {
        hideFeedLiveButtonEnabled = true;
    }

    public static void enableHideFeedSearchButton() {
        hideFeedSearchButtonEnabled = true;
    }

    public static void enableShareSheet() {
        shareSheetEnabled = true;
    }

    public static void enableVideoOverlays() {
        videoOverlaysEnabled = true;
    }

    public static void enableFeedTextSize() {
        feedTextSizeEnabled = true;
    }

    /** Hide video overlays found the Footnotes banner's gate on this build and hooked it. */
    public static boolean footnotesEnabled = false;

    public static void enableFootnotes() {
        footnotesEnabled = true;
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

    static {
        // The patcher fills load() with selected registrations. Runtime hooks can run before settings opens.
        // Keep this after field initializers so their default values cannot overwrite those registrations.
        load();
    }

    public static void load() {
    }
}
