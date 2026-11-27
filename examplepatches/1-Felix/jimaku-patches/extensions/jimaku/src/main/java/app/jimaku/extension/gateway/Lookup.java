package app.jimaku.extension.gateway;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** What the shared cache holds for a video: its transcript's language and the translations made from it. */
public final class Lookup {
    public final String original;
    public final List<String> translations;
    /** The transcript's speakers use two languages: its own language is there once it is among the translations. */
    public final boolean mixed;

    public Lookup(String original, List<String> translations, boolean mixed) {
        this.original = original;
        this.translations = Collections.unmodifiableList(new ArrayList<>(translations));
        this.mixed = mixed;
    }

    /**
     * The languages the cache has subtitles in: the video's own language, unless the transcript is
     * mixed, then the translations. As the extension's {@code lib/menu-model.ts} lists them.
     */
    public List<String> cachedLanguages() {
        List<String> cached = new ArrayList<>();
        if (!mixed) cached.add(original);
        for (String lang : translations) {
            if (!cached.contains(lang)) cached.add(lang);
        }
        return Collections.unmodifiableList(cached);
    }
}
