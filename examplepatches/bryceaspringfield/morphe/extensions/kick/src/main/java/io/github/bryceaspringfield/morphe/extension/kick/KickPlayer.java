package io.github.bryceaspringfield.morphe.extension.kick;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Audio only as a quality: the player's list of video tracks, which the quality menu shows, gets one more track,
 * the lowest one with the size {@link #AUDIO_W} x {@link #AUDIO_H}. The menu sets the player's largest size to
 * the size of the track picked, so that size turns the video track type off (ExoPlayer then fetches and decodes
 * only audio), and any other choice turns it back on.
 */
public final class KickPlayer {

    static final int AUDIO_W = 2;
    static final int AUDIO_H = 1;
    static final String AUDIO_ID = "audio_only";
    /** C.TRACK_TYPE_VIDEO. */
    private static final int TRACK_TYPE_VIDEO = 2;

    private static WeakReference<Object> current = new WeakReference<>(null);
    private static boolean audioOnly;
    private static String lastTracks = "";

    private KickPlayer() {
    }

    /** Called before VideoPlayer.getAvailableVideoTracks() returns: the list with the audio-only track added. A new
     * player (the next stream) keeps audio only. */
    public static List<Object> tracks(Object player, List<Object> tracks) {
        try {
            if (player != null && current.get() != player) {
                current = new WeakReference<>(player);
                if (audioOnly) apply(player);
            }
            if (tracks == null || tracks.isEmpty() || !Kick.bool(Kick.AUDIO_ONLY_OPTION, true)) return tracks;
            Object lowest = null;
            int lowestH = Integer.MAX_VALUE;
            StringBuilder seen = new StringBuilder();
            for (Object t : tracks) {
                if (AUDIO_ID.equals(call(t, "getId"))) return tracks;
                Object size = call(t, "getSize");
                int h = size == null ? Integer.MAX_VALUE : (Integer) call(size, "getHeight");
                seen.append(call(t, "getId")).append(' ').append(size == null ? "?" : call(size, "getWidth") + "x" + h).append("; ");
                if (h < lowestH) {
                    lowestH = h;
                    lowest = t;
                }
            }
            if (Kick.debug() && !seen.toString().equals(lastTracks)) {
                lastTracks = seen.toString();
                Kick.log("video tracks: " + lastTracks);
            }
            if (lowest == null) return tracks;
            Class<?> trackClass = lowest.getClass();
            Object size = sizeOf(lowest.getClass().getClassLoader(), AUDIO_W, AUDIO_H);
            Constructor<?> make = null;
            for (Constructor<?> c : trackClass.getConstructors()) if (c.getParameterTypes().length == 11) make = c;
            if (make == null) return tracks;
            Object audio = make.newInstance(AUDIO_ID, call(lowest, "getUrl"), size, call(lowest, "getMimeType"), true,
                    call(lowest, "getBitrate"), call(lowest, "getAverageBitrate"), call(lowest, "getPeakBitrate"),
                    call(lowest, "getFrameRate"), call(lowest, "getVideoRange"), call(lowest, "getFormat"));
            List<Object> out = new ArrayList<>(tracks);
            out.add(audio);
            return out;
        } catch (Throwable t) {
            Kick.error("audio-only track not added", t);
            return tracks;
        }
    }

    /** Called at the start of VideoPlayer.setMaxResolution(VideoSize): the size to apply. */
    public static Object onMaxResolution(Object player, Object size) {
        try {
            current = new WeakReference<>(player);
            boolean audio = size != null && (Integer) call(size, "getWidth") == AUDIO_W && (Integer) call(size, "getHeight") == AUDIO_H;
            Kick.log("max resolution " + (size == null ? "none" : call(size, "getWidth") + "x" + call(size, "getHeight"))
                    + (audio ? ": audio only" : ""));
            audioOnly = audio;
            apply(player);
            return audio ? null : size;
        } catch (Throwable t) {
            Kick.error("max resolution not read", t);
            return size;
        }
    }

    private static void apply(Object player) {
        boolean off = audioOnly;
        Kick.main(() -> {
            try {
                Object exo = call(player, "getPlayer");
                Class<?> playerApi = Class.forName("androidx.media3.common.Player", true, exo.getClass().getClassLoader());
                Object params = playerApi.getMethod("getTrackSelectionParameters").invoke(exo);
                Object builder = call(params, "buildUpon");
                Method disable = builder.getClass().getMethod("setTrackTypeDisabled", int.class, boolean.class);
                disable.invoke(builder, TRACK_TYPE_VIDEO, off);
                Object built = call(builder, "build");
                for (Method m : playerApi.getMethods()) {
                    if (m.getName().equals("setTrackSelectionParameters") && m.getParameterTypes().length == 1) {
                        m.invoke(exo, built);
                        break;
                    }
                }
                Kick.log("video track " + (off ? "off (audio only)" : "on"));
            } catch (Throwable t) {
                Kick.error("audio only not applied", t);
            }
        });
    }

    private static Object sizeOf(ClassLoader loader, int w, int h) throws Exception {
        Class<?> c = Class.forName("com.kick.mobile.playerv3.records.VideoSize", true, loader);
        return c.getConstructor(int.class, int.class).newInstance(w, h);
    }

    private static Object call(Object o, String name) throws Exception {
        Method m = o.getClass().getMethod(name);
        m.setAccessible(true);
        return m.invoke(o);
    }
}
