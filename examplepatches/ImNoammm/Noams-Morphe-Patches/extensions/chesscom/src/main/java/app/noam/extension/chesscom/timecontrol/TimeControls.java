package app.noam.extension.chesscom.timecontrol;

import android.content.Context;

import java.lang.reflect.Method;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;

/**
 * The app's minutes slider runs from 0 to 120 and clamps to one minute. The patch adds stops left
 * of it for the sub-minute times; GameTime keeps minutes as a float, so 30 seconds is 0.5 there.
 * The server accepts these times, the app only lacks the UI.
 */
public final class TimeControls {
    /** Seconds offered below one minute, left to right on the slider. */
    private static final int[] SUB_MINUTE_SECONDS = {10, 15, 20, 30, 45};

    private static Method secPerGame;
    private static Method bonusSecPerMove;
    private static Method isDailyGame;

    private TimeControls() {}

    private static boolean enabled() {
        return Features.isEnabled(Features.SHORT_TIME_CONTROLS);
    }

    /** Leftmost slider stop: 0 in the app, lower when sub-minute stops are added. */
    public static int sliderMin() {
        return enabled() ? 1 - SUB_MINUTE_SECONDS.length : 0;
    }

    /** Slider stop for a time: whole minutes as before, or the nearest sub-minute stop. */
    public static int sliderPosition(Object gameTime) {
        int seconds = seconds(gameTime);
        if (!enabled() || seconds >= 60) return seconds / 60;
        int nearest = 0;
        for (int i = 1; i < SUB_MINUTE_SECONDS.length; i++) {
            if (Math.abs(SUB_MINUTE_SECONDS[i] - seconds) < Math.abs(SUB_MINUTE_SECONDS[nearest] - seconds)) {
                nearest = i;
            }
        }
        return nearest - (SUB_MINUTE_SECONDS.length - 1);
    }

    /** Minutes (fractional below one) for a slider stop; the app's own clamp when disabled. */
    public static float minutesForPosition(int position) {
        if (position >= 1 || !enabled()) return Math.max(position, 1);
        int index = position + SUB_MINUTE_SECONDS.length - 1;
        index = Math.max(0, Math.min(SUB_MINUTE_SECONDS.length - 1, index));
        return SUB_MINUTE_SECONDS[index] / 60f;
    }

    /** The slider's value text: "30 sec" below a minute, the app's "N min" otherwise. */
    public static String sliderLabel(String original, Object gameTime) {
        if (!enabled()) return original;
        int seconds = seconds(gameTime);
        if (seconds <= 0 || seconds >= 60) return original;
        return secondsText(seconds);
    }

    /**
     * GameTime.toCompactLabel() already prints "0:30" for 30 seconds without increment, but with
     * an increment it prints whole minutes only ("0+1"). Returns "0:30+1" there, null otherwise
     * (the app's own label is kept).
     */
    public static String compactLabel(Object gameTime, Context context) {
        try {
            if (!enabled() || gameTime == null || context == null) return null;
            if ((Boolean) method(gameTime, "isDailyGame").invoke(gameTime)) return null;
            int seconds = seconds(gameTime);
            int bonus = (Integer) method(gameTime, "getBonusSecPerMove").invoke(gameTime);
            if (bonus <= 0 || seconds % 60 == 0) return null;
            String time = format(context, "time_min_sec_format", "%1$s:%2$s",
                String.valueOf(seconds / 60), String.format(java.util.Locale.ROOT, "%02d", seconds % 60));
            return format(context, "time_increment_format", "%1$s+%2$s", time, String.valueOf(bonus));
        } catch (Throwable throwable) {
            Utils.logError("compact label", throwable);
            return null;
        }
    }

    private static String secondsText(int seconds) {
        Context context = Utils.context();
        if (context != null) {
            int plural = context.getResources().getIdentifier("x_sec", "plurals", context.getPackageName());
            if (plural != 0) {
                try {
                    return context.getResources().getQuantityString(plural, seconds, seconds);
                } catch (Throwable ignored) {
                    // Fall through to the plain text.
                }
            }
        }
        return seconds + " sec";
    }

    private static String format(Context context, String name, String fallback, Object... args) {
        int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
        return id == 0 ? String.format(fallback, args) : context.getString(id, args);
    }

    private static int seconds(Object gameTime) {
        if (gameTime == null) return 0;
        try {
            return (Integer) method(gameTime, "getSecPerGame").invoke(gameTime);
        } catch (Throwable throwable) {
            Utils.logError("GameTime seconds", throwable);
            return 0;
        }
    }

    /** GameTime's getters keep their real names; look each up once. */
    private static Method method(Object gameTime, String name) throws NoSuchMethodException {
        switch (name) {
            case "getSecPerGame":
                if (secPerGame == null) secPerGame = gameTime.getClass().getMethod(name);
                return secPerGame;
            case "getBonusSecPerMove":
                if (bonusSecPerMove == null) bonusSecPerMove = gameTime.getClass().getMethod(name);
                return bonusSecPerMove;
            default:
                if (isDailyGame == null) isDailyGame = gameTime.getClass().getMethod(name);
                return isDailyGame;
        }
    }
}
