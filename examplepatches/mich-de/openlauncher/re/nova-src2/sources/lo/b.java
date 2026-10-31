package lo;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import com.instabridge.ai.proactive.AiInsightData;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final SharedPreferences f75071a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f75072b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f75073c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f75074d;

    public b(Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getSharedPreferences("ai_surfaces", 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.f75071a = sharedPreferences;
        this.f75072b = new LinkedHashMap();
        this.f75073c = new LinkedHashMap();
        this.f75074d = new LinkedHashMap();
    }

    public final a a() {
        return (a) this.f75072b.get("left_swipe");
    }

    public final boolean b(String surfaceId) {
        Intrinsics.g(surfaceId, "surfaceId");
        d dVar = (d) this.f75073c.get(surfaceId);
        if ((dVar != null ? dVar.f75081c : null) != null) {
            return dVar.f75081c.booleanValue();
        }
        String strConcat = "surface_enabled_".concat(surfaceId);
        SharedPreferences sharedPreferences = this.f75071a;
        return sharedPreferences.contains(strConcat) ? sharedPreferences.getBoolean(strConcat, true) : ((a) this.f75072b.get(surfaceId)) != null;
    }

    public final void c(String surfaceId, boolean z11) {
        Intrinsics.g(surfaceId, "surfaceId");
        this.f75071a.edit().putBoolean("surface_enabled_".concat(surfaceId), z11).apply();
    }

    public final boolean d(AiInsightData insight) {
        Long l9;
        Integer num;
        Intrinsics.g(insight, "insight");
        a aVar = (a) this.f75072b.get("home_chip");
        if (aVar == null || !b("home_chip")) {
            return false;
        }
        d dVar = (d) this.f75073c.get("home_chip");
        if (insight.getScore() < ((dVar == null || (num = dVar.f75079a) == null) ? aVar.f75068c : num.intValue())) {
            return false;
        }
        Integer num2 = aVar.f75070e;
        if (num2 != null) {
            Integer sensitivity = insight.getSensitivity();
            if ((sensitivity != null ? sensitivity.intValue() : 5) < num2.intValue()) {
                return false;
            }
        }
        long jLongValue = (dVar == null || (l9 = dVar.f75080b) == null) ? aVar.f75069d : l9.longValue();
        Long l11 = (Long) this.f75074d.get("home_chip");
        if (l11 != null) {
            return SystemClock.elapsedRealtime() - l11.longValue() >= jLongValue;
        }
        long j11 = this.f75071a.getLong("surface_last_shown_home_chip", 0L);
        if (j11 <= 0) {
            return true;
        }
        long jCurrentTimeMillis = System.currentTimeMillis() - j11;
        return 0 > jCurrentTimeMillis || jCurrentTimeMillis >= jLongValue;
    }
}
