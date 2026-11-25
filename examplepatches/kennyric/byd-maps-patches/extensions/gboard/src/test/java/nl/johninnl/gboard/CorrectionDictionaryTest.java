package nl.johninnl.gboard;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class CorrectionDictionaryTest {
    private static CorrectionDictionary dictionary(String... words) {
        BpeTokenizer tokenizer = DictionaryTestSupport.letters();
        return new CorrectionDictionary(Arrays.asList(words), DictionaryTestSupport.dutch(),
                DictionaryTestSupport.common("vos", "bakker", "visser", "de", "het"), tokenizer, new HotwordVocab(tokenizer));
    }

    @Test
    public void cleansEntriesSoSherpaReadsThemAsOnePhrase() {
        assertEquals("Jan Bakker", CorrectionDictionary.clean("  Jan \n Bakker "));
        assertEquals("AC DC", CorrectionDictionary.clean("AC/DC"));
        assertEquals("smile", CorrectionDictionary.clean(":smile"));
        assertNull(CorrectionDictionary.clean("someone@example.com"));
        assertNull(CorrectionDictionary.clean("+31 6 1234"));
        assertNull(CorrectionDictionary.clean("a b c d e f g"));
    }

    @Test
    public void leavesOutEntriesMadeOfOrdinaryWords() {
        CorrectionDictionary d = dictionary("Vos", "Bakker", "Jan Bakker", "Hoekstra", "Visser");
        assertEquals(Arrays.asList("Jan Bakker", "Hoekstra"), d.boosted);
        assertEquals(Arrays.asList("Vos", "Bakker", "Visser"), d.ordinary);
        assertEquals("Jan Bakker :2.5/Hoekstra :2.5", d.hotwords);
    }

    @Test
    public void skipsEntriesTheVocabularyCannotSpell() {
        CorrectionDictionary d = dictionary("Hoekstra", "Zoë");
        assertEquals(Collections.singletonList("Hoekstra"), d.boosted);
        assertEquals(Collections.singletonList("Zoë"), d.unsupported);
    }

    @Test
    public void undoesCapitalsTheBoostAddedToOrdinaryWords() {
        CorrectionDictionary d = dictionary("Timmermans");
        assertEquals("De timmerman maakt een deur.", d.restoreOrdinaryCase("De Timmerman maakt een deur."));
        assertEquals("Timmerman komt. Timmermans ook.", d.restoreOrdinaryCase("Timmerman komt. Timmermans ook."));
    }

    @Test
    public void treatsHyphenatedNamesAsOneWord() {
        CorrectionDictionary d = dictionary("Oud-Beijerland");
        assertEquals("We gaan naar Oud-Beiland.", d.restoreOrdinaryCase("We gaan naar Oud-Beiland."));
    }

    @Test
    public void boostsNamesThatAreOnlyRareWords() {
        // "timmerman" is common enough never to be corrected, but not so frequent that a name like it is skipped.
        assertEquals(Arrays.asList("Timmerman"), dictionary("Timmerman").boosted);
    }

    @Test
    public void keepsACorrectionOnlyWhenTheSecondDecodeWritesIt() {
        CorrectionDictionary d = dictionary("Oud-Beijerland", "Coolsingel");
        Map<String, String> outputs = new HashMap<>();
        outputs.put(d.hotwords, "We rijden naar Oud-Bijland en de Koolsingel.");
        outputs.put("Oud-Beijerland :3.0", "We rijden naar Oud-Beijerland en de Koolsingel.");
        outputs.put("Coolsingel :3.0", "We rijden naar Oud-Bijland en de Koolsingelweg.");
        DictionaryDecoder.Result result = DictionaryDecoder.transcribe(outputs::get, d);
        assertEquals(2, result.proposed.size());
        assertEquals(1, result.accepted.size());
        assertEquals("We rijden naar Oud-Beijerland en de Koolsingel.", result.text);
    }

    @Test
    public void ignoresASecondDecodeThatOnlyRepeatsWhatWasThere() {
        CorrectionDictionary d = dictionary("Coolsingel");
        Map<String, String> outputs = new HashMap<>();
        outputs.put(d.hotwords, "Van de Coolsingel naar de Koolsingel.");
        outputs.put("Coolsingel :3.0", "Van de Coolsingel naar de Koolsingel.");
        assertEquals("Van de Coolsingel naar de Koolsingel.", DictionaryDecoder.transcribe(outputs::get, d).text);
    }

    @Test
    public void decodesOnceWhenNothingSoundsLikeAnEntry() {
        CorrectionDictionary d = dictionary("Hoekstra");
        int[] calls = {0};
        DictionaryDecoder.Result result = DictionaryDecoder.transcribe(hotwords -> {
            calls[0]++;
            return "Op de hoek van de straat.";
        }, d);
        assertEquals("Op de hoek van de straat.", result.text);
        assertEquals(1, calls[0]);
    }

    @Test
    public void matchesWholeWordsOnly() {
        assertTrue(DictionaryDecoder.containsWord("Naar Oud-Beijerland.", "Oud-Beijerland"));
        assertTrue(!DictionaryDecoder.containsWord("de Morphepatjes", "Morphe"));
        assertTrue(!DictionaryDecoder.containsWord("de morphe", "Morphe"));
    }
}
