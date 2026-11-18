package app.wazeytm.extension.waze.settings;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.Log;

/** Shared application context and per-provider preferences for the native audio add-ons. */
public final class MorpheSettings {
    public enum Feature { PATCHED_YOUTUBE_MUSIC, SOUNDCLOUD }
    private MorpheSettings() { }

    public static boolean isEnabled(Feature feature) {
        Context context = getContext();
        return context == null || context.getSharedPreferences("morphe_patch_settings", Context.MODE_PRIVATE)
                .getBoolean(feature == Feature.PATCHED_YOUTUBE_MUSIC ? "patched_youtube_music_support" : "soundcloud_support", true);
    }

    @SuppressLint("PrivateApi")
    public static Context getContext() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Exception exception) {
            Log.e("WazeAudioContext", "Application context unavailable", exception);
            return null;
        }
    }
}
