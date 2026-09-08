package app.xperia.extension.sony.camera;

import android.media.MediaFormat;
import android.util.Log;

/**
 * Encoder settings for Live streaming. Injected at the end of RecordingProfile.createMediaFormat, after
 * Sony filled the format from its streaming profile (30 fps RTMP presets), so the format reflects the
 * resolution / frame rate the user picked once the streaming presets patch unlocks them.
 */
@SuppressWarnings("unused")
public final class StreamEncoder {
    private static final String TAG = "StreamEncoder";
    /** Bits per pixel per frame for the automatic bitrate; 1080p30 lands on Sony's "high" 6 Mbit/s. */
    private static final double BITS_PER_PIXEL = 0.1;

    private StreamEncoder() {
    }

    /** Patched by the streaming presets patch from its option; 0 = automatic (resolution × frame rate). */
    public static int bitrateKbpsOption() {
        return 0;
    }

    /** Patched by the streaming presets patch from its option: keyframe interval in seconds. */
    public static int keyframeIntervalOption() {
        return 1;
    }

    /** Injection point (RecordingProfile.createMediaFormat, before return). */
    public static void tune(Object profile, MediaFormat format) {
        try {
            if (!(Boolean) profile.getClass().getMethod("getIsStreaming").invoke(profile)) return;
        } catch (Exception e) {
            Log.w(TAG, "tune: " + e);
            return;
        }
        int width = format.getInteger(MediaFormat.KEY_WIDTH);
        int height = format.getInteger(MediaFormat.KEY_HEIGHT);
        int fps = format.containsKey(MediaFormat.KEY_FRAME_RATE) ? format.getInteger(MediaFormat.KEY_FRAME_RATE) : 30;
        int kbps = bitrateKbpsOption();
        int bitrate = kbps > 0 ? kbps * 1000 : (int) (width * height * (long) fps * BITS_PER_PIXEL);
        format.setInteger(MediaFormat.KEY_BIT_RATE, bitrate);
        format.setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, Math.max(1, keyframeIntervalOption()));
        format.setInteger(MediaFormat.KEY_LATENCY, 0);
        format.setInteger(MediaFormat.KEY_PRIORITY, 0);
        Log.i(TAG, "streaming " + width + "x" + height + "@" + fps + " " + bitrate / 1000 + " kbit/s gop=" + keyframeIntervalOption() + "s");
    }
}
