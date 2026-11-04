package app.wordfeudwordfinder.extension.game;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

public final class Ruleset {
    private final int id;
    private final String languageCode;
    private final Map<String, Integer> tilePoints;
    private final Map<String, Integer> tileCounts;

    public Ruleset(int id, String languageCode, Map<String, Integer> tilePoints,
                   Map<String, Integer> tileCounts) {
        this.id = id;
        this.languageCode = languageCode;
        this.tilePoints = Collections.unmodifiableMap(new LinkedHashMap<>(tilePoints));
        this.tileCounts = Collections.unmodifiableMap(new LinkedHashMap<>(tileCounts));
    }

    public int getId() { return id; }
    public String getLanguageCode() { return languageCode; }
    public Map<String, Integer> getTilePoints() { return tilePoints; }
    public Map<String, Integer> getTileCounts() { return tileCounts; }
}
