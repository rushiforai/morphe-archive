package dev.srwi.gintype.extension.multiglide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

public class SmartTapSwipeSplitJudgeTest {

    private static WordCandidate cand(String word, float score) {
        return new WordCandidate(word, score, 0f, 0f, 0f);
    }

    @Test
    public void oneLetterAllowlistRespectsLanguage() {
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("a", "en", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("I", "en-US", 0));
        assertFalse(SmartTapSwipeSplitJudge.canStandAlone("b", "en", 200));

        assertFalse(SmartTapSwipeSplitJudge.canStandAlone("a", "de", 200));
        assertFalse(SmartTapSwipeSplitJudge.canStandAlone("i", "de-DE", 200));

        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("y", "es", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("é", "pt_BR", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("à", "fr", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("w", "pl", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("v", "cs", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("a", "hu", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("å", "nb", 0));
        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("u", "nl", 0));
    }

    @Test
    public void contextFormCapitalizesEnglishPronounI() {
        assertEquals("I", SmartTapSwipeSplitJudge.contextForm("i", "en"));
        assertEquals("a", SmartTapSwipeSplitJudge.contextForm("a", "en"));
        assertEquals("i", SmartTapSwipeSplitJudge.contextForm("i", "it"));
    }

    @Test
    public void splitsShortGermanTapPrefixWhenCombinedFailsOrIsWeak() {
        List<WordCandidate> none = Collections.emptyList();
        List<WordCandidate> split = Collections.singletonList(cand("gut", 0.62f));

        assertTrue(SmartTapSwipeSplitJudge.shouldSplit(
                "so", "de", 140, 0.3f, none, split));
        assertFalse(SmartTapSwipeSplitJudge.shouldSplit(
                "xz", "de", 0, 0f, none, split));
        assertFalse(SmartTapSwipeSplitJudge.shouldSplit(
                "so", "de", 3, 0f, none, split));
    }

    @Test
    public void keepsRealCombinedWordsTogether() {
        // "so" + "fort" -> "sofort" (strong combined match)
        assertFalse(SmartTapSwipeSplitJudge.shouldSplit(
                "so",
                "de",
                140,
                0f,
                Collections.singletonList(cand("sofort", 0.55f)),
                Collections.singletonList(cand("fort", 0.58f))));

        // "a" + "bout" -> "about" (1-letter prefix requires high margin)
        assertFalse(SmartTapSwipeSplitJudge.shouldSplit(
                "a",
                "en",
                220,
                0f,
                Collections.singletonList(cand("about", 0.50f)),
                Collections.singletonList(cand("bout", 0.45f))));

        // "a" + "lot" -> "a lot" (no strong combined match)
        assertTrue(SmartTapSwipeSplitJudge.shouldSplit(
                "a",
                "en",
                220,
                0.2f,
                Collections.singletonList(cand("alot", 0.08f)),
                Collections.singletonList(cand("lot", 0.65f))));
    }

    @Test
    public void rejectsNonLetterOrOverlongPrefixes() {
        assertFalse(SmartTapSwipeSplitJudge.isEligibleTapPrefix(""));
        assertFalse(SmartTapSwipeSplitJudge.isEligibleTapPrefix("a1"));
        assertFalse(SmartTapSwipeSplitJudge.isEligibleTapPrefix("abcdefg"));
        assertTrue(SmartTapSwipeSplitJudge.isEligibleTapPrefix("gut"));
        assertTrue(SmartTapSwipeSplitJudge.isEligibleTapPrefix("shew"));

        assertTrue(SmartTapSwipeSplitJudge.canStandAlone("them", "en", 150));
        assertFalse(SmartTapSwipeSplitJudge.canStandAlone("shew", "en", 10));
    }

    @Test
    public void evaluatesMidTapCutForSheWouldAndPrefersFullPrefixForThemIs() {
        List<MultiGlideInputToken> shewTaps = Arrays.asList(
                MultiGlideInputToken.tap(0, 's', 10f, 10f, 10L, 15L),
                MultiGlideInputToken.tap(0, 'h', 20f, 10f, 20L, 25L),
                MultiGlideInputToken.tap(0, 'e', 30f, 10f, 30L, 35L),
                MultiGlideInputToken.tap(0, 'w', 40f, 10f, 40L, 45L));
        List<MultiGlideInputToken> oulSwipe = Collections.singletonList(
                MultiGlideInputToken.swipe(0, Collections.emptyList(), 50f, 50L, 100L));

        MultiGlideWordSession.DecodePort sheWouldDecoder = new MultiGlideWordSession.DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                if (tokens.size() == 5) {
                    return Collections.singletonList(cand("shrikes", 0.10f));
                }
                if (tokens.size() == 2 && tokens.get(0).character == 'w') {
                    return Collections.singletonList(cand("would", 0.85f));
                }
                return Collections.emptyList();
            }

            @Override
            public String activeLanguage() {
                return "en";
            }

            @Override
            public int lookupWordFrequency(String word) {
                if ("she".equalsIgnoreCase(word)) return 210;
                if ("shew".equalsIgnoreCase(word)) return 2;
                return 0;
            }
        };

        SmartTapSwipeSplitJudge.Evaluation sheEval = SmartTapSwipeSplitJudge.evaluateBestSplit(
                "shew", shewTaps, oulSwipe, "", sheWouldDecoder);
        assertTrue(sheEval.isSplit());
        assertEquals(3, sheEval.splitIndex);
        assertEquals("would", sheEval.splitCandidates.get(0).word);

        // "them" + swipe "is" should prefer k=4 ("them" + "is") over k=3 ("the" + "miss")
        List<MultiGlideInputToken> themTaps = Arrays.asList(
                MultiGlideInputToken.tap(0, 't', 10f, 10f, 10L, 15L),
                MultiGlideInputToken.tap(0, 'h', 20f, 10f, 20L, 25L),
                MultiGlideInputToken.tap(0, 'e', 30f, 10f, 30L, 35L),
                MultiGlideInputToken.tap(0, 'm', 40f, 10f, 40L, 45L));
        List<MultiGlideInputToken> isSwipe = Collections.singletonList(
                MultiGlideInputToken.swipe(0, Collections.emptyList(), 50f, 50L, 100L));

        MultiGlideWordSession.DecodePort themIsDecoder = new MultiGlideWordSession.DecodePort() {
            @Override
            public List<WordCandidate> decode(List<MultiGlideInputToken> tokens, String prevWord) {
                if (tokens.size() == 5) {
                    return Collections.emptyList();
                }
                if (tokens.size() == 1) {
                    return Collections.singletonList(cand("is", 0.70f));
                }
                if (tokens.size() == 2 && tokens.get(0).character == 'm') {
                    return Collections.singletonList(cand("miss", 0.70f));
                }
                return Collections.emptyList();
            }

            @Override
            public String activeLanguage() {
                return "en";
            }

            @Override
            public int lookupWordFrequency(String word) {
                if ("the".equalsIgnoreCase(word)) return 255;
                if ("them".equalsIgnoreCase(word)) return 200;
                return 0;
            }
        };

        SmartTapSwipeSplitJudge.Evaluation themEval = SmartTapSwipeSplitJudge.evaluateBestSplit(
                "them", themTaps, isSwipe, "", themIsDecoder);
        assertTrue(themEval.isSplit());
        assertEquals(4, themEval.splitIndex);
        assertEquals("is", themEval.splitCandidates.get(0).word);
    }
}
