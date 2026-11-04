package app.wordfeudwordfinder.extension.game;

import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.core.WfError;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.function.LongSupplier;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Holds parsed games and their replayed state; caches rulesets and board layouts on disk because the app omits
 * known ones from games/detail (spec section 5). Thread-safe; listeners run outside the monitor.
 */
public final class GameStore {
    private static final String RULESETS_FILE = "cache/rulesets.json";
    private static final String BOARDS_FILE = "cache/boards.json";

    private final Storage storage;
    private final Function<RawGame, GameState> replayer;
    private final Map<Long, RawGame> games = new LinkedHashMap<>();
    private final Map<Long, GameState> states = new LinkedHashMap<>();
    private final Map<Long, UpdateSource> sources = new LinkedHashMap<>();
    private final Map<Integer, Ruleset> rulesets = new LinkedHashMap<>();
    private final Map<Integer, BoardLayout> boards = new LinkedHashMap<>();
    private final List<Runnable> listeners = new ArrayList<>();
    /** Number of games/detail responses processed (see {@link #detailGeneration}). */
    private long detailGeneration;
    private final LongSupplier clock;
    private DetailSummary lastDetail;

    /**
     * Diagnostics for the last games/detail response (also one that failed as a whole): when, how many games were
     * parsed, which ids failed, how many entries were skipped (no id) and the whole-response error code. Only counts,
     * game ids and error codes: no user names or response content. Shown as {@code store=} in Copy details.
     */
    public static final class DetailSummary {
        /** At most this many failed ids are kept. */
        static final int MAX_IDS = 5;

        public final long timeMillis;
        /** Games parsed and stored from that response. */
        public final int games;
        /** Ids of games whose header could not be parsed (at most {@link #MAX_IDS}). */
        public final List<Long> failedIds;
        public final int failed;
        public final int skipped;
        /** The whole-response error code (e.g. GS-DATA), or null when the response was usable. */
        public final String error;
        /** The number of games known to the store after that response. */
        public final int known;

        public DetailSummary(long timeMillis, int games, List<Long> failedIds, int failed, int skipped, String error,
                int known) {
            this.timeMillis = timeMillis;
            this.games = games;
            this.failedIds = java.util.Collections.unmodifiableList(failedIds);
            this.failed = failed;
            this.skipped = skipped;
            this.error = error;
            this.known = known;
        }

        /** {@code games/detail <time>: games=3 failed=1 [123] skipped=0 known=12}, or {@code ...: error GS-DATA ...}. */
        public String describe(String time) {
            StringBuilder b = new StringBuilder("games/detail ").append(time).append(": ");
            if (error != null) b.append("error ").append(error).append(' ');
            b.append("games=").append(games).append(" failed=").append(failed);
            if (!failedIds.isEmpty()) {
                b.append(" [");
                for (int i = 0; i < failedIds.size(); i++) b.append(i == 0 ? "" : ",").append(failedIds.get(i));
                if (failed > failedIds.size()) b.append(",...");
                b.append(']');
            }
            b.append(" skipped=").append(skipped).append(" known=").append(known);
            return b.toString();
        }
    }

    /**
     * Diagnostics per game: where its stored data came from (the API path with numbers replaced by {@code <id>}, no
     * query, see {@link #sourcePath}), when, its {@code updated} time and turn; plus the last response for it that
     * was skipped as older than the stored one. Paths and numbers only, no response content. Shown in Copy details.
     */
    public static final class UpdateSource {
        public final String path;
        public final long timeMillis;
        /** The game's server {@code updated} time in seconds, or negative when unknown. */
        public final double updated;
        public final boolean myTurn;
        /** Path of the last skipped (older) response for this game, or null. */
        public final String skippedPath;
        public final long skippedTimeMillis;

        public UpdateSource(String path, long timeMillis, double updated, boolean myTurn, String skippedPath,
                long skippedTimeMillis) {
            this.path = path;
            this.timeMillis = timeMillis;
            this.updated = updated;
            this.myTurn = myTurn;
            this.skippedPath = skippedPath;
            this.skippedTimeMillis = skippedTimeMillis;
        }
    }

    private static final String API_PREFIX = "https://api.wordfeud.com/wf/";

