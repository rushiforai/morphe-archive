package p10;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b1 implements d1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81707a;

    /* renamed from: b, reason: collision with root package name */
    public final int f81708b;

    /* renamed from: c, reason: collision with root package name */
    public final i2 f81709c;

    public b1(long j11, int i5, i2 i2Var) {
        this.f81707a = j11;
        this.f81708b = i5;
        this.f81709c = i2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b1)) {
            return false;
        }
        b1 b1Var = (b1) obj;
        return this.f81707a == b1Var.f81707a && this.f81708b == b1Var.f81708b && Intrinsics.b(this.f81709c, b1Var.f81709c);
    }

    public final int hashCode() {
        return this.f81709c.hashCode() + u4.a(this.f81708b, Long.hashCode(this.f81707a) * 31, 31);
    }

    public final String toString() {
        return "Earned(amount=" + this.f81707a + ", remainingToday=" + this.f81708b + ", streak=" + this.f81709c + ")";
    }
}
