package app.wordfeudwordfinder.extension.game;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.wordfeudwordfinder.extension.core.WfError;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

public class GameReplayTest {

    private static final long NEIGEN_GAME = 4391319402L;
    private static final long MANDJE_GAME = 4391372380L;
    private static final long SWAP_GAME = 4391364589L;
    private static final long RESIGNED_GAME = 4391355775L;

    // ---- helpers ----

    static String fixture(String name) {
        try (InputStream in = GameReplayTest.class.getResourceAsStream("/fixtures/" + name)) {
            assertNotNull("missing fixture " + name, in);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    private static RawGame game(ResponseParser.Parsed p, long id) {
        for (RawGame g : p.games) if (g.getId() == id) return g;
        throw new AssertionError("game " + id + " not in fixture");
    }

    private static String row(char[][] board, int y, int x0, int x1) {
        StringBuilder sb = new StringBuilder();
        for (int x = x0; x <= x1; x++) sb.append(board[y][x]);
        return sb.toString();
    }

    private static List<String> sorted(List<String> l) {
        List<String> c = new ArrayList<>(l);
        Collections.sort(c);
        return c;
    }

    /** Modifies the NEIGEN game of detail_neigen.json and replays it. */
    private interface Mutator { void apply(JSONObject game) throws Exception; }

    private static GameState replayModifiedNeigen(Mutator m) throws Exception {
        JSONObject root = new JSONObject(fixture("detail_neigen.json"));
        JSONArray games = root.getJSONObject("content").getJSONArray("games");
        for (int i = 0; i < games.length(); i++) {
            JSONObject g = games.getJSONObject(i);
            if (g.getLong("id") == NEIGEN_GAME) m.apply(g);
        }
        return GameReplay.replay(game(ResponseParser.parseGamesDetail(root.toString()), NEIGEN_GAME));
    }

    // ---- brief tests ----

    @Test
    public void rackAfterNeigen() throws Exception {
        GameState st = GameReplay.replay(game(ResponseParser.parseGamesDetail(fixture("detail_neigen.json")), NEIGEN_GAME));
        assertNull(st.unreadable());
        assertEquals(sorted(Arrays.asList("V", "W", "T", "J", "H", "O", "R")), sorted(st.rack()));
        assertEquals("NEIGEN", row(st.board(), 7, 7, 12));
        // TON was played vertically from (10,4) onto the G of NEIGEN.
        assertEquals('T', st.board()[4][10]);
        assertEquals('O', st.board()[5][10]);
        assertEquals('N', st.board()[6][10]);
        assertEquals('\0', st.board()[0][0]);
        assertTrue(st.myTurn());
        assertFalse(st.ended());
    }

    @Test
    public void packedMoveSkipsOccupied() throws Exception {
        RawGame g = ResponseParser.parseMove(fixture("move_hoort.json"));
        assertEquals(NEIGEN_GAME, g.getId());
        GameState st = GameReplay.replay(g);
        assertNull(st.unreadable());
        assertEquals("HOORT", row(st.board(), 5, 8, 12));
        // The existing O of TON(G) at (10,5) stays where it was; the column still reads TONG.
        assertEquals("TONG", "" + st.board()[4][10] + st.board()[5][10] + st.board()[6][10] + st.board()[7][10]);
        assertEquals('\0', st.board()[5][13]);
        // V W T J + new tiles E S K N
        assertEquals(sorted(Arrays.asList("V", "W", "J", "E", "S", "K", "N")), sorted(st.rack()));
        assertFalse(st.myTurn());
    }

    @Test
    public void mandjeGame() throws Exception {
        RawGame g = game(ResponseParser.parseGamesDetail(fixture("detail_mandje.json")), MANDJE_GAME);
        assertEquals(1, g.getLocalPosition());
        GameState st = GameReplay.replay(g);
        assertNull(st.unreadable());
        // start MEANDIJ, laid M N D J E, received P S D Q E
        assertEquals(sorted(Arrays.asList("A", "I", "P", "S", "D", "Q", "E")), sorted(st.rack()));
        assertEquals("MANDJE", row(st.board(), 8, 6, 11));
        assertEquals("HAI", "" + st.board()[7][7] + st.board()[8][7] + st.board()[9][7]);
        assertEquals(0, g.getCurrentPlayer()); // opponent to move after MANDJE
        assertFalse(st.myTurn());
    }

    @Test
    public void duplicateLettersRemovedOnce() throws Exception {
        List<LogEvent> log = new ArrayList<>();
        log.add(new LogEvent("start", new JSONObject("{\"type\":\"start\",\"tiles\":[[\"E\",\"E\",\"N\"],null],\"timestamp\":1.0}")));
        log.add(new LogEvent("packed_move", new JSONObject(
                "{\"type\":\"packed_move\",\"player\":0,\"x\":7,\"y\":7,\"horizontal\":true,\"tiles\":[\"E\"],\"timestamp\":2.0}")));
        GameState st = GameReplay.replay(new RawGame(1L, 0, 2, 1, 0, 0, log));
        assertNull(st.unreadable());
        assertEquals(Arrays.asList("E", "N"), sorted(st.rack()));
        assertEquals('E', st.board()[7][7]);
    }

    @Test
    public void unknownEventMarksUnreadable() throws Exception {
        GameState st = replayModifiedNeigen(g -> g.getJSONArray("game_log").put(new JSONObject("{\"type\":\"foo\"}")));
        assertNotNull(st.unreadable());
        assertEquals("GS-EVENT-foo", st.unreadable().code());
    }

    private static GameState replayTurn(int currentPlayer, String... events) throws Exception {
        List<LogEvent> log = new ArrayList<>();
        log.add(new LogEvent("start", new JSONObject("{\"type\":\"start\",\"tiles\":[[\"A\",\"B\",\"C\"],null],\"timestamp\":1.0}")));
        for (String e : events) {
            JSONObject o = new JSONObject(e);
            log.add(new LogEvent(o.getString("type"), o));
        }
        return GameReplay.replay(new RawGame(1L, 0, 2, currentPlayer, 0, 0, log));
    }

    @Test
    public void opponentPassAsFirstEventIsReadable() throws Exception {
        GameState st = replayTurn(0, "{\"type\":\"pass\",\"player\":1,\"timestamp\":2.0}");
        assertNull(st.unreadable());
        assertEquals(Arrays.asList("A", "B", "C"), sorted(st.rack()));
        assertTrue(st.myTurn());
    }

    @Test
    public void ownPassAndTimeoutAreReadable() throws Exception {
        GameState own = replayTurn(1, "{\"type\":\"pass\",\"player\":0,\"timestamp\":2.0}");
        assertNull(own.unreadable());
        assertEquals(Arrays.asList("A", "B", "C"), sorted(own.rack()));
        assertFalse(own.myTurn());
        GameState to = replayTurn(0, "{\"type\":\"timeout\",\"player\":1,\"timestamp\":2.0}");
        assertNull(to.unreadable());
        assertEquals(Arrays.asList("A", "B", "C"), sorted(to.rack()));
        assertTrue(to.myTurn());
    }

    @Test
    public void passWithExtraFieldsOrNoPlayerIsReadable() throws Exception {
        assertNull(replayTurn(0, "{\"type\":\"pass\",\"player\":1,\"timestamp\":2.0,\"x\":\"y\",\"extra\":[1]}").unreadable());
        assertNull(replayTurn(0, "{\"type\":\"pass\"}").unreadable());
        assertEquals("GS-DATA", replayTurn(0, "{\"type\":\"pass\",\"player\":\"x\"}").unreadable().code());
    }

    @Test
    public void inconsistentRackMarksUnreadable() throws Exception {
        GameState st = replayModifiedNeigen(g -> {
            JSONObject move = g.getJSONArray("game_log").getJSONObject(1);
            move.getJSONArray("tiles").put(0, "Z"); // Z was never on the rack
        });
        assertNotNull(st.unreadable());
        assertEquals("GS-DATA", st.unreadable().code());
    }

    @Test
    public void endedGame() throws Exception {
        GameState st = replayModifiedNeigen(g -> g.put("end_game", 1));
        assertTrue(st.ended());
        assertFalse(st.myTurn());
    }

    // ---- extra tests ----

    @Test
    public void unknownFieldInKnownEventMarksUnreadable() throws Exception {
        GameState st = replayModifiedNeigen(g -> g.getJSONArray("game_log").getJSONObject(1).put("blank", true));
        assertEquals("GS-DATA", st.unreadable().code());
    }

    @Test
    public void explicitNullNewTilesIsTreatedAsAbsent() throws Exception {
        // Android's org.json returns "null" from optString on JSON null; the parser must not depend on opt* fallbacks.
        GameState st = replayModifiedNeigen(g -> g.getJSONArray("game_log").getJSONObject(1).put("new_tiles", JSONObject.NULL));
        assertNull(st.unreadable());
        assertEquals(Collections.singletonList("V"), st.rack());
    }

    @Test
    public void explicitNullPlayerFieldsParse() throws Exception {
        JSONObject root = new JSONObject(fixture("detail_neigen.json"));
        JSONObject g = root.getJSONObject("content").getJSONArray("games").getJSONObject(0);
        g.getJSONArray("players").getJSONObject(1).put("username", JSONObject.NULL).put("is_local", JSONObject.NULL);
        RawGame raw = game(ResponseParser.parseGamesDetail(root.toString()), NEIGEN_GAME);
        assertEquals(0, raw.getLocalPosition());
    }

    @Test
    public void realSwapGamesReplayWithCorrectRack() throws Exception {
        ResponseParser.Parsed p = ResponseParser.parseGamesDetail(fixture("detail_mandje.json"));
        // Two swaps of all seven tiles: the rack is exactly the last new_tiles.
        GameState st = GameReplay.replay(game(p, SWAP_GAME));
        assertNull(st.unreadable());
        assertEquals(sorted(Arrays.asList("O", "E", "D", "N", "B", "U", "U")), sorted(st.rack()));
        // Swap of 4 tiles (C F C Z) after two moves: rack stays at 7 tiles.
        GameState st2 = GameReplay.replay(game(p, 4391357107L));
        assertNull(st2.unreadable());
        assertEquals(7, st2.rack().size());
        assertTrue(st2.rack().containsAll(Arrays.asList("E", "D", "M", "Y")));
    }

    @Test
    public void realResignGameReplays() throws Exception {
        ResponseParser.Parsed p = ResponseParser.parseGamesDetail(fixture("detail_mandje.json"));
        GameState resigned = GameReplay.replay(game(p, RESIGNED_GAME));
        assertNull(resigned.unreadable());
        assertTrue(resigned.ended()); // real ended games carry end_game = 2
        assertFalse(resigned.myTurn());
        assertTrue(resigned.rack().size() <= 7);
    }

    private static GameState replayWithLog(String... events) throws Exception {
        List<LogEvent> log = new ArrayList<>();
        log.add(new LogEvent("start", new JSONObject("{\"type\":\"start\",\"tiles\":[[\"A\",\"B\",\"C\"],null],\"timestamp\":1.0}")));
        for (String e : events) {
            JSONObject o = new JSONObject(e);
            log.add(new LogEvent(o.getString("type"), o));
        }
        return GameReplay.replay(new RawGame(1L, 0, 2, 1, 0, 0, log));
    }

    private static GameState replayWithRack(String rackJson, String... events) throws Exception {
        List<LogEvent> log = new ArrayList<>();
        log.add(new LogEvent("start", new JSONObject("{\"type\":\"start\",\"tiles\":[" + rackJson + ",null],\"timestamp\":1.0}")));
        for (String e : events) {
            JSONObject o = new JSONObject(e);
            log.add(new LogEvent(o.getString("type"), o));
        }
        return GameReplay.replay(new RawGame(1L, 0, 2, 1, 0, 0, log));
    }

    private static String move(int player, String tiles, String newTiles) {
        return "{\"type\":\"packed_move\",\"player\":" + player + ",\"x\":7,\"y\":7,\"horizontal\":true,\"tiles\":"
                + tiles + (newTiles == null ? "" : ",\"new_tiles\":" + newTiles) + ",\"timestamp\":2.0}";
    }

    @Test
    public void ownBlankPlayedAsLetterRemovesStarAndBoardIsLowercase() throws Exception {
        GameState st = replayWithRack("[\"*\",\"A\",\"B\"]", move(0, "[\"A\",\"*E\"]", "[\"C\",\"D\"]"));
        assertNull(st.unreadable());
        assertEquals(Arrays.asList("B", "C", "D"), sorted(st.rack()));
        assertEquals("Ae", row(st.board(), 7, 7, 8));
    }

    @Test
    public void opponentBlankIsPlacedWithoutTouchingRack() throws Exception {
        GameState st = replayWithRack("[\"A\",\"B\"]", move(1, "[\"*E\",\"T\"]", null));
        assertNull(st.unreadable());
        assertEquals(Arrays.asList("A", "B"), sorted(st.rack()));
        assertEquals("eT", row(st.board(), 7, 7, 8));
    }

    @Test
    public void ownBlankWithoutStarOnRackIsGsData() throws Exception {
        assertEquals("GS-DATA", replayWithRack("[\"E\",\"A\"]", move(0, "[\"*E\"]", "[\"B\"]")).unreadable().code());
    }

    @Test
    public void malformedBlankTilesAreGsData() throws Exception {
        assertEquals("GS-DATA", replayWithRack("[\"*\",\"A\"]", move(0, "[\"*\"]", "[\"B\"]")).unreadable().code());
        assertEquals("GS-DATA", replayWithRack("[\"*\",\"A\"]", move(0, "[\"**\"]", "[\"B\"]")).unreadable().code());
        assertEquals("GS-DATA", replayWithRack("[\"*\",\"A\"]", move(1, "[\"*EE\"]", null)).unreadable().code());
    }

    @Test
    public void blankOnRackCanBeSwappedAway() throws Exception {
        GameState st = replayWithRack("[\"*\",\"A\"]",
                "{\"type\":\"swap\",\"player\":0,\"tile_count\":1,\"tiles\":[\"*\"],\"new_tiles\":[\"Q\"],\"timestamp\":2.0}");
        assertNull(st.unreadable());
        assertEquals(Arrays.asList("A", "Q"), sorted(st.rack()));
    }

    @Test
    public void opponentSwapDoesNotChangeRack() throws Exception {
        GameState st = replayWithLog("{\"type\":\"swap\",\"player\":1,\"tile_count\":2,\"tiles\":null,\"new_tiles\":null,\"timestamp\":2.0}");
        assertNull(st.unreadable());
        assertEquals(Arrays.asList("A", "B", "C"), sorted(st.rack()));
    }

    @Test
    public void ownSwapWithoutNewTilesIsGsData() throws Exception {
        GameState st = replayWithLog("{\"type\":\"swap\",\"player\":0,\"tile_count\":1,\"tiles\":[\"A\"],\"timestamp\":2.0}");
        assertEquals("GS-DATA", st.unreadable().code());
    }

    @Test
    public void ownSwapOfTileNotOnRackIsGsData() throws Exception {
        GameState st = replayWithLog("{\"type\":\"swap\",\"player\":0,\"tile_count\":1,\"tiles\":[\"Z\"],\"new_tiles\":[\"Q\"],\"timestamp\":2.0}");
        assertEquals("GS-DATA", st.unreadable().code());
    }

    @Test
    public void swapAndResignWithUnknownFieldAreGsData() throws Exception {
        assertEquals("GS-DATA", replayWithLog("{\"type\":\"resign\",\"player\":1,\"timestamp\":2.0,\"x\":1}").unreadable().code());
        assertEquals("GS-DATA", replayWithLog("{\"type\":\"swap\",\"player\":1,\"tile_count\":1,\"extra\":1,\"timestamp\":2.0}").unreadable().code());
    }

    @Test
    public void rulesetsAndBoardsParsed() throws Exception {
        ResponseParser.Parsed p = ResponseParser.parseGamesDetail(fixture("detail_mandje.json"));
        assertEquals(2, p.rulesets.size());
        Ruleset nl = p.rulesets.get(0).getId() == 2 ? p.rulesets.get(0) : p.rulesets.get(1);
        assertEquals("nl", nl.getLanguageCode());
        assertEquals(Integer.valueOf(10), nl.getTilePoints().get("Q"));
        assertEquals(Integer.valueOf(18), nl.getTileCounts().get("E"));
        assertEquals(1, p.boards.size());
        int[][] sq = p.boards.get(0).getSquares();
        assertEquals(15, sq.length);
        assertArrayEquals(new int[] {2, 0, 0, 0, 4, 0, 0, 1, 0, 0, 4, 0, 0, 0, 2}, sq[0]);
        assertEquals(7, p.games.size());
    }

    @Test
    public void moveErrorGivesServerCode() {
        try {
            ResponseParser.parseMove("{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\"}}");
            fail();
        } catch (WfError e) {
            assertEquals("MV-SERVER-illegal_word", e.code());
        }
    }

    @Test
    public void malformedDetailGivesGsData() {
        try {
            ResponseParser.parseGamesDetail("{\"status\":\"success\",\"content\":null}");
            fail();
        } catch (WfError e) {
            assertEquals("GS-DATA", e.code());
        }
    }
}