    /**
     * A URL reduced for diagnostics: without the API prefix and query, every run of digits replaced by {@code <id>}
     * (e.g. {@code game/<id>/move/}). Null stays null.
     */
    public static String sourcePath(String url) {
        if (url == null) return null;
        String p = url;
        int q = p.indexOf('?');
        if (q >= 0) p = p.substring(0, q);
        int h = p.indexOf('#');
        if (h >= 0) p = p.substring(0, h);
        if (p.startsWith(API_PREFIX)) p = p.substring(API_PREFIX.length());
        return p.replaceAll("[0-9]+", "<id>");
    }

    public GameStore(Storage s) {
        this(s, GameReplay::replay);
    }

    /** Test seam: a custom replay function (e.g. one that throws). */
    GameStore(Storage s, Function<RawGame, GameState> replayer) {
        this(s, replayer, System::currentTimeMillis);
    }

    /** Test seam: a custom replay function and clock. */
    GameStore(Storage s, Function<RawGame, GameState> replayer, LongSupplier clock) {
        this.storage = s;
        this.replayer = replayer;
        this.clock = clock;
        loadCache();
    }

    /**
     * Merges a games/detail response: games are upserted by id (a game older than the stored one is skipped, see
     * {@link RawGame#notOlder}), new rulesets/boards are merged into memory and the
     * disk cache. A response that is not parseable as a whole leaves the store unchanged and does not notify.
     */
    public void onGamesDetail(String json) {
        onGamesDetail(json, "user/games/detail/");
    }

    /** As {@link #onGamesDetail(String)}; {@code url} is recorded (reduced, see {@link #sourcePath}) per game. */
    public void onGamesDetail(String json, String url) {
        ResponseParser.Parsed p;
        try {
            p = ResponseParser.parseGamesDetail(json);
        } catch (WfError e) {
            onGamesDetail(null, e, url);
            return;
        }
        onGamesDetail(p, null, url);
    }

    /**
     * Any other Wordfeud API response (not games/detail, not a move response): when it carries games with a
     * {@code game_log} (see {@link ResponseParser#classify}) they are merged like a games/detail (a list) or upserted
     * (a single {@code content.game}); anything else, including malformed JSON or an error status, is ignored
     * without notifying. Never throws. Returns true when the response carried game data.
     */
    public boolean onGameData(String json) {
        return onGameData(json, null);
    }

    /** As {@link #onGameData(String)}; {@code url} is recorded (reduced, see {@link #sourcePath}) per game. */
    public boolean onGameData(String json, String url) {
        JSONObject root;
        try {
            root = new JSONObject(json);
        } catch (Exception e) { // JSONException is checked on Android, unchecked on the JVM
            return false;
        }
        ResponseParser.Kind kind = ResponseParser.classify(root);
        if (kind == ResponseParser.Kind.GAMES) {
            ResponseParser.Parsed p;
            try {
                p = ResponseParser.parseGamesDetail(root);
            } catch (WfError e) {
                return false; // a malformed list from another endpoint does not count as a failed games/detail
            }
            onGamesDetail(p, null, url);
            return true;
        }
        if (kind == ResponseParser.Kind.GAME) {
            onSingleGame(root, url);
            return true;
        }
        return false;
    }

    /**
     * Upserts {@code content.game} of a non-move response (e.g. Wordfeud reloading the open game). Unlike
     * {@link #onMoveResponse} it never throws: an unparseable game is ignored. It counts as a games/detail for
     * {@link #detailGeneration}: it is the server's own snapshot, not the result of our move.
     */
    private void onSingleGame(JSONObject root, String url) {
        RawGame g;
        try {
            g = ResponseParser.parseSingleGame(root);
        } catch (WfError | RuntimeException e) {
            return;
        }
        List<Runnable> toRun;
        synchronized (this) {
            put(g, url);
            detailGeneration++;
            toRun = new ArrayList<>(listeners);
        }
        notifyAll(toRun);
    }

