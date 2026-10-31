package o7;

import java.time.Duration;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class e0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f79648a;

    /* renamed from: b, reason: collision with root package name */
    public UUID f79649b;

    /* renamed from: c, reason: collision with root package name */
    public x7.q f79650c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f79651d;

    public e0(Class workerClass) {
        Intrinsics.g(workerClass, "workerClass");
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID()");
        this.f79649b = uuidRandomUUID;
        String string = this.f79649b.toString();
        Intrinsics.f(string, "id.toString()");
        this.f79650c = new x7.q(string, 0, workerClass.getName(), (String) null, (g) null, (g) null, 0L, 0L, 0L, (f) null, 0, 0, 0L, 0L, 0L, 0L, false, 0, 0, 0L, 0, 0, 8388602);
        String[] strArr = {workerClass.getName()};
        LinkedHashSet linkedHashSet = new LinkedHashSet(b70.k.d0(1));
        kotlin.collections.c.Z0(strArr, linkedHashSet);
        this.f79651d = linkedHashSet;
    }

    public final f0 a() {
        f0 f0VarB = b();
        f fVar = this.f79650c.f95180j;
        boolean z11 = fVar.a() || fVar.f79656d || fVar.f79654b || fVar.f79655c;
        x7.q qVar = this.f79650c;
        if (qVar.f95185q) {
            if (z11) {
                throw new IllegalArgumentException("Expedited jobs only support network and storage constraints");
            }
            if (qVar.f95177g > 0) {
                throw new IllegalArgumentException("Expedited jobs cannot be delayed");
            }
        }
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID()");
        this.f79649b = uuidRandomUUID;
        String string = uuidRandomUUID.toString();
        Intrinsics.f(string, "id.toString()");
        x7.q other = this.f79650c;
        Intrinsics.g(other, "other");
        this.f79650c = new x7.q(string, other.f95172b, other.f95173c, other.f95174d, new g(other.f95175e), new g(other.f95176f), other.f95177g, other.f95178h, other.f95179i, new f(other.f95180j), other.f95181k, other.f95182l, other.f95183m, other.n, other.o, other.f95184p, other.f95185q, other.f95186r, other.f95187s, other.f95189u, other.f95190v, other.f95191w, 524288);
        return f0VarB;
    }

    public abstract f0 b();

    public abstract e0 c();

    public final e0 d(int i5, long j11, TimeUnit timeUnit) {
        fq.c.o(i5, "backoffPolicy");
        Intrinsics.g(timeUnit, "timeUnit");
        this.f79648a = true;
        x7.q qVar = this.f79650c;
        qVar.f95182l = i5;
        long millis = timeUnit.toMillis(j11);
        String str = x7.q.f95170x;
        if (millis > 18000000) {
            r.c().f(str, "Backoff delay duration exceeds maximum value");
        }
        if (millis < com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c) {
            r.c().f(str, "Backoff delay duration less than minimum value");
        }
        qVar.f95183m = kotlin.ranges.a.g0(millis, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c, 18000000L);
        return c();
    }

    public final e0 e(f constraints) {
        Intrinsics.g(constraints, "constraints");
        this.f79650c.f95180j = constraints;
        return c();
    }

    public final e0 f(Duration duration) {
        Intrinsics.g(duration, "duration");
        this.f79650c.f95177g = y7.e.a(duration);
        if (Long.MAX_VALUE - System.currentTimeMillis() > this.f79650c.f95177g) {
            return c();
        }
        throw new IllegalArgumentException("The given initial delay is too large and will cause an overflow!");
    }
}
