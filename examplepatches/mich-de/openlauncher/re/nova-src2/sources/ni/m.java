package ni;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final y f78292a;

    /* renamed from: b, reason: collision with root package name */
    public final long f78293b;

    /* renamed from: c, reason: collision with root package name */
    public final String f78294c;

    public m(y yVar, long j11, String str) {
        this.f78292a = yVar;
        this.f78293b = j11;
        this.f78294c = str;
    }

    public final String a() {
        return this.f78294c;
    }

    public final y b() {
        return this.f78292a;
    }

    public final long c() {
        return this.f78293b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return this.f78292a == mVar.f78292a && this.f78293b == mVar.f78293b && Intrinsics.b(this.f78294c, mVar.f78294c);
    }

    public final int hashCode() {
        return this.f78294c.hashCode() + b.c0.d(this.f78292a.hashCode() * 31, 31, this.f78293b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AdValue(precisionType=");
        sb2.append(this.f78292a);
        sb2.append(", valueMicros=");
        sb2.append(this.f78293b);
        return b.c0.r(sb2, ", currencyCode=", this.f78294c, ")");
    }
}
