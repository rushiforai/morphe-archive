package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;

@SuppressWarnings("unused")
public class ChangeFlags {

    private static final String PREFS_NAME = "change_flags";

    private static final String FORCE_CALL_RECORDING =
            "force_call_recording";

    public static boolean isCallRecordingForced(Context context) {
        return getPreferences(context).getBoolean(
                FORCE_CALL_RECORDING,
                false
        );
    }

    public static void setCallRecordingForced(
            Context context,
            boolean enabled
    ) {
        getPreferences(context)
                .edit()
                .putBoolean(FORCE_CALL_RECORDING, enabled)
                .apply();
    }

    public static void resetCallRecording(Context context) {
        getPreferences(context)
                .edit()
                .remove(FORCE_CALL_RECORDING)
                .apply();
    }

    private static SharedPreferences getPreferences(Context context) {
        return context.getSharedPreferences(
                PREFS_NAME,
                Context.MODE_PRIVATE
        );
    }
}
