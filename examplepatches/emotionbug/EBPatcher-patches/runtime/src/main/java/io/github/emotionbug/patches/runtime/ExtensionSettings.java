package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

/** Main-process preference ownership; the recorder child reads through the private provider. */
final class ExtensionSettings {
    static final String AUTO_PERMISSION = "automatic_shizuku_permission";
    static final String FAILURE_TOASTS = "recording_failure_toasts";
    static final String SEPARATE_CHANNELS = "separate_call_channels";
    static final String READ = "read";
    private static final String PREFERENCES = "ebpatcher_settings";

    private ExtensionSettings() { }

    static SharedPreferences local(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    static boolean automaticPermission(Context context) {
        try {
            return local(context).getBoolean(AUTO_PERMISSION, true);
        } catch (RuntimeException unavailable) {
            // An unreadable preference must not cause an unexpected authorization prompt.
            return false;
        }
    }

    static boolean separateChannels(Context context) {
        try {
            Bundle values = context.getContentResolver().call(
                    Uri.parse("content://" + context.getPackageName() + ".ebpatcher.settings"), READ, null, null);
            return values != null && values.getBoolean(SEPARATE_CHANNELS, false);
        } catch (RuntimeException unavailable) {
            Log.w("EmbeddedRecorder", "Unable to read channel preference; retaining mono capture", unavailable);
            return false;
        }
    }

    static boolean failureToasts(Context context) {
        try {
            Bundle values = context.getContentResolver().call(
                    Uri.parse("content://" + context.getPackageName() + ".ebpatcher.settings"), READ, null, null);
            return values == null || values.getBoolean(FAILURE_TOASTS, true);
        } catch (RuntimeException unavailable) {
            Log.w("EmbeddedRecorder", "Unable to read error display preference", unavailable);
            return true;
        }
    }
}