    /** Merges a parsed games list, or records the whole-response error {@code e} (then {@code p} is null). */
    private void onGamesDetail(ResponseParser.Parsed p, WfError e, String url) {
        if (e != null) {
            synchronized (this) {
                lastDetail = new DetailSummary(now(), 0, new ArrayList<Long>(), 0, 0, e.code(), states.size());
            }
            return;
        }
        List<Runnable> toRun;
        synchronized (this) {
            mergeCache(p.rulesets, p.boards);
            for (RawGame g : p.games) put(g, url);
            List<Long> failedIds = new ArrayList<>();
            for (Map.Entry<Long, WfError> f : p.failedGames.entrySet()) {
                games.remove(f.getKey());
                states.put(f.getKey(), unreadable(f.getKey(), f.getValue(), false, false));
                if (failedIds.size() < DetailSummary.MAX_IDS) failedIds.add(f.getKey());
            }
            lastDetail = new DetailSummary(now(), p.games.size(), failedIds, p.failedGames.size(), p.skippedGames,
                    null, states.size());
            detailGeneration++;
            toRun = new ArrayList<>(listeners);
        }
        notifyAll(toRun);
    }

    /**
     * Replaces the game from a move response (unless the stored one is newer); throws MV-SERVER-... and changes
     * nothing on a server error.
     */
    public void onMoveResponse(String json) throws WfError {
        onMoveResponse(json, "move");
    }

    /** As {@link #onMoveResponse(String)}; {@code url} is recorded (reduced, see {@link #sourcePath}). */
    public void onMoveResponse(String json, String url) throws WfError {
        RawGame g = ResponseParser.parseMove(json);
        List<Runnable> toRun;
        synchronized (this) {
            put(g, url);
            toRun = new ArrayList<>(listeners);
        }
        notifyAll(toRun);
    }

    /** Null when the game is unknown. */
    public synchronized GameState state(long gameId) {
        return states.get(gameId);
    }

    /** The parsed game (ruleset/board ids), or null when unknown or its header was unparseable. */
    public synchronized RawGame game(long gameId) {
        return games.get(gameId);
    }

    public synchronized Ruleset ruleset(int id) {
        return rulesets.get(id);
    }

    public synchronized BoardLayout board(int id) {
        return boards.get(id);
    }

    /** Ruleset ids of the games currently in the store. */
    public synchronized Set<Integer> seenRulesets() {
        Set<Integer> out = new HashSet<>();
        for (RawGame g : games.values()) out.add(g.getRulesetId());
        return out;
    }

    /**
     * How many games/detail responses have been processed, including other responses with game data
     * ({@link #onGameData}); a move response does not count. Listeners fire after
     * both kinds; a caller that must wait for a games/detail compares this count instead (Play after MV-NET).
     */
    public synchronized long detailGeneration() {
        return detailGeneration;
    }

    /** Where the stored data of {@code gameId} came from, or null when unknown. */
    public synchronized UpdateSource source(long gameId) {
        return sources.get(gameId);
    }

    /** The last games/detail response's summary, or null when none was seen yet. */
    public synchronized DetailSummary lastDetail() {
        return lastDetail;
    }

    public synchronized void addListener(Runnable r) {
        listeners.add(r);
    }

    // ---- internals (call with the monitor held) ----

    private long now() {
        try {
            return clock.getAsLong();
        } catch (RuntimeException e) {
            return 0L;
        }
    }

    /**
     * Stores {@code g} unless the stored copy of that game is newer ({@link RawGame#notOlder}); false when it was
     * skipped as stale.
     */
    private boolean put(RawGame g, String url) {
        String path = sourcePath(url);
        UpdateSource prev = sources.get(g.getId());
        if (!RawGame.notOlder(games.get(g.getId()), g)) {
            if (prev != null) {
                sources.put(g.getId(), new UpdateSource(prev.path, prev.timeMillis, prev.updated, prev.myTurn, path,
                        now()));
            }
            return false;
        }
        games.put(g.getId(), g);
        replay(g);
        GameState st = states.get(g.getId());
        sources.put(g.getId(), new UpdateSource(path, now(), g.getUpdated(), st != null && st.myTurn(),
                prev == null ? null : prev.skippedPath, prev == null ? 0L : prev.skippedTimeMillis));
        return true;
    }

