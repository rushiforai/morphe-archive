package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.os.Trace;

/** Android 10 members of Trace (patch "Android 9 (API 28)"): Android 9 apps cannot trace these, so off and nothing. */
public final class Trace28 {
    public static final String OWNER = "Landroid/os/Trace;";

    private Trace28() {
    }

    public static boolean isEnabled() {
        return Build.VERSION.SDK_INT >= 29 && Trace.isEnabled();
    }

    public static void beginAsyncSection(String methodName, int cookie) {
        if (Build.VERSION.SDK_INT >= 29) Trace.beginAsyncSection(methodName, cookie);
    }

    public static void endAsyncSection(String methodName, int cookie) {
        if (Build.VERSION.SDK_INT >= 29) Trace.endAsyncSection(methodName, cookie);
    }

    public static void setCounter(String counterName, long counterValue) {
        if (Build.VERSION.SDK_INT >= 29) Trace.setCounter(counterName, counterValue);
    }
}
