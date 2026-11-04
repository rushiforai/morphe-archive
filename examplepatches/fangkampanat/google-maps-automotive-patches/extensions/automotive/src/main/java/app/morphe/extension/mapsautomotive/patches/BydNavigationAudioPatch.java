package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Build;

import app.morphe.extension.shared.Utils;

/**
 * BYD navigation volume: Maps' spoken directions and alert sounds on BYD's navigation stream.
 * <p>
 * Ported from the phone patch (BydNavigationAudioPatch). Maps' MediaAlert player asks for the music
 * stream (setAudioStreamType(3)), so on DiLink the voice followed the media volume. DiLink has a vendor
 * navigation stream, 14, with a volume of its own. On a BYD build whose stream 14 has a volume range,
 * the player gets that stream. Elsewhere, with the feature switch off, or when the player rejects it,
 * Maps' own call runs, with its own exceptions.
 */
@SuppressWarnings("unused")
public final class BydNavigationAudioPatch {
    private static final String TAG = "MorpheBydAudio";
    private static final int STREAM_NAVI = 14;
    private static volatile boolean logged;

    private BydNavigationAudioPatch() {
    }

    /** Injection point: replaces MediaAlert's MediaPlayer.setAudioStreamType (file and resource sounds). */
    public static void setAudioStreamType(MediaPlayer player, int stream) {
        if (navigationStream("stream " + stream)) {
            try {
                player.setAudioStreamType(STREAM_NAVI);
                return;
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "stream 14 rejected; using stream " + stream, error);
            }
        }
        // Outside the try block, so Maps still sees its own call's exceptions.
        player.setAudioStreamType(stream);
    }

    /** Injection point: replaces MediaAlert's MediaPlayer.setAudioAttributes. */
    public static void setAudioAttributes(MediaPlayer player, AudioAttributes attributes) {
        if (navigationStream("Maps' attributes")) {
            try {
                player.setAudioAttributes(new AudioAttributes.Builder().setLegacyStreamType(STREAM_NAVI).build());
                return;
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "stream 14 attributes rejected; using Maps' attributes", error);
            }
        }
        player.setAudioAttributes(attributes);
    }

    /** Whether the player gets stream 14. Logs the first answer of the process. */
    private static boolean navigationStream(String fallback) {
        if (!isBydBuild() || !SafeMode.on(SafeMode.BYD_NAVIGATION_VOLUME)) return false;
        int maximum;
        try {
            AudioManager audio = (AudioManager) Utils.getContext().getSystemService(Context.AUDIO_SERVICE);
            maximum = audio == null ? 0 : audio.getStreamMaxVolume(STREAM_NAVI);
        } catch (RuntimeException error) {
            logOnce("stream 14 unavailable (" + error + "); using " + fallback);
            return false;
        }
        if (maximum <= 0) {
            logOnce("stream 14 has no volume range; using " + fallback);
            return false;
        }
        logOnce("guidance on BYD navigation stream 14 (max volume " + maximum + ")");
        return true;
    }

    private static void logOnce(String message) {
        if (logged) return;
        logged = true;
        ReportLog.i(TAG, message);
    }

    private static boolean isBydBuild() {
        return startsWithByd(Build.MANUFACTURER) || startsWithByd(Build.BRAND);
    }

    private static boolean startsWithByd(String value) {
        return value != null && value.regionMatches(true, 0, "BYD", 0, 3);
    }
}
