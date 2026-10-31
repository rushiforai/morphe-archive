package ir;

import android.os.SystemClock;
import java.util.LinkedHashMap;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes4.dex */
public final class a implements c {

    /* renamed from: b, reason: collision with root package name */
    public static final a f67993b = new a();

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f67994a = new LinkedHashMap();

    public final Duration a(b bVar) {
        Long l9 = (Long) this.f67994a.remove(bVar);
        if (l9 == null) {
            return null;
        }
        long jUptimeMillis = SystemClock.uptimeMillis() - l9.longValue();
        Duration.Companion companion = Duration.f72038b;
        return new Duration(DurationKt.h(jUptimeMillis, DurationUnit.f72045d));
    }
}
