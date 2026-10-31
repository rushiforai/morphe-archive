package cy;

import android.content.Context;
import kotlin.Unit;

/* loaded from: classes4.dex */
public abstract class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final f0 f48478a = f0.f48468d;

    public static boolean a(Context context) {
        long j11 = context.getSharedPreferences("nova_prime_grant", 0).getLong("prime_grant_expires_at_ms", 0L);
        if (j11 <= 0) {
            return false;
        }
        if (((Number) f48478a.invoke()).longValue() < j11) {
            return true;
        }
        context.getSharedPreferences("nova_prime_grant", 0).edit().remove("prime_grant_expires_at_ms").apply();
        zy.c cVar = zy.c.f98823a;
        zy.c.i("rewards_grant_expired", null);
        yx.b bVar = yx.b.f97678a;
        yx.b.g("rewards_grant_expired", null);
        px.c cVar2 = px.c.f83110a;
        px.c.f83115f.c(Unit.f71706a);
        return false;
    }
}
