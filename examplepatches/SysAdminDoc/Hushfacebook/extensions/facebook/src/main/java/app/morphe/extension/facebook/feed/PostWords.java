/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.icu.text.Normalizer2;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * The two lists behind "Hide posts with words you choose": the words and phrases that hide a post,
 * and the ones that keep it whatever else it says.
 *
 * <p>A list is stored as one phrase per line. Each phrase is plain text, matched anywhere in a
 * post's words, inside longer words too, with case and compatibility forms folded the Unicode way
 * (NFKC case folding), so "Spoiler", "SPOILER" and "ｓｐｏｉｌｅｒ" are one phrase. No pattern
 * syntax: a phrase means its own characters and nothing else.
 *
 * <p>Both lists are bounded, whatever wrote the store: at most {@link #MAX_PHRASES} phrases, each
 * {@link #MIN_LENGTH} to {@link #MAX_LENGTH} characters, or one that's a word on its own (an
 * ideograph, a kana or Hangul syllable, an emoji), a phrase given twice counted once. A line
 * outside the bounds is left out rather than cut, and the settings row says how many were.
 *
 * <p>The lists never leave the phone through Hushfacebook: no log line, diagnostic report or
 * request carries a phrase, only the counts.
 */
public final class PostWords {
    /** How many phrases a list holds. Past this, lines are left out. */
    public static final int MAX_PHRASES = 50;
    /** A phrase's length in characters (code points), after the spaces around it are dropped. */
    public static final int MIN_LENGTH = 2;
    public static final int MAX_LENGTH = 60;

    /** How many posts the rule has hidden since Facebook started. The settings row shows it. */
    static final AtomicInteger HIDDEN = new AtomicInteger();

    private PostWords() {
    }

    /** What the lists make of a post's words. Only {@link #HIDE} hides it. */
    enum Verdict {
        HIDE("hide word"),
        KEEP("keep word"),
        NO_MATCH("no match");

        /** What the report counts this under: which list matched, never the phrase. */
        final String reason;

        Verdict(String reason) {
            this.reason = reason;
        }
    }

    /**
     * The phrases a stored list holds, in the order given, each as it was typed without the spaces
     * around it. Lines out of bounds, blank lines and repeats are left out, and the list stops at
     * {@link #MAX_PHRASES}.
     */
    public static List<String> phrases(@Nullable String stored) {
        List<String> kept = new ArrayList<>();
        if (stored == null || stored.isEmpty()) return kept;
        Set<String> seen = new HashSet<>();
        int start = 0;
        while (start <= stored.length() && kept.size() < MAX_PHRASES) {
            int end = lineEnd(stored, start);
            String phrase = strip(stored.substring(start, end));
            if (phrase.codePointCount(0, phrase.length()) <= MAX_LENGTH) {
                String folded = fold(phrase);
                if (longEnough(phrase, folded) && seen.add(folded)) kept.add(phrase);
            }
            start = end + 1;
        }
        return kept;
    }

    /** The list as it's stored: the phrases {@link #phrases} keeps, one per line. */
    public static String clean(@Nullable String typed) {
        return String.join("\n", phrases(typed));
    }

    /** Whether a value is a list exactly as {@link #clean} stores it, which is all a settings file may hold. */
    public static boolean isClean(@Nullable String value) {
        return value != null && clean(value).equals(value);
    }

    /** How many lines with something on them {@link #clean} leaves out of what was typed. */
    public static int leftOut(@Nullable String typed) {
        if (typed == null || typed.isEmpty()) return 0;
        int written = 0;
        int start = 0;
        while (start <= typed.length()) {
            int end = lineEnd(typed, start);
            if (!strip(typed.substring(start, end)).isEmpty()) written++;
            start = end + 1;
        }
        return written - phrases(typed).size();
    }

    /** How many phrases a stored list holds. */
    public static int count(@Nullable String stored) {
        return phrases(stored).size();
    }

    /** How many posts the rule has hidden since Facebook started. */
    public static int hiddenSinceStart() {
        return HIDDEN.get();
    }

    /**
     * Text folded for matching: compatibility forms, case and the characters Unicode ignores in
     * matching all folded away, the way both a phrase and a post's words are read.
     */
    static String fold(String text) {
        return Normalizer2.getNFKCCasefoldInstance().normalize(text);
    }

    /** Both lists folded, ready to judge posts. Built again only when either list changes. */
    static final class Rules {
        final String hideSource;
        final String keepSource;
        final String[] hide;
        final String[] keep;

        Rules(String hideSource, String keepSource) {
            this.hideSource = hideSource;
            this.keepSource = keepSource;
            this.hide = folded(hideSource);
            this.keep = folded(keepSource);
        }

        private static String[] folded(String stored) {
            List<String> phrases = phrases(stored);
            String[] folded = new String[phrases.size()];
            for (int i = 0; i < folded.length; i++) folded[i] = fold(phrases.get(i));
            return folded;
        }

        /** Whether there's anything to hide by. With no hide phrase, no post is read at all. */
        boolean hidesNothing() {
            return hide.length == 0;
        }

        /**
         * What the lists make of a post's words: a keep phrase anywhere in them wins, then a hide
         * phrase anywhere hides. No words match nothing.
         */
        Verdict judge(List<String> texts) {
            if (hidesNothing() || texts.isEmpty()) return Verdict.NO_MATCH;
            List<String> folded = new ArrayList<>(texts.size());
            for (String text : texts) folded.add(fold(text));
            if (anyIn(keep, folded)) return Verdict.KEEP;
            return anyIn(hide, folded) ? Verdict.HIDE : Verdict.NO_MATCH;
        }

        private static boolean anyIn(String[] phrases, List<String> texts) {
            for (String phrase : phrases) {
                for (String text : texts) {
                    if (text.contains(phrase)) return true;
                }
            }
            return false;
        }
    }

    private static volatile Rules cached;

    /** The rules for these two stored lists, folded once and kept until either changes. */
    static Rules rules(String hideStored, String keepStored) {
        Rules found = cached;
        if (found != null && found.hideSource.equals(hideStored) && found.keepSource.equals(keepStored)) return found;
        found = new Rules(hideStored, keepStored);
        cached = found;
        return found;
    }

    /** Where the line starting at [start] ends: the next line break, or the end of the text. */
    private static int lineEnd(String text, int start) {
        int newline = text.indexOf('\n', start);
        return newline < 0 ? text.length() : newline;
    }

    /**
     * Whether a phrase is at least {@link #MIN_LENGTH} characters both as typed and folded, or folds
     * to one character that {@link #standsAlone}. Folding decides, so an emoji's variation selector
     * doesn't count, "Ⓐ" is the letter it folds to, and "ß", which folds to "ss", is still one
     * letter typed.
     */
    private static boolean longEnough(String phrase, String folded) {
        int length = folded.codePointCount(0, folded.length());
        if (length == 1) return standsAlone(folded.codePointAt(0));
        return length >= MIN_LENGTH && phrase.codePointCount(0, phrase.length()) >= MIN_LENGTH;
    }

    /**
     * Whether one character is a word on its own: an ideograph, a kana or Hangul syllable, or a
     * symbol such as an emoji. A letter or digit of a script that spaces its words is inside nearly
     * every post, which is what the floor is for.
     */
    private static boolean standsAlone(int point) {
        if (Character.isIdeographic(point) || Character.getType(point) == Character.OTHER_SYMBOL) return true;
        Character.UnicodeScript script = Character.UnicodeScript.of(point);
        return script == Character.UnicodeScript.HIRAGANA || script == Character.UnicodeScript.KATAKANA
                || Character.UnicodeBlock.of(point) == Character.UnicodeBlock.HANGUL_SYLLABLES;
    }

    /** The text without the spaces, tabs and returns around it, Unicode's spaces included. */
    static String strip(String text) {
        int start = 0;
        int end = text.length();
        while (start < end) {
            int point = text.codePointAt(start);
            if (!blank(point)) break;
            start += Character.charCount(point);
        }
        while (end > start) {
            int point = text.codePointBefore(end);
            if (!blank(point)) break;
            end -= Character.charCount(point);
        }
        return text.substring(start, end);
    }

    private static boolean blank(int point) {
        return Character.isWhitespace(point) || Character.isSpaceChar(point);
    }

    /** For a test: forgets the folded rules and the count of hidden posts. */
    static void forgetForTests() {
        cached = null;
        HIDDEN.set(0);
    }
}
