package app.template.extension.hevalcontrols;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Exports the user's Patch settings choices as plain text and reads such text back (profiles,
 * backup and import). Pure Java: it only reads {@link HevalSettings} and writes through
 * {@link HevalSettings#applyChoices(Map, Map)}.
 *
 * <p>Format, version 1, one record per line:
 * <pre>
 * hevalcontrols-settings:1
 * f TAB featureId TAB 1|0          a runtime switch, as chosen
 * l TAB listId TAB key             one picked key of a list setting (one line per key)
 * </pre>
 * Keys cannot hold a tab or line break ({@link HevalSettings#isValidKey(String)}), so no escaping
 * is needed. Only choices are exported: the pause, safe mode, the theme and the options a picker has
 * seen are not part of a profile.
 *
 * <p>Importing is forgiving: a record for a feature this app does not have, of the wrong kind or
 * with a bad value is skipped and counted, never fatal; text without the header is rejected as a
 * whole. A list that appears in the registry but has no line in the text is imported as empty (the
 * text is a full snapshot).
 */
public final class SettingsTransfer {
    public static final String HEADER = "hevalcontrols-settings:";
    public static final int VERSION = 1;

    private SettingsTransfer() { }

    /** The user's current choices for every runtime switch and list of {@code registry}. Never null. */
    public static String export(Registry registry) {
        StringBuilder out = new StringBuilder(HEADER).append(VERSION).append('\n');
        for (Feature feature : registry.features()) {
            if (feature.buildTimeOnly) continue;
            if (feature.isList()) {
                for (String key : new TreeSet<>(HevalSettings.pickedHidden(feature.id))) {
                    out.append("l\t").append(feature.id).append('\t').append(key).append('\n');
                }
            } else {
                out.append("f\t").append(feature.id).append('\t').append(HevalSettings.isChosen(feature.id) ? '1' : '0').append('\n');
            }
        }
        return out.toString();
    }

    /** What reading a settings text found. */
    public static final class Parsed {
        /** False when the text is not a Patch settings export of a version this build can read. */
        public final boolean valid;
        public final Map<String, Boolean> switches;
        public final Map<String, Set<String>> lists;
        /** Records skipped: unknown feature, wrong kind, bad value or malformed line. */
        public final int skipped;

        Parsed(boolean valid, Map<String, Boolean> switches, Map<String, Set<String>> lists, int skipped) {
            this.valid = valid;
            this.switches = Collections.unmodifiableMap(switches);
            this.lists = Collections.unmodifiableMap(lists);
            this.skipped = skipped;
        }

        /** How many choices applying this changes or confirms. */
        public int count() {
            return switches.size() + lists.size();
        }
    }

    /** Reads {@code text} against {@code registry}. Never throws. */
    public static Parsed parse(String text, Registry registry) {
        Map<String, Boolean> switches = new LinkedHashMap<>();
        Map<String, Set<String>> lists = new LinkedHashMap<>();
        try {
            if (text == null) return new Parsed(false, switches, lists, 0);
            String[] lines = text.split("\n", -1);
            String header = lines.length == 0 ? "" : stripCr(lines[0]).trim();
            if (!header.equals(HEADER + VERSION)) return new Parsed(false, switches, lists, 0);
            // Every list of this app starts empty: the text is a snapshot.
            for (Feature feature : registry.features()) {
                if (feature.isList() && !feature.buildTimeOnly) lists.put(feature.id, new TreeSet<String>());
            }
            int skipped = 0;
            for (int i = 1; i < lines.length; i++) {
                String line = stripCr(lines[i]);
                if (line.isEmpty()) continue;
                String[] fields = line.split("\t", -1);
                if (fields.length != 3) {
                    skipped++;
                    continue;
                }
                Feature feature = registry.feature(fields[1]);
                if (feature == null || feature.buildTimeOnly) {
                    skipped++;
                } else if ("f".equals(fields[0]) && !feature.isList() && ("1".equals(fields[2]) || "0".equals(fields[2]))) {
                    switches.put(feature.id, "1".equals(fields[2]));
                } else if ("l".equals(fields[0]) && feature.isList() && HevalSettings.isValidKey(fields[2])) {
                    Set<String> keys = lists.get(feature.id);
                    if (keys != null) keys.add(fields[2]);
                } else {
                    skipped++;
                }
            }
            return new Parsed(true, switches, lists, skipped);
        } catch (RuntimeException unexpected) {
            return new Parsed(false, new LinkedHashMap<String, Boolean>(), new LinkedHashMap<String, Set<String>>(), 0);
        }
    }

    /** Applies {@code parsed} in one write. False for an invalid text or a failed write. */
    public static boolean apply(Parsed parsed) {
        if (parsed == null || !parsed.valid) return false;
        return HevalSettings.applyChoices(parsed.switches, parsed.lists);
    }

    /** The feature ids a text names that this app lists, for tests and messages. */
    static List<String> featureIds(Parsed parsed) {
        List<String> ids = new ArrayList<>(parsed.switches.keySet());
        ids.addAll(parsed.lists.keySet());
        return ids;
    }

    private static String stripCr(String line) {
        return line.endsWith("\r") ? line.substring(0, line.length() - 1) : line;
    }
}
