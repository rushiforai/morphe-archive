package dev.twitchpatches.extension.reload;

import android.os.SystemClock;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.util.HashSet;
import java.util.Set;

public final class NativeReloadAction {
    private static final WeakHashMap<Object, NativeReloadAction> actions = new WeakHashMap<>();
    private static final Set<String> observedBindings = new HashSet<>();
    private final WeakReference<NativeReloadHost> host;
    private final ReloadGesture gesture = new ReloadGesture();

    private NativeReloadAction(NativeReloadHost host) {
        this.host = new WeakReference<>(host);
    }

    static NativeReloadAction create(NativeReloadHost host) { return new NativeReloadAction(host); }
    void reset() { gesture.reset(); }

    public static synchronized void bind(Object owner, NativeReloadHost host) {
        actions.put(owner, new NativeReloadAction(host));
    }

    public static synchronized NativeReloadAction forVolume(Object callback) {
        NativeReloadAction action = callback instanceof NativeReloadOwner
                ? actions.get(((NativeReloadOwner) callback).reloadControlsOwner()) : null;
        String category = callback instanceof NativeReloadOwner ? "mapped" : "unmapped";
        String binding = category + (action == null ? " unavailable" : action.available() ? " ready" : " not ready");
        if (observedBindings.size() < 16 && observedBindings.add(binding)) {
            Log.i("TwitchPatchesReload", "native controls callback " + binding);
        }
        return action;
    }

    public boolean available() {
        NativeReloadHost current = host.get();
        return current != null && current.reloadIdentity() != null;
    }

    public Object invoke() {
        NativeReloadHost current = host.get();
        Object identity = current == null ? null : current.reloadIdentity();
        ReloadGesture.Result result = gesture.tap(identity, SystemClock.elapsedRealtime(), ReloadRuntime.enabled());
        if (result == ReloadGesture.Result.HINT) ReloadRuntime.showHint();
        else if (result == ReloadGesture.Result.RELOAD && current != null && current.reloadNativeStream()) {
            Log.i("TwitchPatchesReload", "native live stream reload requested");
        }
        return null;
    }

    static synchronized void resetGestures() {
        for (NativeReloadAction action : actions.values()) action.gesture.reset();
    }
}
