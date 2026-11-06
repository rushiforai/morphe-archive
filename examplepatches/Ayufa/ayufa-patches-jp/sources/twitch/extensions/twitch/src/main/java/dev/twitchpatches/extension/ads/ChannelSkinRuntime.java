package dev.twitchpatches.extension.ads;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

public final class ChannelSkinRuntime {
    private static final Map<Object, Boolean> owners = new WeakHashMap<>();
    private static final Handler main = new Handler(Looper.getMainLooper());

    public static void capture(Object owner) {
        synchronized (owners) { owners.put(owner, true); }
        render(owner);
    }

    public static void remove(Object owner) {
        synchronized (owners) { owners.remove(owner); }
    }

    public static void refresh() {
        main.post(() -> {
            ArrayList<Object> active;
            synchronized (owners) { active = new ArrayList<>(owners.keySet()); }
            for (Object owner : active) if (owner != null) render(owner);
        });
    }

    public static void render(Object owner) {
        throw new IllegalStateException("Channel sponsorship bridge was not generated.");
    }
}
