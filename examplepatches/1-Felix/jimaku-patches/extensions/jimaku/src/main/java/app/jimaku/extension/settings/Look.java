package app.jimaku.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.LinkedHashMap;
import java.util.Map;

import app.jimaku.extension.menu.Version;

/**
 * What the viewer set, kept in the YouTube app's preferences in a file of Jimaku's own: whether
 * subtitles are on, the Premium switch's mode, Original caption, both sizes, the background, the
 * position, and the timing of the 200 videos set last. The ranges, steps and defaults are the extension's ({@code lib/store.ts}).
 */
public final class Look {
    public static final int SIZE_MIN = 50, SIZE_MAX = 200, SIZE_STEP = 10, SIZE_DEFAULT = 100;
    public static final int BACKGROUND_MIN = 0, BACKGROUND_MAX = 100, BACKGROUND_STEP = 10, BACKGROUND_DEFAULT = 75;
    /** Timing in tenths of a second, so steps stay exact. */
    public static final int TIMING_MIN = -50, TIMING_MAX = 50, TIMING_STEP = 1;
    private static final int TIMINGS_KEPT = 200;

    /** Told after any change. */
    public interface OnChange {
        void onChange();
    }

    private final SharedPreferences prefs;
    private final LinkedHashMap<String, Integer> timings = new LinkedHashMap<>(16, 0.75f, false);
    private OnChange onChange;

    private boolean on;
    /** The mode the viewer flipped the Premium switch to, or null until they do. */
    private Version mode;
    private boolean dual;
    private int translation;
    private int original;
    private int background;
    /** Where the captions were dropped, as shares of the player's width and height from their own place; NaN at Default. */
    private float positionX;
    private float positionY;
    /** The one-time hint at Jimaku's button is still to be seen, as the extension's {@code hintPending}. */
    private boolean hintPending;

    public Look(Context context) {
        this(context.getSharedPreferences("jimaku", Context.MODE_PRIVATE));
    }

    Look(SharedPreferences prefs) {
        this.prefs = prefs;
        // A fresh install finds Jimaku's file empty, and gets the hint; an update finds what it kept. Every
        // start leaves "started", so the file never reads as fresh again once the hint has gone.
        boolean fresh = prefs.getAll().isEmpty();
        hintPending = fresh || prefs.getBoolean("hint_pending", false);
        if (fresh) prefs.edit().putBoolean("started", true).putBoolean("hint_pending", true).apply();
        else if (!prefs.contains("started")) prefs.edit().putBoolean("started", true).apply();
        on = prefs.getBoolean("on", false);
        String flipped = prefs.getString("mode", null);
        mode = "premium".equals(flipped) ? Version.PREMIUM : "standard".equals(flipped) ? Version.STANDARD : null;
        dual = prefs.getBoolean("dual", false);
        translation = clamp(prefs.getInt("translation", SIZE_DEFAULT), SIZE_MIN, SIZE_MAX);
        original = clamp(prefs.getInt("original", SIZE_DEFAULT), SIZE_MIN, SIZE_MAX);
        background = clamp(prefs.getInt("background", BACKGROUND_DEFAULT), BACKGROUND_MIN, BACKGROUND_MAX);
        positionX = prefs.getFloat("position_x", Float.NaN);
        positionY = prefs.getFloat("position_y", Float.NaN);
        try {
            JSONArray kept = new JSONArray(prefs.getString("timings", "[]"));
            for (int i = 0; i < kept.length(); i++) {
                JSONArray entry = kept.getJSONArray(i);
                timings.put(entry.getString(0), clamp(entry.getInt(1), TIMING_MIN, TIMING_MAX));
            }
        } catch (JSONException e) {
            timings.clear();
        }
    }

    public void setOnChange(OnChange listener) {
        onChange = listener;
    }

    public boolean hintPending() {
        return hintPending;
    }

    /** The hint was closed, or the button pressed before it: it never shows again on this install. */
    public void hintSeen() {
        if (!hintPending) return;
        hintPending = false;
        prefs.edit().remove("hint_pending").apply();
    }

