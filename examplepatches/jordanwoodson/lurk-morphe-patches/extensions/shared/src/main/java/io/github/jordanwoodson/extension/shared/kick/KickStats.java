package io.github.jordanwoodson.extension.shared.kick;

import android.content.Context;
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
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Show video stats: a panel over Kick's player with the numbers its Media3 ExoPlayer keeps, refreshed by the player's
 * own once-a-second time update. The panel is a drawable in the player view's overlay, so it never takes a touch, and
 * it goes away at the next update after the switch is turned off. With the switch off nothing is read.
 */
@SuppressWarnings("unused")
public final class KickStats {
    static final String KEY = "video_stats";
    /** Media3's C.TIME_UNSET. */
    static final long TIME_UNSET = Long.MIN_VALUE + 1;
    /** Media3's Format.NO_VALUE. */
    static final int NO_VALUE = -1;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** The panel on each player view. Main thread only. */
    private static final Map<View, Panel> PANELS = new WeakHashMap<>();
    private static volatile Media3 media3;

    private KickStats() {
    }

    /**
     * Injection point: the start of the player's emitTimeUpdate(), which its interval clock runs on the main thread,
     * once a second for Kick's player, whether it plays or not.
     */
    public static void onTimeUpdate(Object player) {
        if (player == null) return;
        if (!enabled()) {
            if (!PANELS.isEmpty()) post(KickStats::removeAll);
            return;
        }
        try {
            View view = playerView(player);
            if (view == null) return;
            String[] lines = lines(exoPlayer(player), view.getContext());
            post(() -> show(view, lines));
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("video stats: " + e);
        }
    }

    /** The panel's text for a Media3 [player]: one line per number it has. */
    static String[] lines(Object player, Context context) throws ReflectiveOperationException {
        Media3 api = media3;
        ClassLoader loader = player.getClass().getClassLoader();
        if (api == null || api.loader != loader) {
            api = new Media3(loader);
            media3 = api;
        }
        boolean live = (Boolean) api.live.invoke(player);
        long latency = live ? (Long) api.liveOffset.invoke(player) : TIME_UNSET;
        long buffer = (Long) api.buffered.invoke(player);
        Object video = api.videoFormat.invoke(player);
        Object audio = api.audioFormat.invoke(player);
        Object counters = api.counters.invoke(player);
        long estimate = context == null ? 0 : api.estimate(context);

        List<String> lines = new ArrayList<>();
        // Recorded videos have no live edge, and a live stream without wall-clock times has no offset either.
        if (latency != TIME_UNSET && latency >= 0) lines.add("Latency  " + seconds(latency));
        int average = video == null ? NO_VALUE : api.averageBitrate.getInt(video);
        int bitrate = video == null ? NO_VALUE : api.bitrate.getInt(video);
        long shown = average > 0 ? average : bitrate;
        if (shown > 0 || estimate > 0) {
            lines.add("Bitrate  " + (shown > 0 ? rate(shown) : "-") + (estimate > 0 ? ", network " + rate(estimate) : ""));
        }
        lines.add("Buffer   " + seconds(Math.max(0, buffer)));
        float frameRate = video == null ? NO_VALUE : api.frameRate.getFloat(video);
        if (counters != null) {
            api.ensureUpdated.invoke(counters);
            int dropped = api.dropped.getInt(counters);
            int frames = api.rendered.getInt(counters) + dropped + api.skipped.getInt(counters);
            lines.add("Dropped  " + dropped + " of " + frames + " frames"
                    + (frameRate > 0 ? ", " + Math.round(frameRate) + " fps" : ""));
        }
        if (video != null) {
            int width = api.width.getInt(video);
            int height = api.height.getInt(video);
            String name = height > 0 ? height + "p" + (frameRate > 31 ? String.valueOf(Math.round(frameRate)) : "") : "-";
            lines.add("Quality  " + name + (width > 0 && height > 0 ? ", " + width + "x" + height : ""));
        }
        String codecs = join((String) (video == null ? null : api.codecs.get(video)),
                (String) (audio == null ? null : api.codecs.get(audio)));
        if (!codecs.isEmpty()) lines.add("Codecs   " + codecs);
        return lines.toArray(new String[0]);
    }

    private static String join(String video, String audio) {
        StringBuilder text = new StringBuilder();
        for (String codecs : new String[]{video, audio}) {
            if (codecs == null || codecs.isEmpty()) continue;
            if (text.length() > 0) text.append(", ");
            text.append(codecs.replace(",", ", "));
        }
        return text.toString();
    }

    private static String seconds(long milliseconds) {
        return String.format(Locale.ROOT, "%.1f s", milliseconds / 1000.0);
    }

    private static String rate(long bitsPerSecond) {
        return bitsPerSecond >= 1_000_000
                ? String.format(Locale.ROOT, "%.2f Mbps", bitsPerSecond / 1_000_000.0)
                : String.format(Locale.ROOT, "%d kbps", Math.round(bitsPerSecond / 1000.0));
    }

