package dev.srwi.gintype.extension.multiglide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import dev.srwi.gintype.extension.multiglide.GboardMultiGlideDictionaryManager.LanguagePack;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

public class MultiGlideMultilingualDecoderTest {

    private MultiGlideGeometry geom;
    private LanguagePack dePack;
    private LanguagePack enPack;
    private List<LanguagePack> deEnPacks;

    @Before
    public void setUp() {
        geom = MultiGlideGeometry.createStandardLayout(1080f, 600f, true);

        MultiGlideTrie deTrie = new MultiGlideTrie(256);
        MultiGlideBigramTable deBigrams = new MultiGlideBigramTable();
        insert(deTrie, "ich", 240, "de");
        insert(deTrie, "habe", 220, "de");
        insert(deTrie, "guten", 200, "de");
        insert(deTrie, "Tag", 210, "de");
        insert(deTrie, "Haus", 215, "de");
        insert(deTrie, "aber", 230, "de");
        deTrie.compact();
        deBigrams.put("guten", "Tag", 200);
        deBigrams.freeze();
        dePack = new LanguagePack("de", deTrie, deBigrams);

        MultiGlideTrie enTrie = new MultiGlideTrie(256);
        MultiGlideBigramTable enBigrams = new MultiGlideBigramTable();
        insert(enTrie, "really", 230, "en");
        insert(enTrie, "nice", 220, "en");
        insert(enTrie, "tag", 210, "en");
        insert(enTrie, "house", 225, "en");
        insert(enTrie, "think", 220, "en");
        enTrie.compact();
        enBigrams.put("nice", "tag", 200);
        enBigrams.freeze();
        enPack = new LanguagePack("en", enTrie, enBigrams);

        deEnPacks = Arrays.asList(dePack, enPack);
    }

    private static void insert(MultiGlideTrie trie, String word, int freq, String lang) {
        MultiGlideDictionaryLoader.insertWordIntoTrie(trie, word, freq, false, lang, false);
    }

    private MultiGlideInputToken swipeToken(int streamId, long tStart, char... keys) {
        List<MultiGlideInputToken.TouchPoint> pts = new ArrayList<>();
        long t = tStart;
        float pathLen = 0f;
        for (int i = 0; i < keys.length; i++) {
            MultiGlideGeometry.KeySpec ks = geom.keySpec(keys[i]);
            float x = ks.centerX;
            float y = ks.centerY;
            if (!pts.isEmpty()) {
                MultiGlideInputToken.TouchPoint prev = pts.get(pts.size() - 1);
                pathLen += (float) Math.hypot(x - prev.x, y - prev.y);
            }
            pts.add(new MultiGlideInputToken.TouchPoint(x, y, t, streamId));
            if (i + 1 < keys.length) {
                MultiGlideGeometry.KeySpec nextKs = geom.keySpec(keys[i + 1]);
                float nx = nextKs.centerX;
                float ny = nextKs.centerY;
                float mx = (x + nx) * 0.5f;
                float my = (y + ny) * 0.5f;
                pathLen += (float) Math.hypot(mx - x, my - y);
                pts.add(new MultiGlideInputToken.TouchPoint(mx, my, t + 15L, streamId));
            }
            t += 30L;
        }
        return MultiGlideInputToken.swipe(streamId, streamId, pts, pathLen, tStart, t);
    }

    @Test
    public void decodesSecondaryLanguageWordWhenGermanIsPrimaryAndEnglishIsSecondary() {
        KineticaDtwDecoder decoder = new KineticaDtwDecoder();
        List<MultiGlideInputToken> tokens = Collections.singletonList(
                swipeToken(0, 100L, 'h', 'o', 'u', 's', 'e'));

        List<WordCandidate> results = MultiGlideMultilingualDecoder.decodeAcrossPacks(
                decoder, tokens, deEnPacks, geom, "nice", "really nice ");
        assertNotNull(results);
        assertFalse(results.isEmpty());
        assertEquals("house", results.get(0).word);
    }

