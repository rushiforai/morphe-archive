package io.github.jordanwoodson.extension.shared.rumble;

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

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Show video stats: a panel over Rumble's player with what its Media3 player reports. Media3's analytics collector
 * (one per player) hands over the video and audio formats, the video decoder's counters and the bandwidth estimate
 * as the player reports them; once a second, each video frame on screen shows the numbers of the player its player
 * view holds, with that player's buffer and live offset. The panel is a drawable in the frame's overlay, so it never
 * takes a touch. With the switch off the hooks only keep the references Media3 passes and read nothing from them.
 */
@SuppressWarnings("unused")
public final class RumbleStats {
    static final String KEY = "video_stats";
    private static final long REFRESH_MS = 1000;
    /** Media3's C.TIME_UNSET: no live offset (a recorded video, or a stream without wall-clock times). */
    private static final long TIME_UNSET = Long.MIN_VALUE + 1;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** What each player last reported, by player. */
    private static final Map<Object, Stats> STATS = Collections.synchronizedMap(new WeakHashMap<>());
    /** The video frames that were measured, and the panel on those that show one. Main thread only. */
    private static final Map<View, Panel> FRAMES = new WeakHashMap<>();
    private static volatile boolean ticking;

    /**
     * A key of Media3's Format.toLogString ("id=", ", res=", ", decRes=", ", drm=[" ...), each after the start or
     * ", ". Codec lists are joined with a bare comma, so a value never contains ", " followed by a key and "=".
     */
    private static final Pattern FORMAT_KEY = Pattern.compile("(?:^|, )([A-Za-z_]+)=");
    private static final Pattern COUNTER = Pattern.compile("(\\w+)=(-?\\d+)");

    private RumbleStats() {
    }

    private static final class Stats {
        volatile Object video;
        volatile Object audio;
        volatile Object counters;
        volatile long estimate;
    }

