package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.junit.Test;

public class WordListNormalizerTest {

    private static Set<String> az(String... extra) {
        Set<String> s = new HashSet<>();
        for (char c = 'A'; c <= 'Z'; c++) s.add(String.valueOf(c));
        s.addAll(Arrays.asList(extra));
        return s;
    }

    private static List<String> norm(String text, Charset cs, Set<String> alphabet) throws IOException {
        return WordListNormalizer.normalize(new ByteArrayInputStream(text.getBytes(cs)), cs, alphabet);
    }

    @Test
    public void normalizesMessyInput() throws IOException {
        assertEquals(Arrays.asList("AAP", "NOOT"),
                norm("aap\r\n Noot \n\nmies1\nÄRM\n", StandardCharsets.UTF_8, az()));
    }

    @Test
    public void keepsSpecialLettersWhenInAlphabet() throws IOException {
        assertEquals(Arrays.asList("ÄRM"), norm("ärm\n", StandardCharsets.UTF_8, az("Ä")));
        assertEquals(Arrays.asList("ÄRM"), norm("ÄRM", StandardCharsets.ISO_8859_1, az("Ä")));
    }

    @Test
    public void dedupesKeepingFirstOccurrenceOrder() throws IOException {
        assertEquals(Arrays.asList("NOOT", "AAP"),
                norm("noot\nAAP\naap\r\nNOOT\n", StandardCharsets.UTF_8, az()));
    }

    @Test
    public void stripsByteOrderMarkAndSkipsInnerSpaces() throws IOException {
        assertEquals(Arrays.asList("AAP"),
                norm("﻿aap\nnoot mies\n\t\n", StandardCharsets.UTF_8, az()));
    }

    @Test
    public void malformedBytesAreSkipped() throws IOException {
        byte[] bytes = {'a', 'a', 'p', '\n', 'x', (byte) 0xC3, '\n', 'n', 'o', 'o', 't'};
        assertEquals(Arrays.asList("AAP", "NOOT"),
                WordListNormalizer.normalize(new ByteArrayInputStream(bytes), StandardCharsets.UTF_8, az()));
    }
}
