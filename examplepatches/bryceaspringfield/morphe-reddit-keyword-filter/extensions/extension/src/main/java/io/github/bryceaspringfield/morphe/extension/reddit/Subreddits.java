package io.github.bryceaspringfield.morphe.extension.reddit;

import android.annotation.SuppressLint;
import android.content.Context;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Renames communities to subreddits in the filter's own text when the Say subreddits patch renamed Reddit's, with the
 * Spanish words agreeing with comunidad turned masculine (la comunidad, el subreddit). The patch applies the same
 * rules to Reddit's strings.
 */
final class Subreddits {

    private static final Pattern ENGLISH = Pattern.compile("\\b([Cc]ommunit|COMMUNIT)(y|ies|Y|IES)\\b");
    private static final Pattern SPANISH = Pattern.compile("([Cc]omunidad|COMUNIDAD)(es|ES)?");
    private static final Pattern WORDS = Pattern.compile("\\p{L}+|[^\\p{L}]+");
    private static final Map<String, String> BEFORE = new HashMap<>();
    private static final Map<String, String> AFTER = new HashMap<>();
    private static final java.util.Set<String> LINKS = new java.util.HashSet<>(java.util.Arrays.asList("está", "están",
            "es", "son", "fue", "fueron", "será", "estará", "ha", "han", "sido", "sea", "queda", "quedó", "parece", "no", "ya"));
    private static volatile Boolean on;

    static {
        String[] pairs = {"la", "el", "las", "los", "una", "un", "unas", "unos", "esta", "este", "estas", "estos",
                "esa", "ese", "esas", "esos", "otra", "otro", "otras", "otros", "ninguna", "ningún", "alguna", "algún",
                "algunas", "algunos", "varias", "varios", "nuestra", "nuestro", "nuestras", "nuestros", "nueva",
                "nuevo", "nuevas", "nuevos", "toda", "todo", "todas", "todos", "misma", "mismo", "mismas", "mismos",
                "propia", "propio", "propias", "propios", "primera", "primer", "última", "último"};
        for (int i = 0; i < pairs.length; i += 2) BEFORE.put(pairs[i], pairs[i + 1]);
        String[] after = {"privada", "privado", "pública", "público", "públicas", "públicos", "nueva", "nuevo", "nuevas",
                "nuevos", "propia", "propio", "activa", "activo", "activas", "activos", "favorita", "favorito",
                "favoritas", "favoritos", "apta", "apto", "aptas", "aptos", "misma", "mismo", "mismas", "mismos"};
        for (int i = 0; i < after.length; i += 2) AFTER.put(after[i], after[i + 1]);
    }

    private Subreddits() {
    }

    /** Whether the Say subreddits patch was applied, which leaves a flag among the app's resources. */
    @SuppressLint({"PrivateApi", "DiscouragedApi"})
    static boolean on() {
        Boolean value = on;
        if (value != null) return value;
        try {
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (context == null) return false;
            value = context.getResources().getIdentifier("morphe_say_subreddits", "raw", context.getPackageName()) != 0;
        } catch (Exception ex) {
            value = false;
        }
        on = value;
        return value;
    }

    static String rename(String text) {
        if (text == null || !on()) return text;
        Matcher english = ENGLISH.matcher(text);
        StringBuffer out = new StringBuffer();
        while (english.find()) {
            boolean plural = english.group(2).equalsIgnoreCase("ies");
            english.appendReplacement(out, sameCase(english.group(), plural ? "subreddits" : "subreddit"));
        }
        english.appendTail(out);
        return spanish(out.toString());
    }

    private static String spanish(String text) {
        if (!SPANISH.matcher(text).find()) return text;
        java.util.List<String> words = new java.util.ArrayList<>();
        Matcher m = WORDS.matcher(text);
        while (m.find()) words.add(m.group());
        for (int i = 0; i < words.size(); i++) {
            Matcher noun = SPANISH.matcher(words.get(i));
            if (!noun.matches()) continue;
            words.set(i, sameCase(words.get(i), noun.group(2) != null ? "subreddits" : "subreddit"));
            for (int j = i - 2; j >= 0 && words.get(j + 1).trim().isEmpty(); j -= 2) {
                String masculine = BEFORE.get(words.get(j).toLowerCase(Locale.ROOT));
                if (masculine == null) break;
                words.set(j, sameCase(words.get(j), masculine));
            }
            int article = i - 2;
            if (article >= 2 && words.get(article).equalsIgnoreCase("el") && words.get(article - 1).equals(" ")) {
                String preposition = words.get(article - 2).toLowerCase(Locale.ROOT);
                if (preposition.equals("de") || preposition.equals("a")) {
                    words.set(article - 2, sameCase(words.get(article - 2), preposition.equals("de") ? "del" : "al"));
                    words.set(article - 1, "");
                    words.set(article, "");
                }
            }
            // The participles and adjectives after it, across linking verbs (es privada, está restringida).
            for (int k = i + 2; k < words.size() && words.get(k - 1).equals(" "); k += 2) {
                String word = words.get(k).toLowerCase(Locale.ROOT);
                String masculine = AFTER.get(word);
                if (masculine == null && word.matches("\\p{L}{2,}[ai]das?") && !word.equals("nada") && !word.equals("cada")) {
                    masculine = word.endsWith("s") ? word.substring(0, word.length() - 2) + "os"
                            : word.substring(0, word.length() - 1) + "o";
                }
                if (masculine != null) words.set(k, sameCase(words.get(k), masculine));
                else if (!LINKS.contains(word)) break;
            }
        }
        return String.join("", words);
    }

    private static String sameCase(String model, String word) {
        if (model.length() > 1 && model.equals(model.toUpperCase(Locale.ROOT))) return word.toUpperCase(Locale.ROOT);
        if (!model.isEmpty() && Character.isUpperCase(model.charAt(0))) {
            return Character.toUpperCase(word.charAt(0)) + word.substring(1);
        }
        return word;
    }
}
