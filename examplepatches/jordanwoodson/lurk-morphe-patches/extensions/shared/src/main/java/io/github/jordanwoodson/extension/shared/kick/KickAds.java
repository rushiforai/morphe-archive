package io.github.jordanwoodson.extension.shared.kick;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Mute stitched live ads (experimental). While Kick's player reports an ad break, the player is muted and the video
 * covered with black and a small "Ad break"; both are restored when the break's time is up, the break ends or another
 * stream loads. The ad itself still plays: it is part of the stream. Two signals start a break, neither of which a
 * signed-out session received (docs/kick.md): an SCTE-35 splice insert in the stream, which Media3 hands to the player's
 * listener as timed metadata (onMetadata, added to Kick's listener), and the ads of the MediaTailor session Kick's
 * player keeps through Datazoom. With the switch off nothing starts; a break already running still ends, so Lurk never
 * leaves a player muted or covered.
 */
@SuppressWarnings("unused")
public final class KickAds {
    static final String KEY = "mute_live_ads";
    /** The length of an ad when its signal doesn't give one. */
    static final long DEFAULT_MS = 30_000;
    /** The longest a break is kept without a new signal, as on Twitch. */
    static final long MAX_MS = 240_000;
    /** Extra time after an ad's length: its signal can come a little before the ad plays. */
    static final long SLACK_MS = 2_000;
    /** How long the cover waits after a MediaTailor ad ends, for the next ad of the same break. */
    static final long POD_GAP_MS = 1_500;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Breaks by Kick player view. Main thread only. */
    private static final Map<View, Break> BREAKS = new WeakHashMap<>();
    /** The mute state Kick last asked each player view's player for: what the end of a break restores. */
    private static final Map<View, Boolean> REQUESTED = Collections.synchronizedMap(new WeakHashMap<>());
    /** The kinds of metadata already logged, so IVS's per-segment ID3 frames don't flood the log. */
    private static final Set<String> SEEN = new HashSet<>();
    private static final Pattern COMMAND = Pattern.compile("\"cmd\":\"([^\"]*)\"");
    /** While Lurk itself calls a player's setMuted, so muteRequest lets the call through. Main thread only. */
    private static boolean applying;

    private KickAds() {
    }

    private static final class Break {
        final WeakReference<View> view;
        final Drawable foreground;
        final Runnable timeout;

        Break(View view) {
            this.view = new WeakReference<>(view);
            foreground = view.getForeground();
            timeout = () -> {
                View current = this.view.get();
                if (current != null && BREAKS.get(current) == this) end(current, "its time is up");
            };
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /**
     * Injection point: Player.Listener.onMetadata(Metadata), which Lurk adds to Kick's player listener, with the view
     * the player is on, on the main thread. An SCTE-35 splice insert out of the network starts a break for its break
     * duration and its return ends it; other metadata is logged (Debug logging) so a real ad marker can be recognised.
     */
    public static void onMetadata(View view, Object metadata) {
        if (view == null || metadata == null) return;
        try {
            Class<?> type = metadata.getClass();
            int length = (Integer) type.getMethod("length").invoke(metadata);
            for (int i = 0; i < length; i++) {
                Object entry = type.getMethod("get", int.class).invoke(metadata, i);
                if (entry == null) continue;
                if (!isSpliceInsert(entry)) {
                    if (enabled()) logOnce(entry);
                    continue;
                }
                Class<?> splice = entry.getClass();
                if (splice.getField("spliceEventCancelIndicator").getBoolean(entry)) continue;
                if (splice.getField("outOfNetworkIndicator").getBoolean(entry)) {
                    if (!enabled()) continue;
                    long duration = splice.getField("breakDurationUs").getLong(entry);
                    long breakMs = duration > 0 && duration != KickStats.TIME_UNSET ? duration / 1000 : DEFAULT_MS;
                    post(() -> start(view, breakMs, "SCTE-35 splice insert"));
                } else {
                    post(() -> end(view, "the SCTE-35 break returned"));
                }
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("ads: metadata: " + e);
        }
    }

    /**
     * Injection point: the start of the player view's MediaTailor ad event callback (the lambda it gives its Datazoom
     * monitor), with the view and Kick's MediaTailorAdEventPayload. Only a MediaTailor session sends these, and Kick only
     * makes one when its playback response has a tracking URL and Datazoom is running.
     */
    public static void onMediaTailorEvent(View view, Object event) {
        if (view == null || event == null) return;
        String name = adEventName(event);
        if ("adStart".equals(name)) {
            if (!enabled()) return;
            Double seconds = adEventSeconds(event);
            long length = seconds != null && seconds > 0 && seconds < MAX_MS / 1000.0
                    ? Math.round(seconds * 1000) : DEFAULT_MS;
            post(() -> start(view, length, "MediaTailor ad"));
        } else if ("adEnd".equals(name)) {
            post(() -> endSoon(view));
        }
    }

    /**
     * Injection point: the start of the player's prepare() (a new stream, or the same one again) and close(). Another
     * stream, or none, ends the break on the view the player is on.
     */
    public static void onPlayerLoad(Object player) {
        if (player == null) return;
        View view = playerView(player);
        if (view != null) onLoad(view);
    }

    /** Injection point: the start of the player view's setVideoPlayer(VideoPlayer): its player changes. */
    public static void onLoad(View view) {
        if (view != null) post(() -> end(view, "another stream loads"));
    }

    /**
     * Injection point: the start of the player's setMuted(boolean), which React Native calls with the mute Kick wants.
     * Remembered by the player's view, so the end of a break restores it; during a break the player stays muted.
     */
    public static boolean muteRequest(Object player, boolean muted) {
        if (player == null || applying) return muted;
        View view = playerView(player);
        if (view == null) return muted;
        REQUESTED.put(view, muted);
        if (Looper.myLooper() == Looper.getMainLooper() && !muted && BREAKS.containsKey(view)) {
            Logger.d("ads: kept the player muted until the break is over");
            return true;
        }
        return muted;
    }

    // ---------------------------------------------------------------------------------------------
    // Breaks, on the main thread

    private static void start(View view, long length, String source) {
        if (!enabled()) return;
        Break current = BREAKS.get(view);
        if (current == null) {
            current = new Break(view);
            BREAKS.put(view, current);
            view.setForeground(new AdCover(view));
            apply(view, true);
            Logger.i("ads: " + source + ": muted and covered the player");
        } else {
            Logger.d("ads: " + source + " during the break");
        }
        MAIN.removeCallbacks(current.timeout);
        MAIN.postDelayed(current.timeout, Math.min(length, MAX_MS) + SLACK_MS);
    }

    private static void endSoon(View view) {
        Break current = BREAKS.get(view);
        if (current == null) return;
        MAIN.removeCallbacks(current.timeout);
        MAIN.postDelayed(current.timeout, POD_GAP_MS);
    }

    private static void end(View view, String why) {
        Break ended = BREAKS.remove(view);
        if (ended == null) return;
        MAIN.removeCallbacks(ended.timeout);
        if (view.getForeground() instanceof AdCover) view.setForeground(ended.foreground);
        apply(view, Boolean.TRUE.equals(REQUESTED.get(view)));
        Logger.i("ads: the break is over (" + why + "): sound and video back");
    }

    /** The player's own setMuted, so React Native's state follows. */
    private static void apply(View view, boolean muted) {
        applying = true;
        try {
            setMuted(view, muted);
        } catch (RuntimeException e) {
            Logger.w("ads: couldn't " + (muted ? "mute" : "unmute") + " the player", e);
        } finally {
            applying = false;
        }
    }

    private static void post(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else MAIN.post(action);
    }

    /**
     * Logs a kind of metadata that isn't an ad the first time it arrives (Debug logging): Amazon IVS puts ID3 frames
     * in every segment, so only a new kind (its class, ID3 frame ID and description, and the command of IVS's segment
     * metadata) is worth a line.
     */
    private static void logOnce(Object entry) {
        String text = String.valueOf(entry);
        int values = text.indexOf("values=");
        String kind = entry.getClass().getSimpleName() + " " + (values > 0 ? text.substring(0, values) : text);
        Matcher command = COMMAND.matcher(text);
        if (command.find()) kind += " cmd=" + command.group(1);
        synchronized (SEEN) {
            if (SEEN.size() >= 200 || !SEEN.add(kind)) return;
        }
        Logger.d("ads: " + entry.getClass().getSimpleName() + " metadata, not an ad: " + text);
    }

    /** Media3's SCTE-35 SpliceInsertCommand, by the public name Kick's copy of Media3 keeps. */
    private static boolean isSpliceInsert(Object entry) {
        try {
            return Class.forName("androidx.media3.extractor.metadata.scte35.SpliceInsertCommand", false,
                    entry.getClass().getClassLoader()).isInstance(entry);
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    private static boolean enabled() {
        return Settings.isRegistered(KEY) && Settings.isEnabled(KEY);
    }

    // ---------------------------------------------------------------------------------------------
    // Bridges, filled in at patch time.

    /** ((VideoPlayer) player).getCurrentVideoView(): the player view the player is on, or null. */
    private static View playerView(Object player) {
        return null;
    }

    /** ((VideoView) view).getVideoPlayer()?.setMuted(muted). */
    private static void setMuted(View view, boolean muted) {
    }

    /** ((MediaTailorAdEventPayload) event).getType(). */
    private static String adEventName(Object event) {
        return null;
    }

    /** ((MediaTailorAdEventPayload) event).getDuration(), in seconds. */
    private static Double adEventSeconds(Object event) {
        return null;
    }

    /** Opaque black with a small "Ad break" in the middle. */
    private static final class AdCover extends Drawable {
        private final Paint fill = new Paint();
        private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);

        AdCover(View view) {
            fill.setColor(Color.BLACK);
            label.setColor(0x99FFFFFF);
            label.setTextAlign(Paint.Align.CENTER);
            label.setTypeface(Typeface.DEFAULT_BOLD);
            label.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14,
                    view.getResources().getDisplayMetrics()));
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            canvas.drawRect(bounds, fill);
            float baseline = bounds.exactCenterY() - (label.descent() + label.ascent()) / 2;
            canvas.drawText("Ad break", bounds.exactCenterX(), baseline, label);
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.OPAQUE;
        }
    }
}
