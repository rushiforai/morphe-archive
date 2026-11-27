package dev.jason.gboardpatches.extension.sharedmodel;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.SuggestionSpan;
import android.view.textservice.SentenceSuggestionsInfo;
import android.view.textservice.SuggestionsInfo;
import android.view.textservice.TextInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, manifest = Config.NONE)
public class SharedAndroidGrammarTest {
    @Test public void mergesLocalGrammarWithoutLosingAnIndependentSpellingSuggestion() {
        TextInfo input = new TextInfo("They was happi", 9, 4);
        SuggestionsInfo competing = spelling("were");
        SuggestionsInfo independent = spelling("happy");
        SentenceSuggestionsInfo stock = new SentenceSuggestionsInfo(
                new SuggestionsInfo[]{competing, independent}, new int[]{5, 9}, new int[]{3, 5});

        SentenceSuggestionsInfo result = SharedAndroidGrammar.merge(input, stock,
                GrammarEdits.between(input.getText(), "They were happi"));

        assertEquals(2, result.getSuggestionsCount());
        assertSame(independent, result.getSuggestionsInfoAt(0));
        assertEquals(9, result.getOffsetAt(0));
        SuggestionsInfo grammar = result.getSuggestionsInfoAt(1);
        assertEquals(5, result.getOffsetAt(1));
        assertEquals(3, result.getLengthAt(1));
        assertEquals(9, grammar.getCookie());
        assertEquals(4, grammar.getSequence());
        assertEquals("were", grammar.getSuggestionAt(0));
        assertTrue((grammar.getSuggestionsAttributes()
                & SuggestionsInfo.RESULT_ATTR_LOOKS_LIKE_GRAMMAR_ERROR) != 0);
    }

    @Test public void clearsOlderOverlappingGrammarBeforeShowingAnUpdatedRange() {
        SpannableString draft = new SpannableString("They was happy.");
        draft.setSpan(new SuggestionSpan(RuntimeEnvironment.getApplication(),
                        new String[]{" were"}, SuggestionSpan.FLAG_GRAMMAR_ERROR),
                4, 8, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        TextInfo input = new TextInfo(draft, 0, draft.length(), 9, 4);

        SentenceSuggestionsInfo result = SharedAndroidGrammar.merge(input, null,
                GrammarEdits.between(input.getText(), "They were happy."));

        assertEquals(2, result.getSuggestionsCount());
        assertEquals(4, result.getOffsetAt(0));
        assertEquals(4, result.getLengthAt(0));
        assertEquals(SuggestionsInfo.RESULT_ATTR_IN_THE_DICTIONARY,
                result.getSuggestionsInfoAt(0).getSuggestionsAttributes());
        assertEquals(5, result.getOffsetAt(1));
        assertEquals("were", result.getSuggestionsInfoAt(1).getSuggestionAt(0));
    }

    @Test public void dropsOnlyAnEarlierVersionOfTheCurrentSentence() {
        assertTrue(SharedAndroidGrammar.isEarlierPrefix("They was happy.", "They was "));
        assertFalse(SharedAndroidGrammar.isEarlierPrefix("They was happy.", "They was happy."));
        assertFalse(SharedAndroidGrammar.isEarlierPrefix("They was happy. They was ready.", "They was happy."));
        assertFalse(SharedAndroidGrammar.isEarlierPrefix("They was happy.", "was happy."));
        assertFalse(SharedAndroidGrammar.isEarlierPrefix(null, "They was"));
    }

    private static SuggestionsInfo spelling(String alternative) {
        return new SuggestionsInfo(SuggestionsInfo.RESULT_ATTR_LOOKS_LIKE_TYPO,
                new String[]{alternative}, 9, 4);
    }
}
