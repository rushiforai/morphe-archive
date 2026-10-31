package o7;

import java.time.Duration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class z extends e0 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(Class cls, Duration repeatInterval) {
        super(cls);
        Intrinsics.g(repeatInterval, "repeatInterval");
        x7.q qVar = this.f79650c;
        long jA = y7.e.a(repeatInterval);
        qVar.getClass();
        String str = x7.q.f95170x;
        if (jA < 900000) {
            r.c().f(str, "Interval duration lesser than minimum allowed value; Changed to 900000");
        }
        long j11 = jA < 900000 ? 900000L : jA;
        long j12 = jA < 900000 ? 900000L : jA;
        if (j11 < 900000) {
            r.c().f(str, "Interval duration lesser than minimum allowed value; Changed to 900000");
        }
        qVar.f95178h = j11 >= 900000 ? j11 : 900000L;
        if (j12 < 300000) {
            r.c().f(str, "Flex duration lesser than minimum allowed value; Changed to 300000");
        }
        if (j12 > qVar.f95178h) {
            r.c().f(str, "Flex duration greater than interval duration; Changed to " + j11);
        }
        qVar.f95179i = kotlin.ranges.a.g0(j12, 300000L, qVar.f95178h);
    }

    @Override // o7.e0
    public final f0 b() {
        if (this.f79648a && this.f79650c.f95180j.f79655c) {
            throw new IllegalArgumentException("Cannot set backoff criteria on an idle mode job");
        }
        x7.q qVar = this.f79650c;
        if (qVar.f95185q) {
            throw new IllegalArgumentException("PeriodicWorkRequests cannot be expedited");
        }
        return new a0(this.f79649b, qVar, this.f79651d);
    }

    @Override // o7.e0
    public final e0 c() {
        return this;
    }
}