    private static void post(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else MAIN.post(action);
    }

    private static void show(View view, String[] lines) {
        if (!enabled()) {
            removeAll();
            return;
        }
        Panel panel = PANELS.get(view);
        if (panel == null) {
            panel = new Panel(view);
            PANELS.put(view, panel);
            view.getOverlay().add(panel);
            Logger.d("video stats: shown on the player");
        }
        panel.show(lines, view.getWidth(), view.getHeight());
    }

    private static void removeAll() {
        for (Iterator<Map.Entry<View, Panel>> it = PANELS.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry<View, Panel> entry = it.next();
            entry.getKey().getOverlay().remove(entry.getValue());
            it.remove();
            Logger.d("video stats: removed from the player");
        }
    }

    /** The lines on [view]'s panel, or null without one. For the probes. */
    static String[] shown(View view) {
        Panel panel = PANELS.get(view);
        return panel == null ? null : panel.lines.clone();
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

    /** ((VideoPlayer) player).getPlayer(), Media3's ExoPlayer. */
    private static Object exoPlayer(Object player) {
        return null;
    }

    /** The Media3 API, by the public names Kick's copy of Media3 keeps, looked up once. */
    private static final class Media3 {
        final ClassLoader loader;
        final Method live, liveOffset, buffered, videoFormat, audioFormat, counters, ensureUpdated, singleton, bitrateEstimate;
        final Field bitrate, averageBitrate, width, height, frameRate, codecs;
        final Field dropped, rendered, skipped;

        Media3(ClassLoader loader) throws ReflectiveOperationException {
            this.loader = loader;
            Class<?> player = Class.forName("androidx.media3.exoplayer.ExoPlayer", false, loader);
            live = player.getMethod("isCurrentMediaItemLive");
            liveOffset = player.getMethod("getCurrentLiveOffset");
            buffered = player.getMethod("getTotalBufferedDuration");
            videoFormat = player.getMethod("getVideoFormat");
            audioFormat = player.getMethod("getAudioFormat");
            counters = player.getMethod("getVideoDecoderCounters");
            Class<?> format = Class.forName("androidx.media3.common.Format", false, loader);
            bitrate = format.getField("bitrate");
            averageBitrate = format.getField("averageBitrate");
            width = format.getField("width");
            height = format.getField("height");
            frameRate = format.getField("frameRate");
            codecs = format.getField("codecs");
            Class<?> decoder = Class.forName("androidx.media3.exoplayer.DecoderCounters", false, loader);
            ensureUpdated = decoder.getMethod("ensureUpdated");
            dropped = decoder.getField("droppedBufferCount");
            rendered = decoder.getField("renderedOutputBufferCount");
            skipped = decoder.getField("skippedOutputBufferCount");
            // Kick's ExoPlayer is built without a bandwidth meter of its own, so it uses Media3's shared one.
            Class<?> meter = Class.forName("androidx.media3.exoplayer.upstream.DefaultBandwidthMeter", false, loader);
            singleton = meter.getMethod("getSingletonInstance", Context.class);
            bitrateEstimate = meter.getMethod("getBitrateEstimate");
        }

        /** The network estimate, or 0 when the meter can't give one. */
        long estimate(Context context) {
            try {
                return (Long) bitrateEstimate.invoke(singleton.invoke(null, context));
            } catch (ReflectiveOperationException | RuntimeException e) {
                return 0;
            }
        }
    }

    /** White monospace lines on a translucent black box in the player's top left corner. */
    private static final class Panel extends Drawable {
        private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint box = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float margin;
        private final float padding;
        private final float radius;
        String[] lines = new String[0];

        Panel(View view) {
            DisplayMetrics metrics = view.getResources().getDisplayMetrics();
            text.setColor(Color.WHITE);
            text.setTypeface(Typeface.MONOSPACE);
            text.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 10, metrics));
            box.setColor(0xB3000000);
            margin = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 8, metrics);
            padding = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 6, metrics);
            radius = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4, metrics);
        }

        void show(String[] lines, int width, int height) {
            this.lines = lines;
            setBounds(0, 0, width, height);
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            String[] current = lines;
            if (current.length == 0) return;
            Paint.FontMetrics font = text.getFontMetrics();
            float line = font.descent - font.ascent;
            float widest = 0;
            for (String value : current) widest = Math.max(widest, text.measureText(value));
            Rect bounds = getBounds();
            float left = bounds.left + margin;
            float top = bounds.top + margin;
            canvas.drawRoundRect(left, top, left + widest + 2 * padding, top + line * current.length + 2 * padding,
                    radius, radius, box);
            float baseline = top + padding - font.ascent;
            for (String value : current) {
                canvas.drawText(value, left + padding, baseline, text);
                baseline += line;
            }
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
