package app.afterglow.extension.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Lite Mode's forced preferences, ported from iOS YTAGLiteMode.m (lines 186-244).
 * While {@code liteModeEnabled} is on, these keys read as the forced value
 * everywhere (iOS ytagBool = YTAGEffectiveBool), but the stored value is left
 * alone so turning Lite Mode off restores the user's choice.
 */
public final class LiteMode {
    public static final String KEY = "liteModeEnabled";

    /** iOS YTAGLiteForcedTrueKeys. */
    public static final Set<String> FORCED_TRUE = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "noAds", "noPromotionCards", "noSearchHistory", "noLinkTracking", "noShareChunk",
            "noCast", "noNotifsButton", "noVoiceSearchButton", "noSubbar", "noYTLogo",
            "removeLabels", "removeIndicators",
            "hideEndScreenCards", "noRelatedVids", "noContinueWatching", "noContinueWatchingPrompt", "noRelatedWatchNexts",
            "hidePrevNext", "noHUDMsgs", "noDarkBg", "noFullscreenActions", "noWatermarks", "disableAmbientMode",
            "noPlayerShareButton", "noPlayerSaveButton", "noPlayerRemixButton", "noPlayerClipButton",
            "removeShareMenu", "removePlayNext", "removeWatchLaterMenu", "removeSaveToPlaylistMenu",
            "removeNotInterestedMenu", "removeDontRecommendMenu", "removeReportMenu",
            "shortsToRegular", "resumeShorts", "hideShorts", "shortsProgress",
            "hideShortsLogo", "hideShortsSearch", "hideShortsCamera", "hideShortsMore", "hideShortsSubscriptions",
            "hideShortsLike", "hideShortsDislike", "hideShortsComments", "hideShortsRemix", "hideShortsShare",
            "hideShortsAvatars", "hideShortsThanks", "hideShortsSource", "hideShortsChannelName",
            "hideShortsDescription", "hideShortsAudioTrack", "hideShortsPromoCards")));

    /** iOS YTAGLiteForcedFalseKeys. */
    public static final Set<String> FORCED_FALSE = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "noSearchButton", "shortsOnlyMode", "noPlayerDownloadButton", "removeDownloadMenu")));

    private LiteMode() {}

    public static boolean enabled() {
        return AfterglowPrefs.getBool(KEY);
    }

    /** iOS YTAGLiteModeForcedValueForKey: the forced value, or null when Lite Mode is off or leaves the key alone. */
    public static Boolean forcedValue(String key) {
        if (key == null || key.isEmpty() || !enabled()) return null;
        if (FORCED_FALSE.contains(key)) return Boolean.FALSE;
        if (FORCED_TRUE.contains(key)) return Boolean.TRUE;
        return null;
    }

    /** iOS YTAGEffectiveBool: the Lite Mode forced value when forced, else the stored/default bool. */
    public static boolean effectiveBool(String key) {
        Boolean forced = forcedValue(key);
        return forced != null ? forced : AfterglowPrefs.getBool(key);
    }
}
