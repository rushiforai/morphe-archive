package semicoloncolonel.mobilestream.extension.xumo;

import android.graphics.Color;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import semicoloncolonel.mobilestream.extension.shared.misc.AdBreakText;

/**
 * Covers and mutes the ad breaks on Xumo Play's live channels.
 *
 * Live channels are HLS streams with server-side ad insertion (AWS
 * MediaTailor), so the ads are part of the stream and cannot be removed. In
 * the media playlist, the show's segments come from the channel's origin and
 * every ad segment has a "/segment/" path. Each media playlist ExoPlayer
 * parses is read here first, and the segments' start times and lengths are
 * recorded the way ExoPlayer counts them (the running total of #EXTINF). On a
 * half-second tick, the player's position in the live window is compared
 * with those segments. While an ad segment plays, a cover goes over the
 * video and the player's volume is set to zero, and both are restored when
 * the show returns. The cover shows no countdown, because the live playlist
 * reaches only the live edge and the end of a break is not known in advance.
 *
 * The mask follows the most recently started or resumed player that is on
 * screen and playing. The browse tab plays channels in a dialog over the
 * Live tab's player, and both stay on screen, so a player whose position is
 * not moving is passed over. Every new playback clears the previous segments, so a
 * movie or another channel is never compared with an old live window. When
 * the cover lifts, the player's own mute setting is restored.
 */
@SuppressWarnings("unused")
public final class XumoLiveMask {
    private static final String TAG = "MSP-XUMO-ADS";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final String AD_PATH = "/segment/";

    /** One segment of the current media playlist, in milliseconds from its start. */
    private static final class Segment {
        final long startMs;
        final long durationMs;
        final boolean ad;

        Segment(long startMs, long durationMs, boolean ad) {
            this.startMs = startMs;
            this.durationMs = durationMs;
            this.ad = ad;
        }
    }

    private static final List<Segment> NONE = new ArrayList<>();
    private static volatile List<Segment> segments = NONE;
    private static volatile long playlistReadMs;
    private static long lastDiagnosticMs;

    /** Player views, most recently started or resumed last. Main thread only. */
    private static final List<WeakReference<View>> views = new ArrayList<>();
    private static boolean ticking;
    private static int clearTicks;

    // A position that stops moving means the player is paused or has failed.
    private static long lastPositionMs = -1;
    private static int stillTicks;

    private static FrameLayout cover;
    private static TextView label;
    private static View coveredView;
    private static Object mutedPlayer;

    private static Method getPlayer;
    private static Method position;
    private static Method setVolume;
    private static Method getVolume;

    private XumoLiveMask() {
    }

    /** Overwritten by the patch: the player's getCurrentPosition() method name. */
    public static String positionMethod() {
        return null;
    }

    /** Overwritten by the patch: the player's setVolume(float) method name. */
    public static String volumeMethod() {
        return null;
    }

