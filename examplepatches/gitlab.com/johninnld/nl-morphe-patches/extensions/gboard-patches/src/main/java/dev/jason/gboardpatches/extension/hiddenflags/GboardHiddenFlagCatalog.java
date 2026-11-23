package dev.jason.gboardpatches.extension.hiddenflags;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Curated 18.8 flags that are worth exposing but are not part of the Beta features bundle.
 * Every name was verified in the beta dex to have a live consumer; the generic override path
 * documented in the research notes (adfk.o(name) + adfk.h(adiu.OVERRIDE)) is what toggles them,
 * so adding a name here is the only change needed for a new boolean gate.
 */
public final class GboardHiddenFlagCatalog {
    public static final class Entry {
        public final String flagName;
        /** Obfuscated class that declares the flag (documentation; the override stores by name). */
        public final String holderType;
        public final String title;
        public final String summary;

        Entry(String flagName, String holderType, String title, String summary) {
            this.flagName = flagName;
            this.holderType = holderType;
            this.title = title;
            this.summary = summary;
        }
    }

    private static final List<Entry> ENTRIES = Collections.unmodifiableList(Arrays.asList(
            new Entry(
                    "enable_dcontext_biasing", "akid",
                    "App-specific word biasing",
                    "Lets Gboard bias suggestions with words you use in the current app."),
            new Entry(
                    "enable_dcontext_suggestion_bar", "akid",
                    "App-specific suggestion bar",
                    "Shows the app-specific (dcontext) suggestions in the suggestion bar."),
            new Entry(
                    "square_normalized_search_radius", "qup",
                    "Square search radius",
                    "Uses a square distance metric for suggestion search.")));

    private GboardHiddenFlagCatalog() {
    }

    public static List<Entry> entries() {
        return ENTRIES;
    }

    public static Entry find(String flagName) {
        for (Entry entry : ENTRIES) {
            if (entry.flagName.equals(flagName)) {
                return entry;
            }
        }
        return null;
    }
}
