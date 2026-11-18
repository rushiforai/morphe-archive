package app.noam.extension.chesscom.stockfish;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.gamereview.GameReview;
import app.noam.extension.chesscom.lichesspuzzle.San;

/**
 * Cloud-backed Stockfish engine calling high-speed REST APIs:
 * - Syzygy Tablebase: tablebase.lichess.ovh/standard (GET)
 * - Lichess Cloud Eval: lichess.org/api/cloud-eval (GET)
 * - Chess-API: chess-api.com/v1 (POST)
 * - Stockfish Online: stockfish.online/api/s/v2.php (GET)
 *
 * Implements resilient Auto behaviors:
 * - Parallel ping race on startup/manual retest between on-demand engines
 * - Opportunistic fast cache lookups (Tablebase <= 7 pieces, Lichess Cloud depth 30-75)
 * - Rolling EWMA latency tracking based on real in-flight queries
 * - Instant failover between on-demand engines with zero lockout quarantine
 */
public class ApiEngine extends Engine {
    public static final String PROVIDER_AUTO = "AUTO";
    public static final String PROVIDER_LICHESS = "LICHESS";
    public static final String PROVIDER_CHESS_API = "CHESS_API";
    public static final String PROVIDER_STOCKFISH_ONLINE = "STOCKFISH_ONLINE";

    public static final String[] PROVIDERS = {
        PROVIDER_AUTO, PROVIDER_LICHESS, PROVIDER_CHESS_API, PROVIDER_STOCKFISH_ONLINE
    };
    public static final String[] PROVIDER_NAMES = {
        "Auto", "Lichess", "Chess-API", "Stockfish Online"
    };

    public static final String PREF_PROVIDER = "stockfish_api_provider";

    private static final String PRIMARY_API = "https://chess-api.com/v1";
    private static final String BACKUP_API = "https://stockfish.online/api/s/v2.php";
    private static final String LICHESS_API = "https://lichess.org/api/cloud-eval";
    private static final String TABLEBASE_API = "https://tablebase.lichess.ovh/standard";

    private static final int CONNECT_TIMEOUT_MS = 8000;
    private static final int READ_TIMEOUT_MS = 12000;
    private static final int CACHE_CONNECT_TIMEOUT_MS = 1500;
    private static final int CACHE_READ_TIMEOUT_MS = 2000;
    private static final int PING_TIMEOUT_MS = 3000;

    private static final Map<String, Long> pingTimes = new ConcurrentHashMap<>();
    private static volatile String autoWinnerProvider = null;
    private static final Object PING_LOCK = new Object();

    private volatile HttpURLConnection activeConnection;

    public enum Strategy {
        PURE_STOCKFISH,
        COMBO_SMART,
        COMBO_DEEP,
        LICHESS
    }

    private final Strategy strategy;

    public ApiEngine() {
        this(null);
    }

    public ApiEngine(Strategy strategy) {
        super(1, 16);
        this.strategy = strategy;
    }

    public interface PingCallback {
        void onComplete(String summary);
    }

    public static String getProvider() {
        SharedPreferences prefs = Features.preferences();
        return prefs == null ? PROVIDER_AUTO : prefs.getString(PREF_PROVIDER, PROVIDER_AUTO);
    }

    public static void setProvider(String provider) {
        SharedPreferences prefs = Features.preferences();
        if (prefs != null) {
            prefs.edit().putString(PREF_PROVIDER, provider).apply();
        }
    }

    public static int getProviderIndex() {
        String current = getProvider();
        for (int i = 0; i < PROVIDERS.length; i++) {
            if (PROVIDERS[i].equalsIgnoreCase(current)) return i;
        }
        return 0;
    }

    public static void setProviderIndex(int index) {
        if (index >= 0 && index < PROVIDERS.length) {
            setProvider(PROVIDERS[index]);
        }
    }

    public static String getProviderDisplayName(String provider) {
        for (int i = 0; i < PROVIDERS.length; i++) {
            if (PROVIDERS[i].equalsIgnoreCase(provider)) return PROVIDER_NAMES[i];
        }
        return provider;
    }

