package app.noam.extension.chesscom.gamereview;

import android.app.Activity;
import android.app.AlertDialog;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.stockfish.BridgeSettings;

/**
 * Game Review asks who reviews the game: chess.com's servers, Stockfish on the phone, Stockfish on
 * the user's own computer (over the local network, sf-bridge), or Lichess's servers (every one of ours
 * marks moves the Lichess way). The app's navigation call is held back while the chooser is open
 * and replayed once a reviewer is picked.
 */
public final class ReviewChooser {
    /**
     * The reviewers on offer: Local Stockfish only when the app was patched with Stockfish analysis
     * (its engine), Stockfish on the computer only with the Game Review on your computer patch.
     */
    private static GameReview.Mode[] modes() {
        List<GameReview.Mode> modes = new ArrayList<>();
        modes.add(GameReview.Mode.CHESSCOM);
        if (Features.stockfishPatched()) modes.add(GameReview.Mode.STOCKFISH);
        if (GameReview.computerReview()) modes.add(GameReview.Mode.LAPTOP);
        modes.add(GameReview.Mode.LICHESS);
        return modes.toArray(new GameReview.Mode[0]);
    }

    private static String title(GameReview.Mode mode) {
        switch (mode) {
            case CHESSCOM: return "Review on chess.com";
            case STOCKFISH: return "Local Stockfish";
            case LAPTOP: return "Stockfish on your computer";
            default: return "Analyze with Lichess";
        }
    }

    /** Opening a review can take two navigations (a dialog, then the screen); one choice covers both. */
    private static final long CHOICE_MS = 5_000;

    private static boolean replaying;
    private static long chosenAt;

    private ReviewChooser() {}

    /**
     * Called first thing by navigate(activity, directions) and show(router, direction,
     * fragmentManager), with their first three registers. True when the call was held back.
     */
    public static boolean intercept(Object first, Object second, Object third) {
        if (replaying || !GameReview.enabled()) return false;
        if (!isReview(second) && !isReview(third)) return false;
        if (System.currentTimeMillis() - chosenAt < CHOICE_MS) return false;
        Activity activity = Utils.topActivity();
        StackTraceElement caller = new Throwable().getStackTrace()[1];
        Method method = callerMethod(caller, first, second, third);
        if (activity == null || method == null) return false;

        GameReview.Mode[] modes = modes();
        String[] options = new String[modes.length];
        for (int i = 0; i < modes.length; i++) options[i] = title(modes[i]);
        AlertDialog dialog = new AlertDialog.Builder(activity, android.R.style.Theme_Material_Dialog_Alert)
            .setTitle("Game Review")
            .setItems(options, (shown, which) -> {
                GameReview.Mode picked = modes[which];
                if (picked == GameReview.Mode.LICHESS) {
                    if (GameReview.lichessMethod() == null) {
                        GameReview.askLichessMethod(activity, () -> lichess(activity, method, first, second, third));
                    } else {
                        lichess(activity, method, first, second, third);
                    }
                } else if (picked == GameReview.Mode.LAPTOP && !BridgeSettings.configured()) {
                    askComputer(activity);
                } else {
                    review(picked, method, first, second, third);
                }
            })
            .create();
        dialog.show();
        return true;
    }

    private static void review(GameReview.Mode mode, Method method, Object first, Object second, Object third) {
        GameReview.setMode(mode);
        chosenAt = System.currentTimeMillis();
        replay(method, first, second, third);
    }

    /**
     * Stockfish on the computer needs the computer: without an address and a token there is nothing to
     * connect to, so the chooser sends the user to where both are set instead of reviewing nothing.
     */
    private static void askComputer(Activity activity) {
        new AlertDialog.Builder(activity, android.R.style.Theme_Material_Dialog_Alert)
            .setTitle("Stockfish on your computer")
            .setMessage("Set your computer's address and the token sf-bridge shows in More → Quwi's Patches "
                + "→ Game Review, then pick it again.")
            .setPositiveButton("OK", null)
            .show();
    }

    /** Lichess's servers review it in chess.com's screen, or it opens on Lichess's analysis board. */
    private static void lichess(Activity activity, Method method, Object first, Object second, Object third) {
        if (GameReview.LICHESS_SERVERS.equals(GameReview.lichessMethod())) {
            review(GameReview.Mode.LICHESS, method, first, second, third);
            return;
        }
        String pgn = pgn(isReview(second) ? second : third);
        if (pgn == null) {
            Utils.toast("Couldn't read this game");
            return;
        }
        LichessActivity.open(activity, pgn);
    }

    /** The game's PGN from the review direction, with clock times when chess.com has them. */
    private static String pgn(Object direction) {
        Object config = fieldOfType(direction, "com.chess.entities.ComputerAnalysisConfiguration");
        if (config == null) return null;
        Object withClock = field(config, "pgnWithClock");
        if (withClock instanceof String && !((String) withClock).trim().isEmpty()) return (String) withClock;
        Object plain = field(config, "pgn");
        return plain instanceof String && !((String) plain).trim().isEmpty() ? (String) plain : null;
    }

    private static Object fieldOfType(Object owner, String typeName) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (!field.getType().getName().equals(typeName)) continue;
                try {
                    field.setAccessible(true);
                    return field.get(owner);
                } catch (Throwable ignored) {
                    return null;
                }
            }
        }
        return null;
    }

    private static Object field(Object owner, String name) {
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(owner);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isReview(Object direction) {
        return direction != null && String.valueOf(direction).startsWith("GameReview(");
    }

    /** The hooked method itself: navigate is an instance method, show a static one. */
    private static Method callerMethod(StackTraceElement caller, Object first, Object second, Object third) {
        try {
            Class<?> owner = Class.forName(caller.getClassName(), false, ReviewChooser.class.getClassLoader());
            for (Method method : owner.getDeclaredMethods()) {
                if (!method.getName().equals(caller.getMethodName())) continue;
                boolean isStatic = Modifier.isStatic(method.getModifiers());
                Object[] args = isStatic ? new Object[]{first, second, third} : new Object[]{second, third};
                if (accepts(method.getParameterTypes(), args)) {
                    method.setAccessible(true);
                    return method;
                }
            }
        } catch (Throwable throwable) {
            Utils.logError("Review chooser: navigation not found", throwable);
        }
        return null;
    }

    private static boolean accepts(Class<?>[] types, Object[] args) {
        if (types.length != args.length) return false;
        for (int i = 0; i < types.length; i++) {
            if (types[i].isPrimitive() || (args[i] != null && !types[i].isInstance(args[i]))) return false;
        }
        return true;
    }

    private static void replay(Method method, Object first, Object second, Object third) {
        replaying = true;
        try {
            if (Modifier.isStatic(method.getModifiers())) method.invoke(null, first, second, third);
            else method.invoke(first, second, third);
        } catch (Throwable throwable) {
            Utils.logError("Review chooser: replay failed", throwable);
        } finally {
            replaying = false;
        }
    }
}
