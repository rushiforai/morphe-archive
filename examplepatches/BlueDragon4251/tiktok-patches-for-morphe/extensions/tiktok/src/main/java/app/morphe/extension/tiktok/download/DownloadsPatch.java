/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/download/DownloadsPatch.java
 */

package app.morphe.extension.tiktok.download;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.base.model.UrlModel;
import com.ss.android.ugc.aweme.feed.model.Video;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@SuppressWarnings("unused")
public class DownloadsPatch {
    private static final int MAX_SELECTION_LOGS = 24;
    private static final Object SELECTION_LOG_LOCK = new Object();
    private static final Set<String> loggedSelectionSignatures = new LinkedHashSet<>();

    private static volatile String lastLoggedPath;
    private static volatile Boolean lastLoggedRemoveWatermark;

    public static String getDownloadPath() {
        String path = Settings.DOWNLOAD_PATH.get();
        if (BaseSettings.DEBUG.get() && (lastLoggedPath == null || !lastLoggedPath.equals(path))) {
            lastLoggedPath = path;
            Logger.printInfo(() -> "[BlueIT Downloads] download_path=\"" + path + "\"");
        }
        return path;
    }

    public static boolean shouldRemoveWatermark() {
        boolean removeWatermark = Settings.DOWNLOAD_WATERMARK.get();
        if (BaseSettings.DEBUG.get() && (lastLoggedRemoveWatermark == null || lastLoggedRemoveWatermark != removeWatermark)) {
            lastLoggedRemoveWatermark = removeWatermark;
            Logger.printInfo(() -> "[BlueIT Downloads] remove_watermark=" + removeWatermark);
        }
        return removeWatermark;
    }

    public static void patchVideoObject(Video video) {
        if (video == null) return;

        try {
            UrlModel original = video.downloadNoWatermarkAddr;

            UrlModel qualitySelected = DownloadQualitySelector.select(video);
            if (qualitySelected != null) {
                video.downloadNoWatermarkAddr = qualitySelected;
                logSelection("quality:" + Settings.DOWNLOAD_VIDEO_QUALITY.get(), "runtimeVariant", original, qualitySelected);
                return;
            }

            String requestedSource = normalizeSource(Settings.DOWNLOAD_VIDEO_SOURCE.get());
            Candidate selected = selectRequestedSource(video, original, requestedSource);
            if (selected == null || selected.model == original) {
                return;
            }

            video.downloadNoWatermarkAddr = selected.model;
            logSelection(requestedSource, selected.name, original, selected.model);
        } catch (Throwable ex) {
            if (BaseSettings.DEBUG.get()) {
                Logger.printException(() -> "[BlueIT Downloads] patchVideoObject failure", ex);
            }
        }
    }

    private static void logSelection(String requested, String source, UrlModel original, UrlModel replacement) {
        if (!BaseSettings.DEBUG.get()) return;
        String originalSummary = describeUrlModel(original);
        String selectedSummary = describeUrlModel(replacement);
        String signature = requested + '|' + source + '|' + originalSummary + '|' + selectedSummary;
        if (!claimSelectionLog(signature)) return;

        Logger.printInfo(() -> "[BlueIT Downloads] selected video source"
                + " requested=" + requested
                + " original=" + originalSummary
                + " source=" + source
                + " replacement=" + selectedSummary);
    }

    private static boolean claimSelectionLog(String signature) {
        synchronized (SELECTION_LOG_LOCK) {
            if (loggedSelectionSignatures.contains(signature)) return false;
            if (loggedSelectionSignatures.size() >= MAX_SELECTION_LOGS) return false;
            loggedSelectionSignatures.add(signature);
            return true;
        }
    }

    private static Candidate selectRequestedSource(Video video, UrlModel original, String requestedSource) {
        Candidate originalCandidate = new Candidate("downloadNoWatermarkAddr", original);
        Candidate h264 = new Candidate("h264PlayAddr", video.h264PlayAddr);
        Candidate play = new Candidate("playAddr", video.playAddr);

        switch (requestedSource) {
            case "no_watermark":
                if (originalCandidate.usable) return originalCandidate;
                break;
            case "h264":
                if (h264.usable) return h264;
                break;
            case "play":
                if (play.usable) return play;
                break;
            case "auto":
            default:
                break;
        }

        if (originalCandidate.usable) return originalCandidate;
        if (h264.usable) return h264;
        if (play.usable) return play;
        return null;
    }

    private static String normalizeSource(String source) {
        if ("no_watermark".equals(source) || "h264".equals(source) || "play".equals(source)) {
            return source;
        }
        return "auto";
    }

    private static boolean hasUsableUrl(UrlModel model) {
        List<String> urls = getUrlListSafe(model);
        if (urls == null || urls.isEmpty()) return false;
        for (String url : urls) {
            if (url != null && !url.trim().isEmpty() && !"null".equalsIgnoreCase(url.trim())) return true;
        }
        return false;
    }

    private static String describeUrlModel(UrlModel model) {
        if (model == null) return "null";
        List<String> urls = getUrlListSafe(model);
        int urlCount = urls == null ? -1 : urls.size();
        return "{class=" + model.getClass().getName()
                + ",uri=" + getUriSafe(model)
                + ",urlKey=" + getUrlKeySafe(model)
                + ",size=" + getSizeSafe(model)
                + ",urlCount=" + urlCount
                + ",firstUrl=" + redactUrl(firstUrl(urls)) + "}";
    }

    private static List<String> getUrlListSafe(UrlModel model) {
        if (model == null) return null;
        try { return model.getUrlList(); } catch (Throwable ignored) { return null; }
    }

    private static String getUriSafe(UrlModel model) {
        try { return model.getUri(); } catch (Throwable ignored) { return null; }
    }

    private static String getUrlKeySafe(UrlModel model) {
        try { return model.getUrlKey(); } catch (Throwable ignored) { return null; }
    }

    private static long getSizeSafe(UrlModel model) {
        try { return model.getSize(); } catch (Throwable ignored) { return -1; }
    }

    private static String firstUrl(List<String> urls) {
        return urls == null || urls.isEmpty() ? null : urls.get(0);
    }

    private static String redactUrl(String url) {
        if (url == null) return null;
        int queryIndex = url.indexOf('?');
        String withoutQuery = queryIndex >= 0 ? url.substring(0, queryIndex) : url;
        return withoutQuery.length() <= 96 ? withoutQuery : withoutQuery.substring(0, 96) + "...";
    }

    private static final class Candidate {
        final String name;
        final UrlModel model;
        final boolean usable;

        Candidate(String name, UrlModel model) {
            this.name = name;
            this.model = model;
            this.usable = hasUsableUrl(model);
        }
    }
}
