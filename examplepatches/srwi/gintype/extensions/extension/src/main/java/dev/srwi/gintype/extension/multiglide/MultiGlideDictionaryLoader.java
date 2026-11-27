package dev.srwi.gintype.extension.multiglide;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Loads MultiGlide wordlists and bigram tables from plain streams.
 * Ported from Kinetica's DictionaryLoader.kt.
 */
public final class MultiGlideDictionaryLoader {

    private MultiGlideDictionaryLoader() {}

    private static final class ParsedEntry {
        final String word;
        int count;
        boolean isProper;

        ParsedEntry(String word, int count, boolean isProper) {
            this.word = word;
            this.count = count;
            this.isProper = isProper;
        }
    }

    public static MultiGlideTrie loadTrieFromStream(
            InputStream stream,
            String lang,
            boolean hasDedicatedUmlautKeys
    ) throws IOException {
        List<ParsedEntry> entries = new ArrayList<>(65_536);
        Map<String, Integer> indexByDisplay = new HashMap<>(65_536);
        long maxCount = 1L;

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String trimmed = line.trim();
                if (trimmed.isEmpty() || trimmed.startsWith("#")) continue;

                int tabIdx = trimmed.indexOf('\t');
                if (tabIdx <= 0) {
                    tabIdx = trimmed.indexOf(' ');
                }
                String rawWord;
                int freq;
                int flag = 0;

                if (tabIdx > 0) {
                    rawWord = trimmed.substring(0, tabIdx).trim();
                    String rest = trimmed.substring(tabIdx + 1).trim();
                    int secondTab = rest.indexOf('\t');
                    if (secondTab < 0) secondTab = rest.indexOf(' ');
                    try {
                        if (secondTab > 0) {
                            freq = Integer.parseInt(rest.substring(0, secondTab).trim());
                            flag = Integer.parseInt(rest.substring(secondTab + 1).trim());
                        } else {
                            freq = Integer.parseInt(rest);
                        }
                    } catch (NumberFormatException e) {
                        freq = 1000;
                    }
                } else {
                    rawWord = trimmed;
                    freq = 1000;
                }
                if (rawWord.isEmpty()) continue;

                Integer existingIdx = indexByDisplay.get(rawWord);
                if (existingIdx != null) {
                    ParsedEntry prev = entries.get(existingIdx);
                    long sum = (long) prev.count + (long) freq;
                    prev.count = (int) Math.min(Integer.MAX_VALUE, sum);
                    if (flag == 1) prev.isProper = true;
                    if (prev.count > maxCount) maxCount = prev.count;
                } else {
                    int clampedFreq = Math.max(1, freq);
                    indexByDisplay.put(rawWord, entries.size());
                    entries.add(new ParsedEntry(rawWord, clampedFreq, flag == 1));
                    if (clampedFreq > maxCount) maxCount = clampedFreq;
                }
            }
        }

        MultiGlideTrie trie = new MultiGlideTrie(Math.max(4096, entries.size() * 4));
        for (int i = 0; i < entries.size(); i++) {
            ParsedEntry entry = entries.get(i);
            int freqByte = MultiGlideTrie.freqByteFor(entry.count, maxCount);
            insertWordIntoTrie(trie, entry.word, freqByte, entry.isProper, lang, hasDedicatedUmlautKeys);
        }
        trie.compact();
        return trie;
    }

    public static void insertWordIntoTrie(
            MultiGlideTrie trie,
            String rawWord,
            int freq,
            boolean isProperFlag,
            String lang,
            boolean hasDedicatedUmlautKeys
    ) {
        if (rawWord == null || rawWord.isEmpty()) return;
        boolean isProperNoun = isProperFlag || (rawWord.length() > 0 && Character.isUpperCase(rawWord.charAt(0)));
        String foldedKey = MultiGlideAccentFolder.fold(rawWord);
        if (foldedKey.isEmpty()) return;

        trie.insert(foldedKey, freq, rawWord, isProperNoun);

        if ("de".equalsIgnoreCase(lang)) {
            String digraphKey = MultiGlideAccentFolder.foldGermanDigraphs(rawWord, hasDedicatedUmlautKeys);
            if (digraphKey != null && !digraphKey.equals(foldedKey) && !digraphKey.isEmpty()) {
                trie.insert(digraphKey, freq, rawWord, isProperNoun);
            }
        }
    }

    public static MultiGlideBigramTable loadBigramsFromStream(InputStream stream) throws IOException {
        MultiGlideBigramTable table = new MultiGlideBigramTable();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String trimmed = line.trim();
                if (trimmed.isEmpty() || trimmed.startsWith("#")) continue;

                String[] parts = trimmed.split("\\s+");
                if (parts.length >= 3) {
                    String prev = parts[0];
                    String next = parts[1];
                    int count;
                    try {
                        count = Integer.parseInt(parts[2]);
                    } catch (NumberFormatException e) {
                        count = 100;
                    }
                    table.put(prev, next, count);
                }
            }
        }
        table.freeze();
        return table;
    }
}
