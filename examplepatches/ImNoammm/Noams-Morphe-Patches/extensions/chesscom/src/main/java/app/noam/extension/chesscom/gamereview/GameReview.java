/*
 * The online-game activity list below is from PrathxmOp's isLiveMatch() fair-play gate.
 * https://github.com/PrathxmOp/Prathxm-Patches (GPL-3.0)
 */

package app.noam.extension.chesscom.gamereview;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.stockfish.FishnetSearch;

/** Game Review, run locally with Stockfish instead of chess.com's quota-limited server review. */
public final class GameReview {
    /**
     * Screens where a game against another human is in progress (or being watched live).
     * Game Review's own repository is never reachable from these in normal use, but this stays
     * as a second gate: analysis never runs here regardless of how the call was reached.
     */
    private static final Set<String> ONLINE_GAME_ACTIVITIES = new HashSet<>(Arrays.asList(
        "com.chess.realchess.ui.game.RealGameActivity",
        "com.chess.realchess.ui.wait.WaitGameActivity",
        "com.chess.realchess.ui.wait.LiveGameSeekV6Activity",
        "com.chess.features.daily.DailyGameActivity",
        "com.chess.waitgame.daily.DailyGameSeekActivity",
        "com.chess.features.connectedboards.ConnectedBoardGameActivity",
        "com.chess.features.puzzles.battle.PuzzlesBattleGameActivity",
        "com.chess.chesstv.ChessTvActivity",
        "com.chess.features.more.watch.WatchActivity"
    ));

    private GameReview() {}

    /** Who reviews the next game, picked in the review chooser. */
    enum Mode { CHESSCOM, STOCKFISH, LICHESS }

    private static final String REVIEW_SCREEN = "com.chess.gamereview.v2.GameReviewActivity";

    private static final String REVIEW_MODE = "review_mode";
    private static volatile Mode mode;

    public static boolean enabled() {
        return Features.gameReviewPatched() && Features.isEnabled(Features.GAME_REVIEW);
    }

    /**
     * Who reviews: the last pick, kept, so a review screen Android brings back after restarting the
     * app is reviewed by the same reviewer.
     */
    static Mode mode() {
        Mode current = mode;
        if (current == null) {
            SharedPreferences preferences = Features.preferences();
            if (preferences == null) return usable(Mode.STOCKFISH);
            try {
                current = Mode.valueOf(preferences.getString(REVIEW_MODE, Mode.STOCKFISH.name()));
            } catch (IllegalArgumentException e) {
                current = Mode.STOCKFISH;
            }
            mode = current;
        }
        return usable(current);
    }

    /** Local Stockfish needs the engine, which comes with Stockfish analysis; without it chess.com reviews. */
    private static Mode usable(Mode chosen) {
        return chosen == Mode.STOCKFISH && !Features.stockfishPatched() ? Mode.CHESSCOM : chosen;
    }

    static void setMode(Mode chosen) {
        mode = chosen;
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putString(REVIEW_MODE, chosen.name()).apply();
    }

    /** A review by Lichess's servers: everything in it is Lichess's, the phone's Stockfish stays out. */
    public static boolean lichessReview() {
        return enabled() && mode() == Mode.LICHESS;
    }

    /**
     * The open Lichess review's positions after the moves Lichess marked: chess.com draws Lichess's
     * better move there itself (its green arrow).
     */
    private static volatile Set<String> lichessMarked = Collections.emptySet();

    static void setLichessReview(String[] fens, ReviewData data) {
        Set<String> marked = new HashSet<>();
        for (int i = 0; i < data.plies.length && i + 1 < fens.length; i++) {
            if (data.plies[i].bestMove != null && fens[i + 1] != null) marked.add(positionKey(fens[i + 1]));
        }
        lichessMarked = marked;
    }

    static void clearLichessReview() {
        lichessMarked = Collections.emptySet();
    }

    /** chess.com shows Lichess's own better move on this position of the open Lichess review. */
    public static boolean lichessArrow(String fen) {
        return fen != null && lichessMarked.contains(positionKey(fen));
    }

    /** A FEN's placement, side to move and castling: the position, whatever the move counters say. */
    private static String positionKey(String fen) {
        String[] fields = fen.trim().split(" +");
        return fields.length >= 3 ? fields[0] + " " + fields[1] + " " + fields[2] : fen.trim();
    }

    /** A review on the phone, Stockfish's or Lichess's: both are scored and judged the Lichess way. */
    public static boolean lichessStyle() {
        return enabled() && mode() != Mode.CHESSCOM;
    }

    /**
     * Whether chess.com's review shows a move type: in a Lichess-style review only Lichess's own,
     * inaccuracies, mistakes and blunders, and chess.com's Book (Lichess's opening), Miss (a lost
     * forced mate) and, from Local Stockfish only, Best, Excellent and Good (Lichess leaves the
     * moves it doesn't judge unmarked, and never says which of them was best).
     */
    public static boolean shows(Object classification) {
        if (!lichessStyle() || !(classification instanceof Enum)) return true;
        String name = ((Enum<?>) classification).name();
        boolean phone = mode() == Mode.STOCKFISH;
        return name.equals("BOOK") || name.equals("MISS")
            || name.equals("INACCURACY") || name.equals("MISTAKE") || name.equals("BLUNDER")
            || (phone && (name.equals("BEST") || name.equals("EXCELLENT") || name.equals("GOOD")));
    }

    // Lichess's own marks in chess.com's review screen: its colors, its ?! ? ?? badges and words.
    // Each returns a resource id, or 0 for chess.com's own.