    public static String getActiveProviderDescription() {
        String setting = getProvider();
        if (PROVIDER_AUTO.equalsIgnoreCase(setting)) {
            String winner = autoWinnerProvider;
            if (winner == null) {
                return "Auto: will ping on first request";
            }
            Long ping = pingTimes.get(winner);
            String name = getProviderDisplayName(winner);
            return ping != null ? "Active: " + name + " (" + ping + "ms)" : "Active: " + name;
        } else {
            Long ping = pingTimes.get(setting);
            String name = getProviderDisplayName(setting);
            return ping != null ? name + " (" + ping + "ms)" : name;
        }
    }

    public static void runPingRaceAsync(PingCallback callback) {
        new Thread(() -> {
            autoWinnerProvider = null;
            String winner = runPingRace();
            String summary;
            if (winner != null) {
                Long ping = pingTimes.get(winner);
                summary = "Fastest: " + getProviderDisplayName(winner) + (ping != null ? " (" + ping + "ms)" : "");
            } else {
                summary = "Ping test completed";
            }
            if (callback != null) {
                callback.onComplete(summary);
            }
        }, "MorphePingRace").start();
    }

    public static String runPingRace() {
        synchronized (PING_LOCK) {
            if (autoWinnerProvider != null) {
                return autoWinnerProvider;
            }

            String[] testProviders = {PROVIDER_CHESS_API, PROVIDER_STOCKFISH_ONLINE, PROVIDER_LICHESS};
            CountDownLatch firstEngineLatch = new CountDownLatch(1);
            CountDownLatch allDoneLatch = new CountDownLatch(testProviders.length);
            final String[] fastestEngine = new String[1];

            ExecutorService pool = Executors.newFixedThreadPool(testProviders.length);
            for (String provider : testProviders) {
                pool.execute(() -> {
                    try {
                        long start = System.currentTimeMillis();
                        boolean ok = pingProvider(provider);
                        long elapsed = System.currentTimeMillis() - start;
                        if (ok) {
                            pingTimes.put(provider, elapsed);
                            // Only calculation engines qualify for autoWinner
                            if (!PROVIDER_LICHESS.equalsIgnoreCase(provider)) {
                                synchronized (fastestEngine) {
                                    if (fastestEngine[0] == null) {
                                        fastestEngine[0] = provider;
                                        firstEngineLatch.countDown();
                                    }
                                }
                            }
                        }
                    } catch (Throwable t) {
                        Utils.logError("Ping failed for " + provider, t);
                    } finally {
                        allDoneLatch.countDown();
                    }
                });
            }
            pool.shutdown();

            try {
                firstEngineLatch.await(3000, TimeUnit.MILLISECONDS);
            } catch (InterruptedException ignored) {}

            if (fastestEngine[0] != null) {
                autoWinnerProvider = fastestEngine[0];
            } else if (autoWinnerProvider == null) {
                autoWinnerProvider = PROVIDER_CHESS_API;
            }

            new Thread(() -> {
                try {
                    allDoneLatch.await(3000, TimeUnit.MILLISECONDS);
                } catch (InterruptedException ignored) {}
            }).start();

            return autoWinnerProvider;
        }
    }

    private static boolean pingProvider(String provider) {
        if (PROVIDER_LICHESS.equalsIgnoreCase(provider)) return pingLichess();
        if (PROVIDER_CHESS_API.equalsIgnoreCase(provider)) return pingChessApi();
        if (PROVIDER_STOCKFISH_ONLINE.equalsIgnoreCase(provider)) return pingStockfishOnline();
        return false;
    }

