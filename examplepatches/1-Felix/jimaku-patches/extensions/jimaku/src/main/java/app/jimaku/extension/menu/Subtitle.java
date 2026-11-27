package app.jimaku.extension.menu;

import java.util.Objects;

/** One version of subtitles in one language: one Jimaku makes, or the captions uploaded with the video. */
public final class Subtitle {
    public final String lang;
    public final Version version;

    public Subtitle(String lang, Version version) {
        this.lang = Objects.requireNonNull(lang);
        this.version = Objects.requireNonNull(version);
    }

    /** Whether {@code a} and {@code b} are the same version of the same language; never with null. */
    public static boolean same(Subtitle a, Subtitle b) {
        return a != null && a.equals(b);
    }

    @Override
    public boolean equals(Object other) {
        return other instanceof Subtitle subtitle && lang.equals(subtitle.lang) && version == subtitle.version;
    }

    @Override
    public int hashCode() {
        return lang.hashCode() * 31 + version.hashCode();
    }

    @Override
    public String toString() {
        return lang + " " + version.id();
    }
}
