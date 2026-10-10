package app.noam.extension.chesscom.review;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;

import java.lang.reflect.Field;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;

/**
 * chess.com opens its review through a navigation direction carrying the game and, for the full
 * review, its permissions (canCreate is false once the free review is used). The game goes to
 * Lichess instead, always or only when chess.com would refuse.
 */
public final class LichessReview {
    private static final String CONFIG = "com.chess.entities.ComputerAnalysisConfiguration";
    private static final String PERMISSIONS = "com.chess.entities.GameAnalysisPermissions";
    private static final String ALWAYS = "lichess_always";

    /** The last game chess.com was asked to review, for the "used up" dialog that follows. */
    private static String lastPgn;

    private LichessReview() {}

    public static boolean enabled() {
        return Features.lichessReviewPatched() && Features.isEnabled(Features.LICHESS_REVIEW);
    }

    /** Lichess for every review, not only once chess.com's free review is used up. */
    public static boolean always() {
        SharedPreferences preferences = Features.preferences();
        return preferences == null || preferences.getBoolean(ALWAYS, true);
    }

    public static void setAlways(boolean always) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putBoolean(ALWAYS, always).apply();
    }

    /** A screen the app is about to open; true when Lichess took it over. */
    public static boolean onScreen(Object activity, Object directions) {
        if (directions == null || !enabled()) return false;
        try {
            String printed = String.valueOf(directions);
            if (printed.startsWith("GameReview(")) {
                String pgn = pgn(fieldOfType(directions, CONFIG));
                if (pgn == null) return false;
                lastPgn = pgn;
                Object canCreate = field(fieldOfType(directions, PERMISSIONS), "canCreate");
                if (always() || Boolean.FALSE.equals(canCreate)) {
                    open(activity instanceof Context ? (Context) activity : Utils.resumedActivity(), pgn);
                    return true;
                }
                return false;
            }
            if (printed.startsWith("Paywall(") && printed.contains("GAME_REVIEW") && lastPgn != null) {
                open(activity instanceof Context ? (Context) activity : Utils.resumedActivity(), lastPgn);
                return true;
            }
        } catch (Throwable throwable) {
            Utils.logError("Lichess review failed", throwable);
        }
        return false;
    }

    /** A dialog the app is about to show; true when Lichess took it over. */
    public static boolean onDialog(Object direction, Object fragmentManager) {
        if (direction == null || !enabled()) return false;
        try {
            String printed = String.valueOf(direction);
            Activity owner = Utils.activityOwning(fragmentManager);
            if (owner == null) owner = Utils.resumedActivity();
            if (printed.startsWith("GameReview(")) {
                String pgn = pgn(fieldOfType(direction, CONFIG));
                if (pgn == null) return false;
                lastPgn = pgn;
                if (!always()) return false;
                open(owner, pgn);
                return true;
            }
            if (printed.startsWith("GameReviewUpgrade(") && lastPgn != null) {
                open(owner, lastPgn);
                // A review screen that cannot review has nothing left to show.
                if (owner != null && owner.getClass().getSimpleName().contains("Review")) owner.finish();
                return true;
            }
        } catch (Throwable throwable) {
            Utils.logError("Lichess review failed", throwable);
        }
        return false;
    }

    private static void open(Context context, String pgn) {
        if (context == null) context = Utils.context();
        if (context == null) return;
        Intent intent = new Intent(context, LichessActivity.class).putExtra(LichessActivity.EXTRA_PGN, pgn);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    /** The game's PGN, with clock times when chess.com has them. */
    private static String pgn(Object config) {
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
        if (owner == null) return null;
        try {
            Field field = owner.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(owner);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
