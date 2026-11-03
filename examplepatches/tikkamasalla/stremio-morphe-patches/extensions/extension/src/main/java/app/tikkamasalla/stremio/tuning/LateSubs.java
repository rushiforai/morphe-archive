package app.tikkamasalla.stremio.tuning;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;

import androidx.media3.common.Format;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;
import androidx.media3.common.text.Cue;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

import app.tikkamasalla.stremio.diag.PlaybackDiary;

/**
 * Shows an addon subtitle that answered after the first frame without touching the player: stock's way
 * replaces the media item, which flushes the codecs and freezes the picture for seconds. The file is
 * fetched and parsed by Media3's own parser on a background thread and its cues go into stock's
 * SubtitleView in step with the player's clock and subtitle delay, so style and size are stock's. Ends
 * when the item is replaced, the viewer decides otherwise, or the player or view goes away.
 */
final class LateSubs {
    private static final String TAG = "SubtitleGate";
    private static final long MAX_LOOK_MS = 250L;
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final int CONNECT_MS = 8000;
    private static final int READ_MS = 15000;
    private static final int MAX_TRIES = 3;
    /** As stock's PlayerEventListener.onCues, which the cues would have passed through. */
    private static final Pattern LINE_START = Pattern.compile("(^)", Pattern.MULTILINE);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** The one drawing; changed on the main thread only. */
    private static volatile LateSubs active;

    private final Player player;
    private final View view;
    private final Method setCues;
    private final String media;
    private final String wanted;
    private long[] times = new long[0];
    private List<List<Cue>> events = new ArrayList<List<Cue>>();
    /** The event on screen: -1 before the first one, -2 nothing put yet. */
    private int shown = -2;
    private volatile boolean stopped;
    private final Runnable tick = new Runnable() {
        @Override
        public void run() {
            look();
        }
    };

    private LateSubs(Player player, View view, Method setCues, String media, String wanted) {
        this.player = player;
        this.view = view;
        this.setCues = setCues;
        this.media = media;
        this.wanted = wanted;
    }

    /** Main thread. Starts drawing the first of these subtitles that loads; already drawing the first of them: stays. */
    static void draw(Player player, Object view, MediaItem item, List<SubtitleGateCore.Sub> order) throws Exception {
        if (order.isEmpty() || !(view instanceof View)) throw new IllegalStateException("nothing to draw on");
        LateSubs now = active;
        if (now != null && now.player == player && now.wanted.equals(order.get(0).id)) return;
        final List<String[]> tries = new ArrayList<String[]>();
        for (SubtitleGateCore.Sub s : order) {
            for (MediaItem.SubtitleConfiguration c : item.localConfiguration.subtitleConfigurations) {
                if (s.id.equals(c.id) && tries.size() < MAX_TRIES) {
                    tries.add(new String[]{String.valueOf(c.uri), c.mimeType});
                }
            }
        }
        Method set = view.getClass().getMethod("setCues", List.class);
        if (now != null) now.end("other");
        final LateSubs run = new LateSubs(player, (View) view, set, key(item), order.get(0).id);
        active = run;
        Thread loader = new Thread(new Runnable() {
            @Override
            public void run() {
                run.load(tries);
            }
        }, "LateSubs");
        loader.setPriority(Thread.MIN_PRIORITY);
        loader.start();
    }

    static boolean drawing(Object player) {
        LateSubs run = active;
        return run != null && run.player == player;
    }

    /** Main thread. Ends the drawing on this player; safe when none runs. */
    static void stop(Object player, String why) {
        LateSubs run = active;
        if (run != null && run.player == player) run.end(why);
    }

    private void end(String why) {
        if (stopped) return;
        stopped = true;
        MAIN.removeCallbacks(tick);
        if (active == this) active = null;
        LateSubsCues.drawing = null;
        if (shown >= 0) put(Collections.<Cue>emptyList());
        Log.i(TAG, "sub.late.off why=" + why);
        PlaybackDiary.ev("sub.late.off", "why", why);
    }

