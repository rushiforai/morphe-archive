package app.jimaku.extension.menu;

import java.util.Locale;

/**
 * A version of subtitles: the captions uploaded with the video, Premium from the shared cache, or
 * Standard kept on this device. In the order the main list puts a language's versions. The
 * Premium switch's mode is only ever {@link #PREMIUM} or {@link #STANDARD}.
 */
public enum Version {
    UPLOADED, PREMIUM, STANDARD;

    /** The name the extension gives it: "premium". */
    public String id() {
        return name().toLowerCase(Locale.ROOT);
    }

    /** The version the extension calls {@code id}. */
    public static Version of(String id) {
        return valueOf(id.toUpperCase(Locale.ROOT));
    }
}
