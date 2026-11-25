package nl.johninnl.gboard;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public class SoundAlikeTest {
    private static final List<String> ENTRIES = Arrays.asList("Oud-Beijerland", "Prins Hendrikkade", "Coolsingel",
            "Codeberg", "Vela", "Hoekstra", "Parakeet", "Bloemgracht", "Ruijsdael", "Vreeswijk", "Timmermans");

    private static String apply(String text) {
        List<SoundAlike.Proposal> proposals = new SoundAlike(ENTRIES, DictionaryTestSupport.dutch()).propose(text);
        StringBuilder out = new StringBuilder(text);
        for (int i = proposals.size() - 1; i >= 0; i--) {
            SoundAlike.Proposal p = proposals.get(i);
            out.replace(p.start, p.end, p.entry);
        }
        return out.toString();
    }

    @Test
    public void proposesSoundAlikeSpellings() {
        assertEquals("We rijden morgen naar Oud-Beijerland en daarna naar Zwijndrecht.",
                apply("We rijden morgen naar Oud-Bijland en daarna naar Zwijndrecht."));
        assertEquals("Navigeer naar de Coolsingel.", apply("Navigeer naar de Koolsingel."));
        assertEquals("Ruijsdael heeft het gepusht.", apply("Ruisdaal heeft het gepusht."));
        assertEquals("De vergadering met Vreeswijk.", apply("De vergadering met Vreswijk."));
        assertEquals("Vraag het in Codeberg.", apply("Vraag het in Codenberg."));
    }

    @Test
    public void joinsWordsTheRecognizerSplit() {
        assertEquals("Navigeer naar Prins Hendrikkade 33 in Amsterdam.",
                apply("Navigeer naar Prins Hendrik de 33 in Amsterdam."));
    }

    @Test
    public void neverSwallowsANeighbouringWordOrNumber() {
        assertEquals("Het adres is Bloemgracht 42 in Amsterdam.", apply("Het adres is Blomgracht 42 in Amsterdam."));
        assertEquals("Ik heb Parakeet en Vela.", apply("Ik heb paraket en Vela."));
    }

    @Test
    public void neverSwallowsATrailingWordAfterACommonEntry() {
        // "parakeet" is an ordinary English word, so the single word is skipped; "Parakeet en" must not match.
        List<String> entries = Arrays.asList("Parakeet");
        java.util.Set<String> common = DictionaryTestSupport.common("parakeet", "en", "ik", "heb");
        assertTrue(new SoundAlike(entries, common).propose("Ik heb Parakeet en Vela.").isEmpty());
    }

    @Test
    public void leavesOrdinaryWordsAlone() {
        for (String sentence : Arrays.asList(
                "Er waren vele mensen op het plein.",
                "Op de hoek van de straat staat een bakker.",
                "Er zitten veel pakketen in het park.",
                "De code staat al klaar op de server.",
                "De timmerman maakt een nieuwe deur.",
                "Het oude bos bij wijk is mooi.")) {
            assertEquals(sentence, apply(sentence));
        }
    }

    @Test
    public void exactEntriesNeedNoProposal() {
        assertTrue(new SoundAlike(ENTRIES, DictionaryTestSupport.dutch()).propose("Zet Vela aan bij de Coolsingel.").isEmpty());
    }

    @Test
    public void keyMergesDutchSpellingsOfOneSound() {
        assertEquals(SoundAlike.key("Ruijsdael"), SoundAlike.key("Ruysdal"));
        assertEquals(SoundAlike.key("Coolsingel"), SoundAlike.key("Koolsingel"));
        assertEquals(SoundAlike.key("Vreeswijk"), SoundAlike.key("Vreswyk"));
    }
}
