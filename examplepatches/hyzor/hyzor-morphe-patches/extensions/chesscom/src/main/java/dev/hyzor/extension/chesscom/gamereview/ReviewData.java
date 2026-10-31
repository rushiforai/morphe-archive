package dev.hyzor.extension.chesscom.gamereview;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * A finished review the Lichess way, from Stockfish on the phone or from Lichess's servers:
 * every move's evaluation and mark, and each side's accuracy, centipawn loss and marks.
 */
final class ReviewData {
    /** One move. Scores are white-POV pawns, a forced mate as +/-(99 - n) with mate the n. */
    static final class Ply {
        float scoreBefore, scoreAfter;
        int mateBefore, mateAfter;
        /** Inaccuracy, mistake or blunder, as Lichess marks the move, or null. */
        String judgment;
        /** A forced mate was let go: Lichess's "Lost forced checkmate sequence", shown as a Miss. */
        boolean miss;
        /** The engine's own best move was played (only Stockfish on the phone can tell). */
        boolean best;
        /** The better move and its line, in UCI, when known. */
        String bestMove;
        List<String> bestLine = new ArrayList<>();
        /** How deep the engine looked after the move, or 0 when not known. */
        int depth;
        /** How the game goes on after the move, in UCI. */
        List<String> lineAfter = new ArrayList<>();
    }

    Ply[] plies;
    /** The best move from the start position, when known, and its line. */
    String startBest;
    List<String> startLine = new ArrayList<>();
    float startScore;
    int startMate;
    /** Each side's accuracy, as Lichess shows it (a whole percent). */
    float whiteAccuracy, blackAccuracy;
    /** Each side's opening, middlegame and endgame accuracy as Lichess shows them, null for none. */
    Float[] whitePhases = new Float[3], blackPhases = new Float[3];
    int whiteAcpl, blackAcpl;
    /** Inaccuracies, mistakes and blunders. */
    int[] whiteMarks = new int[3], blackMarks = new int[3];
    /** The review's "analysis strength", in chess.com's "depth_N" form. */
    String source;

    /**
     * The phase accuracies from every position (start, then after each ply) and the white-POV
     * win percents after each evaluated ply. None when a position could not be read.
     */
    void scorePhases(String[] fens, double[] winAfter) {
        for (String fen : fens) if (fen == null) return;
        boolean whiteStarts = !fens[0].contains(" b ");
        Float[][] phases = LichessMath.phaseAccuracies(LichessMath.division(fens), winAfter, whiteStarts,
            LichessMath.startPly(fens[0]));
        for (int p = 0; p < 3; p++) {
            whitePhases[p] = phases[0][p] == null ? null : (float) Math.round(phases[0][p]);
            blackPhases[p] = phases[1][p] == null ? null : (float) Math.round(phases[1][p]);
        }
    }

    /** The review as JSON, to be saved (SavedReviews). */
    JSONObject toJson() throws JSONException {
        JSONArray moves = new JSONArray();
        for (Ply ply : plies) {
            JSONObject move = new JSONObject();
            move.put("scoreBefore", (double) ply.scoreBefore);
            move.put("scoreAfter", (double) ply.scoreAfter);
            move.put("mateBefore", ply.mateBefore);
            move.put("mateAfter", ply.mateAfter);
            move.putOpt("judgment", ply.judgment);
            move.put("miss", ply.miss);
            move.put("best", ply.best);
            move.putOpt("bestMove", ply.bestMove);
            move.put("bestLine", new JSONArray(ply.bestLine));
            move.put("depth", ply.depth);
            move.put("lineAfter", new JSONArray(ply.lineAfter));
            moves.put(move);
        }
        JSONObject json = new JSONObject();
        json.put("plies", moves);
        json.putOpt("startBest", startBest);
        json.put("startLine", new JSONArray(startLine));
        json.put("startScore", (double) startScore);
        json.put("startMate", startMate);
        json.put("whiteAccuracy", (double) whiteAccuracy);
        json.put("blackAccuracy", (double) blackAccuracy);
        json.put("whitePhases", phasesJson(whitePhases));
        json.put("blackPhases", phasesJson(blackPhases));
        json.put("whiteAcpl", whiteAcpl);
        json.put("blackAcpl", blackAcpl);
        json.put("whiteMarks", marksJson(whiteMarks));
        json.put("blackMarks", marksJson(blackMarks));
        json.putOpt("source", source);
        return json;
    }

    static ReviewData fromJson(JSONObject json) throws JSONException {
        ReviewData data = new ReviewData();
        JSONArray moves = json.getJSONArray("plies");
        data.plies = new Ply[moves.length()];
        for (int i = 0; i < moves.length(); i++) {
            JSONObject move = moves.getJSONObject(i);
            Ply ply = new Ply();
            ply.scoreBefore = (float) move.getDouble("scoreBefore");
            ply.scoreAfter = (float) move.getDouble("scoreAfter");
            ply.mateBefore = move.getInt("mateBefore");
            ply.mateAfter = move.getInt("mateAfter");
            ply.judgment = move.has("judgment") ? move.getString("judgment") : null;
            ply.miss = move.getBoolean("miss");
            ply.best = move.getBoolean("best");
            ply.bestMove = move.has("bestMove") ? move.getString("bestMove") : null;
            ply.bestLine = strings(move.getJSONArray("bestLine"));
            ply.depth = move.getInt("depth");
            ply.lineAfter = strings(move.getJSONArray("lineAfter"));
            data.plies[i] = ply;
        }
        data.startBest = json.has("startBest") ? json.getString("startBest") : null;
        data.startLine = strings(json.getJSONArray("startLine"));
        data.startScore = (float) json.getDouble("startScore");
        data.startMate = json.getInt("startMate");
        data.whiteAccuracy = (float) json.getDouble("whiteAccuracy");
        data.blackAccuracy = (float) json.getDouble("blackAccuracy");
        data.whitePhases = phases(json.getJSONArray("whitePhases"));
        data.blackPhases = phases(json.getJSONArray("blackPhases"));
        data.whiteAcpl = json.getInt("whiteAcpl");
        data.blackAcpl = json.getInt("blackAcpl");
        data.whiteMarks = marks(json.getJSONArray("whiteMarks"));
        data.blackMarks = marks(json.getJSONArray("blackMarks"));
        data.source = json.has("source") ? json.getString("source") : null;
        return data;
    }

    private static JSONArray phasesJson(Float[] phases) throws JSONException {
        JSONArray array = new JSONArray();
        for (Float phase : phases) array.put(phase == null ? JSONObject.NULL : (Object) (double) phase);
        return array;
    }

    private static Float[] phases(JSONArray array) throws JSONException {
        Float[] phases = new Float[3];
        for (int p = 0; p < 3 && p < array.length(); p++) phases[p] = array.isNull(p) ? null : (float) array.getDouble(p);
        return phases;
    }

    private static JSONArray marksJson(int[] marks) {
        JSONArray array = new JSONArray();
        for (int mark : marks) array.put(mark);
        return array;
    }

    private static int[] marks(JSONArray array) throws JSONException {
        int[] marks = new int[3];
        for (int k = 0; k < 3 && k < array.length(); k++) marks[k] = array.getInt(k);
        return marks;
    }

    private static List<String> strings(JSONArray array) throws JSONException {
        List<String> list = new ArrayList<>(array.length());
        for (int k = 0; k < array.length(); k++) list.add(array.getString(k));
        return list;
    }
}