    /** Replays {@code g} into {@link #states} (the caller has stored it in {@link #games}). */
    private void replay(RawGame g) {
        if (!rulesets.containsKey(g.getRulesetId())) {
            states.put(g.getId(), unreadable(g.getId(), WfError.gsData("ruleset " + g.getRulesetId() + " unknown"),
                    g));
        } else if (!boards.containsKey(g.getBoardId())) {
            states.put(g.getId(), unreadable(g.getId(), WfError.gsData("board " + g.getBoardId() + " unknown"), g));
        } else {
            GameState st;
            try {
                st = replayer.apply(g);
            } catch (RuntimeException e) {
                // an unexpected replay bug makes this one game unreadable instead of losing the whole response
                st = unreadable(g.getId(), WfError.gsData("replay: " + e), g);
            }
            states.put(g.getId(), st);
        }
    }

    private static GameState unreadable(long id, WfError e, RawGame g) {
        boolean ended = g.getEndGame() != 0;
        boolean myTurn = g.getLocalPosition() >= 0 && g.getCurrentPlayer() == g.getLocalPosition() && !ended;
        return unreadable(id, e, myTurn, ended);
    }

    private static GameState unreadable(long id, WfError e, boolean myTurn, boolean ended) {
        return new GameState(id, new char[GameState.SIZE][GameState.SIZE], new ArrayList<String>(), myTurn, ended, e);
    }

    private void mergeCache(List<Ruleset> newRulesets, List<BoardLayout> newBoards) {
        for (Ruleset r : newRulesets) rulesets.put(r.getId(), r);
        for (BoardLayout b : newBoards) boards.put(b.getId(), b);
        try {
            if (!newRulesets.isEmpty()) storage.writeTextAtomic(RULESETS_FILE, rulesetsJson().toString());
            if (!newBoards.isEmpty()) storage.writeTextAtomic(BOARDS_FILE, boardsJson().toString());
        } catch (org.json.JSONException e) {
            // best effort: the in-memory copy is still valid for this session
        } catch (IOException | RuntimeException e) {
            // best effort: the in-memory copy is still valid for this session
        }
    }

    private JSONArray rulesetsJson() throws org.json.JSONException {
        JSONArray a = new JSONArray();
        for (Ruleset r : rulesets.values()) {
            JSONObject o = new JSONObject();
            o.put("ruleset", r.getId());
            o.put("language_code", r.getLanguageCode());
            o.put("tile_points", new JSONObject(r.getTilePoints()));
            o.put("tile_counts", new JSONObject(r.getTileCounts()));
            a.put(o);
        }
        return a;
    }

    private JSONArray boardsJson() throws org.json.JSONException {
        JSONArray a = new JSONArray();
        for (BoardLayout b : boards.values()) {
            JSONObject o = new JSONObject();
            o.put("board_id", b.getId());
            JSONArray rows = new JSONArray();
            for (int[] row : b.getSquares()) {
                JSONArray r = new JSONArray();
                for (int v : row) r.put(v);
                rows.put(r);
            }
            o.put("board", rows);
            a.put(o);
        }
        return a;
    }

    /** Reads the cache files; a missing or corrupt file counts as empty, corrupt entries are skipped. */
    private void loadCache() {
        List<Ruleset> rs = new ArrayList<>();
        List<BoardLayout> bs = new ArrayList<>();
        try {
            String t = storage.readText(RULESETS_FILE);
            if (t != null) {
                Object v = new org.json.JSONTokener(t).nextValue();
                if (v instanceof JSONArray) rs = ResponseParser.parseRulesets((JSONArray) v);
            }
        } catch (Exception e) {
            rs = new ArrayList<>();
        }
        try {
            String t = storage.readText(BOARDS_FILE);
            if (t != null) {
                Object v = new org.json.JSONTokener(t).nextValue();
                if (v instanceof JSONArray) bs = ResponseParser.parseBoards((JSONArray) v);
            }
        } catch (Exception e) {
            bs = new ArrayList<>();
        }
        for (Ruleset r : rs) rulesets.put(r.getId(), r);
        for (BoardLayout b : bs) boards.put(b.getId(), b);
    }

    private static void notifyAll(List<Runnable> toRun) {
        for (Runnable r : toRun) {
            try {
                r.run();
            } catch (Throwable t) {
                // listener failures never affect the store or the app
            }
        }
    }
}
