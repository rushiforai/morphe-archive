package tx;

import java.util.concurrent.TimeUnit;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class s4 {

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f89996a;

    /* renamed from: b, reason: collision with root package name */
    public final long f89997b;

    /* renamed from: c, reason: collision with root package name */
    public long f89998c;

    /* renamed from: d, reason: collision with root package name */
    public long f89999d;

    /* renamed from: e, reason: collision with root package name */
    public long f90000e;

    /* renamed from: f, reason: collision with root package name */
    public long f90001f;

    public s4() {
        r4 r4Var = r4.f89980d;
        this.f89996a = r4Var;
        this.f89997b = ((Number) r4Var.invoke()).longValue();
        this.f89998c = -1L;
        this.f89999d = -1L;
        this.f90000e = -1L;
        this.f90001f = -1L;
    }

    public final MapBuilder a() {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("elapsed_ms", Long.valueOf(TimeUnit.NANOSECONDS.toMillis(((Number) this.f89996a.invoke()).longValue() - this.f89997b)));
        long j11 = this.f89998c;
        if (j11 >= 0) {
            mapBuilder.put("config_wait_ms", Long.valueOf(j11));
        }
        long j12 = this.f89999d;
        if (j12 >= 0) {
            mapBuilder.put("backend_refresh_ms", Long.valueOf(j12));
        }
        long j13 = this.f90000e;
        if (j13 >= 0) {
            mapBuilder.put("local_restore_ms", Long.valueOf(j13));
        }
        long j14 = this.f90001f;
        if (j14 >= 0) {
            mapBuilder.put("backend_verify_ms", Long.valueOf(j14));
        }
        return mapBuilder.b();
    }
}
