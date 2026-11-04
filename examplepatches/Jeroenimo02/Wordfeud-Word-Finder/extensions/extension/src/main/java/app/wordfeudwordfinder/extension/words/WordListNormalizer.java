package app.wordfeudwordfinder.extension.words;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/** Turns a downloaded one-word-per-line text file into the words the solver can use. */
public final class WordListNormalizer {
    private WordListNormalizer() {}

    /**
     * Reads one word per line (LF or CRLF), trims it, upper-cases it with {@link Locale#ROOT}, and keeps it only
     * when every character is in {@code alphabet} (single-character strings, e.g. the ruleset's tile letters).
     * Empty lines, words with other characters (digits, spaces, hyphens, letters not in the ruleset, undecodable
     * bytes) are skipped. A leading byte order mark is ignored. Duplicates are removed; the result keeps the
     * order of first occurrence. The stream is not closed.
     */
    public static List<String> normalize(InputStream in, Charset cs, Set<String> alphabet) throws IOException {
        BufferedReader r = new BufferedReader(new InputStreamReader(in, cs), 1 << 16);
        Set<String> out = new LinkedHashSet<>();
        String line;
        boolean first = true;
        while ((line = r.readLine()) != null) {
            if (first) {
                first = false;
                if (!line.isEmpty() && line.charAt(0) == '﻿') line = line.substring(1);
            }
            String w = line.trim().toUpperCase(Locale.ROOT);
            if (!w.isEmpty() && inAlphabet(w, alphabet)) out.add(w);
        }
        return new ArrayList<>(out);
    }

    private static boolean inAlphabet(String w, Set<String> alphabet) {
        for (int i = 0; i < w.length(); ) {
            int cp = w.codePointAt(i);
            int n = Character.charCount(cp);
            if (!alphabet.contains(w.substring(i, i + n))) return false;
            i += n;
        }
        return true;
    }
}
