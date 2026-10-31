package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i3 {

    /* renamed from: a, reason: collision with root package name */
    public final q3.p f60331a;

    /* renamed from: b, reason: collision with root package name */
    public final long f60332b;

    public i3(q3.p pVar, long j11) {
        this.f60331a = pVar;
        this.f60332b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i3)) {
            return false;
        }
        i3 i3Var = (i3) obj;
        return Intrinsics.b(this.f60331a, i3Var.f60331a) && y3.p.a(this.f60332b, i3Var.f60332b);
    }

    public final int hashCode() {
        q3.p pVar = this.f60331a;
        int iHashCode = pVar == null ? 0 : pVar.hashCode();
        y3.q[] qVarArr = y3.p.f96616b;
        return Long.hashCode(this.f60332b) + (iHashCode * 31);
    }

    public final String toString() {
        return "PrimaryButtonTypography(fontFamily=" + this.f60331a + ", fontSize=" + y3.p.d(this.f60332b) + ")";
    }
}