    /**
     * Injection point: the start of ExoPlayer's HLS playlist parser. Reads the
     * playlist, records a live media playlist's segments, and hands the same
     * bytes back to the parser.
     */
    public static InputStream playlist(Uri uri, InputStream in) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[8192];
        int read;
        while ((read = in.read(chunk)) != -1) {
            buffer.write(chunk, 0, read);
        }
        byte[] bytes = buffer.toByteArray();
        try {
            record(new String(bytes, StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Log.e(TAG, "playlist read failure", t);
        }
        return new ByteArrayInputStream(bytes);
    }

    private static void record(String text) {
        // The multivariant playlist and the captions playlist say nothing
        // about the video's timeline. A finished (on-demand) playlist means
        // the live window is gone.
        if (text.contains("#EXT-X-STREAM-INF") || text.contains(".vtt")) return;
        if (!text.contains("#EXTINF") || text.contains("#EXT-X-ENDLIST")) {
            segments = NONE;
            return;
        }
        List<Segment> parsed = new ArrayList<>();
        long startMs = 0;
        long durationMs = -1;
        for (String raw : text.split("\n")) {
            String line = raw.trim();
            if (line.startsWith("#EXTINF:")) {
                int comma = line.indexOf(',');
                String value = line.substring(8, comma < 0 ? line.length() : comma);
                durationMs = Math.round(Double.parseDouble(value) * 1000);
            } else if (!line.isEmpty() && !line.startsWith("#") && durationMs >= 0) {
                parsed.add(new Segment(startMs, durationMs, line.contains(AD_PATH)));
                startMs += durationMs;
                durationMs = -1;
            }
        }
        segments = parsed;
        playlistReadMs = SystemClock.elapsedRealtime();
    }

    /** Injection point: the start of XumoPlayerView.play. A new playback. */
    public static void play(View view) {
        segments = NONE;
        if (view == coveredView) hide();
        track(view);
    }

    /** Injection point: the start of XumoPlayerView.resume. */
    public static void resume(View view) {
        track(view);
    }

    /** Injection point: the start of XumoPlayerView.release. */
    public static void release(View view) {
        if (view == coveredView) hide();
        untrack(view);
    }

    private static void track(View view) {
        untrack(view);
        views.add(new WeakReference<>(view));
        if (ticking) return;
        ticking = true;
        MAIN.post(TICK);
    }

    private static void untrack(View view) {
        Iterator<WeakReference<View>> it = views.iterator();
        while (it.hasNext()) {
            View known = it.next().get();
            if (known == null || known == view) it.remove();
        }
    }

    /** Each tracked player's position at the last tick. Main thread only. */
    private static final java.util.WeakHashMap<View, Long> positions = new java.util.WeakHashMap<>();

    /**
     * The most recently started or resumed player that is on screen and whose
     * position moved since the last tick, or else the most recent one on
     * screen.
     */
    private static View activeView() {
        View fallback = null;
        for (int i = views.size() - 1; i >= 0; i--) {
            View view = views.get(i).get();
            if (view == null) {
                views.remove(i);
                continue;
            }
            if (!view.isAttachedToWindow() || !view.isShown()) continue;
            if (fallback == null) fallback = view;
            long position;
            try {
                Object player = player(view);
                position = player == null ? -1 : currentPosition(player);
            } catch (Throwable t) {
                position = -1;
            }
            Long previous = positions.put(view, position);
            if (position >= 0 && previous != null && previous != position) return view;
        }
        return fallback;
    }

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            try {
                check();
            } catch (Throwable t) {
                Log.e(TAG, "tick failure", t);
            }
            // Stop when no player is left; play or resume starts it again.
            if (views.isEmpty() && cover == null && mutedPlayer == null) {
                ticking = false;
                return;
            }
            MAIN.postDelayed(this, 500);
        }
    };

    private static void check() throws Exception {
        View view = activeView();
        Object player = view == null || adDisplayed(view) ? null : player(view);
        long positionMs = player == null ? -1 : currentPosition(player);
        if (positionMs >= 0 && positionMs == lastPositionMs) stillTicks++;
        else stillTicks = 0;
        lastPositionMs = positionMs;
        // A position that stops moving (buffering, paused, or failed) leaves
        // the cover as it is: the error screen and controls draw above it.
        if (positionMs >= 0 && stillTicks >= 6) return;
        boolean playing = positionMs >= 0;
        long remainingMs = playing ? adRemaining(positionMs) : -1;
        if (remainingMs >= 0) {
            clearTicks = 0;
            show((ViewGroup) view, player, remainingMs);
        } else if (cover != null || mutedPlayer != null) {
            // Two clear ticks in a row before lifting the cover, so a playlist
            // refresh landing between ticks cannot flash the ad.
            if (++clearTicks >= 2 || !playing) hide();
        }
    }

    /** Milliseconds left in the ad break at this position, or -1 when the show is playing. */
    private static long adRemaining(long positionMs) {
        if (positionMs < 0) return -1;
        List<Segment> list = segments;
        for (int i = 0; i < list.size(); i++) {
            Segment segment = list.get(i);
            if (positionMs < segment.startMs || positionMs >= segment.startMs + segment.durationMs) continue;
            if (!segment.ad) return -1;
            long remaining = segment.startMs + segment.durationMs - positionMs;
            for (int j = i + 1; j < list.size() && list.get(j).ad; j++) {
                remaining += list.get(j).durationMs;
            }
            return remaining;
        }
        return -1;
    }

    /** True while one of Xumo's own client-side (IMA) ads plays in this player. */
    private static boolean adDisplayed(View view) {
        try {
            Field field = view.getClass().getDeclaredField("isAdDisplayed");
            field.setAccessible(true);
            return field.getBoolean(view);
        } catch (Throwable t) {
            return false;
        }
    }

    private static Object player(View view) throws Exception {
        if (getPlayer == null) getPlayer = view.getClass().getMethod("getPlayer");
        return getPlayer.invoke(view);
    }

    private static long currentPosition(Object player) throws Exception {
        if (position == null) {
            String name = positionMethod();
            if (name == null) return -1;
            position = player.getClass().getMethod(name);
        }
        return (Long) position.invoke(player);
    }

    private static void show(ViewGroup view, Object player, long remainingMs) {
        try {
            if (coveredView != view) hide();
            if (cover == null) {
                // Over the video and under the player controls and the error
                // screen, which stay usable during a break.
                ViewGroup host = overlay(view);
                cover = buildCover(view);
                host.addView(cover, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                coveredView = view;
                Log.i(TAG, "Live break covered");
            }
            // No countdown: the live playlist reaches only the live edge, so
            // the end of a break is not known in advance.
            long now = SystemClock.elapsedRealtime();
            if (now - lastDiagnosticMs >= 10_000) {
                lastDiagnosticMs = now;
                Log.i(TAG, "Covered: " + remainingMs + " ms of ads in the playlist ahead, "
                        + segments.size() + " segments, playlist read " + (now - playlistReadMs) + " ms ago");
            }
            // Muted again on every tick, because Xumo restores its own volume
            // when the screen resumes.
            if (getVolume == null) getVolume = player.getClass().getMethod("getVolume");
            if ((Float) getVolume.invoke(player) != 0f) volume(player, 0f);
            mutedPlayer = player;
        } catch (Exception ex) {
            Log.e(TAG, "show failure", ex);
        }
    }

    private static void hide() {
        try {
            if (cover != null) {
                ViewGroup parent = (ViewGroup) cover.getParent();
                if (parent != null) parent.removeView(cover);
                cover = null;
                label = null;
                Log.i(TAG, "Live break ended");
            }
            if (mutedPlayer != null && coveredView != null) {
                // Xumo's own mute setting decides the volume, and its mute
                // button is redrawn to match.
                coveredView.getClass().getMethod("updatePersistedButtons").invoke(coveredView);
            }
        } catch (Throwable t) {
            Log.e(TAG, "hide failure", t);
        } finally {
            mutedPlayer = null;
            coveredView = null;
            clearTicks = 0;
        }
    }

    private static ViewGroup overlay(ViewGroup view) {
        try {
            Object overlay = view.getClass().getMethod("getOverlayFrameLayout").invoke(view);
            if (overlay instanceof ViewGroup) return (ViewGroup) overlay;
        } catch (Throwable ignored) {
        }
        return view;
    }

    private static void volume(Object player, float value) throws Exception {
        if (setVolume == null) {
            String name = volumeMethod();
            if (name == null) return;
            setVolume = player.getClass().getMethod(name, float.class);
        }
        setVolume.invoke(player, value);
    }

    private static FrameLayout buildCover(ViewGroup view) {
        FrameLayout layout = new FrameLayout(view.getContext());
        layout.setBackgroundColor(Color.BLACK);
        // Not clickable: taps reach the player controls underneath, so the
        // channel can still be changed during a break.
        layout.setClickable(false);

        label = new TextView(view.getContext());
        label.setText(AdBreakText.untimed());
        label.setTextColor(Color.LTGRAY);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        label.setGravity(Gravity.CENTER);
        int padding = (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 24, view.getResources().getDisplayMetrics());
        label.setPadding(padding, padding, padding, padding);
        layout.addView(label, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return layout;
    }
}
