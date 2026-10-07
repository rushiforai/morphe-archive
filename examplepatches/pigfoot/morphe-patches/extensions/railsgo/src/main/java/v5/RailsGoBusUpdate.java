package v5;

import android.app.Activity;
import android.util.Log;
import com.google.android.gms.internal.ads.af;
import com.google.android.gms.internal.ads.df;
import com.google.android.gms.internal.ads.mf;
import java.util.WeakHashMap;

/** Scoped to the observed RailsGo bus-update unit; unknown paths retain SDK flow. */
public final class RailsGoBusUpdate {
    private static final WeakHashMap<K, Boolean> completed = new WeakHashMap<>();

    public static synchronized boolean tryComplete(K wrapper) {
        boolean handled = false;
        try {
            if (!"ca-app-pub-6118603149023812/5192762441".equals(wrapper.c)) return false;
            mf loaded = wrapper.g;
            if (loaded == null) return false;
            t0.b callback = wrapper.b;
            if (callback == null || !(callback.A instanceof Activity)) return false;
            if (completed.containsKey(wrapper)) return true;
            df source = loaded.a;
            if (source == null) return false;
            af reward = source.i();
            if (reward == null) return false;
            Integer amount = Integer.valueOf(reward.c());
            String type = reward.b();
            if (type == null) return false;
            J value = new J(amount, type);
            int code = wrapper.a;
            B dismiss = new B(code, callback);
            // Commit before callbacks: failures must not replay reward or SDK show.
            completed.put(wrapper, Boolean.TRUE);
            handled = true;
            callback.H(code, value);
            dismiss.d();
            Log.i("RailsGoBusUpdate", "Matched observed bus-update unit; local reward/dismiss queued without SDK show");
        } catch (Exception error) {
            Log.w("RailsGoBusUpdate", "Scoped completion unavailable; retrieval failures keep original flow", error);
        }
        return handled;
    }
}
