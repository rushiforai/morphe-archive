package io.github.xxlc.extension.grok;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;

/** Media names with milliseconds and a sequence number shared by all save paths in the process. */
public final class DownloadNameHelper {
    private static final AtomicLong SEQUENCE = new AtomicLong();

    private DownloadNameHelper() {
    }

    public static String appendSequence(String timestamp) {
        return timestamp + "_" + SEQUENCE.incrementAndGet();
    }

    public static String renameMedia(String guessed, String mime) {
        if (guessed == null) {
            return null;
        }
        // Drop any query or fragment so a name like "clip.mp4?token=x" keeps a clean ".mp4".
        int cut = guessed.length();
        int query = guessed.indexOf('?');
        int fragment = guessed.indexOf('#');
        if (query >= 0) {
            cut = Math.min(cut, query);
        }
        if (fragment >= 0) {
            cut = Math.min(cut, fragment);
        }
        String name = guessed.substring(0, cut);
        if (!DownloadFolderHelper.isMedia(mime, name)) {
            return guessed;
        }
        int dot = name.lastIndexOf('.');
        String extension = dot >= 0 ? name.substring(dot) : "";
        String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS", Locale.US)
                .format(new Date());
        return "Grok_" + appendSequence(timestamp) + extension;
    }
}
