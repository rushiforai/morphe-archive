package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class hp1 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f4474a;

    /* renamed from: b, reason: collision with root package name */
    public final long f4475b;

    /* renamed from: c, reason: collision with root package name */
    public final long f4476c;

    /* renamed from: d, reason: collision with root package name */
    public final int f4477d;

    public hp1(long j11, long j12, int i5, long j13) {
        this.f4474a = j11;
        this.f4475b = j12;
        this.f4476c = j13;
        this.f4477d = i5;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        ti.j jVar = signals.deviceSignals.memorySignals;
        jVar.runtimeFreeMemory = Long.valueOf(this.f4474a);
        jVar.runtimeMaxMemory = Long.valueOf(this.f4475b);
        jVar.runtimeTotalMemory = Long.valueOf(this.f4476c);
        jVar.webviewCount = Integer.valueOf(this.f4477d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hp1)) {
            return false;
        }
        hp1 hp1Var = (hp1) obj;
        return this.f4474a == hp1Var.f4474a && this.f4475b == hp1Var.f4475b && this.f4476c == hp1Var.f4476c && this.f4477d == hp1Var.f4477d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f4477d) + c0.d(c0.d(Long.hashCode(this.f4474a) * 31, 31, this.f4475b), 31, this.f4476c);
    }

    public final String toString() {
        StringBuilder sbU = c0.u(this.f4474a, "MemorySignal(runtimeFreeMemory=", ", runtimeMaxMemory=");
        sbU.append(this.f4475b);
        c0.B(sbU, ", runtimeTotalMemory=", this.f4476c, ", webviewCount=");
        return c0.o(sbU, this.f4477d, ")");
    }
}