    public static int lichessColor(Object classification) {
        String type = lichessType(classification);
        return type == null || type.isEmpty() ? 0 : Utils.resourceId("morphe_lichess_" + type, "color");
    }

    public static int lichessIcon(Object classification) {
        String type = lichessType(classification);
        return type == null ? 0 : Utils.resourceId("morphe_lichess_" + (type.isEmpty() ? "quiet" : type), "drawable");
    }

    public static int lichessPhrase(Object classification) {
        String type = lichessType(classification);
        return type == null ? 0 : Utils.resourceId("morphe_lichess_" + (type.isEmpty() ? "quiet" : type + "_phrase"), "string");
    }

    /**
     * In a Lichess-style review: "inaccuracy", "mistake" or "blunder", or "" for a move Lichess does not
     * mark. Null for Book, Best, Miss, Good and (from Local Stockfish) Excellent, which keep chess.com's
     * marks, and anywhere else.
     */
    private static String lichessType(Object classification) {
        if (!lichessStyle() || !(classification instanceof Enum)) return null;
        Activity activity = Utils.topActivity();
        if (activity == null || !activity.getClass().getName().equals(REVIEW_SCREEN)) return null;
        String name = ((Enum<?>) classification).name();
        // Book, Best and Miss keep chess.com's marks; so does Good, also the mark of a game phase
        // Lichess colors as good (85% or more), and Excellent where it shows (Local Stockfish).
        if (name.equals("BOOK") || name.equals("BEST") || name.equals("MISS") || name.equals("GOOD")) return null;
        if (name.equals("EXCELLENT") && shows(classification)) return null;
        return shows(classification) ? name.toLowerCase(Locale.ROOT) : "";
    }

    // How "Analyze with Lichess" works, picked on the welcome screens: Lichess's servers analyse
    // the game for the user's Lichess account, or the game opens on Lichess's analysis board without one.

    public static final String LICHESS_SERVERS = "servers";
    public static final String LICHESS_BOARD = "board";
    private static final String LICHESS_METHOD = "lichess_review_method";
    private static final String[] METHOD_TITLES = {
        "Lichess's servers (log in once)", "Lichess analysis board (no login)",
    };

    /** The method picked, or null when it has not been picked yet. */
    public static String lichessMethod() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? null : preferences.getString(LICHESS_METHOD, null);
    }

    public static void setLichessMethod(String method) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putString(LICHESS_METHOD, method).apply();
    }

    /** Asks how Lichess reviews should work (when the welcome screens did not), then runs next (if any). */
    static void askLichessMethod(Activity activity, Runnable next) {
        new AlertDialog.Builder(activity, android.R.style.Theme_Material_Dialog_Alert)
            .setTitle("Analyze with Lichess")
            .setItems(METHOD_TITLES, (shown, which) -> {
                setLichessMethod(which == 0 ? LICHESS_SERVERS : LICHESS_BOARD);
                if (next != null) next.run();
            })
            .show();
    }

    // How hard Local Stockfish looks: chess.com's AnalysisDepth names, each a node budget Lichess's
    // servers use (LocalAnalysisFlow.nodesFor).

    private static final String[] REVIEW_DEPTHS = {"FAST", "STANDARD", "DEEP", "MAXIMUM"};
    public static final String[] REVIEW_DEPTH_NAMES = {"Fast", "Standard", "Deep", "Maximum"};
    private static final String REVIEW_DEPTH = "review_depth";

    public static int reviewDepthIndex() {
        SharedPreferences preferences = Features.preferences();
        int index = preferences == null ? 1 : preferences.getInt(REVIEW_DEPTH, 1);
        return Math.max(0, Math.min(REVIEW_DEPTHS.length - 1, index));
    }

    public static void setReviewDepthIndex(int index) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(REVIEW_DEPTH, index).apply();
    }

    static String reviewDepth() {
        return REVIEW_DEPTHS[reviewDepthIndex()];
    }

    private static final String REVIEW_ENGINES = "review_engines";

    /** How many Stockfish engines a Local Stockfish review runs side by side, or 0 to let the phone's memory decide. */
    public static int reviewEnginesSetting() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? 0 : preferences.getInt(REVIEW_ENGINES, 0);
    }

    public static void setReviewEngines(int engines) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(REVIEW_ENGINES, engines).apply();
    }

    /** The engines a review runs with now. */
    public static int reviewEngines(Context context) {
        int chosen = reviewEnginesSetting();
        return chosen > 0 ? chosen : FishnetSearch.defaultEngines(context);
    }

    public static int savedReviews() {
        Context context = Utils.context();
        return context == null ? 0 : SavedReviews.count(context);
    }

    public static void deleteSavedReviews() {
        Context context = Utils.context();
        if (context != null) SavedReviews.clear(context);
    }

    /** The review runs on the phone, not on chess.com's servers. */
    public static boolean local() {
        return enabled() && mode() != Mode.CHESSCOM;
    }

    /** Fair-play gate: true if a game against a human (or a live game being watched) is on screen. */
    public static boolean isLiveMatch(Activity activity) {
        if (activity == null) return false;
        String name = activity.getClass().getName();
        if (ONLINE_GAME_ACTIVITIES.contains(name)) return true;
        return name.startsWith("com.chess.realchess.")
            || name.startsWith("com.chess.features.daily.")
            || name.startsWith("com.chess.waitgame.")
            || name.startsWith("com.chess.chesstv.")
            || name.startsWith("com.chess.features.connectedboards.");
    }
}
