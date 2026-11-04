package app.wordfeudwordfinder.extension.solver;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

public class MoveSorterTest {
    private static Move mv(String word, int score) {
        return mv(word, score, 0, 0, true);
    }

    private static Move mv(String word, int score, int x, int y, boolean h) {
        return new Move(word, x, y, h, Collections.emptyList(), Collections.emptyList(), score,
                Collections.singletonList(word), Collections.emptyList(), false);
    }

    private static String words(List<Move> l) {
        StringBuilder sb = new StringBuilder();
        for (Move m : l) sb.append(sb.length() == 0 ? "" : ",").append(m.word);
        return sb.toString();
    }

    @Test
    public void scoreOrder() {
        List<Move> in = Arrays.asList(mv("VET", 7), mv("WROET", 16), mv("ROG", 7));
        assertEquals("WROET,ROG,VET", words(MoveSorter.sort(in, SortMode.SCORE)));
        assertEquals("VET,WROET,ROG", words(in)); // input untouched
    }

    @Test
    public void lengthOrder() {
        List<Move> in = Arrays.asList(mv("ROTJE", 14), mv("WROET", 16), mv("HIJ", 10));
        assertEquals("WROET,ROTJE,HIJ", words(MoveSorter.sort(in, SortMode.LENGTH)));
    }

    @Test
    public void alphaOrder() {
        List<Move> out = MoveSorter.sort(Arrays.asList(mv("VET", 7), mv("VET", 9)), SortMode.ALPHA);
        assertEquals(9, out.get(0).score);
        assertEquals(7, out.get(1).score);
    }

    @Test
    public void totalOrderIsIndependentOfInputOrder() {
        List<Move> in = new ArrayList<>(Arrays.asList(mv("VET", 7, 3, 2, false), mv("VET", 7, 3, 2, true),
                mv("VET", 7, 1, 2, true), mv("VET", 7, 5, 0, true)));
        List<Move> a = MoveSorter.sort(in, SortMode.SCORE);
        Collections.reverse(in);
        List<Move> b = MoveSorter.sort(in, SortMode.SCORE);
        assertEquals(a.toString(), b.toString());
        assertEquals(0, a.get(0).y);
        assertEquals(true, a.get(2).horizontal);
    }
}
