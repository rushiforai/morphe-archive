package dev.twitchpatches.extension.ui;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import java.util.WeakHashMap;

public final class UiHypeTrainRuntime {
    private static final Map<Object, Boolean> owners = new WeakHashMap<>();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static boolean registered, hidden;

    public static void accept(Object owner, Object event, int kind) {
        synchronized (owners) {
            if (!registered) {
                hidden = UiSettings.enabled("hide_hype_trains");
                registered = true;
                UiSettings.observe(() -> main.post(UiHypeTrainRuntime::refresh));
            }
            state(owner).accept(event, kind);
            if (kind == 0) owners.remove(owner);
            else owners.put(owner, true);
        }
        if (kind == 0 || !UiSettings.enabled("hide_hype_trains")) render(owner, event);
    }

    private static void refresh() {
        boolean next = UiSettings.enabled("hide_hype_trains");
        if (hidden == next) return;
        hidden = next;
        ArrayList<Object> active;
        synchronized (owners) { active = new ArrayList<>(owners.keySet()); }
        for (Object owner : active) {
            List<Object> events;
            synchronized (owners) { events = state(owner).restore(); }
            if (next) remove(owner);
            else for (Object event : events) render(owner, event);
        }
    }

    public static UiHypeTrainState state(Object owner) {
        throw new IllegalStateException("Hype Train state bridge was not generated.");
    }

    public static void render(Object owner, Object event) {
        throw new IllegalStateException("Hype Train event bridge was not generated.");
    }

    public static void remove(Object owner) {
        throw new IllegalStateException("Hype Train removal bridge was not generated.");
    }
}
