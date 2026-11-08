package app.noam.extension.chesscom.stockfish;

import android.content.Context;

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
import java.util.List;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.lichesspuzzle.San;

/**
 * Cloud-backed Stockfish engine calling high-speed REST APIs:
 * Primary: chess-api.com (POST)
 * Backup: stockfish.online (GET)
 *
 * Provides instantaneous evaluations and best-move arrows without running
 * heavy 80 MB native binaries or draining battery on mobile CPU cores.
 */
public class ApiEngine extends Engine {
    private static final String PRIMARY_API = "https://chess-api.com/v1";
    private static final String BACKUP_API = "https://stockfish.online/api/s/v2.php";
    private static final int TIMEOUT_MS = 5000;

    private volatile HttpURLConnection activeConnection;

    public ApiEngine() {
        super(1, 16);
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
        // Stateless cloud engine does not need transposition table clearing
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

        // Check if the game is already over (checkmate, stalemate, insufficient material)
        Result finished = checkFinished(fen);
        if (finished != null) {
            if (progress != null) progress.onProgress(finished);
            return finished;
        }

        // 1. Try Primary API (chess-api.com)
        Result res = queryChessApi(fen, depth);
        if (res != null && res.valid()) {
            if (progress != null) progress.onProgress(res);
            return res;
        }

        // 2. Try Backup API (stockfish.online)
        res = queryStockfishOnline(fen, Math.min(depth, 12));
        if (res != null && res.valid()) {
            if (progress != null) progress.onProgress(res);
            return res;
        }

        return empty();
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

    private Result queryChessApi(String fen, int depth) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(PRIMARY_API);
            conn = (HttpURLConnection) url.openConnection();
            activeConnection = conn;
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android; Chess)");
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);
            conn.setDoOutput(true);

            // chess-api.com's validator strictly rejects FENs with en-passant target squares (e.g. e3, d6)
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
            if (conn != null) {
                conn.disconnect();
            }
            if (activeConnection == conn) {
                activeConnection = null;
            }
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
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);

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
            if (conn != null) {
                conn.disconnect();
            }
            if (activeConnection == conn) {
                activeConnection = null;
            }
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

    /**
     * Normalizes the en-passant field in FEN to "-" for chess-api.com.
     * chess-api.com strictly fails with INVALID_FEN_VALIDATION_ERROR on any FEN
     * containing a pseudo en-passant target square (e.g. "e3", "d6").
     */
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
