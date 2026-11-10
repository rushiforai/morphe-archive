package app.morphe.extension.kicktv.emotes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Holds the currently known third-party emotes and rewrites chat text so the
 * stock KICK renderer can display them.
 *
 * <p>KICK already understands {@code [emote:<id>:<name>]} tokens. Third-party
 * emotes are injected with reserved numeric fake IDs in the 1000000000 range,
 * which cannot collide with real KICK emote IDs. The URL builder is patched
 * separately ({@link EmoteUrlResolver}) and maps those fake IDs back to the
 * provider CDN URL.</p>
 */
public final class EmoteStore {

    /** Matches the emote tokens KICK itself puts in a message. */
    private static final Pattern NATIVE_TOKEN = Pattern.compile("\\[emote:\\d+:[^]]+]");

    private static final int FAKE_ID_BASE = 1000000000;
    private static final int FAKE_ID_BUCKETS = 900000000;

    /**
     * vz3.d and vz3.a parse the same text back-to-back. A provider refresh
     * landing between the two calls must not produce different tokens, so the
     * most recent result is reused briefly for the same input text.
     */
    private static final long RECENT_CACHE_MS = 250L;

    private static volatile Snapshot snapshot = Snapshot.EMPTY;
    private static volatile Recent recent;

    private static final class Recent {
        final String input;
        final String output;
        final long at;

        Recent(String input, String output, long at) {
            this.input = input;
            this.output = output;
            this.at = at;
        }
    }

    private EmoteStore() {
    }

    /** A single third-party emote: chat name plus resolved image URL. */
    public static final class Emote {
        final String name;
        final String url;

        public Emote(String name, String url) {
            this.name = name;
            this.url = url;
        }
    }

    private static final class Snapshot {
        static final Snapshot EMPTY = new Snapshot(
                null,
                Collections.<String, Integer>emptyMap(),
                Collections.<Integer, String>emptyMap());

        final Pattern pattern;
        final Map<String, Integer> idsByName;
        final Map<Integer, String> urlsById;

        Snapshot(Pattern pattern,
                 Map<String, Integer> idsByName,
                 Map<Integer, String> urlsById) {
            this.pattern = pattern;
            this.idsByName = idsByName;
            this.urlsById = urlsById;
        }
    }

    /**
     * Rewrites third-party emote names into native KICK emote tokens.
     * Native tokens are preserved untouched, so already emote-only messages
     * are not modified.
     */
    public static String transform(String text) {
        if (text == null || text.isEmpty() || !EmotePrefs.isEnabled()) {
            return text;
        }

        // Makes sure the global provider sets are fetched the first time chat
        // actually renders, even if the channel response hook never ran.
        EmoteRepository.ensureStarted();

        long now = System.currentTimeMillis();
        Recent cached = recent;
        if (cached != null && now - cached.at <= RECENT_CACHE_MS
                && text.equals(cached.input)) {
            return cached.output;
        }

        Snapshot current = snapshot;
        if (current.pattern == null) {
            remember(text, text);
            return text;
        }

        StringBuilder out = new StringBuilder(text.length() + 32);
        boolean changed = false;
        int last = 0;

        Matcher nativeMatcher = NATIVE_TOKEN.matcher(text);
        while (nativeMatcher.find()) {
            String segment = text.substring(last, nativeMatcher.start());
            String replaced = replaceSegment(current, segment);
            if (!replaced.equals(segment)) {
                changed = true;
            }
            out.append(replaced);
            out.append(text, nativeMatcher.start(), nativeMatcher.end());
            last = nativeMatcher.end();
        }

        String tail = text.substring(last);
        String replacedTail = replaceSegment(current, tail);
        if (!replacedTail.equals(tail)) {
            changed = true;
        }
        out.append(replacedTail);

        String result = changed ? out.toString() : text;
        remember(text, result);
        return result;
    }

    private static void remember(String input, String output) {
        recent = new Recent(input, output, System.currentTimeMillis());
    }

    /** Image URL registered for a fake emote ID, or null for real KICK ids. */
    static String urlFor(int id) {
        return snapshot.urlsById.get(id);
    }

    /** Number of currently active third-party emotes. */
    static int size() {
        return snapshot.idsByName.size();
    }

