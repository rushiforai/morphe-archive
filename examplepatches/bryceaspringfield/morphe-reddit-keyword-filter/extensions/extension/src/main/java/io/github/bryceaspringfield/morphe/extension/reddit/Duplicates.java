package io.github.bryceaspringfield.morphe.extension.reddit;

import java.text.Normalizer;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Posts already shown since Reddit started, keyed by their normalized title and media kind, for hiding the same post
 * made again in other communities (a crosspost or a copy).
 */
final class Duplicates {
    /** Titles shorter than this, once normalized, are too generic to call two posts the same. */
    private static final int MIN_TITLE = 12;
    private static final int MAX_KEPT = 5000;

    /** The post first shown under each key, by its ID (or its community and author when it has none). */
    private static final Map<String, String> FIRST = new LinkedHashMap<String, String>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_KEPT;
        }
    };

    private Duplicates() {
    }

    /** The first line of a title, lowercase, without accents, punctuation, or repeated spaces. */
    static String normalize(CharSequence title) {
        String line = title.toString();
        int end = line.indexOf('\n');
        if (end >= 0) line = line.substring(0, end);
        line = Normalizer.normalize(line, Normalizer.Form.NFD).replaceAll("\\p{M}+", "");
        return line.toLowerCase(Locale.ROOT).replaceAll("[^\\p{L}\\p{N}]+", " ").trim();
    }

    private static String kind(PostInfo post) {
        return post.video ? "v" : post.photo ? "p" : post.link ? "l" : "t";
    }

    /** Text bodies shorter than this, once normalized, are too generic to call two posts the same. */
    private static final int MIN_BODY = 40;

    /** The keys naming the post's content: its title with its media kind, its body, and its media. */
    static java.util.List<String> keys(PostInfo post) {
        java.util.List<String> keys = new java.util.ArrayList<>(3);
        String title = normalize(post.title);
        if (title.length() >= MIN_TITLE && title.indexOf(' ') >= 0) keys.add("title:" + kind(post) + ":" + title);
        String body = normalize(post.body.toString().replace('\n', ' '));
        if (body.length() >= MIN_BODY) keys.add("body:" + body);
        if (post.media.length() > 0) keys.add("media:" + post.media);
        return keys;
    }

    /**
     * The reason to hide a post repeating one already shown (the same title, the same body, or the same media), or
     * null; the keys of a post shown are recorded.
     */
    static String check(PostInfo post) {
        java.util.List<String> keys = keys(post);
        if (keys.isEmpty()) return null;
        String self = !post.id.isEmpty() ? post.id : post.community() + "/" + String.join(",", post.authors);
        synchronized (FIRST) {
            for (String key : keys) {
                String first = FIRST.get(key);
                if (first != null && !first.equals(self)) {
                    return "duplicate " + key.substring(0, key.indexOf(':')) + " of " + first;
                }
            }
            for (String key : keys) if (!FIRST.containsKey(key)) FIRST.put(key, self);
        }
        return null;
    }
}
