package com.waze.gw;

import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Temporarily overrides Waze's own night-mode flow while the matched segment is a tunnel. */
final class TunnelThemeController {
    private static final String TAG = "WazeGW-Tunnel";
    private static final long EXIT_CONFIRM_MS = 1_000L;
    private static final long UNKNOWN_RELEASE_MS = 5_000L;

    private static boolean applied;
    private static long firstOutsideAt;
    private static long lastKnownAt;
    private static Object overrideFlow;
    private static Object nightValue;
    private static Method emitMethod;

    private TunnelThemeController() {}

    static synchronized void onSample(int state) {
        long now = SystemClock.elapsedRealtime();
        if (state == 1) {
            lastKnownAt = now;
            firstOutsideAt = 0L;
            if (!applied && emit(true)) {
                applied = true;
                Log.i(TAG, "entered tunnel; temporary night theme enabled");
            }
            return;
        }

        if (state == 0) {
            lastKnownAt = now;
            if (!applied) return;
            if (firstOutsideAt == 0L) {
                firstOutsideAt = now;
                return;
            }
            if (now - firstOutsideAt >= EXIT_CONFIRM_MS) release("left tunnel");
            return;
        }

        // A tile can be replaced between callbacks. Keep the override briefly instead of flashing
        // the day skin at the tunnel portal, but never leave night mode stuck indefinitely.
        firstOutsideAt = 0L;
        if (applied && lastKnownAt > 0L && now - lastKnownAt >= UNKNOWN_RELEASE_MS) {
            release("tunnel state unavailable");
        }
    }

    static synchronized void reset() {
        if (applied) release("mod inactive");
        firstOutsideAt = 0L;
        lastKnownAt = 0L;
    }

    private static void release(String reason) {
        if (emit(false)) {
            applied = false;
            firstOutsideAt = 0L;
            Log.i(TAG, reason + "; restored Waze theme selection");
        }
    }

    private static boolean emit(boolean night) {
        try {
            if (overrideFlow == null || emitMethod == null || nightValue == null) {
                // {controller, mode enum, MutableStateFlow}: 5.27 first, then 5.24.
                String[][] generations = {
                        {"com.waze.nightmode.x", "com.waze.nightmode.q", "kotlinx.coroutines.b.bk"},
                        {"com.waze.nightmode.u", "com.waze.nightmode.o", "kotlinx.coroutines.b.bj"}};
                Throwable last = null;
                for (String[] names : generations) {
                    try {
                        Class<?> controller = Class.forName(names[0]);
                        Field flowField = controller.getDeclaredField("d");
                        flowField.setAccessible(true);
                        Object flow = flowField.get(null);

                        Class<?> mode = Class.forName(names[1]);
                        Field nightField = mode.getDeclaredField("a");
                        nightField.setAccessible(true);
                        Object night0 = nightField.get(null);

                        Method emitter = Class.forName(names[2]).getMethod("e", Object.class);
                        overrideFlow = flow;
                        nightValue = night0;
                        emitMethod = emitter;
                        break;
                    } catch (Throwable error) {
                        last = error;
                    }
                }
                if (emitMethod == null) throw new IllegalStateException("night-mode API not found", last);
            }
            emitMethod.invoke(overrideFlow, night ? nightValue : null);
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "unable to update Waze night-mode override", error);
            overrideFlow = null;
            nightValue = null;
            emitMethod = null;
            return false;
        }
    }
}
