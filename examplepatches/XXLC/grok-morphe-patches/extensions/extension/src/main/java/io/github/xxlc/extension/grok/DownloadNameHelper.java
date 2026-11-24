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
        if (!DownloadFolderHelper.isMedia(mime, guessed)) {
            return guessed;
        }
        String extension = extensionOf(guessed);
        String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS", Locale.US)
                .format(new Date());
        return "Grok_" + appendSequence(timestamp) + extension;
    }

    /**
     * Extension including the dot. A trailing "?query" or "#fragment" is dropped only when the
     * name before it ends in a recognised media extension ("clip.mp4?token=x" gives ".mp4"); a
     * literal "?" or "#" inside the name ("a?b.mp4") is kept as part of the name.
     */
    private static String extensionOf(String name) {
        int cut = name.length();
        int query = name.indexOf('?');
        int fragment = name.indexOf('#');
        if (query >= 0) {
            cut = Math.min(cut, query);
        }
        if (fragment >= 0) {
            cut = Math.min(cut, fragment);
        }
        String trimmed = name.substring(0, cut);
        String source = DownloadFolderHelper.isMedia(null, trimmed) ? trimmed : name;
        int dot = source.lastIndexOf('.');
        String extension = dot >= 0 ? source.substring(dot) : "";
        return extension.indexOf('?') >= 0 || extension.indexOf('#') >= 0 || extension.indexOf('/') >= 0
                ? ""
                : extension;
    }
}
