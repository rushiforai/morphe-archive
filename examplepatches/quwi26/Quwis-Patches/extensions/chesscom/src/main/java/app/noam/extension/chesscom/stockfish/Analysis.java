package app.noam.extension.chesscom.stockfish;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.arrows.Arrows;
import app.noam.extension.chesscom.gamereview.GameReview;

/**
 * Stockfish on the phone, offline: best-move arrows, and an eval bar where chess.com has none, on
 * the boards of the screens below. Live and daily games, puzzles and anything else played against
 * a person never get it.
 */
public final class Analysis {
    /**
     * Screens with no engine of chess.com's own, which get the arrows and the eval bar: the
     * self-analysis board, the game explorer and finished games. Not a bot or coach game being played.
     */
    private static final Set<String> SCREENS = new HashSet<>(Arrays.asList(
        "com.chess.features.analysis.selfengineless.AnalysisSelfEnginelessActivity",
        "com.chess.features.explorer.GameExplorerActivity",
        "com.chess.features.live.archive.ArchivedLiveGameActivity",
        "com.chess.features.versusbots.archive.ArchivedBotGameActivityV2"
    ));
    private static final String REVIEW_SCREEN = "com.chess.gamereview.v2.GameReviewActivity";
    /**
     * The analysis boards and Game Review draw chess.com's own eval bar, so they only get the arrows;
     * in a review by Lichess's servers, only on the moves Lichess did not mark.
     */
    private static final Set<String> ARROW_SCREENS = new HashSet<>(Arrays.asList(
        "com.chess.features.analysis.standalone.StandaloneAnalysisActivity",
        "com.chess.features.analysis.standalonev2.StandaloneAnalysisActivityV2",
        REVIEW_SCREEN
    ));

