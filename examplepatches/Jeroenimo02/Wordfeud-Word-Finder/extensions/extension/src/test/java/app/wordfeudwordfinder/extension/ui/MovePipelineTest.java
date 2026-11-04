package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.GameState;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.solver.SortMode;
import app.wordfeudwordfinder.extension.words.WordGraph;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.Test;

public class MovePipelineTest {

    private static Ruleset ruleset() {
        Map<String, Integer> pts = new HashMap<>();
        Map<String, Integer> cnt = new HashMap<>();
        for (char c = 'A'; c <= 'Z'; c++) {
            pts.put(String.valueOf(c), 1);
            cnt.put(String.valueOf(c), 2);
        }
        pts.put("Z", 10);
        return new Ruleset(4, "nl", pts, cnt);
    }

    private static BoardLayout plainLayout() {
        return new BoardLayout(0, new int[15][15]);
    }

    private static GameState emptyGame(String... rack) {
        return new GameState(1L, new char[15][15], Arrays.asList(rack), true, false, null);
    }

    private static WordGraph graph(String... words) {
        return WordGraph.build(Arrays.asList(words));
    }

    private static List<String> words(List<Move> moves) {
        List<String> out = new ArrayList<>();
        for (Move m : moves) out.add(m.word);
        return out;
    }

    @Test
    public void generatesFiltersAndSortsByScore() {
        List<Move> out = MovePipeline.compute(emptyGame("Z", "A", "T", "E"), plainLayout(), ruleset(),
                graph("AT", "ZA", "TEA"), l -> l, SortMode.SCORE, new AtomicBoolean(false));
        assertFalse(out.isEmpty());
        assertEquals("ZA", out.get(0).word);
        for (int i = 1; i < out.size(); i++) assertTrue(out.get(i - 1).score >= out.get(i).score);
    }

    @Test
    public void rejectedFilterIsApplied() {
        List<Move> out = MovePipeline.compute(emptyGame("Z", "A", "T", "E"), plainLayout(), ruleset(),
                graph("AT", "ZA", "TEA"), l -> {
                    List<Move> keep = new ArrayList<>();
                    for (Move m : l) if (!m.allWords.contains("ZA")) keep.add(m);
                    return keep;
                }, SortMode.SCORE, new AtomicBoolean(false));
        assertFalse(out.isEmpty());
        assertFalse(words(out).contains("ZA"));
    }

    @Test
    public void sortModeIsHonoured() {
        List<Move> out = MovePipeline.compute(emptyGame("Z", "A", "T", "E"), plainLayout(), ruleset(),
                graph("AT", "ZA", "TEA"), l -> l, SortMode.LENGTH, new AtomicBoolean(false));
        assertEquals("TEA", out.get(0).word);
        List<Move> alpha = MovePipeline.sort(out, SortMode.ALPHA, new AtomicBoolean(false));
        assertEquals("AT", alpha.get(0).word);
    }

    @Test
    public void cancelledComputationReturnsNull() {
        assertNull(MovePipeline.compute(emptyGame("A", "T"), plainLayout(), ruleset(), graph("AT"), l -> l,
                SortMode.SCORE, new AtomicBoolean(true)));
        assertNull(MovePipeline.sort(Collections.<Move>emptyList(), SortMode.SCORE, new AtomicBoolean(true)));
    }

    @Test
    public void cancellationDuringFilterReturnsNull() {
        AtomicBoolean cancel = new AtomicBoolean(false);
        assertNull(MovePipeline.compute(emptyGame("A", "T"), plainLayout(), ruleset(), graph("AT"), l -> {
            cancel.set(true);
            return l;
        }, SortMode.SCORE, cancel));
    }

    @Test
    public void missingInputsGiveAnEmptyList() {
        assertTrue(MovePipeline.compute(null, plainLayout(), ruleset(), graph("AT"), l -> l, SortMode.SCORE,
                new AtomicBoolean(false)).isEmpty());
        assertTrue(MovePipeline.compute(emptyGame("A", "T"), plainLayout(), ruleset(), null, l -> l,
                SortMode.SCORE, new AtomicBoolean(false)).isEmpty());
    }

    @Test
    public void bestIndexIsTheHighestScoreFirstOccurrence() {
        List<Move> moves = MovePipeline.compute(emptyGame("Z", "A", "T", "E"), plainLayout(), ruleset(),
                graph("AT", "ZA", "TEA"), l -> l, SortMode.ALPHA, new AtomicBoolean(false));
        int best = MovePipeline.bestIndex(moves);
        for (Move m : moves) assertTrue(moves.get(best).score >= m.score);
        assertEquals("ZA", moves.get(best).word);
        assertEquals(-1, MovePipeline.bestIndex(Collections.<Move>emptyList()));
        assertEquals(-1, MovePipeline.bestIndex(null));
    }

    @Test
    public void indexOfFindsTheSameMoveInstance() {
        List<Move> moves = MovePipeline.compute(emptyGame("Z", "A", "T", "E"), plainLayout(), ruleset(),
                graph("AT", "ZA", "TEA"), l -> l, SortMode.SCORE, new AtomicBoolean(false));
        Move m = moves.get(moves.size() - 1);
        List<Move> resorted = MovePipeline.sort(moves, SortMode.ALPHA, new AtomicBoolean(false));
        assertEquals(m, resorted.get(MovePipeline.indexOf(resorted, m)));
        assertEquals(-1, MovePipeline.indexOf(resorted, null));
    }

    @Test
    public void sameInputComparesBoardRackTurnAndError() {
        char[][] b = new char[15][15];
        b[7][7] = 'A';
        GameState a = new GameState(1L, b, Arrays.asList("A", "T"), true, false, null);
        assertTrue(MovePipeline.sameInput(a, new GameState(1L, b, Arrays.asList("A", "T"), true, false, null)));
        assertTrue(MovePipeline.sameInput(a, a));
        char[][] b2 = new char[15][15];
        b2[7][8] = 'A';
        assertFalse(MovePipeline.sameInput(a, new GameState(1L, b2, Arrays.asList("A", "T"), true, false, null)));
        assertFalse(MovePipeline.sameInput(a, new GameState(1L, b, Arrays.asList("A", "E"), true, false, null)));
        assertFalse(MovePipeline.sameInput(a, new GameState(1L, b, Arrays.asList("A", "T"), false, false, null)));
        assertFalse(MovePipeline.sameInput(a, new GameState(2L, b, Arrays.asList("A", "T"), true, false, null)));
        assertFalse(MovePipeline.sameInput(a, new GameState(1L, b, Arrays.asList("A", "T"), true, false,
                app.wordfeudwordfinder.extension.core.WfError.gsData("x"))));
        assertFalse(MovePipeline.sameInput(a, null));
        assertFalse(MovePipeline.sameInput(null, a));
    }
}
