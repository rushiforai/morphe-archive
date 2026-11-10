package io.github.bryceaspringfield.morphe.extension.youtube;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Videos and channels hidden by topic, as the Reddit bundle hides communities. A video is hidden when its title,
 * text, or channel name contains one of the topic's patterns, unless an opposing word sits right before or after it
 * (anti-, against, debunk, ...) or the match is one of the exceptions. The user's own channels to hide
 * ({@link XSettings#HIDDEN_CHANNELS}) are hidden whatever the topic.
 */
final class Topics {

    static final String[] KEYS = {"zionism", "fascism", "incel", "conspiracy"};
    static final String[] LABELS_EN = {"Zionism", "Fascism, Nazism, and white supremacy", "Incels and the blackpill",
            "Conspiracy theories"};
    static final String[] LABELS_ES = {"Sionismo", "Fascismo, nazismo y supremacía blanca", "Incels y la blackpill",
            "Teorías de la conspiración"};

    /**
     * Patterns, each the start of a word or phrase in the lowercase text (a pattern may end inside a word, e.g.,
     * "zionis" matches zionist and zionism); a space in a pattern also matches a hyphen, an underscore, or nothing.
     */
    private static final String[][] PATTERNS = {
            {"zionis", "sionis", "stand with israel", "israel first", "greater israel"},
            {"fascis", "fascist", "nazi", "neo nazi", "hitler was right", "1488", "14 words", "fourteen words",
                    "aryan", "third reich", "fourth reich", "white nationalis", "white supremac", "white pride",
                    "white genocide", "great replacement", "gran remplazo", "grand remplacement", "race realis",
                    "remigration", "its okay to be white", "it's okay to be white", "sieg heil"},
            {"incel", "blackpill", "black pill", "braincel", "truecel", "looksmax", "mgtow", "femoid",
                    "hypergamy"},
            {"flat earth", "tierra plana", "chemtrail", "qanon", "new world order", "nuevo orden mundial",
                    "illuminati", "reptilian", "plandemic", "plandemia", "great reset", "gran reinicio",
                    "pizzagate", "false flag", "crisis actor", "moon landing hoax", "fake moon landing",
                    "adrenochrome", "sovereign citizen", "5g covid", "5g coronavirus", "vaccines cause autism",
                    "hollow earth", "tartaria", "mud flood", "deep state", "globalist"},
    };

    private static final java.util.regex.Pattern[][] COMPILED = new java.util.regex.Pattern[PATTERNS.length][];

    static {
        for (int t = 0; t < PATTERNS.length; t++) {
            COMPILED[t] = new java.util.regex.Pattern[PATTERNS[t].length];
            for (int i = 0; i < PATTERNS[t].length; i++) {
                StringBuilder rx = new StringBuilder("(?<![\\p{L}\\p{N}])");
                String[] words = PATTERNS[t][i].split(" ");
                for (int w = 0; w < words.length; w++) {
                    if (w > 0) rx.append("[\\s\\-_.]*");
                    rx.append(java.util.regex.Pattern.quote(words[w]));
                }
                COMPILED[t][i] = java.util.regex.Pattern.compile(rx.toString());
            }
        }
    }

    /** Matches never hidden: words sharing a pattern's letters by chance, or about the topic without promoting it. */
    private static final String[] EXCEPTIONS = {"grammar nazi", "grammarnazi", "soup nazi", "feminazi", "nazi hunt",
            "debunk", "desmont", "documentary", "documental", "explained", "explicad", "history of", "historia de"};

    private static final String[] OPPOSING_BEFORE = {"anti", "against", "contra", "stop", "end", "no", "not",
            "post", "ex", "beyond", "leaving", "fight", "fighting", "defeat", "debunk", "debunking", "why", "how",
            "porque", "como", "against"};
    private static final String[] OPPOSING_AFTER = {"debunked", "explained", "is racism", "is fascism", "is evil",
            "sucks", "exposed", "documentary", "history", "desmentido", "explicado", "is a lie", "is fake",
            "myth", "hoax debunked", "conspiracy debunked"};

    private static volatile String parsedSetting;
    private static volatile List<Integer> active = Collections.emptyList();
    private static volatile String parsedChannels;
    private static volatile List<ChannelRules.Channel> channels = Collections.emptyList();

    private Topics() {
    }

    static String label(int i) {
        return Strings.spanish() ? LABELS_ES[i] : LABELS_EN[i];
    }

    static List<Integer> active() {
        String s = XSettings.TOPICS.get();
        //noinspection StringEquality
        if (s != parsedSetting) {
            List<Integer> out = new ArrayList<>();
            for (int i = 0; i < KEYS.length; i++) if (("," + s + ",").contains("," + KEYS[i] + ",")) out.add(i);
            active = out;
            parsedSetting = s;
        }
        return active;
    }

    static List<ChannelRules.Channel> hiddenChannels() {
        String s = XSettings.HIDDEN_CHANNELS.get();
        //noinspection StringEquality
        if (s != parsedChannels) {
            List<ChannelRules.Channel> out = new ArrayList<>();
            for (String line : s.split("[\n,]")) if (!line.trim().isEmpty()) out.add(new ChannelRules.Channel(line));
            channels = out;
            parsedChannels = s;
        }
        return channels;
    }

    /** The label of the topic or list hiding the item, or null. */
    
    static String match(VideoItem item) {
        for (ChannelRules.Channel c : hiddenChannels()) if (item.isChannel(c)) return "hidden channel " + c.label();
        List<Integer> topics = active();
        if (topics.isEmpty()) return null;
        String text = item.text + "\n" + (item.channelName == null ? "" : item.channelName.toLowerCase(Locale.ROOT));
        for (int t : topics) {
            for (int i = 0; i < COMPILED[t].length; i++) {
                java.util.regex.Matcher m = COMPILED[t][i].matcher(text);
                while (m.find()) {
                    if (!opposed(text, m.start(), m.end() - m.start())) return KEYS[t] + ":" + PATTERNS[t][i];
                }
            }
        }
        return null;
    }

    private static boolean opposed(String s, int at, int len) {
        int lo = Math.max(0, at - 14), hi = Math.min(s.length(), at + len + 16);
        String around = s.substring(lo, hi);
        for (String e : EXCEPTIONS) if (around.contains(e)) return true;
        String before = s.substring(lo, at).replaceAll("[\\s\\-_]+", " ").trim();
        if (before.endsWith(" the")) before = before.substring(0, before.length() - 4);
        for (String w : OPPOSING_BEFORE) if (before.equals(w) || before.endsWith(" " + w)) return true;
        String after = s.substring(Math.min(s.length(), at + len), hi).replaceAll("[\\s\\-_]+", " ").trim();
        for (String w : OPPOSING_AFTER) if (after.startsWith(w)) return true;
        return false;
    }
}
