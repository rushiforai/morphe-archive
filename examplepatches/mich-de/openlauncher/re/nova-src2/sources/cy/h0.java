package cy;

import android.content.Context;
import com.amplitude.core.events.Plan;
import kotlin.collections.builders.MapBuilder;

/* loaded from: classes4.dex */
public final class h0 {
    public static void a(Context context, String str) {
        zy.c cVar = zy.c.f98823a;
        d0 d0Var = d0.f48442a;
        boolean z11 = context.getSharedPreferences("nova_billing", 0).getBoolean("subscription_active", false);
        long jZ = d0.z(context);
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(Plan.AMP_PLAN_SOURCE, str);
        mapBuilder.put("subscription_active", Boolean.valueOf(z11));
        mapBuilder.put("last_verified_age_h", Long.valueOf(jZ));
        mapBuilder.putAll(b70.h.f17594a);
        zy.c.i("prime_revoked", mapBuilder.b());
    }

    public static String b(String str) {
        return b.c0.k("stale_cache_", str);
    }
}