    public boolean on() {
        return on;
    }

    public Version mode() {
        return mode;
    }

    public boolean dual() {
        return dual;
    }

    public int translation() {
        return translation;
    }

    public int original() {
        return original;
    }

    public int background() {
        return background;
    }

    public boolean moved() {
        return !Float.isNaN(positionX) && !Float.isNaN(positionY) && (positionX != 0 || positionY != 0);
    }

    public float positionX() {
        return moved() ? positionX : 0;
    }

    public float positionY() {
        return moved() ? positionY : 0;
    }

    /** This video's timing in tenths of a second: later is positive. */
    public int timing(String video) {
        Integer tenths = video == null ? null : timings.get(video);
        return tenths == null ? 0 : tenths;
    }

    public void setOn(boolean value) {
        if (on == value) return;
        on = value;
        prefs.edit().putBoolean("on", value).apply();
        changed();
    }

    /** The Premium switch, flipped: Premium or Standard for every video from now on. */
    public void setMode(Version value) {
        if (value != Version.PREMIUM && value != Version.STANDARD) throw new IllegalArgumentException("Not a mode: " + value);
        if (mode == value) return;
        mode = value;
        prefs.edit().putString("mode", value.id()).apply();
        changed();
    }

    public void setDual(boolean value) {
        if (dual == value) return;
        dual = value;
        prefs.edit().putBoolean("dual", value).apply();
        changed();
    }

    public void stepTranslation(int steps) {
        translation = clamp(translation + steps * SIZE_STEP, SIZE_MIN, SIZE_MAX);
        prefs.edit().putInt("translation", translation).apply();
        changed();
    }

    public void stepOriginal(int steps) {
        original = clamp(original + steps * SIZE_STEP, SIZE_MIN, SIZE_MAX);
        prefs.edit().putInt("original", original).apply();
        changed();
    }

    public void stepBackground(int steps) {
        background = clamp(background + steps * BACKGROUND_STEP, BACKGROUND_MIN, BACKGROUND_MAX);
        prefs.edit().putInt("background", background).apply();
        changed();
    }

    public void stepTiming(String video, int steps) {
        if (video == null) return;
        int tenths = clamp(timing(video) + steps * TIMING_STEP, TIMING_MIN, TIMING_MAX);
        timings.remove(video);
        if (tenths != 0) timings.put(video, tenths);
        while (timings.size() > TIMINGS_KEPT) timings.remove(timings.keySet().iterator().next());
        saveTimings();
        changed();
    }

    public void setPosition(float x, float y) {
        positionX = x;
        positionY = y;
        prefs.edit().putFloat("position_x", x).putFloat("position_y", y).apply();
        changed();
    }

    public void resetPosition() {
        positionX = Float.NaN;
        positionY = Float.NaN;
        prefs.edit().remove("position_x").remove("position_y").apply();
        changed();
    }

    /** Whether Reset all has anything to put back for {@code video}. */
    public boolean atDefaults(String video) {
        return translation == SIZE_DEFAULT && original == SIZE_DEFAULT && background == BACKGROUND_DEFAULT
                && !moved() && timing(video) == 0;
    }

    /** Both sizes, the background, the position and this video's timing back to their defaults; Original caption stays. */
    public void resetAll(String video) {
        translation = SIZE_DEFAULT;
        original = SIZE_DEFAULT;
        background = BACKGROUND_DEFAULT;
        positionX = Float.NaN;
        positionY = Float.NaN;
        if (video != null) timings.remove(video);
        prefs.edit().putInt("translation", translation).putInt("original", original).putInt("background", background)
                .remove("position_x").remove("position_y").apply();
        saveTimings();
        changed();
    }

    private void saveTimings() {
        JSONArray kept = new JSONArray();
        for (Map.Entry<String, Integer> entry : timings.entrySet()) {
            kept.put(new JSONArray().put(entry.getKey()).put(entry.getValue()));
        }
        prefs.edit().putString("timings", kept.toString()).apply();
    }

    private void changed() {
        if (onChange != null) onChange.onChange();
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