    @Test
    public void switchesLanguageSeamlesslyMidSentence() {
        KineticaDtwDecoder decoder = new KineticaDtwDecoder();
        // German context before cursor, but unambiguous English swipe "house"
        List<MultiGlideInputToken> tokens = Collections.singletonList(
                swipeToken(0, 100L, 'h', 'o', 'u', 's', 'e'));

        List<WordCandidate> results = MultiGlideMultilingualDecoder.decodeAcrossPacks(
                decoder, tokens, deEnPacks, geom, "habe", "ich habe ");
        assertFalse(results.isEmpty());
        assertEquals("house", results.get(0).word);
    }

    @Test
    public void breaksTiesAndCaseConflictsUsingSentenceContextLanguage() {
        KineticaDtwDecoder decoder = new KineticaDtwDecoder();
        List<MultiGlideInputToken> tagTokens = Collections.singletonList(
                swipeToken(0, 100L, 't', 'a', 'g'));

        // German context -> "Tag" wins over English "tag"
        assertEquals("de", MultiGlideMultilingualDecoder.inferContextLanguage("ich habe guten ", deEnPacks));
        List<WordCandidate> deResults = MultiGlideMultilingualDecoder.decodeAcrossPacks(
                decoder, tagTokens, deEnPacks, geom, "guten", "ich habe guten ");
        assertFalse(deResults.isEmpty());
        assertEquals("Tag", deResults.get(0).word);

        // English context -> "tag" wins over German "Tag"
        assertEquals("en", MultiGlideMultilingualDecoder.inferContextLanguage("really nice ", deEnPacks));
        List<WordCandidate> enResults = MultiGlideMultilingualDecoder.decodeAcrossPacks(
                decoder, tagTokens, deEnPacks, geom, "nice", "really nice ");
        assertFalse(enResults.isEmpty());
        assertEquals("tag", enResults.get(0).word);

        // Neutral/empty context -> primary language ("de") breaks tie
        assertNull(MultiGlideMultilingualDecoder.inferContextLanguage("", deEnPacks));
        List<WordCandidate> neutralResults = MultiGlideMultilingualDecoder.decodeAcrossPacks(
                decoder, tagTokens, deEnPacks, geom, null, "");
        assertFalse(neutralResults.isEmpty());
        assertEquals("Tag", neutralResults.get(0).word);
    }

    @Test
    public void smartTapSwipeSplitSupportsOneLetterWordsFromSecondaryActiveLanguage() {
        List<String> deOnly = Collections.singletonList("de");
        List<String> deEn = Arrays.asList("de", "en");

        assertFalse(SmartTapSwipeSplitJudge.canStandAlone("a", deOnly, 0));
        assertFalse(SmartTapSwipeSplitJudge.canStandAlone("i", deOnly, 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("a", deEn, 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("i", deEn, 0));
        assertEquals("I", SmartTapSwipeSplitJudge.contextForm("i", deEn));
        assertEquals("i", SmartTapSwipeSplitJudge.contextForm("i", deOnly));
    }

    @Test
    public void attributesCommittedWordsToMatchingLanguagePack() {
        assertEquals("en", MultiGlideMultilingualDecoder.resolveCommitLanguage(
                "house", "nice", deEnPacks, "de"));
        assertEquals("de", MultiGlideMultilingualDecoder.resolveCommitLanguage(
                "Haus", "ich", deEnPacks, "de"));
        assertEquals("en", MultiGlideMultilingualDecoder.resolveCommitLanguage(
                "tag", "nice", deEnPacks, "de"));
        assertEquals("de", MultiGlideMultilingualDecoder.resolveCommitLanguage(
                "Tag", "guten", deEnPacks, "de"));
        // OOV word falls back to primary language
        assertEquals("de", MultiGlideMultilingualDecoder.resolveCommitLanguage(
                "xyzzy", null, deEnPacks, "de"));
    }
}
