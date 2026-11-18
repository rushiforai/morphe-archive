package nl.johninnl.gboard;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.junit.Test;

public class BpeTokenizerTest {
    private static final String S = BpeTokenizer.SPACE;

    /** ids: 0 <unk>, 1 ▁, 2 a, 3 b, 4 c, 5 ▁a, 6 ab, 7 ▁ab, 8 bc */
    static BpeTokenizer tiny() {
        String json = "{\"model\":{\"type\":\"BPE\",\"vocab\":{\"<unk>\":0,\"" + S + "\":1,\"a\":2,\"b\":3,\"c\":4,\""
                + S + "a\":5,\"ab\":6,\"" + S + "ab\":7,\"bc\":8},\"merges\":[[\"" + S + "\",\"a\"],[\"a\",\"b\"],[\""
                + S + "a\",\"b\"],[\"b\",\"c\"]]}}";
        return BpeTokenizer.fromJson(json);
    }

    @Test
    public void appliesTheLowestRankedMergeFirst() {
        // ▁a (rank 0) wins over ab (rank 1); then ▁ab (rank 2) over bc (rank 3).
        assertEquals(Arrays.asList(S + "ab", "c"), tiny().encodeWord("abc"));
    }

    @Test
    public void readsMergesWrittenAsStrings() {
        String json = "{\"model\":{\"type\":\"BPE\",\"vocab\":{\"" + S + "\":0,\"x\":1,\"" + S + "x\":2},\"merges\":[\""
                + S + " x\"]}}";
        assertEquals(Arrays.asList(S + "x"), BpeTokenizer.fromJson(json).encodeWord("x"));
    }

    @Test
    public void refusesWordsOutsideTheVocabulary() {
        assertNull(tiny().encodeWord("abd"));
    }

    @Test
    public void keepsPieceIdsInVocabularyOrder() {
        List<String> pieces = tiny().pieces;
        assertEquals("<unk>", pieces.get(0));
        assertEquals("bc", pieces.get(8));
        assertTrue(tiny().contains(S + "ab"));
    }

    @Test
    @SuppressWarnings("unchecked")
    public void jsonReaderHandlesEscapesAndNesting() {
        Map<String, Object> value = (Map<String, Object>) MiniJson.parse(
                "{\"a\": [1, 2.5, true, null, \"x\\u2581\\n\\\"\"], \"b\": {}}");
        List<Object> list = (List<Object>) value.get("a");
        assertEquals(2.5, (Double) list.get(1), 0.0);
        assertEquals("x▁\n\"", list.get(4));
        assertTrue(((Map<String, Object>) value.get("b")).isEmpty());
    }
}
