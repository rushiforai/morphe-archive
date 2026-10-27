package dev.twitchpatches.extension.ui;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

public final class UiClassicHeaderRuntime {
    private static final Map<Object, Object> headers = new WeakHashMap<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static boolean registered;
    private static boolean queued;
    private static int preferences;

    public static void capture(Object owner, Object state) {
        headers.put(owner, state);
        if (registered) return;
        registered = true;
        preferences = preferenceState();
        UiSettings.observe(UiClassicHeaderRuntime::schedule);
    }

    private static void schedule() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            main.post(UiClassicHeaderRuntime::schedule);
            return;
        }
        if (queued) return;
        queued = true;
        main.post(() -> {
            queued = false;
            int current = preferenceState();
            if (current == preferences) return;
            preferences = current;
            for (Map.Entry<Object, Object> entry : new ArrayList<>(headers.entrySet())) {
                Object owner = entry.getKey();
                if (owner != null) UiComposeBridge.renderClassicHeader(owner, entry.getValue());
            }
        });
    }

    private static int preferenceState() {
        return (UiSettings.enabled("classic_support_hide_subscribe") ? 1 : 0)
                | (UiSettings.enabled("classic_support_hide_gift") ? 2 : 0)
                | (UiSettings.enabled("classic_support_hide_bits") ? 4 : 0)
                | (UiSettings.enabled("hide_channel_extensions") ? 8 : 0)
                | (UiSettings.enabled("hide_leaderboards") ? 16 : 0);
    }
}
