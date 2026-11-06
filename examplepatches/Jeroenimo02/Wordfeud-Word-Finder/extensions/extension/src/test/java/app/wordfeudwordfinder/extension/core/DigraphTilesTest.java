package app.wordfeudwordfinder.extension.core;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.GameReplay;
import app.wordfeudwordfinder.extension.game.GameState;
import app.wordfeudwordfinder.extension.game.LogEvent;
import app.wordfeudwordfinder.extension.game.RawGame;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.play.MoveRequest;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.solver.MovePipelineAccess;
import app.wordfeudwordfinder.extension.words.WordGraph;
import app.wordfeudwordfinder.extension.words.WordListNormalizer;
import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

/** Spanish digraph tiles (CH, LL, RR) from game log to sent move. */
public class DigraphTilesTest {
    private static final String CH = "Χ";

    private static Ruleset spanish() {
        Map<String, Integer> points = new LinkedHashMap<>();
        for (String t : "A B C D E F G H I J L M N Ñ O P Q R S T U V X Y Z".split(" ")) points.put(t, 1);
        points.put("CH", 5);
        points.put("LL", 8);
        points.put("RR", 8);
        points.put("?", 0);
        return new Ruleset(6, "es", points, new LinkedHashMap<>());
    }

    @Test
    public void codesSpellingAndEncoding() {
        assertEquals('Χ', Tiles.code("CH"));
        assertEquals('Χ', Tiles.code("ch"));
        assertEquals('A', Tiles.code("A"));
        assertEquals(0, Tiles.code("XY"));
        assertEquals("CH", Tiles.text('χ'));
        assertEquals("CHICO", Tiles.spell(CH + "ICO"));
        assertEquals("chico", Tiles.spell("χico"));
        List<String> dg = Arrays.asList("CH", "LL", "RR");
        assertEquals(CH + "ICO", Tiles.encode("CHICO", dg));
        assertEquals("PEΡO", Tiles.encode("PERRO", dg));
        assertEquals("ΛAMA", Tiles.encode("LLAMA", dg));
        assertEquals("CHICO", Tiles.encode("CHICO", new ArrayList<String>())); // other languages: unchanged
        assertEquals(dg, Tiles.digraphsOf(Arrays.asList("A", "CH", "LL", "RR", "?")));
    }

    @Test
    public void wordListEncodesDigraphsOnlyWhenTheRulesetHasThem() throws Exception {
        String list = "chico\nperro\nllama\ncasa\nkiwi\n";
        Set<String> es = new java.util.HashSet<>(spanish().getTilePoints().keySet());
        List<String> words = WordListNormalizer.normalize(
                new ByteArrayInputStream(list.getBytes(StandardCharsets.UTF_8)), StandardCharsets.UTF_8, es);
        assertEquals(Arrays.asList(CH + "ICO", "PEΡO", "ΛAMA", "CASA"), words); // no K or W in Spanish
    }

    private static JSONObject move(int player, int x, int y, boolean horizontal, String... tiles) throws Exception {
        return new JSONObject().put("type", "packed_move").put("player", player).put("x", x).put("y", y)
                .put("horizontal", horizontal).put("tiles", new JSONArray(Arrays.asList(tiles)));
    }

    @Test
    public void gameLogWithDigraphTilesAndASpanishMove() throws Exception {
        List<LogEvent> log = new ArrayList<>();
        JSONObject start = new JSONObject().put("type", "start").put("tiles", new JSONArray()
                .put(new JSONArray(Arrays.asList("CH", "I", "O", "*", "A", "S", "E")))
                .put(JSONObject.NULL));
        log.add(new LogEvent("start", start));
        // opponent played PERRO across the centre with the RR tile, and LLAMA with a blank as LL
        log.add(new LogEvent("packed_move", move(1, 5, 7, true, "P", "E", "RR", "O")));
        GameState st = GameReplay.replay(new RawGame(1, 0, 6, 0, 0, 0, log));
        assertNull(st.unreadable());
        assertEquals('Ρ', st.board()[7][7]);
        assertEquals(Arrays.asList("PERRO".replace("RR", "Ρ")), st.playedWords());
        assertTrue(st.rack().contains(CH));

        // The solver finds CHICO with the CH tile and the request spells it out.
        WordGraph g = WordGraph.build(Arrays.asList(CH + "ICO", "PEΡO"));
        int[][] sq = new int[15][15];
        List<Move> moves = MovePipelineAccess.generate(st.board(), st.rack(), new BoardLayout(0, sq), spanish(), g);
        Move chico = null;
        for (Move m : moves) if ((CH + "ICO").equals(m.word)) chico = m;
        assertTrue("CHICO found", chico != null);
        String body = MoveRequest.body(chico, 6);
        assertTrue(body, body.contains("\"CH\""));
        assertTrue(body, body.contains("\"CHICO\""));
        assertFalse(body, body.contains("Χ"));
    }

    @Test
    public void blankPlayedAsDigraph() throws Exception {
        List<LogEvent> log = new ArrayList<>();
        log.add(new LogEvent("start", new JSONObject().put("type", "start").put("tiles", new JSONArray()
                .put(new JSONArray(Arrays.asList("*", "A", "M", "A", "E", "S", "O"))).put(JSONObject.NULL))));
        log.add(new LogEvent("packed_move", move(0, 7, 7, true, "*LL", "A", "M", "A")));
        GameState st = GameReplay.replay(new RawGame(1, 0, 6, 1, 0, 0, log));
        assertNull(st.unreadable());
        assertEquals('λ', st.board()[7][7]); // blank as LL: lower-case code
        assertEquals(Arrays.asList("ΛAMA"), st.playedWords());
        assertFalse(st.rack().contains("*"));
    }
}
