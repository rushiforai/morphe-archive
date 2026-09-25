/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/speed/PlaybackSpeedPatch.java
 */
package app.morphe.extension.tiktok.speed;

import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.TextView;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    /** TikTok's own hold speed, written into the gesture and into its words for it. */
    static final float TIKTOK_HOLD_SPEED = 2f;
    private static final Pattern STANDALONE_TWO = Pattern.compile("(?<![\\p{Nd}.,])2(?![\\p{Nd}.,])");
    /** The hold banner's labels and the text TikTok gave each, kept while the view lives. */
    private static final Map<TextView, CharSequence> BANNER_TEXT = new WeakHashMap<>();
    private static volatile float loggedHoldSpeed = Float.NaN;

    private static volatile float rememberedSpeed = 1.0f;
    private static String currentVideoId = "";
    private static float manualSpeed = Float.NaN;

    private PlaybackSpeedPatch() {}

    /** A speed the way the row writes it: 0.5, 1.25, 3. No trailing zero, no locale comma. */
    public static String speedLabel(float speed) {
        // Float.toString gives the shortest decimal that round-trips the float. BigDecimal.valueOf
        // has no float overload, so it would widen to double first and render 1.1f as the double's
        // "1.100000023841858": harmless for the hold's fixed values, wrong for a free-text menu speed.
        return new java.math.BigDecimal(Float.toString(speed)).stripTrailingZeros().toPlainString();
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

    /**
     * The speed the row under Speed picks for the hold gesture, or NaN when TikTok's own stands:
     * Hushfeed paused, or a value the player would refuse.
     */
    static float chosenHoldSpeed() {
        if (Setting.isPaused()) return Float.NaN;
        try {
            float value = Float.parseFloat(Settings.HOLD_SPEED.get());
            return isValidSpeed(value) && value >= MIN_SPEED && value <= MAX_SPEED ? value : Float.NaN;
        } catch (NumberFormatException refused) {
            return Float.NaN;
        }
    }

    /**
     * The speed the hold gesture plays at and its pull-down lock keeps (upstream #52). TikTok
     * writes it as a literal 2x in the gesture, in its banner's "already at that speed" check
     * and in the lock's telemetry; each of those literals comes through here.
     */
    public static float holdSpeed(float nativeSpeed) {
        float chosen = chosenHoldSpeed();
        if (Float.isNaN(chosen)) return nativeSpeed;
        if (Float.compare(chosen, nativeSpeed) != 0 && Float.compare(chosen, loggedHoldSpeed) != 0) {
            // Once per value per process: the export says the gesture was reached and what it
            // ran at, without a line for every hold.
            loggedHoldSpeed = chosen;
            Logger.printInfo(() -> "Hold gesture speed " + speedLabel(chosen)
                    + "x in place of TikTok's " + speedLabel(nativeSpeed) + "x");
        }
        return chosen;
    }

    /**
     * TikTok's own words for the hold carry its fixed number: "Speed: 2x", "Pull down to lock
     * 2x speed", "Locked at 2× speed". With another hold speed chosen, the one standalone 2 in
     * such a text becomes that speed, whatever the language puts around it. A text with no 2 in
     * it ("Back to normal speed") or with more than one is left as TikTok wrote it.
     */
    public static String holdSpeedText(String text) {
        return rewordSpeedNumber(text, chosenHoldSpeed());
    }

    /**
     * TikTok's speed menu toast names the nearest built-in speed for a custom one: choosing 2.5x
     * plays at 2.5x but the toast reads "Playing at 2x speed", because the click handler picks the
     * label by exact value and only 0.5, 1.5, 2 and 3 have their own. Every other speed falls to
     * the "2x" label, whose standalone 2 becomes the chosen speed here, so "2x" reads "2.5x" in the
     * phone's own format. 1.0 has its own "normal speed" text and never reaches this, and TikTok's
     * own 0.5, 1.5 and 3 carry a different number, so their label rewords to itself.
     */
    public static String menuSpeedText(String label, float speed) {
        return rewordSpeedNumber(label, speed);
    }

    /**
     * The one standalone 2 in TikTok's text becomes {@code speed}. A text with no 2, with more
     * than one, or a {@code speed} that is TikTok's own 2x or not a speed is left as TikTok wrote
     * it, whatever the language puts around the number.
     */
    private static String rewordSpeedNumber(String text, float speed) {
        if (text == null || Float.isNaN(speed) || Float.compare(speed, TIKTOK_HOLD_SPEED) == 0) return text;
        Matcher two = STANDALONE_TWO.matcher(text);
        if (!two.find()) return text;
        int at = two.start();
        if (two.find()) return text;
        return text.substring(0, at) + speedLabel(speed) + text.substring(at + 1);
    }

    /**
     * The lock's toast, which TikTok sets from a string id: the reworded text, or null to keep
     * TikTok's own. The id is resolved the way TikTok resolves it, through its activity, because
     * most of its strings are served at run time rather than kept in the APK.
     */
    public static CharSequence holdSpeedToast(int id) {
        try {
            android.content.Context context = Utils.getActivity();
            if (context == null) context = Utils.getContext();
            if (context == null) return null;
            String text = context.getString(id);
            String wanted = holdSpeedText(text);
            return wanted == null || wanted.equals(text) ? null : wanted;
        } catch (RuntimeException unreadable) {
            Logger.printInfo(() -> "Hold speed toast left as TikTok wrote it", unreadable);
            return null;
        }
    }

    /**
     * The banner TikTok shows during a hold when the lock is off, a label it builds once with
     * "Speed: 2x" in it. It is shown and hidden from here, and each time the label is set from
     * the text TikTok gave it, so a changed row or a pause shows up at the next hold.
     */
    public static void holdSpeedBanner(ViewGroup banner) {
        for (int i = 0; i < banner.getChildCount(); i++) {
            if (!(banner.getChildAt(i) instanceof TextView)) continue;
            TextView label = (TextView) banner.getChildAt(i);
            CharSequence original = BANNER_TEXT.get(label);
            if (original == null) {
                original = label.getText();
                BANNER_TEXT.put(label, original);
            }
            String wanted = holdSpeedText(String.valueOf(original));
            if (!TextUtils.equals(wanted, label.getText())) label.setText(wanted);
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
