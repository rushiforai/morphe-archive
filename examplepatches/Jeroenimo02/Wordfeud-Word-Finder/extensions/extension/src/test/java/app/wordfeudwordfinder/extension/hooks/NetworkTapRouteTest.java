package app.wordfeudwordfinder.extension.hooks;

import static org.junit.Assert.*;

import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.game.GameState;
import app.wordfeudwordfinder.extension.game.GameStore;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class NetworkTapRouteTest {
    private static final long GAME = 4391319402L;

    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private static String fixture(String name) throws Exception {
        try (InputStream in = NetworkTapRouteTest.class.getResourceAsStream("/fixtures/" + name)) {
            assertNotNull("missing fixture " + name, in);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    private static int tiles(GameState st) {
        int n = 0;
        for (char[] row : st.board()) for (char c : row) if (c != '\0') n++;
        return n;
    }

    private GameStore store() {
        return new GameStore(new Storage(tmp.getRoot()));
    }

    @Test
    public void routesGamesDetail() throws Exception {
        GameStore s = store();
        NetworkTap.route(new ResponseAssembler.Completed(
                "https://api.wordfeud.com/wf/user/games/detail/?known_rulesets=", fixture("detail_neigen.json")), s);
        assertNotNull(s.state(GAME));
        assertEquals(1, s.detailGeneration());
    }

    @Test
    public void routesMoveResponse() throws Exception {
        GameStore s = store();
        NetworkTap.route(new ResponseAssembler.Completed(
                "https://api.wordfeud.com/wf/user/games/detail/", fixture("detail_neigen.json")), s);
        int before = tiles(s.state(GAME));
        NetworkTap.route(new ResponseAssembler.Completed(
                "https://api.wordfeud.com/wf/game/" + GAME + "/move/", fixture("move_hoort.json")), s);
        assertTrue("move applied", tiles(s.state(GAME)) > before);
        assertEquals("a move response does not count as a detail", 1, s.detailGeneration());
    }

    private static final String API = "https://api.wordfeud.com/wf/";

    /** move_hoort.json's game as another endpoint would return it, with the given updated/current_player. */
    private static String singleGame(long updatedDelta, int currentPlayer) throws Exception {
        org.json.JSONObject root = new org.json.JSONObject(fixture("move_hoort.json"));
        org.json.JSONObject g = root.getJSONObject("content").getJSONObject("game");
        g.put("updated", g.getLong("updated") + updatedDelta);
        g.put("current_player", currentPlayer);
        return root.toString();
    }

    @Test
    public void gamesListFromAnyEndpointIsMerged() throws Exception {
        GameStore s = store();
        NetworkTap.route(new ResponseAssembler.Completed(API + "user/status/", fixture("detail_neigen.json")), s);
        assertNotNull(s.state(GAME));
        assertEquals(1, s.detailGeneration());
    }

    @Test
    public void singleGameFromAnyEndpointIsUpserted() throws Exception {
        GameStore s = store();
        NetworkTap.route(new ResponseAssembler.Completed(API + "user/games/detail/", fixture("detail_neigen.json")), s);
        NetworkTap.route(new ResponseAssembler.Completed(API + "game/" + GAME + "/move/", fixture("move_hoort.json")), s);
        assertFalse(s.state(GAME).myTurn());
        // the opponent replied (here: only the turn changed); Wordfeud reloads the open game
        NetworkTap.route(new ResponseAssembler.Completed(API + "game/" + GAME + "/?game_format=log",
                singleGame(20, 0)), s);
        assertTrue(s.state(GAME).myTurn());
        assertEquals("a server snapshot counts like a games/detail", 2, s.detailGeneration());
    }

    @Test
    public void olderSingleGameIsSkipped() throws Exception {
        GameStore s = store();
        NetworkTap.route(new ResponseAssembler.Completed(API + "user/games/detail/", fixture("detail_neigen.json")), s);
        NetworkTap.route(new ResponseAssembler.Completed(API + "game/" + GAME + "/", singleGame(20, 0)), s);
        NetworkTap.route(new ResponseAssembler.Completed(API + "game/" + GAME + "/", singleGame(0, 1)), s);
        assertTrue(s.state(GAME).myTurn());
    }

    @Test
    public void errorOrGameLessResponsesAreIgnoredWithoutThrowing() throws Exception {
        GameStore s = store();
        NetworkTap.route(new ResponseAssembler.Completed(API + "game/" + GAME + "/",
                "{\"status\":\"error\",\"content\":{\"type\":\"game_log\"}}"), s);
        NetworkTap.route(new ResponseAssembler.Completed(API + "user/status/",
                "{\"status\":\"success\",\"content\":{\"games\":[{\"id\":1,\"updated\":5}]}}"), s);
        NetworkTap.route(new ResponseAssembler.Completed(API + "user/notices/", "not json game_log"), s);
        assertEquals(0, s.detailGeneration());
        assertNull(s.lastDetail());
    }

    @Test(expected = app.wordfeudwordfinder.extension.core.WfError.class)
    public void moveErrorStillThrows() throws Exception {
        NetworkTap.route(new ResponseAssembler.Completed(API + "game/" + GAME + "/move/",
                "{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\"}}"), store());
    }

    @Test
    public void ignoresNulls() throws Exception {
        NetworkTap.route(null, store());
        NetworkTap.route(new ResponseAssembler.Completed(null, "{}"), store());
        NetworkTap.route(new ResponseAssembler.Completed("x/move/", "{}"), null);
    }
}
