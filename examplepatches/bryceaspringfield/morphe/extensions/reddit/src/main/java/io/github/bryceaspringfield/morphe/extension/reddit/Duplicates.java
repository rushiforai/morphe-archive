package io.github.bryceaspringfield.morphe.extension.reddit;

import java.text.Normalizer;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

final class Duplicates {
    private static final int MIN_TITLE = 12;
    private static final int MAX_KEPT = 5000;

    private static final Map<String, String> FIRST = new LinkedHashMap<String, String>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_KEPT;
        }
    };

    private Duplicates() {
    }

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

    private static final int MIN_BODY = 40;

    static java.util.List<String> keys(PostInfo post) {
        java.util.List<String> keys = new java.util.ArrayList<>(3);
        String title = normalize(post.title);
        if (title.length() >= MIN_TITLE && title.indexOf(' ') >= 0) keys.add("title:" + kind(post) + ":" + title);
        String body = normalize(post.body.toString().replace('\n', ' '));
        if (body.length() >= MIN_BODY) keys.add("body:" + body);
        if (post.media.length() > 0) keys.add("media:" + post.media);
        return keys;
    }

    static boolean seen(PostInfo post) {
        java.util.List<String> keys = keys(post);
        String self = !post.id.isEmpty() ? post.id : post.community() + "/" + String.join(",", post.authors);
        synchronized (FIRST) {
            for (String key : keys) {
                String first = FIRST.get(key);
                if (first != null && !first.equals(self)) return true;
            }
        }
        return false;
    }

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
