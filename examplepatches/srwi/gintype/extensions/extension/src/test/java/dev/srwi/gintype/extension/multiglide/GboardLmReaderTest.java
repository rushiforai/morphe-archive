package dev.srwi.gintype.extension.multiglide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

/**
 * Pure-JVM tests for {@link GboardLmReader} covering MARISA LOUDS symbol decoding,
 * 16-byte alignment, CompactLmFst unigram/bigram extraction, filtering, and decoding.
 */
public class GboardLmReaderTest {

    @Rule
    public TemporaryFolder tempFolder = new TemporaryFolder();

    @Test
    public void parsesUnigramsBigramsAndFiltersInternalTokens() throws Exception {
        List<LmSymbolSpec> symbols = Arrays.asList(
                new LmSymbolSpec("<epsilon>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec("<UNK>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec(new byte[] {(byte) 0x86}, 80, false),
                new LmSymbolSpec(new byte[] {(byte) 0x99, 'a'}, 90, false),
                new LmSymbolSpec("_compound".getBytes(StandardCharsets.UTF_8), 75, true),
                new LmSymbolSpec("1234".getBytes(StandardCharsets.UTF_8), 95, false),
                new LmSymbolSpec("und".getBytes(StandardCharsets.UTF_8), 60, true),
                new LmSymbolSpec("ich".getBytes(StandardCharsets.UTF_8), 64, true),
                new LmSymbolSpec("habe".getBytes(StandardCharsets.UTF_8), 72, true),
                new LmSymbolSpec("vielleicht".getBytes(StandardCharsets.UTF_8), 113, true),
                new LmSymbolSpec("auch".getBytes(StandardCharsets.UTF_8), 70, true),
                new LmSymbolSpec("funktioniert".getBytes(StandardCharsets.UTF_8), 136, true),
                new LmSymbolSpec("nicht".getBytes(StandardCharsets.UTF_8), 78, true),
                new LmSymbolSpec("müssen".getBytes(StandardCharsets.UTF_8), 118, true),
                new LmSymbolSpec("Welt".getBytes(StandardCharsets.UTF_8), 131, true),
                new LmSymbolSpec("don't".getBytes(StandardCharsets.UTF_8), 90, true),
                new LmSymbolSpec("untersuchen".getBytes(StandardCharsets.UTF_8), 175, false),
                new LmSymbolSpec("rareword".getBytes(StandardCharsets.UTF_8), 240, false)
        );

        List<LmBigramSpec> bigrams = Arrays.asList(
                new LmBigramSpec("ich", "habe", 38),
                new LmBigramSpec("ich", "nicht", 55),
                new LmBigramSpec("vielleicht", "auch", 45),
                new LmBigramSpec("funktioniert", "nicht", 38),
                new LmBigramSpec("_compound", "und", 10) // must be filtered out
        );

        byte[] lmBytes = buildSyntheticLm(symbols, bigrams, 0.0676536f, 5);
        File file = tempFolder.newFile("de-de_test_main.lm");
        try (FileOutputStream fos = new FileOutputStream(file)) {
            fos.write(lmBytes);
        }

        assertTrue(GboardLmReader.isLmFile(file));
        File notLm = tempFolder.newFile("not_an_lm.bin");
        try (FileOutputStream fos = new FileOutputStream(notLm)) {
            fos.write(new byte[64]);
        }
        assertFalse(GboardLmReader.isLmFile(notLm));

        GboardLmReader.LmDictionaries dicts = GboardLmReader.read(file, "de", true);
        assertEquals(12, dicts.cleanWordCount);
        assertEquals(4, dicts.bigramCount);

        assertTrue(dicts.trie.lookupFrequency("und") > dicts.trie.lookupFrequency("vielleicht"));
        assertTrue(dicts.trie.lookupFrequency("vielleicht") > dicts.trie.lookupFrequency("funktioniert"));
        assertTrue(dicts.trie.lookupFrequency("funktioniert") > dicts.trie.lookupFrequency("untersuchen"));
        assertTrue(dicts.trie.lookupFrequency("untersuchen") > dicts.trie.lookupFrequency("rareword"));
        assertTrue(dicts.trie.lookupFrequency("müssen") > 0);
        assertTrue(dicts.trie.lookupFrequency("Welt") > 0);
        assertTrue(dicts.trie.lookupFrequency("dont") > 0); // "don't" indexed under folded letters

        // Filtered tokens must not appear
        assertEquals(0, dicts.trie.lookupFrequency("_compound"));
        assertEquals(0, dicts.trie.lookupFrequency("epsilon"));
        assertEquals(0, dicts.trie.lookupFrequency("UNK"));

        // Bigrams extracted cleanly
        assertEquals(1.0f, dicts.bigrams.score("ich", "habe"), 1e-4f);
        assertTrue(dicts.bigrams.score("ich", "nicht") > 0f);
        assertTrue(dicts.bigrams.score("ich", "nicht") < 1.0f);
        assertEquals(1.0f, dicts.bigrams.score("vielleicht", "auch"), 1e-4f);
        assertEquals(1.0f, dicts.bigrams.score("funktioniert", "nicht"), 1e-4f);
        assertEquals(0.0f, dicts.bigrams.score("_compound", "und"), 1e-4f);
    }

    @Test
    public void capsBigramsByStrengthAndSupportsNestedMarisaTailTrie() throws Exception {
        List<LmSymbolSpec> symbols = Arrays.asList(
                new LmSymbolSpec("<epsilon>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec("alpha".getBytes(StandardCharsets.UTF_8), 70, true),
                new LmSymbolSpec("beta".getBytes(StandardCharsets.UTF_8), 80, true),
                new LmSymbolSpec("gamma".getBytes(StandardCharsets.UTF_8), 90, true),
                new LmSymbolSpec("delta".getBytes(StandardCharsets.UTF_8), 100, true)
        );
        List<LmBigramSpec> bigrams = Arrays.asList(
                new LmBigramSpec("alpha", "beta", 20),
                new LmBigramSpec("beta", "gamma", 50),
                new LmBigramSpec("gamma", "delta", 90),
                new LmBigramSpec("delta", "alpha", 120)
        );

        byte[] lmBytes = buildSyntheticLm(symbols, bigrams, 0.08f, 3);
        GboardLmReader.LmDictionaries dicts = GboardLmReader.readFromBytes(lmBytes, "en", false, 2);

        assertEquals(4, dicts.cleanWordCount);
        assertEquals(2, dicts.bigramCount);
        assertTrue(dicts.bigrams.score("alpha", "beta") > 0f);
        assertTrue(dicts.bigrams.score("beta", "gamma") > 0f);
        assertEquals(0f, dicts.bigrams.score("gamma", "delta"), 1e-4f);
        assertEquals(0f, dicts.bigrams.score("delta", "alpha"), 1e-4f);
    }

    @Test
    public void normalizesLanguageTagsConsistently() {
        assertEquals("de", GboardMultiGlideDictionaryManager.normalizeLanguageKey("de-DE"));
        assertEquals("en", GboardMultiGlideDictionaryManager.normalizeLanguageKey("en_US"));
        assertEquals("fr", GboardMultiGlideDictionaryManager.normalizeLanguageKey("fr"));
        assertEquals("de", GboardMultiGlideDictionaryManager.normalizeLanguageKey(null));
    }

    @Test
    public void filtersInternalVocabularyTokensAsExpected() {
        assertTrue(GboardLmReader.isUsableVocabularyWord("vielleicht"));
        assertTrue(GboardLmReader.isUsableVocabularyWord("don't"));
        assertTrue(GboardLmReader.isUsableVocabularyWord("E-Mail"));
        assertFalse(GboardLmReader.isUsableVocabularyWord("<epsilon>"));
        assertFalse(GboardLmReader.isUsableVocabularyWord("<UNK>"));
        assertFalse(GboardLmReader.isUsableVocabularyWord("_Mann"));
        assertFalse(GboardLmReader.isUsableVocabularyWord("weiter_"));
        assertFalse(GboardLmReader.isUsableVocabularyWord("2026"));
        assertFalse(GboardLmReader.isUsableVocabularyWord("\u0099closure"));
    }

    @Test
    public void synthesizesTopCompoundWordsFromUnderscoreBigramsWithGermanCasing() throws Exception {
        List<LmSymbolSpec> symbols = Arrays.asList(
                new LmSymbolSpec("<epsilon>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec("und".getBytes(StandardCharsets.UTF_8), 60, true),
                new LmSymbolSpec("vielleicht".getBytes(StandardCharsets.UTF_8), 113, true),
                new LmSymbolSpec("Teilnahme".getBytes(StandardCharsets.UTF_8), 140, true),
                new LmSymbolSpec("Teil_".getBytes(StandardCharsets.UTF_8), 137, true),
                new LmSymbolSpec("Nacht-_".getBytes(StandardCharsets.UTF_8), 145, true),
                new LmSymbolSpec("Rare_".getBytes(StandardCharsets.UTF_8), 210, true),
                new LmSymbolSpec("_weise".getBytes(StandardCharsets.UTF_8), 81, true),
                new LmSymbolSpec("_Zeit".getBytes(StandardCharsets.UTF_8), 95, true),
                new LmSymbolSpec("_nahme".getBytes(StandardCharsets.UTF_8), 100, true),
                new LmSymbolSpec("_Fotos".getBytes(StandardCharsets.UTF_8), 98, true),
                new LmSymbolSpec("_Part".getBytes(StandardCharsets.UTF_8), 190, true),
                new LmSymbolSpec("_infix_".getBytes(StandardCharsets.UTF_8), 90, true)
        );
        List<LmBigramSpec> bigrams = Arrays.asList(
                new LmBigramSpec("Teil_", "_weise", 11),    // joint_q = 148 -> "teilweise"
                new LmBigramSpec("Teil_", "_Zeit", 40),     // joint_q = 177 -> "Teilzeit"
                new LmBigramSpec("Teil_", "_nahme", 90),    // already exists as "Teilnahme" -> skipped
                new LmBigramSpec("Nacht-_", "_Fotos", 18),  // joint_q = 163 -> "Nacht-Fotos"
                new LmBigramSpec("Rare_", "_Part", 50),     // joint_q = 260 -> dropped by cap=3
                new LmBigramSpec("Teil_", "_infix_", 10)    // infixes ignored for 2-part compounds
        );

        byte[] lmBytes = buildSyntheticLm(symbols, bigrams, 0.0676536f, 5);
        GboardLmReader.LmDictionaries dicts = GboardLmReader.readFromBytes(
                lmBytes, "de", true, GboardLmReader.DEFAULT_MAX_BIGRAMS, 3);

        assertEquals(3, dicts.cleanWordCount);
        assertEquals(3, dicts.compoundWordCount);
        assertEquals(0, dicts.bigramCount);

        // Strongest 3 compounds admitted, preserving German compound capitalization & display forms
        int freqTeilweise = dicts.trie.lookupFrequency("teilweise");
        int freqTeilzeit = dicts.trie.lookupFrequency("teilzeit");
        int freqNachtFotos = dicts.trie.lookupFrequency("nachtfotos");
        assertTrue(freqTeilweise > freqTeilzeit);
        assertTrue(freqNachtFotos > freqTeilzeit);

        List<MultiGlideTrie.WordForm> teilweiseForms =
                dicts.trie.getWordForms(dicts.trie.findNode("teilweise"));
        assertEquals(1, teilweiseForms.size());
        assertEquals("teilweise", teilweiseForms.get(0).displayWord);
        assertFalse(teilweiseForms.get(0).isProperNoun);

        List<MultiGlideTrie.WordForm> teilzeitForms =
                dicts.trie.getWordForms(dicts.trie.findNode("teilzeit"));
        assertEquals(1, teilzeitForms.size());
        assertEquals("Teilzeit", teilzeitForms.get(0).displayWord);
        assertTrue(teilzeitForms.get(0).isProperNoun);

        List<MultiGlideTrie.WordForm> nachtFotosForms =
                dicts.trie.getWordForms(dicts.trie.findNode("nachtfotos"));
        assertEquals(1, nachtFotosForms.size());
        assertEquals("Nacht-Fotos", nachtFotosForms.get(0).displayWord);
        assertTrue(nachtFotosForms.get(0).isProperNoun);

        // Standalone word retains precedence; weak/infix/bare underscore tokens stay excluded
        assertEquals(
                "Teilnahme",
                dicts.trie.getWordForms(dicts.trie.findNode("teilnahme")).get(0).displayWord);
        assertEquals(0, dicts.trie.lookupFrequency("rarepart"));
        assertEquals(0, dicts.trie.lookupFrequency("teilinfix"));
        assertEquals(0, dicts.trie.lookupFrequency("teil"));
        assertEquals(0, dicts.trie.lookupFrequency("weise"));
    }

    @Test
    public void joinsGermanCompoundCasingConsistently() {
        assertEquals("teilweise", GboardLmReader.joinCompoundWord("Teil", "weise"));
        assertEquals("Teilzeit", GboardLmReader.joinCompoundWord("Teil", "Zeit"));
        assertEquals("Ölmühle", GboardLmReader.joinCompoundWord("Öl", "Mühle"));
        assertEquals("Nacht-Fotos", GboardLmReader.joinCompoundWord("Nacht-", "Fotos"));
        assertEquals(
                "Datenschutzerklärung",
                GboardLmReader.joinCompoundWords("Daten", "Schutz", "Erklärung"));
        assertEquals(
                "versandkostenfrei",
                GboardLmReader.joinCompoundWords("Versand", "kosten", "frei"));
        assertEquals(
                "Rheinland-Pfalz",
                GboardLmReader.joinCompoundWords("Rhein", "Land-", "Pfalz"));
        assertEquals(
                "Antivirus-Software",
                GboardLmReader.joinCompoundWords("Anti", "Virus-", "Software"));
        assertEquals(
                "Besucher-Shopbewertung",
                GboardLmReader.joinCompoundWords("Besucher-", "Shop", "Bewertung"));
    }

    @Test
    public void synthesizesTopTripleCompoundsFromInfixChainsWithCap() throws Exception {
        List<LmSymbolSpec> symbols = Arrays.asList(
                new LmSymbolSpec("<epsilon>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec("und".getBytes(StandardCharsets.UTF_8), 60, true),
                new LmSymbolSpec("Daten_".getBytes(StandardCharsets.UTF_8), 110, true),
                new LmSymbolSpec("Versand_".getBytes(StandardCharsets.UTF_8), 120, true),
                new LmSymbolSpec("Selten_".getBytes(StandardCharsets.UTF_8), 195, true),
                new LmSymbolSpec("_Schutz_".getBytes(StandardCharsets.UTF_8), 100, true),
                new LmSymbolSpec("_kosten_".getBytes(StandardCharsets.UTF_8), 105, true),
                new LmSymbolSpec("_Erklärung".getBytes(StandardCharsets.UTF_8), 95, true),
                new LmSymbolSpec("_frei".getBytes(StandardCharsets.UTF_8), 90, true),
                new LmSymbolSpec("_Fall".getBytes(StandardCharsets.UTF_8), 130, true)
        );
        List<LmBigramSpec> bigrams = Arrays.asList(
                new LmBigramSpec("Daten_", "_Schutz_", 20),       // pq+fq1 = 130
                new LmBigramSpec("Versand_", "_kosten_", 22),     // pq+fq1 = 142
                new LmBigramSpec("Selten_", "_Schutz_", 40),      // pq+fq1 = 235
                new LmBigramSpec("_Schutz_", "_Erklärung", 45),   // Daten -> Erklärung joint_q = 175
                new LmBigramSpec("_Schutz_", "_Fall", 60),        // Selten -> Fall joint_q = 295 (dropped by cap=2)
                new LmBigramSpec("_kosten_", "_frei", 19)         // Versand -> frei joint_q = 161
        );

        byte[] lmBytes = buildSyntheticLm(symbols, bigrams, 0.0676536f, 5);
        GboardLmReader.LmDictionaries dicts = GboardLmReader.readFromBytes(
                lmBytes, "de", true, GboardLmReader.DEFAULT_MAX_BIGRAMS, 0, 2);

        assertEquals(1, dicts.cleanWordCount);
        assertEquals(2, dicts.compoundWordCount);

        List<MultiGlideTrie.WordForm> dse =
                dicts.trie.getWordForms(dicts.trie.findNode("datenschutzerklarung"));
        assertEquals(1, dse.size());
        assertEquals("Datenschutzerklärung", dse.get(0).displayWord);
        assertTrue(dse.get(0).isProperNoun);

        List<MultiGlideTrie.WordForm> vkf =
                dicts.trie.getWordForms(dicts.trie.findNode("versandkostenfrei"));
        assertEquals(1, vkf.size());
        assertEquals("versandkostenfrei", vkf.get(0).displayWord);
        assertFalse(vkf.get(0).isProperNoun);

        // Excluded weaker triples and standalone infix/suffix tokens
        assertEquals(0, dicts.trie.lookupFrequency("seltenschutzfall"));
        assertEquals(0, dicts.trie.lookupFrequency("datenschutzfall"));
        assertEquals(0, dicts.trie.lookupFrequency("schutz"));
    }

    @Test
    public void extractsExplicitLevel2TrigramsAndFiltersWeakChainedEdges() throws Exception {
        List<LmSymbolSpec> symbols = Arrays.asList(
                new LmSymbolSpec("<epsilon>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec("und".getBytes(StandardCharsets.UTF_8), 60, true),
                new LmSymbolSpec("Schilddrüsen_".getBytes(StandardCharsets.UTF_8), 115, true),
                new LmSymbolSpec("Daten_".getBytes(StandardCharsets.UTF_8), 110, true),
                new LmSymbolSpec("Schwach_".getBytes(StandardCharsets.UTF_8), 90, true),
                new LmSymbolSpec("_unter_".getBytes(StandardCharsets.UTF_8), 100, true),
                new LmSymbolSpec("_Schutz_".getBytes(StandardCharsets.UTF_8), 95, true),
                new LmSymbolSpec("_Funktion".getBytes(StandardCharsets.UTF_8), 105, true),
                new LmSymbolSpec("_Erklärung".getBytes(StandardCharsets.UTF_8), 95, true),
                new LmSymbolSpec("_Kette_".getBytes(StandardCharsets.UTF_8), 90, true)
        );
        // Ensure _unter_ is an L1 state so it can own an L2 trigram child state
        // (and Daten_ + _Schutz_ -> _Erklärung is the only valid chained 3-part compound).
        List<LmBigramSpec> bigrams = Arrays.asList(
                new LmBigramSpec("Daten_", "_Schutz_", 20),
                new LmBigramSpec("_Schutz_", "_Erklärung", 30),
                // Weak step (q = 120 > MAX_CHAINED_TRIPLE_EDGE_Q = 96) must not form a noisy 3-part chain
                new LmBigramSpec("Schwach_", "_Kette_", 120),
                new LmBigramSpec("_Kette_", "_Funktion", 20),
                new LmBigramSpec("_unter_", "und", 50)
        );
        List<LmTrigramSpec> trigrams = Collections.singletonList(
                // Reverse context order in Gboard NGramFst: parent=_unter_, child=Schilddrüsen_ -> future=_Funktion
                new LmTrigramSpec("_unter_", "Schilddrüsen_", "_Funktion", 12)
        );

        byte[] lmBytes = buildSyntheticLmWithTrigrams(symbols, bigrams, trigrams, 0.0676536f, 5);
        GboardLmReader.LmDictionaries dicts = GboardLmReader.readFromBytes(
                lmBytes, "de", true, GboardLmReader.DEFAULT_MAX_BIGRAMS, 0, 10);

        assertEquals(2, dicts.compoundWordCount);
        assertTrue(dicts.trie.containsWordIgnoreCase("Schilddrüsenunterfunktion"));
        assertEquals(
                "Schilddrüsenunterfunktion",
                dicts.trie.getWordForms(dicts.trie.findNode("schilddrusenunterfunktion")).get(0).displayWord);
        assertTrue(dicts.trie.containsWordIgnoreCase("Datenschutzerklärung"));
        assertFalse(dicts.trie.containsWordIgnoreCase("Schwachkettefunktion"));
        assertEquals(0, dicts.trie.lookupFrequency("schwachkettefunktion"));
    }

    @Test
    public void compactTrieSupportsBitmaskTraversalMultiFormsAndPostCompactInsertion() {
        MultiGlideTrie trie = new MultiGlideTrie(16);
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, "weg", 180, false, "de", true);
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, "Weg", 210, true, "de", true);
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, "Welt", 195, true, "de", true);
        trie.compact();

        assertEquals(2, trie.wordCount);
        assertTrue(trie.containsWordIgnoreCase("weg"));
        assertTrue(trie.containsWordIgnoreCase("Weg"));
        assertTrue(trie.containsWordIgnoreCase("Welt"));
        assertFalse(trie.containsWordIgnoreCase("Wege"));

        int wegNode = trie.findNode("weg");
        assertTrue(wegNode > 0);
        List<MultiGlideTrie.WordForm> wegForms = trie.getWordForms(wegNode);
        assertEquals(2, wegForms.size());
        assertEquals("Weg", wegForms.get(0).displayWord);
        assertTrue(wegForms.get(0).isProperNoun);
        assertEquals(210, wegForms.get(0).frequency);
        assertEquals("weg", wegForms.get(1).displayWord);
        assertFalse(wegForms.get(1).isProperNoun);
        assertEquals(180, wegForms.get(1).frequency);

        // Mutating after compact() (e.g. UserDictionary / session learning) preserves all existing entries
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, "weiter", 170, false, "de", true);
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, "schön", 205, false, "de", true);
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, "schon", 185, false, "de", true);
        trie.compact();
        assertEquals(4, trie.wordCount);
        assertEquals(210, trie.lookupFrequency("Weg"));
        assertEquals(210, trie.lookupFrequency("weg"));
        assertEquals(205, trie.lookupFrequency("schön"));
        assertEquals(185, trie.lookupFrequency("schon"));
        assertEquals(195, trie.lookupFrequency("Welt"));
        assertEquals(170, trie.lookupFrequency("weiter"));
    }

    // -------------------------------------------------------------------------
    // Binary Gboard .lm builder for hermetic unit tests
    // -------------------------------------------------------------------------

    static final class LmTrigramSpec {
        final String l1Parent;
        final String l2Child;
        final String future;
        final int qWeight;

        LmTrigramSpec(String l1Parent, String l2Child, String future, int qWeight) {
            this.l1Parent = l1Parent;
            this.l2Child = l2Child;
            this.future = future;
            this.qWeight = qWeight;
        }
    }

    static final class LmSymbolSpec {
        final byte[] raw;
        final int qWeight;
        final boolean compressed;

        LmSymbolSpec(byte[] raw, int qWeight, boolean compressed) {
            this.raw = raw;
            this.qWeight = qWeight;
            this.compressed = compressed;
        }
    }

    static final class LmBigramSpec {
        final String prev;
        final String next;
        final int qWeight;

        LmBigramSpec(String prev, String next, int qWeight) {
            this.prev = prev;
            this.next = next;
            this.qWeight = qWeight;
        }
    }

    static MultiGlideTrie loadGermanTestTrieFromSyntheticLm() throws IOException {
        List<LmSymbolSpec> symbols = Arrays.asList(
                new LmSymbolSpec("<epsilon>".getBytes(StandardCharsets.UTF_8), 255, false),
                new LmSymbolSpec("funktioniert".getBytes(StandardCharsets.UTF_8), 115, true),
                new LmSymbolSpec("funktioniere".getBytes(StandardCharsets.UTF_8), 150, false),
                new LmSymbolSpec("funktionieren".getBytes(StandardCharsets.UTF_8), 130, true),
                new LmSymbolSpec("funktion".getBytes(StandardCharsets.UTF_8), 140, false),
                new LmSymbolSpec("fromme".getBytes(StandardCharsets.UTF_8), 190, false),
                new LmSymbolSpec("frommer".getBytes(StandardCharsets.UTF_8), 205, false),
                new LmSymbolSpec("untersuchen".getBytes(StandardCharsets.UTF_8), 120, true),
                new LmSymbolSpec("untersuche".getBytes(StandardCharsets.UTF_8), 165, false),
                new LmSymbolSpec("in".getBytes(StandardCharsets.UTF_8), 65, true),
                new LmSymbolSpec("Freund".getBytes(StandardCharsets.UTF_8), 135, true),
                new LmSymbolSpec("Freunde".getBytes(StandardCharsets.UTF_8), 132, true),
                new LmSymbolSpec("vielleicht".getBytes(StandardCharsets.UTF_8), 105, true),
                new LmSymbolSpec("heute".getBytes(StandardCharsets.UTF_8), 90, true),
                new LmSymbolSpec("müssen".getBytes(StandardCharsets.UTF_8), 95, true)
        );
        byte[] lm = buildSyntheticLm(
                symbols,
                Collections.singletonList(new LmBigramSpec("funktioniert", "heute", 40)),
                0.0676536f,
                7);
        return GboardLmReader.readFromBytes(lm, "de", true, GboardLmReader.DEFAULT_MAX_BIGRAMS).trie;
    }

    /**
     * Builds a syntactically faithful Gboard v3 {@code .lm} binary containing a dummy leading chunk
     * (testing unaligned chunk file offsets), a {@code 0x2} {@code CompactLmFst} chunk, and a
     * {@code 0x20} {@code MarisaSymbolTable} chunk (testing 2-level nested Marisa tries + relabeling).
     */
    static byte[] buildSyntheticLm(
            List<LmSymbolSpec> symbols,
            List<LmBigramSpec> bigrams,
            float scale,
            int oddPaddingLen
    ) throws IOException {
        return buildSyntheticLmWithTrigrams(
                symbols, bigrams, Collections.emptyList(), scale, oddPaddingLen);
    }

    static byte[] buildSyntheticLmWithTrigrams(
            List<LmSymbolSpec> symbols,
            List<LmBigramSpec> bigrams,
            List<LmTrigramSpec> trigrams,
            float scale,
            int oddPaddingLen
    ) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        writeLeInt(out, GboardLmReader.LM_MAGIC);
        writeLeInt(out, 3);
        writeLeLong(out, 0L);

        // Leading dummy chunk to shift offsets off 16-byte boundaries
        byte[] dummy = new byte[oddPaddingLen];
        writeChunk(out, 0x40L, dummy);

        // Assign compressed IDs (for compressed == true)
        int numWords = symbols.size();
        Map<String, Integer> wordToCompId = new LinkedHashMap<>();
        List<Integer> compSymIds = new ArrayList<>();
        List<Integer> tailWeights = new ArrayList<>();
        for (int sym = 0; sym < numWords; sym++) {
            LmSymbolSpec s = symbols.get(sym);
            if (s.compressed) {
                int cid = compSymIds.size();
                compSymIds.add(sym);
                wordToCompId.put(new String(s.raw, StandardCharsets.UTF_8), cid);
            } else {
                tailWeights.add(s.qWeight);
            }
        }

        // Chunk 0x2
        long off2 = out.size() + 16L;
        byte[] chunk2 = buildCompactLmChunk(
                off2, symbols, bigrams, trigrams, compSymIds, tailWeights, wordToCompId, scale);
        writeChunk(out, 0x2L, chunk2);

        // Chunk 0x20
        long off20 = out.size() + 16L;
        byte[] chunk20 = buildMarisaChunk(off20, symbols);
        writeChunk(out, 0x20L, chunk20);

        return out.toByteArray();
    }

    private static byte[] buildCompactLmChunk(
            long chunkFileOffset,
            List<LmSymbolSpec> symbols,
            List<LmBigramSpec> bigrams,
            List<LmTrigramSpec> trigrams,
            List<Integer> compSymIds,
            List<Integer> tailWeights,
            Map<String, Integer> wordToCompId,
            float scale
    ) throws IOException {
        // Group bigrams by prev word compressed ID
        Map<Integer, List<int[]>> byPrevCid = new LinkedHashMap<>();
        for (LmBigramSpec b : bigrams) {
            Integer prevCid = wordToCompId.get(b.prev);
            Integer nextCid = wordToCompId.get(b.next);
            if (prevCid != null && nextCid != null) {
                byPrevCid.computeIfAbsent(prevCid, k -> new ArrayList<>())
                        .add(new int[] {nextCid, b.qWeight});
            }
        }
        // Group trigrams by L1 parent compressed ID -> list of (l2ChildCid, futureCid, qWeight)
        Map<Integer, List<int[]>> l2ByParentCid = new LinkedHashMap<>();
        for (LmTrigramSpec t : trigrams) {
            Integer pCid = wordToCompId.get(t.l1Parent);
            Integer cCid = wordToCompId.get(t.l2Child);
            Integer fCid = wordToCompId.get(t.future);
            if (pCid != null && cCid != null && fCid != null) {
                byPrevCid.computeIfAbsent(pCid, k -> new ArrayList<>());
                l2ByParentCid.computeIfAbsent(pCid, k -> new ArrayList<>())
                        .add(new int[] {cCid, fCid, t.qWeight});
            }
        }
        List<Integer> l1PrevCids = new ArrayList<>(byPrevCid.keySet());
        List<int[]> l2States = new ArrayList<>();
        for (int prevCid : l1PrevCids) {
            List<int[]> children = l2ByParentCid.get(prevCid);
            if (children != null) {
                l2States.addAll(children);
            }
        }
        int numStates = 1 + l1PrevCids.size() + l2States.size();

        int numFutures = compSymIds.size();
        for (List<int[]> lst : byPrevCid.values()) {
            numFutures += lst.size();
        }
        numFutures += l2States.size();

        // Build NGramFst block
        ByteArrayOutputStream ng = new ByteArrayOutputStream();
        writeLeLong(ng, numStates);
        writeLeLong(ng, numFutures);
        writeLeLong(ng, 0L); // numFinal

        // ctx_bv_: super-root '1','0', then state 0 has l1PrevCids.size() '1's + '0',
        // then each L1 state has its L2 child count '1's + '0', then each L2 state has '0'.
        int ctxBits = 2 * numStates + 1;
        byte[] ctxBv = new byte[((ctxBits + 63) / 64) * 8];
        setBit(ctxBv, 0);
        int cBitPos = 2;
        for (int i = 0; i < l1PrevCids.size(); i++) {
            setBit(ctxBv, cBitPos++);
        }
        cBitPos++; // 0 terminating state 0's children
        for (int prevCid : l1PrevCids) {
            List<int[]> children = l2ByParentCid.get(prevCid);
            if (children != null) {
                for (int i = 0; i < children.size(); i++) {
                    setBit(ctxBv, cBitPos++);
                }
            }
            cBitPos++; // 0 terminating this L1 state's children
        }
        ng.write(ctxBv);

        // fut_bv_: bit 0=0, state 0 unigrams (compSymIds.size() 1s) + 0, then each L1 state's 1s + 0, then each L2 state's 1 + 0
        int futBits = numFutures + numStates + 1;
        byte[] futBv = new byte[((futBits + 63) / 64) * 8];
        int bp = 1; // skip bit 0 (0)
        for (int i = 0; i < compSymIds.size(); i++) {
            setBit(futBv, bp++);
        }
        bp++; // 0 ends state 0
        for (int prevCid : l1PrevCids) {
            List<int[]> arcs = byPrevCid.get(prevCid);
            for (int i = 0; i < arcs.size(); i++) {
                setBit(futBv, bp++);
            }
            bp++;
        }
        for (int i = 0; i < l2States.size(); i++) {
            setBit(futBv, bp++);
            bp++;
        }
        ng.write(futBv);

        // fin_bv_ (all zeros)
        ng.write(new byte[((numStates + 63) / 64) * 8]);

        // ctx_words_: u16[numStates + 1] (index 0 = 0, index 1..l1 = l1PrevCids, index l1+1.. = l2ChildCids, trailing sentinel)
        writeLeShort(ng, 0);
        for (int prevCid : l1PrevCids) {
            writeLeShort(ng, prevCid);
        }
        for (int[] l2 : l2States) {
            writeLeShort(ng, l2[0]);
        }
        writeLeShort(ng, 0);

        // fut_words_ + fut_weights_
        ByteArrayOutputStream fw = new ByteArrayOutputStream();
        ByteArrayOutputStream fwt = new ByteArrayOutputStream();
        for (int cid = 0; cid < compSymIds.size(); cid++) {
            writeLeShort(fw, cid);
            fwt.write(symbols.get(compSymIds.get(cid)).qWeight & 0xFF);
        }
        for (int prevCid : l1PrevCids) {
            for (int[] arc : byPrevCid.get(prevCid)) {
                writeLeShort(fw, arc[0]);
                fwt.write(arc[1] & 0xFF);
            }
        }
        for (int[] l2 : l2States) {
            writeLeShort(fw, l2[1]);
            fwt.write(l2[2] & 0xFF);
        }
        ng.write(fw.toByteArray());

        // ctx_weights_: u8[numStates + 1]
        ng.write(new byte[numStates + 1]);
        ng.write(fwt.toByteArray());

        byte[] ngBytes = ng.toByteArray();

        ByteArrayOutputStream c2 = new ByteArrayOutputStream();
        c2.write(new byte[70]); // FstHeader placeholder
        writeLeInt(c2, symbols.size());
        writeLeInt(c2, tailWeights.size());
        c2.write(0); // quant byte
        writeLeFloat(c2, scale);
        writeLeLong(c2, ngBytes.length);

        padTo16(c2, chunkFileOffset);
        c2.write(ngBytes);

        // Align ngram_size to 8 bytes for bitset
        int ngPad = ((ngBytes.length + 7) & ~7) - ngBytes.length;
        if (ngPad > 0) c2.write(new byte[ngPad]);

        byte[] bitset = new byte[((symbols.size() + 63) / 64) * 8];
        for (int sym = 0; sym < symbols.size(); sym++) {
            if (symbols.get(sym).compressed) {
                setBit(bitset, sym);
            }
        }
        c2.write(bitset);
        for (int w : tailWeights) {
            c2.write(w & 0xFF);
        }
        return c2.toByteArray();
    }

    private static byte[] buildMarisaChunk(
            long chunkFileOffset,
            List<LmSymbolSpec> symbols
    ) throws IOException {
        byte[] marisaBytes = buildTwoLevelMarisaTrie(symbols);

        ByteArrayOutputStream c20 = new ByteArrayOutputStream();
        writeLeInt(c20, 2); // version
        byte[] name = "test".getBytes(StandardCharsets.US_ASCII);
        writeLeInt(c20, name.length);
        c20.write(name);
        writeLeInt(c20, 16); // digestLen
        c20.write(new byte[16]);
        writeLeLong(c20, marisaBytes.length);

        padTo16(c20, chunkFileOffset);
        c20.write(marisaBytes);

        // Relabel table: write u64 size placeholder + pad to 16 + (stride=3, byteLen=count*3, reversed mapping)
        int count = symbols.size();
        int relBytes = count * 3;
        writeLeLong(c20, 0L);
        padTo16(c20, chunkFileOffset);
        writeLeLong(c20, 3L);
        writeLeLong(c20, relBytes);
        // Map sym -> kid = (count - 1 - sym) so relabel table exercises non-identity lookup!
        for (int sym = 0; sym < count; sym++) {
            int val = (count - 1 - sym) + 1; // 1-based marisa key ID
            c20.write(val & 0xFF);
            c20.write((val >>> 8) & 0xFF);
            c20.write((val >>> 16) & 0xFF);
        }
        return c20.toByteArray();
    }

    /**
     * Encodes each symbol using a 2-level Marisa trie:
     * L0 has root (0) -> node (i+1) using first byte when len==1, or links to L1 child trie
     * holding the reversed full bytes of each symbol, exercising recursive + reversed decoding.
     */
    private static byte[] buildTwoLevelMarisaTrie(List<LmSymbolSpec> symbols) throws IOException {
        int count = symbols.size();
        // Put reversed symbols in L1 tail_buf to also exercise depth>0 node linking + TEXT_TAIL!
        // Specifically: split each symbol: L0 stores root->N nodes via links to L1, L1 has 1 link per key to tail_buf.
        // Reverse symbol storage order so L0 kid i -> symbol[count - 1 - i] matching relabel table above.
        List<byte[]> orderedKeys = new ArrayList<>(count);
        for (int i = count - 1; i >= 0; i--) {
            orderedKeys.add(symbols.get(i).raw);
        }

        // L1: each key gets 1 node (first reversed byte -> last byte of word? Wait: depth>0 edge+parent, with parent=0 so node string = tail!).
        // To test multi-byte L1 parent+edge concatenation, encode L1 nodes directly as 1 node per key with a link to TEXT_TAIL.
        ByteArrayOutputStream l1TailBuf = new ByteArrayOutputStream();
        int[] l1Offsets = new int[count];
        for (int i = 0; i < count; i++) {
            l1Offsets[i] = l1TailBuf.size();
            l1TailBuf.write(orderedKeys.get(i));
            l1TailBuf.write(0);
        }

        ByteArrayOutputStream m = new ByteArrayOutputStream();
        m.write("We love Marisa.\0".getBytes(StandardCharsets.US_ASCII));

        // L0: root (node 0) has `count` children (nodes 1..count), all terminal, all linked to L1 node (i+1)
        int l0Nodes = count + 1;
        writeSimpleFlatLoudsBv(m, count); // louds: root has `count` children, each leaf has 0 children
        writeTermBvAllChildren(m, l0Nodes); // term: 0 at root, 1 at 1..count
        writeTermBvAllChildren(m, l0Nodes); // links: 0 at root, 1 at 1..count
        byte[] l0Bases = new byte[l0Nodes];
        for (int i = 0; i < count; i++) {
            l0Bases[i + 1] = (byte) ((i + 1) & 0xFF);
        }
        writeMarisaVec(m, l0Bases);
        writeMarisaFlatVec16HighByte(m, count, i -> (i + 1) >>> 8);
        writeMarisaVec(m, new byte[0]); // empty tail_buf -> recurse into L1
        writeEmptyMarisaBv(m); // tail_end

        // L1: root (node 0) has `count` children (nodes 1..count), no term needed, all linked to l1TailBuf offsets
        writeSimpleFlatLoudsBv(m, count);
        writeEmptyMarisaBv(m); // term
        writeTermBvAllChildren(m, l0Nodes); // links
        byte[] l1Bases = new byte[l0Nodes];
        for (int i = 0; i < count; i++) {
            l1Bases[i + 1] = (byte) (l1Offsets[i] & 0xFF);
        }
        writeMarisaVec(m, l1Bases);
        writeMarisaFlatVec16HighByte(m, count, i -> l1Offsets[i] >>> 8);
        writeMarisaVec(m, l1TailBuf.toByteArray());
        writeEmptyMarisaBv(m); // tail_end (TEXT_TAIL)
        // L1 trailing cache + num_l1 + cfg
        writeMarisaVec(m, new byte[0]);
        writeLeInt(m, 0);
        writeLeInt(m, 0);

        // L0 trailing cache + num_l1 + cfg
        writeMarisaVec(m, new byte[0]);
        writeLeInt(m, 0);
        writeLeInt(m, 0);

        return m.toByteArray();
    }

    private interface IntUnaryOp {
        int apply(int v);
    }

    private static void writeSimpleFlatLoudsBv(ByteArrayOutputStream out, int numChildren) throws IOException {
        // Super-root: '1','0'; Node 0 (root): numChildren '1's + '0'; each child node: '0'
        int totalBits = 2 + numChildren + 1 + numChildren;
        byte[] units = new byte[((totalBits + 63) / 64) * 8];
        setBit(units, 0); // 1 (enter node 0)
        // bit 1 is 0 (end super-root)
        int pos = 2;
        for (int i = 0; i < numChildren; i++) {
            setBit(units, pos++);
        }
        // remaining bits (1 zero for root + numChildren zeros for leaves) are already 0!
        writeMarisaBitVector(out, units, totalBits, numChildren + 1);
    }

    private static void writeTermBvAllChildren(ByteArrayOutputStream out, int totalNodes) throws IOException {
        byte[] units = new byte[((totalNodes + 63) / 64) * 8];
        for (int i = 1; i < totalNodes; i++) {
            setBit(units, i);
        }
        writeMarisaBitVector(out, units, totalNodes, Math.max(0, totalNodes - 1));
    }

    private static void writeEmptyMarisaBv(ByteArrayOutputStream out) throws IOException {
        writeMarisaBitVector(out, new byte[0], 0, 0);
    }

    private static void writeMarisaBitVector(
            ByteArrayOutputStream out,
            byte[] units,
            int size,
            int num1s
    ) throws IOException {
        writeMarisaVec(out, units);
        writeLeInt(out, size);
        writeLeInt(out, num1s);
        // 3 empty accelerator vectors (select0, select1, rank1s)
        writeMarisaVec(out, new byte[0]);
        writeMarisaVec(out, new byte[0]);
        writeMarisaVec(out, new byte[0]);
    }

    private static void writeMarisaFlatVec16HighByte(
            ByteArrayOutputStream out,
            int count,
            IntUnaryOp highByteFn
    ) throws IOException {
        byte[] units = new byte[count];
        for (int i = 0; i < count; i++) {
            units[i] = (byte) (highByteFn.apply(i) & 0xFF);
        }
        writeMarisaVec(out, units);
        writeLeInt(out, 8); // val_size = 8 bits
        writeLeInt(out, 0xFF); // mask
        writeLeLong(out, count);
    }

    private static void writeMarisaVec(ByteArrayOutputStream out, byte[] data) throws IOException {
        writeLeLong(out, data.length);
        out.write(data);
        int rem = data.length & 7;
        if (rem != 0) {
            out.write(new byte[8 - rem]);
        }
    }

    private static void writeChunk(ByteArrayOutputStream out, long type, byte[] data) throws IOException {
        writeLeLong(out, type);
        writeLeLong(out, data.length);
        out.write(data);
    }

    private static void padTo16(ByteArrayOutputStream out, long chunkFileOffset) throws IOException {
        long abs = chunkFileOffset + out.size();
        int rem = (int) (abs & 15L);
        if (rem != 0) {
            out.write(new byte[16 - rem]);
        }
    }

    private static void setBit(byte[] buf, int bit) {
        buf[bit >>> 3] |= (byte) (1 << (bit & 7));
    }

    private static void writeLeShort(ByteArrayOutputStream out, int v) {
        out.write(v & 0xFF);
        out.write((v >>> 8) & 0xFF);
    }

    private static void writeLeInt(ByteArrayOutputStream out, int v) {
        out.write(v & 0xFF);
        out.write((v >>> 8) & 0xFF);
        out.write((v >>> 16) & 0xFF);
        out.write((v >>> 24) & 0xFF);
    }

    private static void writeLeFloat(ByteArrayOutputStream out, float f) {
        writeLeInt(out, Float.floatToRawIntBits(f));
    }

    private static void writeLeLong(ByteArrayOutputStream out, long v) {
        for (int i = 0; i < 8; i++) {
            out.write((int) ((v >>> (i * 8)) & 0xFF));
        }
    }
}