    private void load(List<String[]> tries) {
        long t0 = System.currentTimeMillis();
        for (int i = 0; i < tries.size() && !stopped; i++) {
            try {
                Object subtitle = parse(fetch(tries.get(i)[0]), tries.get(i)[1]);
                final long[] t = eventTimes(subtitle);
                final List<List<Cue>> e = eventCues(subtitle, t);
                if (t.length == 0) throw new IllegalStateException("no cues");
                final long ms = System.currentTimeMillis() - t0;
                final int tried = i;
                MAIN.post(new Runnable() {
                    @Override
                    public void run() {
                        if (stopped) return;
                        events = e;
                        times = t;
                        Log.i(TAG, "sub.late.on ms=" + ms + " events=" + t.length + " try=" + tried);
                        PlaybackDiary.ev("sub.late.on", "ms", ms, "events", t.length, "try", tried);
                        look();
                    }
                });
                return;
            } catch (Throwable t) {
                Log.w(TAG, "late subtitle " + i + " failed: " + t.getClass().getSimpleName());
            }
        }
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                end("failed"); // the item stays held: the dialog still offers it
            }
        });
    }

    private static byte[] fetch(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        try {
            c.setConnectTimeout(CONNECT_MS);
            c.setReadTimeout(READ_MS);
            int code = c.getResponseCode();
            if (code / 100 != 2) throw new IllegalStateException("http " + code);
            InputStream in = c.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream(128 * 1024);
            byte[] buf = new byte[32 * 1024];
            for (int n; (n = in.read(buf)) > 0; ) {
                out.write(buf, 0, n);
                if (out.size() > MAX_BYTES) throw new IllegalStateException("too large");
            }
            return out.toByteArray();
        } finally {
            c.disconnect();
        }
    }

    /** The parser the text renderer itself uses; extractor classes are not on the compile path, so by name. */
    private static Object parse(byte[] data, String mime) throws Exception {
        Object factory = Class.forName("androidx.media3.extractor.text.DefaultSubtitleParserFactory").newInstance();
        Object parser = factory.getClass().getMethod("create", Format.class)
                .invoke(factory, new Format.Builder().setSampleMimeType(mime).build());
        return parser.getClass().getMethod("parseToLegacySubtitle", byte[].class, int.class, int.class)
                .invoke(parser, data, 0, data.length);
    }

    private static long[] eventTimes(Object subtitle) throws Exception {
        int n = (Integer) subtitle.getClass().getMethod("getEventTimeCount").invoke(subtitle);
        Method at = subtitle.getClass().getMethod("getEventTime", int.class);
        long[] out = new long[n];
        for (int i = 0; i < n; i++) out[i] = (Long) at.invoke(subtitle, i);
        return out;
    }

    @SuppressWarnings("unchecked")
    private static List<List<Cue>> eventCues(Object subtitle, long[] times) throws Exception {
        Method get = subtitle.getClass().getMethod("getCues", long.class);
        List<List<Cue>> out = new ArrayList<List<Cue>>(times.length);
        for (long t : times) {
            List<Cue> cues = (List<Cue>) get.invoke(subtitle, t);
            List<Cue> tweaked = new ArrayList<Cue>(cues.size());
            for (Cue cue : cues) {
                Cue.Builder b = cue.buildUpon();
                if (cue.text != null) b.setText(LINE_START.matcher(cue.text).replaceAll("‎$1"));
                if (cue.line == -1.0f) b.setLine(Cue.DIMEN_UNSET, Cue.TYPE_UNSET);
                tweaked.add(b.build());
            }
            out.add(tweaked);
        }
        return out;
    }

    private void look() {
        if (stopped) return;
        try {
            if (player.getPlaybackState() == Player.STATE_IDLE) {
                end("idle");
                return;
            }
            if (!view.isAttachedToWindow()) {
                end("detached");
                return;
            }
            if (!media.equals(key(player.getCurrentMediaItem()))) {
                end("media");
                return;
            }
            long timeUs = (player.getCurrentPosition() - delayMs()) * 1000L;
            int event = SubtitleGateCore.eventAt(times, timeUs);
            if (event != shown) {
                shown = event;
                put(event < 0 ? Collections.<Cue>emptyList() : events.get(event));
            }
            float speed = player.getPlaybackParameters().speed;
            MAIN.postDelayed(tick, SubtitleGateCore.nextLookMs(times, event, timeUs, MAX_LOOK_MS, speed));
        } catch (Throwable t) {
            Log.w(TAG, "late subtitle stopped: " + t.getClass().getSimpleName());
            end("error");
        }
    }

    /** Stock keeps the delay in its text renderer, behind the wrapper's getter. */
    private long delayMs() {
        try {
            return (Long) player.getClass().getMethod("getSubtitlesDelayMs").invoke(player);
        } catch (Throwable t) {
            return 0L;
        }
    }

    private void put(List<Cue> cues) {
        if (!stopped) LateSubsCues.drawing = cues;
        try {
            setCues.invoke(view, cues);
        } catch (Throwable t) {
            Log.w(TAG, "late subtitle draw failed: " + t.getClass().getSimpleName());
        }
    }

    private static String key(MediaItem item) {
        return item == null || item.localConfiguration == null ? "" : String.valueOf(item.localConfiguration.uri);
    }
}
