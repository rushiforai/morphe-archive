/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/download/DownloadsPatch.java
 */

package app.morphe.extension.tiktok.download;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Video;

@SuppressWarnings("unused")
public class DownloadsPatch {
    private static volatile String lastLoggedPath;
    private static volatile Boolean lastLoggedRemoveWatermark;

    public static String getDownloadPath() {
        String path = Settings.DOWNLOAD_PATH.get();
        if (BaseSettings.DEBUG.get() && (lastLoggedPath == null || !lastLoggedPath.equals(path))) {
            lastLoggedPath = path;
            Logger.printInfo(() -> "[ReVanced Downloads] download_path=\"" + path + "\"");
        }
        return path;
    }

    public static boolean shouldRemoveWatermark() {
        boolean removeWatermark = Settings.DOWNLOAD_WATERMARK.get();
        if (BaseSettings.DEBUG.get() && (lastLoggedRemoveWatermark == null || lastLoggedRemoveWatermark != removeWatermark)) {
            lastLoggedRemoveWatermark = removeWatermark;
            Logger.printInfo(() -> "[ReVanced Downloads] remove_watermark=" + removeWatermark);
        }
        return removeWatermark;
    }

    public static void patchVideoObject(Video video) {
        if (video == null) return;

        try {
            boolean isMissingCleanUrl = false;

            // TikTok may remove the non-watermark URL for some videos.
            if (video.downloadNoWatermarkAddr == null) {
                isMissingCleanUrl = true;
            } else if (video.downloadNoWatermarkAddr.getUrlList() == null || video.downloadNoWatermarkAddr.getUrlList().isEmpty()) {
                isMissingCleanUrl = true;
            }

            if (isMissingCleanUrl) {
                if (video.h264PlayAddr != null && video.h264PlayAddr.getUrlList() != null && !video.h264PlayAddr.getUrlList().isEmpty()) {
                    video.downloadNoWatermarkAddr = video.h264PlayAddr;
                } else if (video.playAddr != null) {
                    video.downloadNoWatermarkAddr = video.playAddr;
                }
            }
        } catch (Throwable ignored) {
        }
    }
}

