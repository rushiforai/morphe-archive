package e.e.a;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Locale;

/** Literal, case-insensitive title matching; no regular expressions. */
public final class ContentFilterRules {
    private ContentFilterRules() { }
    private static final java.util.LinkedHashMap<String, String> normalized = new java.util.LinkedHashMap<>(256, .75f, true);
    private static synchronized String normalized(String value) {
        String prior = normalized.get(value); if (prior != null) return prior;
        String result = Normalizer.normalize(value, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        normalized.put(value, result);
        if (normalized.size() > 256) normalized.remove(normalized.keySet().iterator().next());
        return result;
    }
    public static String[] keywords(String input) {
        ArrayList<String> result = new ArrayList<>();
        if (input != null) for (String part : input.split("[,，、\\r\\n]+")) {
            String word = normalized(part).trim();
            if (!word.isEmpty() && !result.contains(word)) result.add(word);
        }
        return result.toArray(new String[0]);
    }
    public static boolean blocked(String title, String[] words) {
        if (title == null || words.length == 0) return false;
        String text = normalized(title);
        for (String word : words) if (text.contains(word)) return true;
        return false;
    }
}
