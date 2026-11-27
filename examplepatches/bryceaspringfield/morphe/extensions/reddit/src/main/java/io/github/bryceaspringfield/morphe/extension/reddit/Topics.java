package io.github.bryceaspringfield.morphe.extension.reddit;

import java.util.Locale;
import java.util.Set;

final class Topics {

    static final String[] KEYS = {"zionism", "fascism", "incel", "jerk"};
    static final String LEGACY_NAZISM = "nazism";
    static final String[] LABELS = {"Zionism", "Fascism, Nazism, and white supremacy", "Incels",
            "Circlejerk (-jerk) subreddits"};
    private static final String[][] PATTERNS = {
            {"zionis"},
            {"fascis", "nazi", "hitler", "1488", "14words", "fourteenwords", "aryan", "thirdreich", "fourthreich",
                    "whitenationalis", "whitesupremac", "whitepride", "whitegenocide", "greatreplacement", "racerealis"},
            {"incel", "braincel", "truecel", "blackpill", "foreveraloneinc"},
            {"circlejerk", "jerk$"},
    };

    private static final String[] EXCEPTIONS = {"inceltear", "incelexit", "grammarnazi", "soupnazi", "feminazi",
            "nazihunt", "debunk", "watch", "exit", "recover", "former", "history", "askhistorian", "ashkenazi",
            "princel", "pincel"};

    private static final String[] OPPOSING_BEFORE = {"anti", "against", "fuck", "fck", "stop", "end", "punch", "kill",
            "smash", "no", "not", "non", "post", "ex", "beyond", "leaving", "leftover", "criticalof", "critiqueof",
            "survivorsof", "victimsof", "resist", "fight", "fighting", "defeat", "defeating", "bash"};

    private static final String[] OPPOSING_AFTER = {"sucks", "suck", "isracism", "isterror", "isevil", "isfascism",
            "isnazism", "criticism", "critique", "debunked", "victims", "survivors", "busters", "hunters", "punchers",
            "fuckoff", "punksfuckoff", "out", "watch"};

    private Topics() {
    }

    static String label(String key) {
        for (int i = 0; i < KEYS.length; i++) {
            if (KEYS[i].equals(key)) return LABELS[i];
        }
        return key;
    }

    static String patterns(int index) {
        StringBuilder out = new StringBuilder();
        for (String pattern : PATTERNS[index]) {
            if (out.length() > 0) out.append(", ");
            out.append(pattern.endsWith("$") ? "-" + pattern.substring(0, pattern.length() - 1) : pattern);
        }
        return out.toString();
    }

    static boolean chosen(Set<String> topics, String key) {
        return topics.contains(key) || (key.equals("fascism") && topics.contains(LEGACY_NAZISM));
    }

    static boolean hides(String community, Set<String> topics, Set<String> extra) {
        if (community == null || community.isEmpty()) return false;
        String name = community.toLowerCase(Locale.ROOT).replace("_", "");
        if (extra.contains(name)) return true;
        if (topics.isEmpty()) return false;

        for (String exception : EXCEPTIONS) {
            if (name.contains(exception)) return false;
        }
        for (int i = 0; i < KEYS.length; i++) {
            if (!chosen(topics, KEYS[i])) continue;
            for (String pattern : PATTERNS[i]) {
                if (pattern.endsWith("$")) {
                    String end = pattern.substring(0, pattern.length() - 1);
                    if (name.endsWith(end) && !opposed(name, name.length() - end.length(), name.length())) return true;
                    continue;
                }
                for (int at = name.indexOf(pattern); at >= 0; at = name.indexOf(pattern, at + 1)) {
                    if (!opposed(name, at, at + pattern.length())) return true;
                }
            }
        }
        return false;
    }

    private static boolean opposed(String name, int start, int end) {
        String before = name.substring(0, start);
        if (before.endsWith("the")) before = before.substring(0, before.length() - 3);
        for (String word : OPPOSING_BEFORE) {
            if (before.endsWith(word)) return true;
        }
        for (int extra = 0; extra <= 3 && end + extra <= name.length(); extra++) {
            if (extra > 0 && "msta".indexOf(name.charAt(end + extra - 1)) < 0) break;
            String after = name.substring(end + extra);
            for (String word : OPPOSING_AFTER) {
                if (after.startsWith(word)) return true;
            }
        }
        return false;
    }
}
