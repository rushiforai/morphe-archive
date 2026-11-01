package app.noam.extension.chesscom.gamereview;

import android.webkit.CookieManager;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Locale;

import app.noam.extension.chesscom.lichesspuzzle.San;

/**
 * A review by Lichess's servers: the game is imported and analysed on Lichess (with the user's
 * Lichess account), then read back through Lichess's game export API.
 */
final class LichessServerReview {
    private static final long POLL_MS = 2_500;
    private static final long WAIT_MS = 5 * 60_000;
    /** About how long Lichess takes, for the progress bar. */
    private static final long USUAL_MS = 45_000;
    /** How Lichess's comment on a move that let a forced mate go starts (lila MateLost). */
    private static final String LOST_MATE = "Lost forced checkmate sequence";
    /** Lichess analyses this many plies at most. */
    private static final int MAX_PLIES = 300;

    /** Shows how long the wait is so far, and stops it when the review is closed. */
    interface Waiting {
        void progress(float fraction) throws Throwable;
    }

    private LichessServerReview() {}

    static ReviewData review(String pgn, String[] fens, int plies, Waiting waiting) throws Throwable {
        String id = LichessSession.analyse(pgn);
        long start = System.currentTimeMillis();
        int wanted = Math.min(plies, MAX_PLIES) - 1;
        while (true) {
            long elapsed = System.currentTimeMillis() - start;
            waiting.progress(Math.min(0.95f, (float) elapsed / USUAL_MS));
            JSONObject game = export(id);
            JSONArray analysis = game.optJSONArray("analysis");
            if (analysis != null && analysis.length() >= wanted) return parse(game, analysis, fens, plies);
            if (elapsed > WAIT_MS) throw new IOException("Lichess is taking too long. Try again later.");
            Thread.sleep(POLL_MS);
        }
    }

    private static JSONObject export(String id) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(LichessSession.ORIGIN + "/game/export/" + id
            + "?evals=true&accuracy=true&clocks=false&opening=false").openConnection();
        connection.setRequestProperty("Accept", "application/json");
        // Lichess exports most older games, imported ones among them, only to a signed-in user.
        String cookies = CookieManager.getInstance().getCookie(LichessSession.ORIGIN);
        if (cookies != null) connection.setRequestProperty("Cookie", cookies);
        connection.setConnectTimeout(15_000);
        connection.setReadTimeout(30_000);
        try {
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IOException("Lichess answered " + connection.getResponseCode());
            }
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[16384];
                int n;
                while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
                return new JSONObject(out.toString(StandardCharsets.UTF_8.name()));
            } catch (org.json.JSONException e) {
                throw new IOException("Lichess sent something unexpected", e);
            }
        } finally {
            connection.disconnect();
        }
    }

    private static ReviewData parse(JSONObject game, JSONArray analysis, String[] fens, int plies) {
        ReviewData data = new ReviewData();
        // Kept in the "depth_N" form chess.com reads; Lichess does not say how deep it looked.
        data.source = "depth_0";
        data.plies = new ReviewData.Ply[plies];
        // Lichess's start position: +0.15 for white (lila's evals.initial).
        float before = 0.15f;
        int mateBefore = 0;
        boolean mated = "mate".equals(game.optString("status"));
        for (int k = 0; k < plies; k++) {
            ReviewData.Ply ply = new ReviewData.Ply();
            ply.scoreBefore = before;
            ply.mateBefore = mateBefore;
            JSONObject entry = analysis.optJSONObject(k);
            boolean white = fens[k] == null || !fens[k].contains(" b ");
            if (entry != null && (entry.has("eval") || entry.has("mate"))) {
                if (entry.has("mate")) {
                    int mate = entry.optInt("mate");
                    ply.mateAfter = mate;
                    ply.scoreAfter = mate > 0 ? LichessMath.MATE_SCORE - mate : -LichessMath.MATE_SCORE - mate;
                } else {
                    ply.scoreAfter = entry.optInt("eval") / 100f;
                }
                JSONObject judgment = entry.optJSONObject("judgment");
                if (judgment != null) {
                    ply.judgment = judgment.optString("name").toLowerCase(Locale.ROOT);
                    ply.miss = judgment.optString("comment").startsWith(LOST_MATE);
                }
                String best = standardCastling(fens[k], entry.optString("best", ""));
                if (!best.isEmpty()) {
                    String variation = entry.optString("variation", "");
                    ply.bestLine = variation.isEmpty() ? Arrays.asList(best)
                        : San.uci(fens[k], Arrays.asList(variation.split(" ")));
                    if (ply.bestLine.isEmpty()) ply.bestLine = Arrays.asList(best);
                    ply.bestMove = ply.bestLine.get(0);
                }
            } else if (k == plies - 1 && mated) {
                // The checkmated position has no eval: the mover has won.
                ply.scoreAfter = white ? LichessMath.MATE_SCORE : -LichessMath.MATE_SCORE;
            } else {
                // Past what Lichess analyses: nothing new is known.
                ply.scoreAfter = before;
                ply.mateAfter = mateBefore;
            }
            data.plies[k] = ply;
            before = ply.scoreAfter;
            mateBefore = ply.mateAfter;
        }
        JSONObject players = game.optJSONObject("players");
        side(data, players != null ? players.optJSONObject("white") : null, true);
        side(data, players != null ? players.optJSONObject("black") : null, false);
        // The phases from the plies Lichess evaluated, as its game page works them out.
        int evaluated = 0;
        while (evaluated < Math.min(plies, analysis.length())) {
            JSONObject entry = analysis.optJSONObject(evaluated);
            if (entry == null || !(entry.has("eval") || entry.has("mate"))) break;
            evaluated++;
        }
        double[] winAfter = new double[evaluated];
        for (int k = 0; k < evaluated; k++) {
            winAfter[k] = LichessMath.winPercent(data.plies[k].scoreAfter, data.plies[k].mateAfter);
        }
        data.scorePhases(fens, winAfter);
        return data;
    }

    /** Lichess writes castling as the king taking its rook (e1h1); chess.com as e1g1. */
    private static String standardCastling(String fen, String uci) {
        if (uci.length() != 4 || fen == null) return uci;
        boolean white = !fen.contains(" b ");
        String home = white ? "e1" : "e8";
        String rank = white ? "1" : "8";
        if (!uci.startsWith(home) || !fen.split(" ")[0].contains(white ? "K" : "k")) return uci;
        if (uci.equals(home + "h" + rank)) return home + "g" + rank;
        if (uci.equals(home + "a" + rank)) return home + "c" + rank;
        return uci;
    }

    private static void side(ReviewData data, JSONObject player, boolean white) {
        JSONObject stats = player != null ? player.optJSONObject("analysis") : null;
        if (stats == null) return;
        int[] marks = {stats.optInt("inaccuracy"), stats.optInt("mistake"), stats.optInt("blunder")};
        if (white) {
            data.whiteAccuracy = (float) stats.optDouble("accuracy", 0);
            data.whiteAcpl = stats.optInt("acpl");
            data.whiteMarks = marks;
        } else {
            data.blackAccuracy = (float) stats.optDouble("accuracy", 0);
            data.blackAcpl = stats.optInt("acpl");
            data.blackMarks = marks;
        }
    }
}
