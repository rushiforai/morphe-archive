package com.ironsource.unity.androidbridge;

import android.os.Handler;
import android.os.Looper;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONException;
import org.json.JSONObject;

/** Local game callbacks without SDK impression, revenue or ad-network requests. */
public final class CoffeeRewardedBridge {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, State> STATES = new WeakHashMap<>();
    private static final class State {
        final String unit;
        final IUnityRewardedAdListener listener;
        boolean ready, loading, showing;
        State(String unit, IUnityRewardedAdListener listener) { this.unit = unit; this.listener = listener; }
        String info(String placement) {
            try {
                return new JSONObject().put("adUnitId", unit).put("adFormat", "rewarded")
                    .put("placementName", placement == null ? "" : placement).toString();
            } catch (JSONException e) { throw new IllegalStateException(e); }
        }
    }
    private CoffeeRewardedBridge() {}
    public static synchronized void register(Object owner, String unit, IUnityRewardedAdListener listener) {
        STATES.put(owner, new State(unit, listener));
    }
    public static synchronized boolean ready(Object owner) {
        State state = STATES.get(owner);
        return state != null && state.ready && !state.showing;
    }
    public static synchronized void load(Object owner) {
        State state = STATES.get(owner);
        if (state == null || state.listener == null || state.loading || state.showing) return;
        state.loading = true;
        MAIN.post(() -> {
            synchronized (CoffeeRewardedBridge.class) { state.loading = false; state.ready = true; }
            state.listener.onAdLoaded(state.info(null));
        });
    }
    public static synchronized void show(Object owner, String placement) {
        State state = STATES.get(owner);
        if (state == null || !state.ready || state.showing || state.listener == null) return;
        state.ready = false;
        state.showing = true;
        MAIN.post(() -> {
            String info = state.info(placement);
            state.listener.onAdDisplayed(info);
            state.listener.onAdRewarded(info, placement == null ? "" : placement, 1);
            synchronized (CoffeeRewardedBridge.class) { state.showing = false; }
            state.listener.onAdClosed(info);
        });
    }
}
