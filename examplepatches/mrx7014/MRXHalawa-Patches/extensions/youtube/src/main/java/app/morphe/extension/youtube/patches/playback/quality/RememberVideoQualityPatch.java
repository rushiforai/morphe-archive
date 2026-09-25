/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.patches.playback.quality;

import static app.morphe.extension.shared.StringRef.str;

import androidx.annotation.NonNull;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.patches.VideoInformation.*;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.ShortsPlayerState;
import j$.util.Optional;

@SuppressWarnings({"rawtypes", "unused"})
public class RememberVideoQualityPatch {

    private static final IntegerSetting videoQualityWifi = Settings.VIDEO_QUALITY_DEFAULT_WIFI;
    private static final IntegerSetting videoQualityMobile = Settings.VIDEO_QUALITY_DEFAULT_MOBILE;
    private static final IntegerSetting shortsQualityWifi = Settings.SHORTS_QUALITY_DEFAULT_WIFI;
    private static final IntegerSetting shortsQualityMobile = Settings.SHORTS_QUALITY_DEFAULT_MOBILE;

    private static int channelDefaultQuality() {
        String channelId = VideoInformation.getChannelId();
        if (channelId == null || channelId.isEmpty()) return VideoInformation.AUTOMATIC_VIDEO_QUALITY_VALUE;
        for (String entry : Settings.VIDEO_QUALITY_CHANNEL_DEFAULTS.get().split("\\R")) {
            String[] parts = entry.trim().split("=", 2);
            if (parts.length != 2 || !channelId.equals(parts[0].trim())) continue;
            try {
                int quality = Integer.parseInt(parts[1].trim());
                return quality > 0 ? quality : VideoInformation.AUTOMATIC_VIDEO_QUALITY_VALUE;
            } catch (NumberFormatException ignored) {
                return VideoInformation.AUTOMATIC_VIDEO_QUALITY_VALUE;
            }
        }
        return VideoInformation.AUTOMATIC_VIDEO_QUALITY_VALUE;
    }

    public static boolean shouldRememberVideoQuality() {
        BooleanSetting preference = ShortsPlayerState.isOpen()
                ? Settings.REMEMBER_SHORTS_QUALITY_LAST_SELECTED
                : Settings.REMEMBER_VIDEO_QUALITY_LAST_SELECTED;
        return preference.get();
    }

    public static int getDefaultQualityResolution() {
        final boolean isShorts = ShortsPlayerState.isOpen();
        IntegerSetting preference = Utils.getNetworkType() == Utils.NetworkType.MOBILE
                ? (isShorts ? shortsQualityMobile : videoQualityMobile)
                : (isShorts ? shortsQualityWifi : videoQualityWifi);
        int channelQuality = channelDefaultQuality();
        return channelQuality != VideoInformation.AUTOMATIC_VIDEO_QUALITY_VALUE
                ? channelQuality : preference.get();
    }

    public static void saveDefaultQuality(int qualityResolution) {
        final boolean shortPlayerOpen = ShortsPlayerState.isOpen();
        final boolean isMobile = Utils.getNetworkType() == Utils.NetworkType.MOBILE;
        IntegerSetting qualitySetting;
        if (isMobile) {
            qualitySetting = shortPlayerOpen ? shortsQualityMobile : videoQualityMobile;
        } else {
            qualitySetting = shortPlayerOpen ? shortsQualityWifi : videoQualityWifi;
        }

        if (qualitySetting.get() == qualityResolution) {
            // User clicked the same video quality as the current video,
            // or changed between 1080p Premium and non-Premium.
            return;
        }
        qualitySetting.save(qualityResolution);

        if (Settings.REMEMBER_VIDEO_QUALITY_LAST_SELECTED_TOAST.get()) {
            String qualityLabel = qualityResolution + "p";
            final String toastStringId = getString(shortPlayerOpen, isMobile);
            Utils.showToastShort(str(toastStringId, qualityLabel));
        }
    }

    @NonNull
    private static String getString(boolean shortPlayerOpen, boolean isMobile) {
        final String toastStringId;
        if (shortPlayerOpen && isMobile) {
            toastStringId = "morphe_remember_video_quality_toast_shorts_mobile";
        } else if (shortPlayerOpen) {
            toastStringId = "morphe_remember_video_quality_toast_shorts_wifi";
        } else if (isMobile) {
            toastStringId = "morphe_remember_video_quality_toast_mobile";
        } else {
            toastStringId = "morphe_remember_video_quality_toast_wifi";
        }
        return toastStringId;
    }

    /**
     * Injection point.
     * <p>
     * Overrides the initial video quality to not follow the 'Video quality preferences' in YouTube settings.
     * (e.g. 'Auto (recommended)' - 360p/480p, 'Higher picture quality' - 720p/1080p...)
     * If the maximum video quality available is 1080p and the default video quality is 2160p,
     * 1080p is used as an initial video quality.
     * <p>
     * Called before {@link #newVideoStarted(VideoInformation.PlaybackController)}.
     */
    public static Optional getInitialVideoQuality(Optional optional) {
        int preferredQuality = getDefaultQualityResolution();
        if (preferredQuality != VideoInformation.AUTOMATIC_VIDEO_QUALITY_VALUE) {
            Logger.printDebug(() -> "initialVideoQuality: " + preferredQuality);
            return Optional.of(preferredQuality);
        }
        return optional;
    }

    /**
     * Injection point.
     * @param userSelectedQualityIndex Element index of {@link VideoInformation#getCurrentQualities()}.
     */
    public static void userChangedShortsQuality(int userSelectedQualityIndex) {
        try {
            if (shouldRememberVideoQuality()) {
                VideoQualityInterface[] currentQualities = VideoInformation.getCurrentQualities();
                if (currentQualities == null) {
                    Logger.printDebug(() -> "Cannot save default quality, qualities is null");
                    return;
                }
                VideoQualityInterface quality = currentQualities[userSelectedQualityIndex];
                saveDefaultQuality(quality.patch_getResolution());
            }
        } catch (Exception ex) {
            Logger.printException(() -> "userChangedShortsQuality failure", ex);
        }
    }

    /**
     * Injection point.  Regular videos.
     * @param videoResolution Human-readable resolution: 480, 720, 1080.
     */
    public static void userChangedQuality(int videoResolution) {
        Utils.verifyOnMainThread();
        Logger.printDebug(() -> "User changed quality to: " + videoResolution);

        if (shouldRememberVideoQuality()) {
            saveDefaultQuality(videoResolution);
        }
    }

    /**
     * Injection point.
     */
    public static void newVideoStarted(VideoInformation.PlaybackController ignoredPlayerController) {
        VideoInformation.setDesiredVideoResolution(getDefaultQualityResolution());
    }
}
