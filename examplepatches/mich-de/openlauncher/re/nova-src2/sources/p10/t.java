package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final long f81912a;

    /* renamed from: b, reason: collision with root package name */
    public final i2 f81913b;

    public t(long j11, i2 i2Var) {
        this.f81912a = j11;
        this.f81913b = i2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return this.f81912a == tVar.f81912a && Intrinsics.b(this.f81913b, tVar.f81913b);
    }

    public final int hashCode() {
        return this.f81913b.hashCode() + (Long.hashCode(this.f81912a) * 31);
    }

    public final String toString() {
        return "EarnCredit(amount=" + this.f81912a + ", streak=" + this.f81913b + ")";
    }
}
