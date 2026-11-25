package nl.johninnl.gboard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Set;

/**
 * Reads "word count" frequency lists, most frequent first, into lower-case word sets: every word
 * (never corrected), and the most frequent ones (names made of them are not boosted).
 */
final class CommonWords {
    /** Words this frequent are ordinary enough that a name spelled like one is left as heard (Vos, Visser). */
    static final int ORDINARY_RANK = 12_000;

    private CommonWords() {}

    static void read(InputStream in, Set<String> all, Set<String> ordinary) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8));
        int rank = 0;
        for (String line; (line = reader.readLine()) != null; ) {
            int space = line.indexOf(' ');
            String word = (space < 0 ? line : line.substring(0, space)).trim().toLowerCase(Locale.ROOT);
            if (word.isEmpty()) continue;
            all.add(word);
            if (++rank <= ORDINARY_RANK && ordinary != null) ordinary.add(word);
        }
    }
}
