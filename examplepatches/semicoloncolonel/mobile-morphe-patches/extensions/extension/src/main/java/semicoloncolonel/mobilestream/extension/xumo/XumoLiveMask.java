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
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
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

    private static volatile List<Segment> segments = new ArrayList<>();
    private static volatile long playlistReadMs;
    private static long lastDiagnosticMs;

    private static WeakReference<View> playerView = new WeakReference<>(null);
    private static boolean ticking;
    private static int clearTicks;

    private static FrameLayout cover;
    private static TextView label;

    private static Object mutedPlayer;
    private static float savedVolume = 1f;

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
        } catch (Exception ex) {
            Log.e(TAG, "playlist read failure", ex);
        }
        return new ByteArrayInputStream(bytes);
    }

    private static void record(String text) {
        // Media playlists only: not the multivariant playlist, not a finished
        // (on-demand) playlist, and not the captions playlist.
        if (!text.contains("#EXTINF") || text.contains("#EXT-X-STREAM-INF")
                || text.contains("#EXT-X-ENDLIST") || text.contains(".vtt")) {
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

    /** Injection point: the end of each XumoPlayerView constructor. */
    public static void attach(View view) {
        playerView = new WeakReference<>(view);
        if (ticking) return;
        ticking = true;
        MAIN.post(TICK);
    }

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            try {
                check();
            } catch (Exception ex) {
                Log.e(TAG, "tick failure", ex);
            }
            MAIN.postDelayed(this, 500);
        }
    };

    private static void check() throws Exception {
        View view = playerView.get();
        Object player = view != null && view.isAttachedToWindow() ? player(view) : null;
        long remainingMs = player == null ? -1 : adRemaining(currentPosition(player));
        if (remainingMs >= 0) {
            clearTicks = 0;
            show((ViewGroup) view, player, remainingMs);
        } else if (cover != null || mutedPlayer != null) {
            // Two clear ticks in a row before lifting the cover, so a playlist
            // refresh landing between ticks cannot flash the ad.
            if (++clearTicks >= 2 || player == null) hide();
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
            if (cover == null || cover.getParent() != view) {
                if (cover != null && cover.getParent() != null) {
                    ((ViewGroup) cover.getParent()).removeView(cover);
                }
                cover = buildCover(view);
                view.addView(cover, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                Log.i(TAG, "Live break covered");
            }
            cover.bringToFront();
            // No countdown: the live playlist reaches only the live edge, so
            // the end of a break is not known in advance.
            long now = SystemClock.elapsedRealtime();
            if (now - lastDiagnosticMs >= 10_000) {
                lastDiagnosticMs = now;
                Log.i(TAG, "Covered: " + remainingMs + " ms of ads in the playlist ahead, "
                        + segments.size() + " segments, playlist read " + (now - playlistReadMs) + " ms ago");
            }
            if (mutedPlayer != player) mute(player);
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
            if (mutedPlayer != null) {
                volume(mutedPlayer, savedVolume);
                mutedPlayer = null;
            }
            clearTicks = 0;
        } catch (Exception ex) {
            Log.e(TAG, "hide failure", ex);
        }
    }

    private static void mute(Object player) throws Exception {
        if (mutedPlayer != null) volume(mutedPlayer, savedVolume);
        if (getVolume == null) getVolume = player.getClass().getMethod("getVolume");
        savedVolume = (Float) getVolume.invoke(player);
        if (savedVolume <= 0f) savedVolume = 1f;
        volume(player, 0f);
        mutedPlayer = player;
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