    public static final int[] DEPTHS = {14, 18, 22};
    public static final String[] DEPTH_NAMES = {"Quick", "Normal", "Deep"};
    private static final String DEPTH = "stockfish_depth";
    private static final String LINES = "stockfish_lines";
    private static final String ARROWS = "stockfish_arrows";
    private static final String BAR = "stockfish_bar";
    /** The engine holds its network in memory, so it stops when nothing has asked for a while. */
    private static final long IDLE_MS = 120_000;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "MorpheStockfish");
        thread.setDaemon(true);
        thread.setPriority(Thread.MIN_PRIORITY);
        return thread;
    });
    private static final Engine ENGINE = new Engine();
    private static final Runnable IDLE = () -> WORKER.execute(ENGINE::quit);

    /** The position the board shows now; older searches stop and their results are dropped. */
    private static volatile String wanted;
    private static WeakReference<View> wantedScreen = new WeakReference<>(null);
    private static volatile boolean searching;
    private static boolean failed;
    private static Method fenGetter;

    private Analysis() {}

    /** The position's FEN getter (an obfuscated interface method); set by the patch. */
    private static String fenMethod() {
        return "";
    }

    public static boolean enabled() {
        return Features.stockfishPatched() && Features.isEnabled(Features.STOCKFISH);
    }

    /** The 4.10.23 board state keeps the position in its first field. */
    public static void onBoardState(Object state) {
        if (state == null) return;
        try {
            onPosition(state.getClass().getField("a").get(state));
        } catch (Throwable throwable) {
            Utils.logError("board state position", throwable);
        }
    }

    /** The board's view state got a new position. */
    public static void onPosition(Object position) {
        if (position == null || !enabled()) return;
        // The first position is set while the screen is still being created.
        Activity activity = Utils.topActivity();
        if (activity == null) return;
        String name = activity.getClass().getName();
        boolean withBar = SCREENS.contains(name);
        if (!withBar && !ARROW_SCREENS.contains(name)) return;
        String fen = fen(position);
        if (fen == null) return;
        View decor = activity.getWindow().getDecorView();
        // In a review by Lichess's servers chess.com shows Lichess's better move on each move Lichess
        // marked; Stockfish looks at the other positions live.
        if (name.equals(REVIEW_SCREEN) && GameReview.lichessReview() && GameReview.lichessArrow(fen)) {
            wanted = null;
            if (searching) ENGINE.stopSearch();
            MAIN.post(() -> Arrows.clearEngine(decor));
            return;
        }
        if (fen.equals(wanted) && wantedScreen.get() == decor) return;
        WeakReference<View> screen = new WeakReference<>(decor);
        wanted = fen;
        wantedScreen = screen;
        if (searching) ENGINE.stopSearch();
        MAIN.removeCallbacks(IDLE);
        MAIN.post(() -> {
            View view = screen.get();
            if (view != null) Arrows.clearEngine(view);
        });
        WORKER.execute(() -> analyse(fen, screen, withBar));
    }

    private static void analyse(String fen, WeakReference<View> screen, boolean withBar) {
        if (!fen.equals(wanted)) return;
        Context context = Utils.context();
        if (context == null) return;
        if (!ENGINE.ready()) {
            if (failed || !ENGINE.start(context)) {
                if (!failed) MAIN.post(() -> Utils.toast("Stockfish could not start on this phone"));
                failed = true;
                return;
            }
        }
        searching = true;
        Engine.Result result;
        try {
            result = ENGINE.analyse(fen, depth(), lines(), partial -> publish(fen, partial, screen, withBar));
        } finally {
            searching = false;
        }
        publish(fen, result, screen, withBar);
        MAIN.removeCallbacks(IDLE);
        MAIN.postDelayed(IDLE, IDLE_MS);
    }

    private static void publish(String fen, Engine.Result result, WeakReference<View> screen, boolean withBar) {
        if (!fen.equals(wanted) || !result.valid()) return;
        int[][] moves = arrows() ? squares(result.moves) : new int[0][];
        float score = withBar && bar() ? result.score : Float.NaN;
        MAIN.post(() -> {
            View view = screen.get();
            if (view != null && fen.equals(wanted)) Arrows.showEngine(view, moves, score, result.mate, result.over);
        });
    }

    /** UCI moves ("e2e4", "e7e8q") as from and to squares (a1 = 0). */
    private static int[][] squares(List<String> moves) {
        int[][] squares = new int[moves.size()][];
        for (int i = 0; i < squares.length; i++) {
            String move = moves.get(i);
            squares[i] = new int[]{
                move.charAt(0) - 'a' + 8 * (move.charAt(1) - '1'),
                move.charAt(2) - 'a' + 8 * (move.charAt(3) - '1'),
            };
        }
        return squares;
    }

    /** The position as a FEN with all six fields, or null. */
    private static String fen(Object position) {
        try {
            if (fenGetter == null) fenGetter = findFenGetter(position.getClass());
            if (fenGetter == null) return null;
            Object value = fenGetter.invoke(position);
            if (!(value instanceof String)) return null;
            String[] fields = ((String) value).trim().split(" +");
            if (fields.length != 6 || fields[0].split("/", -1).length != 8) return null;
            StringBuilder fen = new StringBuilder(fields[0]);
            for (int i = 1; i < fields.length; i++) fen.append(' ').append(fields[i]);
            return fen.toString();
        } catch (Throwable throwable) {
            return null;
        }
    }

    private static Method findFenGetter(Class<?> type) {
        String name = fenMethod();
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            for (Class<?> implemented : c.getInterfaces()) {
                try {
                    Method method = implemented.getMethod(name);
                    if (method.getReturnType() == String.class) return method;
                } catch (NoSuchMethodException ignored) {
                    // Not this interface.
                }
            }
        }
        return null;
    }

    public static int depthIndex() {
        SharedPreferences preferences = Features.preferences();
        int index = preferences == null ? 1 : preferences.getInt(DEPTH, 1);
        return Math.max(0, Math.min(DEPTHS.length - 1, index));
    }

    public static void setDepthIndex(int index) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(DEPTH, index).apply();
        wanted = null;
    }

    private static int depth() {
        return DEPTHS[depthIndex()];
    }

    public static int lines() {
        SharedPreferences preferences = Features.preferences();
        int lines = preferences == null ? 2 : preferences.getInt(LINES, 2);
        return Math.max(1, Math.min(3, lines));
    }

    public static void setLines(int lines) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(LINES, lines).apply();
        wanted = null;
    }

    public static boolean arrows() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null || preferences.getBoolean(ARROWS, true);
    }

    public static void setArrows(boolean on) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putBoolean(ARROWS, on).apply();
        wanted = null;
    }

    public static boolean bar() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null || preferences.getBoolean(BAR, true);
    }

    public static void setBar(boolean on) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putBoolean(BAR, on).apply();
        wanted = null;
    }
}
