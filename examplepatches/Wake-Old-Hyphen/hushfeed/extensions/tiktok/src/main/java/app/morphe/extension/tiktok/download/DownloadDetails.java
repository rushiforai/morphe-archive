/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.download;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/** Captured before queueing, so a later swipe cannot change the saved video's details. */
final class DownloadDetails {
    private final String text;

    DownloadDetails(Object aweme) {
        Object author = Reflect.property(aweme, "getAuthor", "author");
        String handle = value(Reflect.string(author, "getUniqueId", "uniqueId"), 256);
        String id = value(Reflect.string(aweme, "getAid", "aid"), 128);
        String link = handle.isEmpty() || id.isEmpty() ? ExternalDownloader.shareUrl(aweme)
                : "https://www.tiktok.com/@" + Uri.encode(handle) + "/video/" + Uri.encode(id);
        Object created = Reflect.property(aweme, "getCreateTime", "createTime");
        long time = created instanceof Number ? ((Number) created).longValue() : 0;
        // TikTok normally supplies Unix seconds; older imported models may supply milliseconds.
        if (time > 0 && time < 100_000_000_000L) time *= 1000;
        String date = "Unknown";
        if (time > 0 && time <= 253_402_300_799_000L) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ROOT);
            format.setTimeZone(TimeZone.getTimeZone("UTC"));
            date = format.format(new Date(time));
        }
        text = "Creator: " + (handle.isEmpty() ? "Unknown" : "@" + handle)
                + "\nLink: " + value(link, 4096)
                + "\nPublished: " + date
                + "\n\nCaption:\n" + value(Reflect.string(aweme, "getDesc", "desc"), 65536) + "\n";
    }

    String text() { return text; }

    /** Android's scoped store only accepts a plain-text sidecar in Download or Documents. */
    static String pairedPath(String path) {
        if (Build.VERSION.SDK_INT < 29 || path.equals("Download") || path.startsWith("Download/")
                || path.equals("Documents") || path.startsWith("Documents/")) return path;
        int slash = path.indexOf('/');
        return "Download" + (slash < 0 ? "/TikTok" : path.substring(slash));
    }

    void save(Context context, MediaFileWriter.Saved video, String path) throws IOException {
        File temporary = MediaCache.createTempFile(context, "video-details-", ".txt");
        try {
            try (FileOutputStream output = new FileOutputStream(temporary)) {
                output.write(text.getBytes(StandardCharsets.UTF_8));
            }
            int dot = video.name.lastIndexOf('.');
            String stem = dot > 0 ? video.name.substring(0, dot) : video.name;
            MediaFileWriter.publish(context, temporary, stem + ".txt", "text/plain", path, false);
        } finally {
            if (!MediaCache.delete(temporary)) Logger.printInfo(() -> "Could not remove the details temporary file");
        }
    }

    private static String value(String value, int limit) {
        if (value == null) return "";
        int end = Math.min(value.length(), limit);
        if (end > 0 && end < value.length() && Character.isHighSurrogate(value.charAt(end - 1))) end--;
        return value.substring(0, end).replace('\u0000', ' ');
    }
}
