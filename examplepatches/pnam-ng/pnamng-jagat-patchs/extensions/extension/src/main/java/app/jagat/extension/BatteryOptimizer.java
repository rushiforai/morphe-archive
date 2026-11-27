package app.jagat.extension;

import android.content.Context;
import android.os.PowerManager;

public class BatteryOptimizer {
    private static final String TAG = "JagatMorphe_Battery";

    public static boolean shouldSkipBackgroundLocation(Context context) {
        if (context == null) return false;
        try {
            PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
            if (pm != null && !pm.isInteractive()) {
                // Màn hình đang tắt: bỏ qua polling tần suất cao để tiết kiệm pin
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }
}