    /**
     * Builds a new immutable snapshot. Called from background loader threads
     * only; the snapshot itself is published with a single volatile write.
     */
    static void publish(List<Emote> emotes) {
        Snapshot previous = snapshot;
        if (emotes.isEmpty()) {
            // Keep the URL history: a message rendered against the previous
            // snapshot may still be on screen and must keep resolving.
            snapshot = new Snapshot(
                    null,
                    Collections.<String, Integer>emptyMap(),
                    previous.urlsById);
            return;
        }

        Map<String, Integer> idsByName = new LinkedHashMap<>();
        Map<Integer, String> urlsById = new LinkedHashMap<>(previous.urlsById);
        List<String> names = new ArrayList<>(emotes.size());

        for (Emote emote : emotes) {
            if (emote == null || emote.name == null || emote.name.isEmpty()
                    || emote.url == null || emote.url.isEmpty()) {
                continue;
            }
            if (idsByName.containsKey(emote.name)) {
                continue;
            }

            int id = fakeId(emote.name, emote.url);
            while (urlsById.containsKey(id) && !emote.url.equals(urlsById.get(id))) {
                id++;
                if (id > FAKE_ID_BASE + FAKE_ID_BUCKETS - 1) {
                    id = FAKE_ID_BASE;
                }
            }

            idsByName.put(emote.name, id);
            urlsById.put(id, emote.url);
            names.add(emote.name);
        }

        if (names.isEmpty()) {
            snapshot = new Snapshot(
                    null,
                    Collections.<String, Integer>emptyMap(),
                    urlsById);
            return;
        }

        // Longest names first so "LONGEMOTE" wins over "LONG".
        Collections.sort(names, new Comparator<String>() {
            @Override
            public int compare(String a, String b) {
                if (a.length() != b.length()) {
                    return b.length() - a.length();
                }
                return a.compareTo(b);
            }
        });

        // Emote names are whole whitespace-separated tokens, exactly like the
        // KICK/Twitch chat tokenizer. Requiring whitespace boundaries keeps
        // short names such as "gg" from corrupting URLs and mentions.
        StringBuilder regex = new StringBuilder();
        regex.append("(?<!\\S)(?:");
        for (int i = 0; i < names.size(); i++) {
            if (i > 0) {
                regex.append('|');
            }
            regex.append(Pattern.quote(names.get(i)));
        }
        regex.append(")(?!\\S)");

        Pattern pattern;
        try {
            pattern = Pattern.compile(regex.toString());
        } catch (Throwable t) {
            // A pathological emote name must never break chat rendering.
            snapshot = new Snapshot(
                    null,
                    Collections.<String, Integer>emptyMap(),
                    urlsById);
            return;
        }

        snapshot = new Snapshot(pattern, idsByName, urlsById);
    }

    private static String replaceSegment(Snapshot current, String segment) {
        if (segment.isEmpty()) {
            return segment;
        }

        Matcher matcher = current.pattern.matcher(segment);
        if (!matcher.find()) {
            return segment;
        }

        StringBuilder out = new StringBuilder(segment.length() + 24);
        int last = 0;
        do {
            out.append(segment, last, matcher.start());
            Integer id = current.idsByName.get(matcher.group());
            if (id == null) {
                out.append(matcher.group());
            } else {
                out.append("[emote:").append(id).append(':')
                        .append(sanitizeName(matcher.group())).append(']');
            }
            last = matcher.end();
        } while (matcher.find());
        out.append(segment, last, segment.length());
        return out.toString();
    }

    /** The emote token grammar stops at ']', so it cannot appear in a name. */
    private static String sanitizeName(String name) {
        if (name.indexOf(']') < 0 && name.indexOf('[') < 0) {
            return name;
        }
        return name.replace(']', ' ').replace('[', ' ');
    }

    /** Stable ID in the reserved 1000000000..1899999999 range. */
    private static int fakeId(String name, String url) {
        long hash = 1125899906842597L;
        String key = name + '\u0000' + url;
        for (int i = 0; i < key.length(); i++) {
            hash = 31 * hash + key.charAt(i);
        }
        int positive = (int) (hash & 0x7fffffffL);
        return FAKE_ID_BASE + (positive % FAKE_ID_BUCKETS);
    }
}
