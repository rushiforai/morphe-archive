package app.waze.systemtts.extension;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** Exact prompt-name matches only: arbitrary sound filenames are never spoken. */
public final class PromptTextCatalog {
    private final Map<String, String> phrases = new HashMap<>();
    private final Map<String, String> alertDefaults = new java.util.TreeMap<>();
    private final Map<String, String> alertNames = new HashMap<>();
    private final Map<String, String> alertTexts = new HashMap<>();

    public PromptTextCatalog(Reader source) throws IOException {
        BufferedReader reader = new BufferedReader(source);
        String line;
        while ((line = reader.readLine()) != null) {
            int split = line.indexOf('=');
            if (split < 1) continue;
            String key = line.substring(0, split).trim();
            String value = line.substring(split + 1).trim();
            // Templates require runtime substitution, not literal speech.
            if (value.isEmpty() || value.contains("%") || value.contains("<")) continue;
            phrases.put(normalize(key), value);
            if (key.startsWith("TTS_APPTEXT_")) phrases.put(normalize(key.substring(12)), value);
            if (key.startsWith("TTS_")) {
                String identity = value.toLowerCase(Locale.ROOT);
                String canonical = alertTexts.get(identity);
                if (canonical == null) {
                    canonical = key;
                    alertTexts.put(identity, canonical);
                    alertDefaults.put(canonical, value);
                }
                alertNames.put(normalize(key), canonical);
                if (key.startsWith("TTS_APPTEXT_")) alertNames.put(normalize(key.substring(12)), canonical);
            }
        }
        alias("TurnLeft", "NAV_TTS_TEXT_TURN_LEFT");
        alias("TurnRight", "NAV_TTS_TEXT_TURN_RIGHT");
        alias("KeepLeft", "NAV_TTS_TEXT_KEEP_LEFT");
        alias("KeepRight", "NAV_TTS_TEXT_KEEP_RIGHT");
        alias("Straight", "NAV_TTS_TEXT_CONTINUE");
        alias("uturn", "NAV_TTS_TEXT_U_TURN");
        alias("AndThen", "NAV_TTS_TEXT_AND_THEN");
        alias("Arrive", "NAV_TTS_TEXT_APPROACHING_DESTINATION");
        alias("Roundabout", "NAV_TTS_TEXT_ROUNDABOUT_ENTER");
        for (String side : new String[]{"Left", "Right"}) alias("Exit" + side, "NAV_TTS_TEXT_EXIT_" + side.toUpperCase(Locale.ROOT));
        for (String ordinal : new String[]{"First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh"})
            alias(ordinal, "NAV_TTS_TEXT_" + ordinal.toUpperCase(Locale.ROOT) + "_EXIT");
        for (String metres : new String[]{"200", "400", "500", "800"}) {
            alias(metres + "meters", "NAV_TTS_TEXT_IN_" + metres + "_METERS");
        }
        alias("1000meters", "NAV_TTS_TEXT_IN_1_KILOMETER");
        alias("1500meters", "NAV_TTS_TEXT_IN_1p5_KILOMETERS");
    }

    private void alias(String name, String key) {
        String value = phrases.get(normalize(key));
        if (value != null) phrases.put(normalize(name), value);
    }

    public String resolve(String file) {
        return phrases.get(fileName(file));
    }

    public Map<String, String> alerts() {
        return java.util.Collections.unmodifiableMap(alertDefaults);
    }

    public String alertKey(String file, String text) {
        String key = alertNames.get(fileName(file));
        if (key != null) return key;
        return text == null ? null : alertTexts.get(text.trim().toLowerCase(Locale.ROOT));
    }

    private static String fileName(String file) {
        if (file == null) return null;
        String name = file.replace('\\', '/');
        name = name.substring(name.lastIndexOf('/') + 1);
        int extension = name.lastIndexOf('.');
        if (extension >= 0) name = name.substring(0, extension);
        return normalize(name);
    }

    private static String normalize(String value) {
        return value.replace("_", "").replace("-", "").toLowerCase(Locale.ROOT);
    }
}
