package app.wordfeudwordfinder.extension.game;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.core.WfError;
import java.io.File;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class GameStoreTest {
    private static final long GAME = 4391319402L;
    private static final long OTHER = 4391325091L;

    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private static String fixture(String n) { return GameReplayTest.fixture(n); }

    private String withoutRulesetsAndBoards() throws Exception {
        JSONObject root = new JSONObject(fixture("detail_neigen.json"));
        root.getJSONObject("content").remove("rulesets");
        root.getJSONObject("content").remove("boards");
        return root.toString();
    }

    @Test
    public void storesGamesAndCaches() throws Exception {
        Storage s = new Storage(tmp.getRoot());
        GameStore store = new GameStore(s);
        store.onGamesDetail(fixture("detail_neigen.json"));
        GameState st = store.state(GAME);
        assertNotNull(st);
        assertNull(st.unreadable());
        assertTrue(s.readText("cache/rulesets.json").contains("\"ruleset\":2"));
        assertNotNull(s.readText("cache/boards.json"));
        assertNotNull(store.ruleset(2));
        assertNotNull(store.board(0));
        assertNotNull(store.game(GAME));
        assertTrue(store.seenRulesets().contains(2));
        assertNull(store.state(1L));
    }

    @Test
    public void usesCachedBoardWhenOmitted() throws Exception {
        new GameStore(new Storage(tmp.getRoot())).onGamesDetail(fixture("detail_neigen.json"));
        GameStore second = new GameStore(new Storage(tmp.getRoot()));
        second.onGamesDetail(withoutRulesetsAndBoards());
        assertNull(second.state(GAME).unreadable());
    }

    @Test
    public void missingRulesetOrBoardGivesGsData() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(withoutRulesetsAndBoards());
        GameState st = store.state(GAME);
        assertNotNull(st);
        assertEquals("GS-DATA", st.unreadable().code());
    }

    @Test
    public void corruptCacheIsTreatedAsEmptyAndMergeKeepsOldEntries() throws Exception {
        Storage s = new Storage(tmp.getRoot());
        s.writeTextAtomic("cache/rulesets.json", "{not json");
        s.writeTextAtomic("cache/boards.json", "[1,2");
        GameStore store = new GameStore(s);
        assertNull(store.ruleset(2));
        store.onGamesDetail(fixture("detail_neigen.json"));
        assertNull(store.state(GAME).unreadable());
        // merge: a later response with only another ruleset keeps ruleset 2 on disk
        JSONObject root = new JSONObject(fixture("detail_neigen.json"));
        JSONObject c = root.getJSONObject("content");
        JSONObject r = new JSONObject(c.getJSONArray("rulesets").getJSONObject(0).toString());
        r.put("ruleset", 9);
        c.getJSONArray("rulesets").put(0, r);
        store.onGamesDetail(root.toString());
        GameStore again = new GameStore(s);
        assertNotNull(again.ruleset(9));
        assertNotNull(again.ruleset(2));
    }

    @Test
    public void moveResponseReplacesGame() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(fixture("detail_neigen.json"));
        int before = countTiles(store.state(GAME));
        store.onMoveResponse(fixture("move_hoort.json"));
        GameState after = store.state(GAME);
        assertNull(after.unreadable());
        assertFalse(after.myTurn());
        assertTrue(countTiles(after) > before);
    }

    @Test
    public void moveResponseWorksWithoutDetail() throws Exception {
        // ruleset/board come from the disk cache of an earlier session
        new GameStore(new Storage(tmp.getRoot())).onGamesDetail(fixture("detail_neigen.json"));
        GameStore fresh = new GameStore(new Storage(tmp.getRoot()));
        fresh.onMoveResponse(fixture("move_hoort.json"));
        assertNull(fresh.state(GAME).unreadable());
    }

    @Test
    public void moveErrorThrowsAndLeavesStoreUnchanged() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(fixture("detail_neigen.json"));
        GameState before = store.state(GAME);
        final AtomicInteger calls = new AtomicInteger();
        store.addListener(new Runnable() { public void run() { calls.incrementAndGet(); } });
        try {
            store.onMoveResponse("{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\"}}");
            fail();
        } catch (WfError e) {
            assertEquals("MV-SERVER-illegal_word", e.code());
        }
        assertTrue(before == store.state(GAME));
        assertEquals(0, calls.get());
    }

    @Test
    public void listenerCalled() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        final AtomicInteger calls = new AtomicInteger();
        store.addListener(new Runnable() { public void run() { calls.incrementAndGet(); } });
        store.addListener(new Runnable() { public void run() { throw new IllegalStateException("boom"); } });
        store.onGamesDetail(fixture("detail_neigen.json"));
        assertEquals(1, calls.get());
        store.onMoveResponse(fixture("move_hoort.json"));
        assertEquals(2, calls.get());
    }

    @Test
    public void listenerMayCallBackIntoStore() throws Exception {
        final GameStore store = new GameStore(new Storage(tmp.getRoot()));
        final AtomicInteger seen = new AtomicInteger();
        store.addListener(new Runnable() {
            public void run() {
                Thread t = new Thread(new Runnable() { public void run() { seen.set(store.seenRulesets().size()); } });
                t.start();
                try { t.join(2000); } catch (InterruptedException e) { /* ignore */ }
            }
        });
        store.onGamesDetail(fixture("detail_neigen.json")); // would deadlock if invoked under the monitor
        assertEquals(1, seen.get());
    }

    @Test
    public void malformedGameDoesNotSpoilOthers() throws Exception {
        JSONObject root = new JSONObject(fixture("detail_neigen.json"));
        root.getJSONObject("content").getJSONArray("games").getJSONObject(1).remove("board");
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(root.toString());
        assertNull(store.state(GAME).unreadable());
        GameState bad = store.state(OTHER);
        assertNotNull(bad);
        assertEquals("GS-DATA", bad.unreadable().code());
        assertNull(store.game(OTHER));
    }

    @Test
    public void detailGenerationCountsOnlyProcessedGamesDetail() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        assertEquals(0, store.detailGeneration());
        store.onGamesDetail(fixture("detail_neigen.json"));
        assertEquals(1, store.detailGeneration());
        store.onMoveResponse(fixture("move_hoort.json"));
        assertEquals("a move response is not a games/detail", 1, store.detailGeneration());
        store.onGamesDetail("not json");
        assertEquals("an unparseable response is not processed", 1, store.detailGeneration());
        final long[] seen = {-1};
        store.addListener(new Runnable() { public void run() { seen[0] = store.detailGeneration(); } });
        store.onGamesDetail(fixture("detail_neigen.json"));
        assertEquals(2, store.detailGeneration());
        assertEquals("listeners already see the new count", 2, seen[0]);
    }

    @Test
    public void replayRuntimeExceptionMakesGameUnreadable() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()), g -> {
            throw new IllegalStateException("boom");
        });
        final int[] notified = {0};
        store.addListener(() -> notified[0]++);
        store.onGamesDetail(fixture("detail_neigen.json"));
        GameState st = store.state(GAME);
        assertNotNull(st);
        assertNotNull(st.unreadable());
        assertEquals("GS-DATA", st.unreadable().code());
        assertEquals(1, notified[0]);
        assertEquals(1, store.detailGeneration());
        assertNotNull("raw game still stored", store.game(GAME));

        store.onMoveResponse(fixture("move_hoort.json"));
        assertEquals("GS-DATA", store.state(GAME).unreadable().code());
        assertEquals(2, notified[0]);
        assertEquals("a move does not count as a detail", 1, store.detailGeneration());
    }

    private static int countTiles(GameState s) {
        int n = 0;
        for (char[] row : s.board()) for (char c : row) if (c != '\0') n++;
        return n;
    }

    @Test
    public void recordsALastDetailSummary() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()), GameReplay::replay, () -> 1000L);
        assertNull(store.lastDetail());
        store.onGamesDetail(fixture("detail_neigen.json"));
        GameStore.DetailSummary d = store.lastDetail();
        assertNotNull(d);
        assertEquals(1000L, d.timeMillis);
        assertTrue(d.games > 0);
        assertEquals(0, d.failed);
        assertNull(d.error);
        assertEquals("games/detail T: games=" + d.games + " failed=0 skipped=0 known=" + d.known, d.describe("T"));

        // a malformed game with an id, one without: failed [id] and skipped 1
        JSONObject root = new JSONObject(fixture("detail_neigen.json"));
        org.json.JSONArray games = root.getJSONObject("content").getJSONArray("games");
        games.put(new JSONObject().put("id", 77L));
        games.put(new JSONObject().put("x", 1));
        store.onGamesDetail(root.toString());
        d = store.lastDetail();
        assertEquals(1, d.failed);
        assertEquals(java.util.Collections.singletonList(77L), d.failedIds);
        assertEquals(1, d.skipped);
        assertTrue(d.describe("T"), d.describe("T").contains(" failed=1 [77] skipped=1 "));

        // a response unusable as a whole keeps the store, records the code
        long gen = store.detailGeneration();
        store.onGamesDetail("{\"status\":\"error\"}");
        d = store.lastDetail();
        assertEquals("GS-DATA", d.error);
        assertEquals(0, d.games);
        assertEquals(gen, store.detailGeneration());
        assertTrue(d.describe("T"), d.describe("T").startsWith("games/detail T: error GS-DATA games=0 failed=0"));
        assertNotNull(store.state(GAME)); // unchanged
    }
    /** The game from move_hoort.json after the opponent passed: same board, the turn is ours again. */
    private static String detailAfterOpponentPass() throws Exception {
        JSONObject game = new JSONObject(fixture("move_hoort.json")).getJSONObject("content").getJSONObject("game");
        game.put("updated", game.getLong("updated") + 30);
        game.put("current_player", 0);
        JSONObject pass = new JSONObject();
        pass.put("type", "pass");
        pass.put("player", 1);
        pass.put("timestamp", game.getLong("updated"));
        game.getJSONArray("game_log").put(pass);
        JSONObject content = new JSONObject();
        content.put("games", new org.json.JSONArray().put(game));
        JSONObject root = new JSONObject();
        root.put("status", "success");
        root.put("content", content);
        return root.toString();
    }

    @Test
    public void olderDetailDoesNotOverwriteNewerMoveResponse() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(fixture("detail_neigen.json"));
        store.onMoveResponse(fixture("move_hoort.json"));
        GameState afterMove = store.state(GAME);
        // a games/detail that was in flight across the move arrives late
        store.onGamesDetail(fixture("detail_neigen.json"));
        assertTrue("stale snapshot skipped", afterMove == store.state(GAME));
        assertFalse(store.state(GAME).myTurn());
        assertEquals(2, store.detailGeneration()); // still counts as a processed games/detail
    }

    @Test
    public void olderMoveResponseDoesNotOverwriteNewerDetail() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(fixture("detail_neigen.json"));
        store.onGamesDetail(detailAfterOpponentPass());
        assertTrue(store.state(GAME).myTurn());
        store.onMoveResponse(fixture("move_hoort.json")); // processed late on another thread
        assertTrue("turn stays with us", store.state(GAME).myTurn());
    }

    @Test
    public void opponentPassFlipsTurnWithUnchangedBoard() throws Exception {
        GameStore store = new GameStore(new Storage(tmp.getRoot()));
        store.onGamesDetail(fixture("detail_neigen.json"));
        store.onMoveResponse(fixture("move_hoort.json"));
        GameState afterMove = store.state(GAME);
        assertFalse(afterMove.myTurn());
        store.onGamesDetail(detailAfterOpponentPass());
        GameState now = store.state(GAME);
        assertNull(now.unreadable());
        assertTrue(now.myTurn());
        assertTrue(java.util.Arrays.deepEquals(afterMove.board(), now.board()));
        assertFalse("overlay reloads on a turn-only change",
                app.wordfeudwordfinder.extension.ui.MovePipeline.sameInput(afterMove, now));
    }

    @Test
    public void notOlderComparesUpdatedThenLogLength() {
        java.util.List<LogEvent> one = java.util.Collections.singletonList(new LogEvent("start", new JSONObject()));
        java.util.List<LogEvent> none = java.util.Collections.emptyList();
        RawGame old = new RawGame(1L, 0, 2, 0, 0, 0, one, 100);
        assertTrue(RawGame.notOlder(null, old));
        assertFalse(RawGame.notOlder(old, null));
        assertTrue(RawGame.notOlder(old, new RawGame(1L, 0, 2, 0, 0, 0, none, 101)));
        assertFalse(RawGame.notOlder(old, new RawGame(1L, 0, 2, 0, 0, 0, one, 99)));
        assertTrue("equal data is accepted", RawGame.notOlder(old, new RawGame(1L, 0, 2, 1, 0, 0, one, 100)));
        assertFalse(RawGame.notOlder(old, new RawGame(1L, 0, 2, 0, 0, 0, none, 100)));
        // without updated on either side only the log length counts
        assertTrue(RawGame.notOlder(old, new RawGame(1L, 0, 2, 0, 0, 0, one)));
        assertFalse(RawGame.notOlder(old, new RawGame(1L, 0, 2, 0, 0, 0, none)));
    }

    @Test
    public void sourcePathHidesNumbersAndQuery() {
        assertEquals("game/<id>/move/",
                GameStore.sourcePath("https://api.wordfeud.com/wf/game/4391319402/move/?game_format=log"));
        assertEquals("user/games/detail/",
                GameStore.sourcePath("https://api.wordfeud.com/wf/user/games/detail/?known_tile_points=1"));
        assertEquals("overlay-play", GameStore.sourcePath("overlay-play"));
        assertNull(GameStore.sourcePath(null));
    }

    @Test
    public void recordsSourceOfLastUpdateAndSkippedStaleOne() throws Exception {
        long[] t = {1000L};
        GameStore store = new GameStore(new Storage(tmp.getRoot()), GameReplay::replay, () -> t[0]);
        assertNull(store.source(GAME));
        store.onGamesDetail(fixture("detail_neigen.json"), "https://api.wordfeud.com/wf/user/games/detail/?x=1");
        t[0] = 2000L;
        store.onMoveResponse(fixture("move_hoort.json"), "https://api.wordfeud.com/wf/game/" + GAME + "/move/");
        GameStore.UpdateSource src = store.source(GAME);
        assertEquals("game/<id>/move/", src.path);
        assertEquals(2000L, src.timeMillis);
        assertFalse(src.myTurn);
        assertEquals(1793538961L, (long) src.updated);
        assertNull(src.skippedPath);
        t[0] = 3000L;
        store.onGamesDetail(fixture("detail_neigen.json"), "https://api.wordfeud.com/wf/user/games/detail/");
        src = store.source(GAME);
        assertEquals("applied source kept", "game/<id>/move/", src.path);
        assertEquals("user/games/detail/", src.skippedPath);
        assertEquals(3000L, src.skippedTimeMillis);
        assertEquals("user/games/detail/", store.source(OTHER).path);
    }
}
