package app.noam.extension.chesscom.lichesspuzzle;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.settings.MorpheSettingsActivity;
import kotlin.jvm.functions.Function0;

/**
 * Lichess puzzles in chess.com's own puzzle screen. Puzzles from Lichess is the Puzzles tab's big
 * button: it opens chess.com's puzzle screen in guest mode, which a signed-in account never uses,
 * and that mode's puzzles come from Lichess's open puzzle database instead of chess.com. Results
 * stay on the phone: a Glicko-2 rating as Lichess keeps one, and nothing reaches chess.com.
 */
public final class LichessPuzzles {
    /** Lichess puzzles get chess.com ids far above chess.com's own. */
    private static final long ID_BASE = 7_000_000_000L;
    private static final int BATCH = 5;
    private static final String RATING = "lichess_puzzle_rating";
    private static final String DEVIATION = "lichess_puzzle_deviation";
    private static final String VOLATILITY = "lichess_puzzle_volatility";
    private static final String TARGET = "lichess_puzzle_target";
    private static final String SOLVED = "lichess_puzzle_solved";
    private static final String FAILED = "lichess_puzzle_failed";
    /** Lichess shows a rating as provisional (with a ?) while its deviation is above this. */
    private static final double PROVISIONAL = 110;

    private static WeakReference<Object> listener = new WeakReference<>(null);
    private static boolean solving;
    /** Between Puzzles from Lichess and Solve Puzzles, guest puzzles are Lichess's. */
    private static volatile boolean active;
    /** The Lichess puzzle screen is the activity in front. */
    private static volatile boolean puzzleVisible;
    private static boolean watching;
    private static final String PUZZLE_SCREEN = "com.chess.features.puzzles.rated.RatedPuzzlesGameActivity";
    private static final String HOME_SCREEN = "com.chess.home.HomeActivity";

    /** Last hub path/user state, reused while a new one is not available. */
    private static volatile Object lastPath;
    private static volatile Object frozenPath;
    private static volatile Object lastUser;
    private static volatile Object frozenUser;
    private static volatile boolean freezeActive;
    private static volatile long unfreezeAt;

    /** The hub's empty/loading user data; it must not replace the real XP/level. */
    private static final String EMPTY_USER = "com.chess.features.puzzles.home.ui.a2$b";

    private static final Function0<Object> SOLVE = () -> {
        solve();
        return null;
    };

    private LichessPuzzles() {}

    // Names in chess.com's code (obfuscated), set by the patch.
    private static String solveMethod() { return ""; }
    private static String daoField() { return ""; }
    private static String daoInsert() { return ""; }
    private static String converterClass() { return ""; }
    private static String converterMethod() { return ""; }
    private static String resultClass() { return ""; }
    private static String scoreClass() { return ""; }
    private static String problemIdGetter() { return ""; }

    public static boolean enabled() {
        return Features.lichessPuzzlesPatched() && Features.isEnabled(Features.LICHESS_PUZZLES);
    }

    /** The Puzzles tab's listener was created. */
    public static void onListener(Object created) {
        listener = new WeakReference<>(created);
    }

    /** What the big button does: chess.com's own puzzles, Lichess's in chess.com's screen, or nothing more. */
    public static final int SOLVE_PUZZLES = 0, LICHESS_PUZZLES = 1, HANDLED = 2;

    /** Opens Lichess puzzles, or the settings page when no pack is downloaded. */
    public static int onBigButton() {
        if (solving || !enabled()) return SOLVE_PUZZLES;
        Context app = Utils.context();
        if (app == null || !PuzzleStore.get(app).any()) {
            Context context = Utils.topActivity();
            if (context == null) context = app;
            if (context == null) return HANDLED;
            Intent intent = new Intent(context, MorpheSettingsActivity.class)
                .putExtra(MorpheSettingsActivity.EXTRA_PAGE, Features.PAGE_PUZZLES);
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Utils.toast("Download Lichess puzzles to play them offline");
            return HANDLED;
        }
        frozenPath = lastPath;
        frozenUser = lastUser;
        freezeActive = frozenPath != null || frozenUser != null;
        unfreezeAt = Long.MAX_VALUE;
        active = true;
        puzzleVisible = true;
        watchScreen();
        return LICHESS_PUZZLES;
    }

