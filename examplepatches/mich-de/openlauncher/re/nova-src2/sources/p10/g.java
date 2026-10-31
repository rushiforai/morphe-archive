package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements h {

    /* renamed from: a, reason: collision with root package name */
    public final long f81768a;

    /* renamed from: b, reason: collision with root package name */
    public final i2 f81769b;

    public g(long j11, i2 i2Var) {
        this.f81768a = j11;
        this.f81769b = i2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f81768a == gVar.f81768a && Intrinsics.b(this.f81769b, gVar.f81769b);
    }

    public final int hashCode() {
        return this.f81769b.hashCode() + (Long.hashCode(this.f81768a) * 31);
    }

    public final String toString() {
        return "Claimed(amount=" + this.f81768a + ", streak=" + this.f81769b + ")";
    }
}
