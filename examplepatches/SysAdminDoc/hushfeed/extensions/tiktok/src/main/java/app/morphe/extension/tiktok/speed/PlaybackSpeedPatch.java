/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/speed/PlaybackSpeedPatch.java
 */
package app.morphe.extension.tiktok.speed;

import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/** Helper methods injected by the TikTok playback speed bytecode patch. */
public final class PlaybackSpeedPatch {
    private static final String EDGE_SPEEDUP_CLASS =
        "com.ss.android.ugc.aweme.feed.longvideo.edgespeedup.EdgeSpeedupAssem";
    private static final String SOURCE_LONG_PRESS = "long_press";
    private static final String SOURCE_SHARE_BUTTON = "click_share_button";
    private static final String SOURCE_IMMERSIVE_PICKER = "immersive_click";
    private static final String SOURCE_ON_SCREEN_BUTTON = "on_screen_button";
    private static final String SOURCE_SWIPE_LOCK = "swipe_up_lock_persist";

    /**
     * What the speed menu row accepts. The row's summary and its refusal say these numbers,
     * formatted in from here, so the words follow the limit.
     */
    public static final int MAX_MENU_SPEEDS = 8;
    public static final float MIN_SPEED = 0.5f;
    public static final float MAX_SPEED = 3f;

    private static volatile float rememberedSpeed = 1.0f;
    private static String currentVideoId = "";
    private static float manualSpeed = Float.NaN;

    private PlaybackSpeedPatch() {}

    /** A speed the way the row writes it: 0.5, 1.25, 3. No trailing zero, no locale comma. */
    public static String speedLabel(float speed) {
        String text = java.math.BigDecimal.valueOf(speed).stripTrailingZeros().toPlainString();
        return text;
    }

    public static synchronized void beginVideo(Aweme aweme) {
        String id = aweme == null || aweme.getAid() == null ? "" : aweme.getAid();
        if (!id.equals(currentVideoId) || id.isEmpty()) {
            currentVideoId = id;
            manualSpeed = Float.NaN;
        }
    }

    public static synchronized void onSelection(float speed, Aweme aweme, String event, String source) {
        if (!isValidSpeed(speed) ||
                (!isExplicitSelectionSource(source) && !isEdgeSpeedupSelection(source))) return;
        beginVideo(aweme);
        manualSpeed = speed;
        rememberPlaybackSpeed(speed, source);
    }

    public static synchronized float getPlaybackSpeedForVideo(Aweme aweme) {
        beginVideo(aweme);
        return getPlaybackSpeed();
    }

    /** Replaced with the verified native Aweme getter and controller setSpeed calls. */
    public static void onFirstFrame(Object controller) { }

    public static List<Float> parseMenuSpeeds(String text) {
        if (text == null || text.trim().isEmpty()) return List.of();
        String[] entries = text.split(",", -1);
        if (entries.length > MAX_MENU_SPEEDS) {
            throw new IllegalArgumentException("Use at most " + MAX_MENU_SPEEDS + " speeds");
        }
        LinkedHashSet<Float> values = new LinkedHashSet<>();
        for (String entry : entries) {
            float speed;
            try { speed = Float.parseFloat(entry.trim()); }
            catch (NumberFormatException error) { throw new IllegalArgumentException("Invalid speed", error); }
            if (!isValidSpeed(speed) || speed < MIN_SPEED || speed > MAX_SPEED) {
                throw new IllegalArgumentException(
                        "Use speeds from " + speedLabel(MIN_SPEED) + " to " + speedLabel(MAX_SPEED));
            }
            values.add(speed);
        }
        return new ArrayList<>(values);
    }

    public static Object menuSpeeds(Object original) {
        try {
            List<Float> values = parseMenuSpeeds(Settings.CUSTOM_SPEEDS.get());
            return values.isEmpty() ? original : values;
        } catch (IllegalArgumentException error) {
            return original;
        }
    }

    public static void rememberPlaybackSpeed(float speed, String source) {
        if (!isValidSpeed(speed) ||
            (!isExplicitSelectionSource(source) && !isEdgeSpeedupSelection(source))) {
            return;
        }

        // With the switch off, a new video starts at 1x (TikTok's default) and a choice made
        // from the menu applies to that video only. Upstream #168 asked for this: the remembered
        // speed always applied, and dropping the patch was the only way to get per-video reset.
        if (!Settings.REMEMBER_SPEED.get()) {
            rememberedSpeed = 1.0f;
            return;
        }

        rememberedSpeed = speed;
        try {
            Settings.REMEMBERED_SPEED.save(speed);
        } catch (Throwable ignored) {
            // Settings can be unavailable during early startup.
        }
    }

    public static float preserveTransitionSpeed(float requestedSpeed) {
        if (Settings.DEFAULT_SPEED_ENABLED.get()) return getPlaybackSpeed();
        if (Float.compare(requestedSpeed, 1.0f) != 0) {
            return requestedSpeed;
        }
        return getPlaybackSpeed();
    }

    public static synchronized float getPlaybackSpeed() {
        try {
            if (Settings.DEFAULT_SPEED_ENABLED.get()) {
                if (!currentVideoId.isEmpty() && isValidSpeed(manualSpeed)) return manualSpeed;
                try {
                    float value = Float.parseFloat(Settings.DEFAULT_SPEED.get());
                    return isValidSpeed(value) && value >= MIN_SPEED && value <= MAX_SPEED ? value : 1.5f;
                } catch (NumberFormatException error) {
                    return 1.5f;
                }
            }
            if (!Settings.REMEMBER_SPEED.get()) return 1.0f;
            float persisted = Settings.REMEMBERED_SPEED.get();
            return isValidSpeed(persisted) ? persisted : rememberedSpeed;
        } catch (Throwable ignored) {
            return rememberedSpeed;
        }
    }

    private static boolean isValidSpeed(float speed) {
        return !Float.isNaN(speed) && !Float.isInfinite(speed) && speed > 0.0f;
    }

    private static boolean isExplicitSelectionSource(String source) {
        return SOURCE_LONG_PRESS.equals(source)
            || SOURCE_SHARE_BUTTON.equals(source)
            || SOURCE_IMMERSIVE_PICKER.equals(source)
            || SOURCE_ON_SCREEN_BUTTON.equals(source)
            || SOURCE_SWIPE_LOCK.equals(source);
    }

    private static boolean isEdgeSpeedupSelection(String source) {
        if (source != null) {
            return false;
        }
        for (StackTraceElement frame : Thread.currentThread().getStackTrace()) {
            if (EDGE_SPEEDUP_CLASS.equals(frame.getClassName())) {
                return true;
            }
        }
        return false;
    }
}