    /** True while the Lichess puzzle screen is in front. */
    public static boolean onPuzzleScreen() {
        return active && puzzleVisible;
    }

    /** The hub's path, or the frozen pre-session path during a return. */
    public static Object pathForHub(Object path) {
        if (freezeActive) {
            if (SystemClock.uptimeMillis() < unfreezeAt) return frozenPath;
            freezeActive = false;
        }
        if (path != null) lastPath = path;
        return path != null ? path : lastPath;
    }

    /** The hub's user data (XP, level, rating), frozen like the path. */
    public static Object userForHub(Object user) {
        if (freezeActive) {
            if (SystemClock.uptimeMillis() < unfreezeAt) return frozenUser;
            freezeActive = false;
        }
        if (user != null && !user.getClass().getName().equals(EMPTY_USER)) lastUser = user;
        return user != null ? user : lastUser;
    }

    /** Ends the session before the hub resumes, not after the Lichess screen is destroyed. */
    private static void endSessionIfFinishing(Activity activity) {
        if (isPuzzle(activity) && activity.isFinishing()) active = false;
    }

    private static boolean isPuzzle(Activity activity) {
        return activity.getClass().getName().equals(PUZZLE_SCREEN);
    }

    private static boolean isHub(Activity activity) {
        return activity.getClass().getName().equals(HOME_SCREEN);
    }

    private static void onPuzzlePaused(Activity activity) {
        if (isPuzzle(activity) && !activity.isChangingConfigurations()) puzzleVisible = false;
        endSessionIfFinishing(activity);
    }

