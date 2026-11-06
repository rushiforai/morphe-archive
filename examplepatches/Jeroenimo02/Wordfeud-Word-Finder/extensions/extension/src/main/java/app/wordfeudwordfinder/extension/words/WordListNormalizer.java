package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.Tiles;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.function.Consumer;

/** Turns a downloaded one-word-per-line text file into the words the solver can use. */
public final class WordListNormalizer {
    private WordListNormalizer() {}

    /**
     * Reads one word per line (LF or CRLF), trims it, upper-cases it with {@link Locale#ROOT}, and keeps it only
     * when it consists of tiles in {@code alphabet} (the ruleset's tile names, e.g. "A" or the digraph tile "CH").
     * Digraph tiles are encoded to their one-char code ({@link Tiles#encode}). Empty lines and words with other
     * characters are skipped. A leading byte order mark is ignored. Duplicates are removed; the result keeps the
     * order of first occurrence. The stream is not closed.
     */
    public static List<String> normalize(InputStream in, Charset cs, Set<String> alphabet) throws IOException {
        Set<String> out = new LinkedHashSet<>();
        each(in, cs, alphabet, out::add);
        return new ArrayList<>(out);
    }

    /** As {@link #normalize}, but hands each kept word to {@code sink} in file order (duplicates included). */
    public static void each(InputStream in, Charset cs, Set<String> alphabet, Consumer<String> sink)
            throws IOException {
        List<String> digraphs = Tiles.digraphsOf(alphabet);
        Set<Character> chars = new HashSet<>();
        for (String t : alphabet) {
            char c = Tiles.code(t.toUpperCase(Locale.ROOT));
            if (c != 0) chars.add(c);
        }
        BufferedReader r = new BufferedReader(new InputStreamReader(in, cs), 1 << 16);
        String line;
        boolean first = true;
        while ((line = r.readLine()) != null) {
            if (first) {
                first = false;
                if (!line.isEmpty() && line.charAt(0) == '﻿') line = line.substring(1);
            }
            String w = Tiles.encode(line.trim().toUpperCase(Locale.ROOT), digraphs);
            if (!w.isEmpty() && inAlphabet(w, chars)) sink.accept(w);
        }
    }

    private static boolean inAlphabet(String w, Set<Character> chars) {
        for (int i = 0; i < w.length(); i++) {
            if (!chars.contains(w.charAt(i))) return false;
        }
        return true;
    }
}
