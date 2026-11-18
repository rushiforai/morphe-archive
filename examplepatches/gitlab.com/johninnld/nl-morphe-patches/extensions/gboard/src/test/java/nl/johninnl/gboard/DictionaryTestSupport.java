package nl.johninnl.gboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Small tokenizers and word lists for the dictionary tests. */
final class DictionaryTestSupport {
    private DictionaryTestSupport() {}

    /** Every ASCII letter, digit and hyphen as a piece, plus "▁"; any plain word can be spelled. */
    static BpeTokenizer letters() {
        List<String> pieces = new ArrayList<>(Arrays.asList("<unk>", BpeTokenizer.SPACE));
        for (char c = 'a'; c <= 'z'; c++) pieces.add(String.valueOf(c));
        for (char c = 'A'; c <= 'Z'; c++) pieces.add(String.valueOf(c));
        for (char c = '0'; c <= '9'; c++) pieces.add(String.valueOf(c));
        pieces.add("-");
        return new BpeTokenizer(pieces, new ArrayList<String[]>());
    }

    static Set<String> common(String... words) {
        return new HashSet<>(Arrays.asList(words));
    }

    /** Ordinary Dutch words that occur in the test sentences. */
    static Set<String> dutch() {
        return common("we", "rijden", "morgen", "naar", "en", "daarna", "er", "zitten", "veel", "in", "het", "park", "op",
                "de", "hoek", "van", "straat", "staat", "een", "bakker", "waren", "vele", "mensen", "plein", "code", "al",
                "klaar", "server", "navigeer", "adres", "is", "zet", "aan", "timmerman", "maakt", "nieuwe", "deur", "vos",
                "visser", "kool", "tuin", "wijk", "bij", "oude", "bos", "mooi");
    }
}
