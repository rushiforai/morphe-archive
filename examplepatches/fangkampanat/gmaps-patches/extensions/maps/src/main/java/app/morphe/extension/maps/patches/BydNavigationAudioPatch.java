package app.morphe.extension.maps.patches;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Build;
import android.util.Log;

import app.morphe.extension.shared.Utils;

/** Routes Maps guidance alerts to BYD's vendor navigation stream when it is available. */
@SuppressWarnings("unused")
public final class BydNavigationAudioPatch {
    private static final String TAG = "MorpheBydAudio";
    private static final int STREAM_NAVI = 14;

    private BydNavigationAudioPatch() {
    }

    public static void setAudioStreamType(MediaPlayer player, int fallbackStream) {
        if (isBydBuild()) {
            try {
                Context context = Utils.getContext();
                AudioManager audioManager =
                        (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
                int maximum = audioManager == null
                        ? 0
                        : audioManager.getStreamMaxVolume(STREAM_NAVI);
                if (maximum > 0) {
                    player.setAudioStreamType(STREAM_NAVI);
                    return;
                }
                Log.w(TAG, "stream=14 probe unavailable; fallback="
                        + fallbackStream);
            } catch (RuntimeException exception) {
                Log.w(TAG, "stream=14 rejected; fallback="
                        + fallbackStream, exception);
            }
        }

        // Keep the original call semantics on non-BYD devices and when the vendor probe fails.
        // Deliberately leave this outside the catch block so its RuntimeException still propagates.
        player.setAudioStreamType(fallbackStream);
    }

    public static void setAudioAttributes(MediaPlayer player, AudioAttributes attributes) {
        if (!isBydBuild()) {
            player.setAudioAttributes(attributes);
            return;
        }

        try {
            Context context = Utils.getContext();
            AudioManager audioManager =
                    (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
            int maximum = audioManager == null
                        ? 0
                        : audioManager.getStreamMaxVolume(STREAM_NAVI);
            if (maximum > 0) {
                AudioAttributes navigationAttributes = new AudioAttributes.Builder()
                        .setLegacyStreamType(STREAM_NAVI)
                        .build();
                player.setAudioAttributes(navigationAttributes);
                return;
            } else {
                Log.w(TAG, "stream=14 attributes probe unavailable");
            }
        } catch (RuntimeException exception) {
            Log.w(TAG, "stream=14 attributes rejected; using original",
                    exception);
        }

        // Preserve the original call semantics when the BYD-only attempt fails. Deliberately
        // leave this outside the catch block so its RuntimeException still propagates.
        player.setAudioAttributes(attributes);
    }

    private static boolean isBydBuild() {
        return startsWithByd(Build.MANUFACTURER) || startsWithByd(Build.BRAND);
    }

    private static boolean startsWithByd(String value) {
        return value != null && value.regionMatches(true, 0, "BYD", 0, 3);
    }
}
