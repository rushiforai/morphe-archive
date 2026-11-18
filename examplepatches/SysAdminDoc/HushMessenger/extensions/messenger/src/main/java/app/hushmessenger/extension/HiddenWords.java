package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Hides messages that have one of your own words in them (#196). A message that matches shows as {@link #MASK} in the
 * chat and its notification never goes up. Nothing is sent back and nothing is deleted, so the message is still there
 * for the person who sent it, and the messages you send go as they always did.
 *
 * It rides two hooks other controls already have: the chat row's text getter, which Keep unsent messages reads, and the
 * new-message notification, which the message log and Auto reply read. Its own switch and its words gate every path
 * here, so neither of those controls has to be on for it to work, and neither changes when it is.
 */
final class HiddenWords {
    static final String KEY = "hidden_words";
    /** The words themselves, as typed, split by commas. */
    static final String WORDS = "hidden_words_text";
    static final int MAX_LENGTH = 200;
    /** What a hidden message's row shows instead of its words, next to Keep unsent messages' [unsent]. */
    static final String MASK = "[hidden]";
    /** Message ids whose notification was dropped, oldest first. */
    private static final int MAX_MARKED = 256;

    /** The saved words and the patterns they compiled to, so a row doesn't compile them again. */
    private static final class Parsed {
        final String saved;
        final List<Pattern> terms;

        Parsed(String saved, List<Pattern> terms) {
            this.saved = saved;
            this.terms = terms;
        }
    }

    private static volatile Parsed parsed;

    /**
     * The messages whose words are hidden, by id. The notification manager asks about a message right after its
     * notification was built, and the push and the sync copy of one message share the id, so a mark is kept rather than
     * taken: both copies have to stay off the screen.
     */
    private static final Map<String, Boolean> MARKED = Collections.synchronizedMap(new LinkedHashMap<String, Boolean>(64, 0.75f, false) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > MAX_MARKED;
        }
    });

    private HiddenWords() { }

    /** One whole-word pattern per word written, compiled once per change to the saved words. */
    static List<Pattern> terms() {
        SharedPreferences prefs = Settings.preferences;
        String saved = prefs == null ? "" : prefs.getString(WORDS, "");
        if (saved == null) saved = "";
        Parsed had = parsed;
        if (had != null && had.saved.equals(saved)) return had.terms;
        List<Pattern> compiled = new ArrayList<>();
        for (String term : saved.split(",")) {
            String word = term.trim();
            if (word.isEmpty()) continue;
            // Whole words, ignoring case, the way Auto reply reads its own: "ok" doesn't hide "okay".
            compiled.add(Pattern.compile("(?<![\\p{L}\\p{N}])" + Pattern.quote(word) + "(?![\\p{L}\\p{N}])",
                Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE));
        }
        compiled = Collections.unmodifiableList(compiled);
        parsed = new Parsed(saved, compiled);
        return compiled;
    }

    /** On, not paused, not in safe mode, and with at least one word written. */
    static boolean wanted() {
        return Settings.wouldUse(KEY) && !terms().isEmpty();
    }

    /** Whether [text] has one of the words written, as a whole word. */
    static boolean hits(String text) {
        if (text == null || text.isEmpty()) return false;
        for (Pattern term : terms()) if (term.matcher(text).find()) return true;
        return false;
    }

    /** The words a chat's row is about to show, or {@link #MASK} when they're hidden. Never throws. */
    static String mask(String text) {
        try {
            if (text == null || text.isEmpty() || !wanted() || !hits(text)) return text;
            Settings.enabled(KEY);
            return MASK;
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't hide a message's words", failure);
            return text;
        }
    }

    /**
     * An incoming message, from the notification hook, before its notification goes up. A message with one of the words
     * is marked, and {@link #marked} then keeps the notification off the screen. Never throws.
     */
    static void received(String text, String id) {
        try {
            if (id == null || id.isEmpty() || !wanted() || !hits(text)) return;
            Settings.enabled(KEY);
            MARKED.put(id, Boolean.TRUE);
        } catch (Throwable failure) {
            Settings.hookFailedPrivately(KEY, "Can't hide an incoming message", failure);
        }
    }

    /** Whether [id]'s notification goes nowhere. */
    static boolean marked(String id) {
        return id != null && !id.isEmpty() && MARKED.containsKey(id);
    }

    static void resetForTests() {
        parsed = null;
        MARKED.clear();
    }
}