    private static boolean pingLichess() {
        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://lichess.org/api/cloud-eval?fen=rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR%20w%20KQkq%20-%200%201&multiPv=1");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(CACHE_CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(CACHE_READ_TIMEOUT_MS);
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Throwable t) {
            return false;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static boolean pingChessApi() {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(PRIMARY_API);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(PING_TIMEOUT_MS);
            conn.setReadTimeout(PING_TIMEOUT_MS);
            conn.setDoOutput(true);
            JSONObject body = new JSONObject();
            body.put("fen", "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1");
            body.put("depth", 8);

            byte[] b = body.toString().getBytes(StandardCharsets.UTF_8);
            try (OutputStream os = conn.getOutputStream()) {
                os.write(b);
                os.flush();
            }
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Throwable t) {
            return false;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static boolean pingStockfishOnline() {
        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://stockfish.online/api/s/v2.php?fen=rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR%20w%20KQkq%20-%200%201&depth=5");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(PING_TIMEOUT_MS);
            conn.setReadTimeout(PING_TIMEOUT_MS);
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Throwable t) {
            return false;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static void recordSuccess(String provider, long elapsedMs) {
        Long prev = pingTimes.get(provider);
        if (prev != null && prev > 0) {
            // Rolling EWMA: 70% history, 30% live query
            pingTimes.put(provider, (long) (0.7 * prev + 0.3 * elapsedMs));
        } else {
            pingTimes.put(provider, elapsedMs);
        }
    }

    @Override
    public boolean start(Context context) {
        return true;
    }

    @Override
    public boolean ready() {
        return true;
    }

    @Override
    public void newGame() {
    }

    private Strategy resolveStrategy() {
        if (this.strategy != null) return this.strategy;
        String setting = getProvider();
        if (PROVIDER_LICHESS.equalsIgnoreCase(setting)) {
            return Strategy.LICHESS;
        } else if (PROVIDER_CHESS_API.equalsIgnoreCase(setting) || PROVIDER_STOCKFISH_ONLINE.equalsIgnoreCase(setting)) {
            return Strategy.PURE_STOCKFISH;
        } else {
            return Strategy.COMBO_SMART;
        }
    }

    @Override
    public void stopSearch() {
        HttpURLConnection conn = activeConnection;
        if (conn != null) {
            try {
                conn.disconnect();
            } catch (Throwable ignored) {
            }
        }
    }

    @Override
    public void quit() {
        stopSearch();
    }

    @Override
    public Result analyse(String fen, int depth, int lines, Progress progress) {
        return query(fen, depth > 0 ? depth : 10, lines, progress);
    }

    @Override
    public Result analyseGame(String startFen, List<String> history, String positionFen, int depth, long nodes, int lines) {
        String targetFen = (positionFen != null && !positionFen.trim().isEmpty())
            ? positionFen
            : (startFen != null && !startFen.trim().isEmpty())
                ? startFen
                : "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
        Result res = query(targetFen, depth > 0 ? depth : 10, lines, null);
        if (res == null || !res.valid()) {
            List<String> moves = new ArrayList<>();
            moves.add("e2e4");
            return new Result(moves, 0f, 0, depth > 0 ? depth : 10, false, moves, new float[]{0f});
        }
        return res;
    }

    private Result query(String fen, int depth, int lines, Progress progress) {
        if (fen == null || fen.trim().isEmpty()) return empty();

        // 1. Terminal game state (mate, stalemate, insufficient material)
        Result finished = checkFinished(fen);
        if (finished != null) {
            if (progress != null) progress.onProgress(finished);
            return finished;
        }

        Strategy strat = resolveStrategy();

        // PURE_STOCKFISH: Directly compute with pure Stockfish engine (chess-api.com / stockfish.online)
        // Zero Lichess / Tablebase calls.
        if (strat == Strategy.PURE_STOCKFISH) {
            return queryEngineFallback(fen, depth, progress);
        }

        int pieces = countPieces(fen);

        // Endgame Tablebase (Syzygy, <= 7 pieces) for COMBO_SMART, COMBO_DEEP, and LICHESS
        if (pieces <= 7) {
            Result tb = queryLichessTablebase(fen);
            if (tb != null && tb.valid()) {
                if (progress != null) progress.onProgress(tb);
                return tb;
            }
        }

        // COMBO_SMART:
        // Opening theory (pieces > 20): check Lichess Cloud cache.
        // Opening theory is almost always cached (instant depth 30-75 in ~150ms).
        // Middlegame (8..20 pieces): skip Lichess cache check completely!
        // Middlegame positions are novel, so checking Lichess would waste 404 latency.
        if (strat == Strategy.COMBO_SMART) {
            if (pieces > 20) {
                Result cloud = queryLichessCloud(fen, CACHE_CONNECT_TIMEOUT_MS, CACHE_READ_TIMEOUT_MS);
                if (cloud != null && cloud.valid()) {
                    if (progress != null) progress.onProgress(cloud);
                    return cloud;
                }
            }
            return queryEngineFallback(fen, depth, progress);
        }

        // COMBO_DEEP:
        // Speculatively check Lichess Cloud cache for every move (including middlegame master positions)
        // with an aggressive short timeout (350ms connect, 400ms read) so misses fail fast without stalling.
        if (strat == Strategy.COMBO_DEEP) {
            Result cloud = queryLichessCloud(fen, 350, 400);
            if (cloud != null && cloud.valid()) {
                if (progress != null) progress.onProgress(cloud);
                return cloud;
            }
            return queryEngineFallback(fen, depth, progress);
        }

        // LICHESS:
        // Standard Lichess Cloud check with fallback to engine compute
        if (strat == Strategy.LICHESS) {
            Result cloud = queryLichessCloud(fen, CACHE_CONNECT_TIMEOUT_MS, CACHE_READ_TIMEOUT_MS);
            if (cloud != null && cloud.valid()) {
                if (progress != null) progress.onProgress(cloud);
                return cloud;
            }
            return queryEngineFallback(fen, depth, progress);
        }

        return queryEngineFallback(fen, depth, progress);
    }

    private Result queryEngineFallback(String fen, int depth, Progress progress) {
        List<String> order = getProviderOrder();
        for (String p : order) {
            long start = System.currentTimeMillis();
            Result res = queryEngineProvider(p, fen, depth);
            long elapsed = System.currentTimeMillis() - start;
            if (res != null && res.valid()) {
                recordSuccess(p, elapsed);
                if (progress != null) progress.onProgress(res);
                return res;
            }
        }
        return empty();
    }

    private List<String> getProviderOrder() {
        String setting = getProvider();
        List<String> order = new ArrayList<>();

        if (PROVIDER_STOCKFISH_ONLINE.equalsIgnoreCase(setting)) {
            order.add(PROVIDER_STOCKFISH_ONLINE);
            order.add(PROVIDER_CHESS_API);
        } else if (PROVIDER_CHESS_API.equalsIgnoreCase(setting)) {
            order.add(PROVIDER_CHESS_API);
            order.add(PROVIDER_STOCKFISH_ONLINE);
        } else {
            // AUTO or LICHESS
            String winner = autoWinnerProvider;
            if (winner == null) {
                winner = PROVIDER_CHESS_API;
            }
            if (PROVIDER_STOCKFISH_ONLINE.equalsIgnoreCase(winner)) {
                order.add(PROVIDER_STOCKFISH_ONLINE);
                order.add(PROVIDER_CHESS_API);
            } else {
                order.add(PROVIDER_CHESS_API);
                order.add(PROVIDER_STOCKFISH_ONLINE);
            }
        }
        return order;
    }

    private Result queryEngineProvider(String provider, String fen, int depth) {
        if (PROVIDER_STOCKFISH_ONLINE.equalsIgnoreCase(provider)) {
            return queryStockfishOnline(fen, Math.min(depth, 12));
        } else {
            return queryChessApi(fen, depth);
        }
    }

    private static int countPieces(String fen) {
        if (fen == null) return 32;
        String placement = fen.trim().split("\\s+")[0];
        int count = 0;
        for (int i = 0; i < placement.length(); i++) {
            char c = placement.charAt(i);
            if (c != '/' && !Character.isDigit(c)) {
                count++;
            }
        }
        return count;
    }

    private Result checkFinished(String fen) {
        boolean whiteToMove = !fen.contains(" b ");
        if (San.checkmate(fen)) {
            float score = whiteToMove ? -Engine.MATE_SCORE : Engine.MATE_SCORE;
            return new Result(new ArrayList<>(), score, 0, 0, true, new ArrayList<>(), new float[]{score});
        }
        if (San.stalemate(fen) || San.insufficientMaterial(fen)) {
            return new Result(new ArrayList<>(), 0f, 0, 0, true, new ArrayList<>(), new float[]{0f});
        }
        return null;
    }

    private Result queryLichessTablebase(String fen) {
        HttpURLConnection conn = null;
        try {
            String encodedFen = URLEncoder.encode(fen, "UTF-8");
            URL url = new URL(TABLEBASE_API + "?fen=" + encodedFen);
            conn = (HttpURLConnection) url.openConnection();
            activeConnection = conn;
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(CACHE_CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(CACHE_READ_TIMEOUT_MS);

            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                String response = readStream(conn.getInputStream());
                JSONObject json = new JSONObject(response);
                if (json.has("moves")) {
                    JSONArray movesArr = json.getJSONArray("moves");
                    if (movesArr.length() > 0) {
                        JSONObject topMove = movesArr.getJSONObject(0);
                        String bestMove = topMove.optString("uci", null);
                        if (bestMove != null && bestMove.length() >= 4) {
                            List<String> moves = new ArrayList<>();
                            moves.add(bestMove);

                            String category = json.optString("category", "draw");
                            boolean whiteToMove = !fen.contains(" b ");

                            float score = 0f;
                            int mate = 0;

                            if ("win".equals(category)) {
                                score = whiteToMove ? Engine.MATE_SCORE : -Engine.MATE_SCORE;
                                int dtm = json.optInt("dtm", 0);
                                if (dtm != 0) {
                                    mate = whiteToMove ? Math.abs(dtm) : -Math.abs(dtm);
                                }
                            } else if ("loss".equals(category)) {
                                score = whiteToMove ? -Engine.MATE_SCORE : Engine.MATE_SCORE;
                                int dtm = json.optInt("dtm", 0);
                                if (dtm != 0) {
                                    mate = whiteToMove ? -Math.abs(dtm) : Math.abs(dtm);
                                }
                            } else {
                                score = 0f;
                            }

                            List<String> pv = new ArrayList<>();
                            pv.add(bestMove);
                            return new Result(moves, score, mate, 100, false, pv, new float[]{score});
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Utils.logError("Tablebase query error: " + t.getMessage(), t);
        } finally {
            if (conn != null) conn.disconnect();
            if (activeConnection == conn) activeConnection = null;
        }
        return null;
    }

    private Result queryLichessCloud(String fen) {
        return queryLichessCloud(fen, CACHE_CONNECT_TIMEOUT_MS, CACHE_READ_TIMEOUT_MS);
    }

    private Result queryLichessCloud(String fen, int connectTimeoutMs, int readTimeoutMs) {
        HttpURLConnection conn = null;
        try {
            String encodedFen = URLEncoder.encode(fen, "UTF-8");
            URL url = new URL(LICHESS_API + "?fen=" + encodedFen + "&multiPv=1");
            conn = (HttpURLConnection) url.openConnection();
            activeConnection = conn;
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(connectTimeoutMs);
            conn.setReadTimeout(readTimeoutMs);

            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                String response = readStream(conn.getInputStream());
                JSONObject json = new JSONObject(response);
                if (json.has("pvs")) {
                    JSONArray pvs = json.getJSONArray("pvs");
                    if (pvs.length() > 0) {
                        JSONObject pv0 = pvs.getJSONObject(0);
                        String movesStr = pv0.optString("moves", "");
                        if (!movesStr.isEmpty()) {
                            String[] moveList = movesStr.split(" ");
                            String bestMove = moveList[0];
                            if (bestMove.length() >= 4) {
                                List<String> moves = new ArrayList<>();
                                moves.add(bestMove);

                                int mate = 0;
                                if (pv0.has("mate") && !pv0.isNull("mate")) {
                                    mate = pv0.getInt("mate");
                                }

                                float score = 0f;
                                if (mate != 0) {
                                    score = mate > 0 ? (Engine.MATE_SCORE - mate) : (-Engine.MATE_SCORE - mate);
                                } else if (pv0.has("cp") && !pv0.isNull("cp")) {
                                    score = (float) (pv0.getDouble("cp") / 100.0);
                                }

                                List<String> pv = new ArrayList<>();
                                for (String m : moveList) {
                                    if (!m.isEmpty()) pv.add(m);
                                }

                                int reportedDepth = json.optInt("depth", 30);
                                return new Result(moves, score, mate, reportedDepth, false, pv, new float[]{score});
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Utils.logError("Lichess Cloud query error: " + t.getMessage(), t);
        } finally {
            if (conn != null) conn.disconnect();
            if (activeConnection == conn) activeConnection = null;
        }
        return null;
    }

    private Result queryChessApi(String fen, int depth) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(PRIMARY_API);
            conn = (HttpURLConnection) url.openConnection();
            activeConnection = conn;
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);
            conn.setDoOutput(true);

            String targetFen = normalizeEnPassant(fen);
            JSONObject body = new JSONObject();
            body.put("fen", targetFen);
            body.put("depth", depth);

            byte[] jsonBytes = body.toString().getBytes(StandardCharsets.UTF_8);
            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonBytes);
                os.flush();
            }

            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                String response = readStream(conn.getInputStream());
                JSONObject json = new JSONObject(response);
                if (json.has("move")) {
                    String bestMove = json.getString("move");
                    if (bestMove != null && bestMove.length() >= 4) {
                        List<String> moves = new ArrayList<>();
                        moves.add(bestMove);

                        int mate = 0;
                        if (json.has("mate") && !json.isNull("mate")) {
                            mate = json.optInt("mate", 0);
                        }

                        float score = 0f;
                        if (mate != 0) {
                            score = mate > 0 ? (Engine.MATE_SCORE - mate) : (-Engine.MATE_SCORE - mate);
                        } else if (json.has("eval") && !json.isNull("eval")) {
                            score = (float) json.getDouble("eval");
                        }

                        List<String> pv = new ArrayList<>();
                        pv.add(bestMove);
                        if (json.has("continuationArr") && !json.isNull("continuationArr")) {
                            JSONArray arr = json.getJSONArray("continuationArr");
                            for (int i = 0; i < arr.length(); i++) {
                                pv.add(arr.getString(i));
                            }
                        }

                        int reportedDepth = json.optInt("depth", depth);
                        return new Result(moves, score, mate, reportedDepth, false, pv, new float[]{score});
                    }
                }
            }
        } catch (Throwable t) {
            Utils.logError("Chess-API query error: " + t.getMessage(), t);
        } finally {
            if (conn != null) conn.disconnect();
            if (activeConnection == conn) activeConnection = null;
        }
        return null;
    }

    private Result queryStockfishOnline(String fen, int depth) {
        HttpURLConnection conn = null;
        try {
            String encodedFen = URLEncoder.encode(fen, "UTF-8");
            URL url = new URL(BACKUP_API + "?fen=" + encodedFen + "&depth=" + depth);
            conn = (HttpURLConnection) url.openConnection();
            activeConnection = conn;
            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);

            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                String response = readStream(conn.getInputStream());
                JSONObject json = new JSONObject(response);
                if (json.optBoolean("success", false) && json.has("bestmove")) {
                    String rawBest = json.getString("bestmove");
                    String[] parts = rawBest.split(" ");
                    String bestMove = parts.length > 1 ? parts[1] : null;
                    if (bestMove != null && bestMove.length() >= 4) {
                        List<String> moves = new ArrayList<>();
                        moves.add(bestMove);

                        int mate = 0;
                        if (json.has("mate") && !json.isNull("mate")) {
                            mate = json.optInt("mate", 0);
                        }

                        float score = 0f;
                        if (mate != 0) {
                            score = mate > 0 ? (Engine.MATE_SCORE - mate) : (-Engine.MATE_SCORE - mate);
                        } else if (json.has("evaluation") && !json.isNull("evaluation")) {
                            score = (float) json.getDouble("evaluation");
                        }

                        List<String> pv = new ArrayList<>();
                        if (json.has("continuation") && !json.isNull("continuation")) {
                            String cont = json.getString("continuation");
                            for (String move : cont.split(" ")) {
                                if (!move.isEmpty()) pv.add(move);
                            }
                        } else {
                            pv.add(bestMove);
                        }

                        return new Result(moves, score, mate, depth, false, pv, new float[]{score});
                    }
                }
            }
        } catch (Throwable t) {
            Utils.logError("Stockfish.online query error: " + t.getMessage(), t);
        } finally {
            if (conn != null) conn.disconnect();
            if (activeConnection == conn) activeConnection = null;
        }
        return null;
    }

    private static String readStream(InputStream is) throws Exception {
        BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        return sb.toString();
    }

    private static String normalizeEnPassant(String fen) {
        if (fen == null) return null;
        String[] parts = fen.trim().split("\\s+");
        if (parts.length >= 4 && !"-".equals(parts[3])) {
            parts[3] = "-";
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < parts.length; i++) {
                if (i > 0) sb.append(' ');
                sb.append(parts[i]);
            }
            return sb.toString();
        }
        return fen;
    }
}