    private static Stats stats(Object collector) {
        Object player = collector == null ? null : collectorPlayer(collector);
        if (player == null) return null;
        synchronized (STATS) {
            Stats stats = STATS.get(player);
            if (stats == null) {
                stats = new Stats();
                STATS.put(player, stats);
            }
            return stats;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points: the start of four methods of Media3's analytics collector.

    /** The video decoder's input format changed (the rendition being decoded). */
    public static void onVideoFormat(Object collector, Object format) {
        Stats stats = stats(collector);
        if (stats != null) stats.video = format;
        wake();
    }

    /** The audio decoder's input format changed. */
    public static void onAudioFormat(Object collector, Object format) {
        Stats stats = stats(collector);
        if (stats != null) stats.audio = format;
        wake();
    }

    /** The video renderer was enabled, with the counters it updates from then on. */
    public static void onVideoEnabled(Object collector, Object counters) {
        Stats stats = stats(collector);
        if (stats != null) stats.counters = counters;
        wake();
    }

    /** The bandwidth meter's new estimate, in bits per second. */
    public static void onBandwidth(Object collector, long bitsPerSecond) {
        Stats stats = stats(collector);
        if (stats != null) stats.estimate = bitsPerSecond;
        wake();
    }

    /** Injection point: the start of the video frame's onMeasure (Media3's AspectRatioFrameLayout). */
    public static void onFrame(View frame) {
        if (frame == null || Looper.myLooper() != Looper.getMainLooper()) return;
        if (!FRAMES.containsKey(frame)) FRAMES.put(frame, null);
        wake();
    }

    // ---------------------------------------------------------------------------------------------
    // The panel

    private static boolean enabled() {
        return Settings.isRegistered(KEY) && Settings.isEnabled(KEY);
    }

    /** Starts the once-a-second refresh while the switch is on; it stops by itself. */
    private static void wake() {
        if (ticking || !enabled()) return;
        ticking = true;
        MAIN.post(RumbleStats::tick);
    }

    private static void tick() {
        boolean on = enabled();
        boolean any = false;
        for (Map.Entry<View, Panel> entry : new ArrayList<>(FRAMES.entrySet())) {
            View frame = entry.getKey();
            if (frame == null) continue;
            String[] lines = null;
            if (on && frame.isAttachedToWindow()) {
                any = true;
                if (frame.isShown()) lines = lines(frame);
            }
            if (lines == null || lines.length == 0) {
                remove(frame);
                if (!frame.isAttachedToWindow()) FRAMES.remove(frame);
            } else {
                show(frame, lines);
            }
        }
        if (on && any) {
            MAIN.postDelayed(RumbleStats::tick, REFRESH_MS);
        } else {
            // The next format, estimate or measured frame starts it again.
            ticking = false;
        }
    }

    private static String[] lines(View frame) {
        try {
            Object player = viewPlayer(frame.getParent());
            Stats stats = player == null ? null : STATS.get(player);
            if (stats == null) return null;
            Object video = stats.video;
            Object audio = stats.audio;
            Object counters = stats.counters;
            return lines(video == null ? null : formatLog(video), audio == null ? null : formatLog(audio),
                    counters == null ? null : counters.toString(), stats.estimate, bufferedMs(player),
                    liveOffsetMs(player));
        } catch (RuntimeException e) {
            Logger.d("video stats: " + e);
            return null;
        }
    }

    /**
     * The panel's text: one line per number the player has. [video] and [audio] are Media3 format log strings
     * ("id=1, mimeType=video/avc, bitrate=4500000, codecs=avc1.640028, res=1920x1080, fps=30.0"), [counters] is
     * DecoderCounters.toString(), [buffered] and [liveOffset] are milliseconds or null.
     */
    static String[] lines(String video, String audio, String counters, long estimate, Object buffered, Object liveOffset) {
        Map<String, String> v = format(video);
        Map<String, String> a = format(audio);
        List<String> lines = new ArrayList<>();
        if (liveOffset instanceof Long && (Long) liveOffset != TIME_UNSET && (Long) liveOffset >= 0) {
            lines.add("Latency  " + seconds((Long) liveOffset));
        }
        long bitrate = number(v.get("bitrate"));
        if (bitrate > 0 || estimate > 0) {
            lines.add("Bitrate  " + (bitrate > 0 ? rate(bitrate) : "-") + (estimate > 0 ? ", network " + rate(estimate) : ""));
        }
        if (buffered instanceof Long) lines.add("Buffer   " + seconds(Math.max(0, (Long) buffered)));
        Map<String, String> c = counters(counters);
        if (c.containsKey("droppedBuffers") && c.containsKey("renderedOutputBuffers")) {
            long dropped = number(c.get("droppedBuffers"));
            lines.add("Dropped  " + dropped + " of " + (dropped + number(c.get("renderedOutputBuffers"))) + " frames");
        }
        String resolution = v.get("res");
        if (resolution != null) {
            double fps = decimal(v.get("fps"));
            lines.add("Video    " + resolution + (fps > 0 ? ", " + trim(fps) + " fps" : ""));
        }
        String videoCodec = codec(v);
        String audioCodec = codec(a);
        // A stream with audio and video in one track names both codecs in the video format.
        if (videoCodec != null && audioCodec != null && videoCodec.contains(audioCodec)) audioCodec = null;
        if (videoCodec != null || audioCodec != null) {
            lines.add("Codecs   " + (videoCodec == null ? "" : videoCodec)
                    + (videoCodec != null && audioCodec != null ? ", " : "") + (audioCodec == null ? "" : audioCodec));
        }
        long rate = number(a.get("sample_rate"));
        long channels = number(a.get("channels"));
        if (rate > 0 || channels > 0) {
            lines.add("Audio    " + (rate > 0 ? trim(rate / 1000.0) + " kHz" : "")
                    + (rate > 0 && channels > 0 ? ", " : "") + (channels > 0 ? channels + " ch" : ""));
        }
        return lines.toArray(new String[0]);
    }

    /** The key=value pairs of a Media3 format log string. Values may contain commas (codecs). */
    static Map<String, String> format(String log) {
        Map<String, String> values = new HashMap<>();
        if (log == null) return values;
        Matcher matcher = FORMAT_KEY.matcher(log);
        String key = null;
        int start = 0;
        while (matcher.find()) {
            if (key != null) values.put(key, log.substring(start, matcher.start()));
            key = matcher.group(1);
            start = matcher.end();
        }
        if (key != null) values.put(key, log.substring(start));
        return values;
    }

    /** The integer name=value pairs of DecoderCounters.toString(). */
    static Map<String, String> counters(String text) {
        Map<String, String> values = new HashMap<>();
        if (text == null) return values;
        Matcher matcher = COUNTER.matcher(text);
        while (matcher.find()) values.put(matcher.group(1), matcher.group(2));
        return values;
    }

    /** The codecs string, or without one the sample type after its "video/" or "audio/". */
    private static String codec(Map<String, String> format) {
        String codecs = format.get("codecs");
        if (codecs != null && !codecs.isEmpty() && !codecs.equals("null")) return codecs.replace(",", ", ");
        String type = format.get("mimeType");
        if (type == null || type.isEmpty() || type.equals("null")) return null;
        return type.substring(type.indexOf('/') + 1);
    }

    private static long number(String value) {
        if (value == null) return 0;
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static double decimal(String value) {
        if (value == null) return 0;
        try {
            return Double.parseDouble(value.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /** 30 for 30.0, 29.97 for 29.97003, 44.1 for 44.1. */
    private static String trim(double value) {
        String text = String.format(Locale.ROOT, "%.2f", value);
        return text.contains(".") ? text.replaceAll("0+$", "").replaceAll("\\.$", "") : text;
    }

    private static String seconds(long milliseconds) {
        return String.format(Locale.ROOT, "%.1f s", milliseconds / 1000.0);
    }

    private static String rate(long bitsPerSecond) {
        return bitsPerSecond >= 1_000_000
                ? String.format(Locale.ROOT, "%.2f Mbps", bitsPerSecond / 1_000_000.0)
                : String.format(Locale.ROOT, "%d kbps", Math.round(bitsPerSecond / 1000.0));
    }

    private static void show(View frame, String[] lines) {
        Panel panel = FRAMES.get(frame);
        if (panel == null) {
            panel = new Panel(frame);
            FRAMES.put(frame, panel);
            frame.getOverlay().add(panel);
            Logger.d("video stats: shown on a player");
        }
        panel.show(lines, frame.getWidth(), frame.getHeight());
    }

    private static void remove(View frame) {
        Panel panel = FRAMES.get(frame);
        if (panel == null) return;
        FRAMES.put(frame, null);
        frame.getOverlay().remove(panel);
        Logger.d("video stats: removed from a player");
    }

    /** The lines on [frame]'s panel, or null without one. For the probes. */
    static String[] shown(View frame) {
        Panel panel = FRAMES.get(frame);
        return panel == null ? null : panel.lines.clone();
    }

    // ---------------------------------------------------------------------------------------------
    // Bridges, filled in by the patch with Media3's renamed classes and methods.

    /** The player of an analytics collector. */
    private static Object collectorPlayer(Object collector) {
        return null;
    }

    /** The player of a player view, or null for another view or a view without a player. */
    private static Object viewPlayer(Object playerView) {
        return null;
    }

    /** Format.toLogString(format). */
    private static String formatLog(Object format) {
        return null;
    }

    /** Player.getTotalBufferedDuration() in milliseconds, as a Long. */
    private static Object bufferedMs(Object player) {
        return null;
    }

    /** Player.getCurrentLiveOffset() in milliseconds, as a Long; C.TIME_UNSET without one. */
    private static Object liveOffsetMs(Object player) {
        return null;
    }

    /** White monospace lines on a translucent black box in the frame's top left corner. */
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
