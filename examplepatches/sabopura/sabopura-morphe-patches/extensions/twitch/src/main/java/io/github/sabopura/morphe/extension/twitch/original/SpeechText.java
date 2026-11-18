package io.github.sabopura.morphe.extension.twitch.original;

import java.util.function.Predicate;
import java.util.regex.Pattern;

/** Turns a chat message into what the voice says. Pure Java for tests. */
final class SpeechText {
    private static final Pattern URL = Pattern.compile("(?i)(?:https?://|www\\.)\\S+");
    private static final Pattern SPACES = Pattern.compile("\\s+");
    /** One character many times over, as in "nooooooo" or "!!!!!!!!": three say as much. A run of digits is a number. */
    private static final Pattern RUN = Pattern.compile("([^\\p{Nd}\\s])\\1{3,}");
    /**
     * Japanese chat laughs with "w" and claps with "888", and a Japanese voice would spell each one out.
     * A capital alone is a word ("W杯"), and three eights next to a word may be a number ("888円").
     */
    private static final Pattern LAUGH = Pattern.compile("(?<![A-Za-z0-9])(?:[wｗ]+|[WＷ]{2,})(?![A-Za-z0-9])");
    private static final Pattern CLAP = Pattern.compile(
            "(?<!\\p{Nd})[8８]{4,}(?!\\p{Nd})|(?<![\\p{L}\\p{Nd}])[8８]{3}(?![\\p{L}\\p{Nd}])");

    private SpeechText() {
    }

    /** The message without the words chat shows as pictures: nobody said an emote's name. */
    static String without(String text, Predicate<String> emote) {
        StringBuilder kept = new StringBuilder(text.length());
        for (String word : SPACES.split(text)) {
            if (word.isEmpty() || emote.test(word)) continue;
            if (kept.length() > 0) kept.append(' ');
            kept.append(word);
        }
        return kept.toString();
    }

    /**
     * What to say, or null when nothing readable is left. Links are not read out character by character.
     *
     * @param japanese whether a Japanese voice reads it
     */
    static String of(String author, String text, boolean names, boolean japanese, int maxChars) {
        String body = URL.matcher(text).replaceAll(japanese ? "リンク" : "link");
        if (japanese) body = CLAP.matcher(LAUGH.matcher(body).replaceAll("わら")).replaceAll("ぱちぱち");
        body = RUN.matcher(body).replaceAll("$1$1$1").trim();
        if (body.isEmpty()) return null;
        if (body.length() > maxChars) body = body.substring(0, maxChars);
        return names && author != null && !author.isEmpty() ? author + (japanese ? "、" : ", ") + body : body;
    }
}
