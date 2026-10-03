/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import java.util.ArrayList;
import java.util.List;

/**
 * The fixed corpus #58's matching is measured on: two lists of 1,000 phrases each that share long
 * prefixes and run through several scripts, and a 10 KB post built from their near misses, so the
 * walk through it keeps starting phrases and never finishes one. Plain Java with no test library, so
 * the same corpus runs in the JVM tests and on a phone through app_process.
 */
public final class WordsCorpus {
    public static final int PHRASES = 1000;
    public static final int POST_CHARS = 10 * 1024;

    private WordsCorpus() {
    }

    /** The hide list: 1,000 distinct phrases, one per line. */
    public static String hide() {
        return list("");
    }

    /** The keep list: 1,000 more, each a hide phrase with its own ending. */
    public static String keep() {
        return list("~");
    }

    private static String list(String mark) {
        String[] stems = {
                "spoiler alert ", "ababababababababab", "Straße ", "ΣΟΦΟΣ ", "猫の写真", "😀🎉 ",
                "giveaway now ", "ｆｕｌｌｗｉｄｔｈ", "नमस्ते ", "café ",
        };
        List<String> phrases = new ArrayList<>();
        for (int i = 0; i < PHRASES; i++) {
            String stem = stems[i % stems.length];
            // A shared stem, then a number past what any near miss in the post reaches.
            phrases.add(stem + mark + "#" + i + "!");
        }
        return String.join("\n", phrases);
    }

    /**
     * A post of {@link #POST_CHARS} chars that holds no phrase of either list: every stem again and
     * again with the "#" each phrase needs next left out, and long runs that keep the walk deep in
     * the shared "abab" prefix.
     */
    public static String post() {
        String[] misses = {
                "spoiler alert 12 ", "abababababababababababab ", "STRASSE ", "σοφοσ ", "猫の写真です ",
                "😀🎉 party ", "Giveaway now ", "fullwidth ", "नमस्ते दुनिया ", "CAFÉ ",
        };
        StringBuilder post = new StringBuilder(POST_CHARS + 64);
        for (int i = 0; post.length() < POST_CHARS; i++) post.append(misses[i % misses.length]);
        post.setLength(POST_CHARS);
        // A cut through a surrogate pair would leave half an emoji at the end.
        if (Character.isHighSurrogate(post.charAt(POST_CHARS - 1))) post.setCharAt(POST_CHARS - 1, ' ');
        return post.toString();
    }
}
