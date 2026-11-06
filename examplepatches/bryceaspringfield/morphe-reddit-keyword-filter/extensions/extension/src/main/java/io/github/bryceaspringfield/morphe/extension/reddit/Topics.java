package io.github.bryceaspringfield.morphe.extension.reddit;

import java.util.Locale;
import java.util.Set;

/**
 * Communities hidden by topic. A community is hidden when its name contains one of the topic's patterns and
 * none of its exceptions (communities opposing the topic, or names sharing the letters by chance). Names are
 * compared lowercase, without underscores. The user's own list ({@link FilterSettings#TOPIC_EXTRA}) adds names.
 */
final class Topics {

    // Version 1.1 kept Nazism and fascism apart; a stored "nazism" now chooses the joined list.
    static final String[] KEYS = {"zionism", "fascism", "incel"};
    static final String LEGACY_NAZISM = "nazism";
    static final String[] LABELS = {"Zionism", "Fascism, Nazism, and white supremacy", "Incels"};
    private static final String[][] PATTERNS = {
            {"zionis"},
            {"fascis", "nazi", "hitler", "1488", "14words", "fourteenwords", "aryan", "thirdreich", "fourthreich",
                    "whitenationalis", "whitesupremac", "whitepride", "whitegenocide", "greatreplacement", "racerealis"},
            {"incel", "braincel", "truecel", "blackpill", "foreveraloneinc"},
    };

    /** Names sharing a topic's letters by chance, or about the topic without promoting it: never hidden. */
    private static final String[] EXCEPTIONS = {"inceltear", "incelexit", "grammarnazi", "soupnazi", "feminazi",
            "nazihunt", "debunk", "watch", "exit", "recover", "former", "history", "askhistorian", "ashkenazi",
            "princel", "pincel"};

    /**
     * Words opposing the topic when they come right before its pattern (r/AntiZionism, r/JewsAgainstZionism,
     * r/PunchTheNazis); a "the" between the two is skipped.
     */
    private static final String[] OPPOSING_BEFORE = {"anti", "against", "fuck", "fck", "stop", "end", "punch", "kill",
            "smash", "no", "not", "non", "post", "ex", "beyond", "leaving", "leftover", "criticalof", "critiqueof",
            "survivorsof", "victimsof", "resist", "fight", "fighting", "defeat", "defeating", "bash"};

    /** Words opposing the topic when they come after its pattern (r/ZionismIsRacism, r/NazisSuck). */
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

    /**
     * The patterns of a topic, for the settings screen.
     */
    static String patterns(int index) {
        return String.join(", ", PATTERNS[index]);
    }

    static boolean chosen(Set<String> topics, String key) {
        return topics.contains(key) || (key.equals("fascism") && topics.contains(LEGACY_NAZISM));
    }

    /**
     * Whether the community belongs to a chosen topic or to the user's own list.
     */
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
                for (int at = name.indexOf(pattern); at >= 0; at = name.indexOf(pattern, at + 1)) {
                    if (!opposed(name, at, at + pattern.length())) return true;
                }
            }
        }
        return false;
    }

    /** Whether the pattern found at {@code start} to {@code end} of {@code name} has an opposing word beside it. */
    private static boolean opposed(String name, int start, int end) {
        String before = name.substring(0, start);
        if (before.endsWith("the")) before = before.substring(0, before.length() - 3);
        for (String word : OPPOSING_BEFORE) {
            if (before.endsWith(word)) return true;
        }
        // The pattern's word may go on past the pattern (zionis-m, zionis-ts, nazi-s) before the opposing word.
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
