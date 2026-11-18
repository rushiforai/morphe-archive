package nl.johninnl.gboard;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public class HotwordVocabTest {
    private static final String S = BpeTokenizer.SPACE;

    @Test
    public void fitsScoresUntilSherpaSplitsLikeParakeet() {
        BpeTokenizer tokenizer = BpeTokenizerTest.tiny();
        HotwordVocab vocab = new HotwordVocab(tokenizer);
        List<String> words = Arrays.asList("abc", "bc", "abcbc");
        HotwordVocab.Fit fit = vocab.fit(words);
        for (String word : words) {
            assertEquals(word, tokenizer.encodeWord(word), vocab.sherpaSplit(word));
            assertTrue(fit.exact.contains(word));
        }
    }

    @Test
    public void reportsWordsItCannotSpell() {
        HotwordVocab.Fit fit = new HotwordVocab(BpeTokenizerTest.tiny()).fit(Arrays.asList("abc", "abz"));
        assertEquals(Arrays.asList("abz"), Arrays.asList(fit.unsupported.toArray()));
    }

    @Test
    public void writesOneScoredPiecePerLineInIdOrder() throws Exception {
        HotwordVocab vocab = new HotwordVocab(BpeTokenizerTest.tiny());
        vocab.fit(Arrays.asList("abc"));
        File file = File.createTempFile("bpe", ".vocab");
        try {
            vocab.write(file);
            List<String> lines = Files.readAllLines(file.toPath());
            assertEquals(9, lines.size());
            assertTrue(lines.get(0).startsWith("<unk> "));
            assertTrue(lines.get(7).startsWith(S + "ab "));
            for (String line : lines) Float.parseFloat(line.substring(line.indexOf(' ') + 1));
        } finally {
            file.delete();
        }
    }
}