    /** Watches the Lichess screen's lifecycle. */
    private static void watchScreen() {
        if (watching || !(Utils.context() instanceof Application)) return;
        watching = true;
        ((Application) Utils.context()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityPaused(Activity activity) {
                onPuzzlePaused(activity);
            }

            @Override
            public void onActivityStopped(Activity activity) {
                onPuzzlePaused(activity);
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (isPuzzle(activity) && !activity.isChangingConfigurations()) {
                    puzzleVisible = false;
                    active = false;
                }
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle state) {
                if (isPuzzle(activity)) puzzleVisible = true;
            }

            @Override
            public void onActivityStarted(Activity activity) {
                if (isPuzzle(activity)) puzzleVisible = true;
            }

            @Override
            public void onActivityResumed(Activity activity) {
                puzzleVisible = isPuzzle(activity);
                // The hub is back: hold the frozen state for its first refresh.
                if (isHub(activity) && freezeActive && unfreezeAt == Long.MAX_VALUE) {
                    unfreezeAt = SystemClock.uptimeMillis() + 1000;
                }
            }

            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        });
    }

    private static void solve() {
        Object target = listener.get();
        if (target == null) return;
        active = false;
        solving = true;
        try {
            target.getClass().getMethod(solveMethod()).invoke(target);
        } catch (Throwable throwable) {
            Utils.logError("Solve Puzzles failed", throwable);
        } finally {
            solving = false;
        }
    }

    // The Puzzles tab's menu.

    /** The big button's text: ours instead of Solve Puzzles. */
    public static int bigButtonText(int solvePuzzles) {
        if (!enabled()) return solvePuzzles;
        int text = Utils.resourceId("morphe_lichess_puzzles", "string");
        return text == 0 ? solvePuzzles : text;
    }

    /** The spot above the big button: Solve Puzzles, unless Next Lesson has it. */
    public static Object secondary(int solvePuzzles, Object secondary, List<Object> buttons) {
        if (secondary != null || !enabled()) return secondary;
        return button(buttons.isEmpty() ? null : buttons.get(0), solvePuzzles);
    }

    /** The menu's list: Solve Puzzles goes first when Next Lesson has the spot above the big button. */
    public static List<Object> buttons(int solvePuzzles, Object secondary, List<Object> buttons) {
        if (secondary == null || !enabled()) return buttons;
        Object button = button(secondary, solvePuzzles);
        if (button == null) return buttons;
        List<Object> list = new ArrayList<>(buttons.size() + 1);
        list.add(button);
        list.addAll(buttons);
        return list;
    }

    /** A menu button (image, text, onClick) of the same class as one of chess.com's own. */
    private static Object button(Object like, int text) {
        if (like == null || text == 0) return null;
        try {
            for (Constructor<?> constructor : like.getClass().getDeclaredConstructors()) {
                Class<?>[] types = constructor.getParameterTypes();
                if (types.length == 3 && types[1] == int.class && types[2] == Function0.class) {
                    constructor.setAccessible(true);
                    return constructor.newInstance(null, text, SOLVE);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    // The puzzle repository.

    /** Stores Lichess puzzles for the guest puzzle flow. */
    public static void onGuestPuzzles(Object repository) {
        if (!active) return;
        new Thread(() -> {
            Context context = Utils.context();
            if (context == null) return;
            give(repository, PuzzleStore.get(context), BATCH);
        }, "MorpheLichessPuzzles").start();
    }

    /** Scores Lichess puzzles locally; null lets chess.com score others. */
    public static Object solved(Object repository, Object solution) {
        if (!active || solution == null) return null;
        try {
            long id = ((Number) solution.getClass().getMethod(problemIdGetter()).invoke(solution)).longValue();
            if (id < ID_BASE) return null;
            Context context = Utils.context();
            if (context == null) return null;
            PuzzleStore store = PuzzleStore.get(context);
            long number = id - ID_BASE;
            int puzzleRating = store.rating(number);
            boolean correct = "CORRECT".equals(String.valueOf(fieldOfType(solution, "Outcome")));

            Glicko before = glicko();
            Glicko after = before.after(puzzleRating > 0 ? puzzleRating : before.rating, correct ? 1 : 0);
            save(after);
            count(correct ? SOLVED : FAILED);
            store.solved(number);
            STORE_WORK.execute(() -> counts = null);
            give(repository, store, 1);

            int newRating = (int) Math.round(after.rating);
            int oldRating = (int) Math.round(before.rating);
            Object empty = emptyBytes();
            Class<?> ratingClass = Class.forName("chesscom.puzzles.v1.Rating");
            Class<?> algorithm = Class.forName("chesscom.puzzles.v1.RatingAlgorithm");
            Object rating = ratingClass.getConstructor(int.class, int.class, float.class, algorithm, boolean.class,
                    String.class, int.class, float.class, Class.forName("okio.ByteString"))
                .newInstance(newRating, newRating - oldRating, (float) after.deviation,
                    enumValue(algorithm, "RATING_ALGORITHM_STANDARD_RATING"), true, "", oldRating,
                    (float) before.deviation, empty);
            Class<?> pathResultClass = Class.forName("chesscom.puzzles.v1.PuzzlePathResult");
            Object pathResult = null;
            for (Constructor<?> constructor : pathResultClass.getConstructors()) {
                Class<?>[] types = constructor.getParameterTypes();
                if (types.length == 4 && types[0] == int.class) {
                    pathResult = constructor.newInstance(0, null, null, empty);
                }
            }
            Object score = Class.forName(scoreClass()).getConstructor(pathResultClass, ratingClass, Throwable.class)
                .newInstance(pathResult, rating, null);
            Class<?> result = Class.forName(resultClass());
            for (Constructor<?> constructor : result.getConstructors()) {
                if (constructor.getParameterTypes().length == 2) return constructor.newInstance(solution, score);
            }
        } catch (Throwable throwable) {
            Utils.logError("Lichess puzzle not scored", throwable);
        }
        return null;
    }

    /** Hands Lichess puzzles near the rating to chess.com's puzzle database as guest puzzles. */
    private static void give(Object repository, PuzzleStore store, int count) {
        try {
            List<PuzzleStore.Puzzle> puzzles = store.take(puzzleRating(), count);
            if (puzzles.isEmpty()) {
                Utils.toast("You've played all your downloaded Lichess puzzles. Download more in settings.");
                return;
            }
            Class<?> sourceClass = Class.forName("com.chess.features.puzzles.db.model.ProblemSource");
            Object guest = enumValue(sourceClass, "RATED_GUEST");
            Class<?> colorClass = Class.forName("com.chess.entities.Color");
            Class<?> problemClass = Class.forName("com.chess.net.model.TacticsProblem");
            Constructor<?> problemConstructor = problemClass.getConstructor(long.class, String.class, String.class,
                int.class, int.class, int.class, int.class, boolean.class, colorClass, int.class, boolean.class, List.class);
            Method convert = Class.forName(converterClass())
                .getMethod(converterMethod(), problemClass, sourceClass, long.class);
            List<Object> rows = new ArrayList<>(puzzles.size());
            for (PuzzleStore.Puzzle puzzle : puzzles) {
                String movetext = San.movetext(puzzle.fen, puzzle.moves);
                if (movetext == null) continue;
                // The FEN is before the opponent's first move, as in chess.com's puzzles.
                boolean whiteMovesFirst = puzzle.fen.contains(" w ");
                Object player = enumValue(colorClass, whiteMovesFirst ? "BLACK" : "WHITE");
                int moves = puzzle.moves.trim().split(" +").length;
                Object problem = problemConstructor.newInstance(ID_BASE + puzzle.number, puzzle.fen, movetext, 0, 0,
                    puzzle.rating, 0, false, player, moves / 2, false, Collections.emptyList());
                rows.add(convert.invoke(null, problem, guest, -1L));
            }
            Utils.log("Lichess puzzles: storing " + rows.size() + " near " + puzzleRating());
            Field dao = repository.getClass().getDeclaredField(daoField());
            dao.setAccessible(true);
            Object target = dao.get(repository);
            target.getClass().getMethod(daoInsert(), List.class).invoke(target, rows);
        } catch (Throwable throwable) {
            Utils.logError("Lichess puzzles not stored", throwable);
        }
    }

    /** The Lichess puzzle rating, shown where chess.com shows its own during a Lichess session. */
    public static int rating() {
        return (int) Math.round(glicko().rating);
    }

    /** The rating as Lichess shows it: a ? while it is provisional. */
    public static String ratingText() {
        Glicko glicko = glicko();
        return Math.round(glicko.rating) + (glicko.deviation > PROVISIONAL ? "?" : "");
    }

    public static int solvedCount() {
        return counter(SOLVED);
    }

    public static int failedCount() {
        return counter(FAILED);
    }

    /** Starts the rating over, as a new Lichess account would, so it is worked out again. */
    public static void resetRating() {
        SharedPreferences preferences = Features.preferences();
        if (preferences == null) return;
        preferences.edit().remove(RATING).remove(DEVIATION).remove(VOLATILITY).remove(SOLVED).remove(FAILED).apply();
    }

    /** The rating puzzles are chosen near: a chosen one, or 0 for the player's own. */
    public static int targetRating() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? 0 : preferences.getInt(TARGET, 0);
    }

    public static void setTargetRating(int rating) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(TARGET, rating).apply();
    }

    private static int puzzleRating() {
        int target = targetRating();
        return target > 0 ? target : rating();
    }

    private static int counter(String key) {
        SharedPreferences preferences = Features.preferences();
        return preferences == null ? 0 : preferences.getInt(key, 0);
    }

    private static void count(String key) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(key, preferences.getInt(key, 0) + 1).apply();
    }

    // Offline puzzle packs, for the settings page. A pack holds up to millions of puzzles, so the
    // database is never used on the main thread here: downloads, counts and deletes run one at a time.

    private static final ExecutorService STORE_WORK = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** A download in progress: 0..100, -1 while its size is unknown, or null when none is. */
    private static volatile Integer downloading;
    private static volatile boolean deleting;
    /** The puzzles on the phone and how many of them are solved, or null until counted again. */
    private static volatile int[] counts;
    private static volatile boolean counting;

    public static String[] packNames() {
        return PuzzleStore.PACK_NAMES;
    }

    public static String[] packSizes() {
        return PuzzleStore.PACK_SIZES;
    }

    public static Integer downloadProgress() {
        return downloading;
    }

    public static boolean deleting() {
        return deleting;
    }

    /** The puzzles on the phone and how many are solved; null while they are counted, then done runs. */
    public static int[] counts(Runnable done) {
        int[] known = counts;
        Context context = Utils.context();
        if (known != null || context == null || counting) return known;
        counting = true;
        STORE_WORK.execute(() -> {
            try {
                PuzzleStore store = PuzzleStore.get(context);
                counts = new int[]{store.count(), store.solvedCount()};
            } catch (Throwable throwable) {
                // Unreadable puzzles are as good as none, and asking again would fail again.
                Utils.logError("Lichess puzzles not counted", throwable);
                counts = new int[]{0, 0};
            } finally {
                counting = false;
            }
            MAIN.post(done);
        });
        return null;
    }

    /** Downloads a pack in the background; a toast says how it went. */
    public static void download(int pack) {
        Context context = Utils.context();
        if (context == null || downloading != null || deleting) return;
        downloading = -1;
        STORE_WORK.execute(() -> {
            String error = PuzzleStore.get(context).download(pack, percent -> downloading = percent);
            counts = null;
            downloading = null;
            Utils.toast(error == null ? "Lichess puzzles downloaded" : error);
        });
    }

    /** Deletes every puzzle in the background, then runs done on the main thread. */
    public static void deletePuzzles(Runnable done) {
        Context context = Utils.context();
        if (context == null || downloading != null || deleting) return;
        deleting = true;
        STORE_WORK.execute(() -> {
            try {
                PuzzleStore.get(context).clear();
            } catch (Throwable throwable) {
                Utils.logError("Lichess puzzles not deleted", throwable);
            } finally {
                counts = null;
                deleting = false;
            }
            MAIN.post(done);
        });
    }

    /** A Lichess session is open: chess.com's puzzle screen treats it as rated, online play. */
    public static boolean session() {
        return active;
    }

    private static Glicko glicko() {
        SharedPreferences preferences = Features.preferences();
        if (preferences == null || !preferences.contains(RATING)) return Glicko.start();
        return new Glicko(preferences.getFloat(RATING, 1500), preferences.getFloat(DEVIATION, 500),
            preferences.getFloat(VOLATILITY, 0.09f));
    }

    private static void save(Glicko glicko) {
        SharedPreferences preferences = Features.preferences();
        if (preferences == null) return;
        preferences.edit().putFloat(RATING, (float) glicko.rating).putFloat(DEVIATION, (float) glicko.deviation)
            .putFloat(VOLATILITY, (float) glicko.volatility).apply();
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object enumValue(Class<?> type, String name) {
        return Enum.valueOf((Class) type, name);
    }

    private static Object emptyBytes() throws Exception {
        Class<?> bytes = Class.forName("okio.ByteString");
        for (Field field : bytes.getFields()) {
            if (Modifier.isStatic(field.getModifiers()) && field.getType() == bytes) return field.get(null);
        }
        throw new IllegalStateException("No empty ByteString");
    }

    private static Object fieldOfType(Object owner, String simpleName) {
        for (Field field : owner.getClass().getDeclaredFields()) {
            if (!field.getType().getSimpleName().equals(simpleName)) continue;
            try {
                field.setAccessible(true);
                Object value = field.get(owner);
                return value instanceof Enum ? ((Enum<?>) value).name() : value;
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }
}
