package f1;

import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m3 {

    /* renamed from: a, reason: collision with root package name */
    public final long f53768a;

    /* renamed from: b, reason: collision with root package name */
    public final k1.e f53769b;

    public m3(long j11, k1.e eVar) {
        this.f53768a = j11;
        this.f53769b = eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m3)) {
            return false;
        }
        m3 m3Var = (m3) obj;
        long j11 = m3Var.f53768a;
        int i5 = i2.s.n;
        return ULong.a(this.f53768a, j11) && Intrinsics.b(this.f53769b, m3Var.f53769b);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        int iHashCode = Long.hashCode(this.f53768a) * 31;
        k1.e eVar = this.f53769b;
        return iHashCode + (eVar != null ? eVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RippleConfiguration(color=");
        com.google.android.gms.internal.measurement.k2.v(this.f53768a, ", rippleAlpha=", sb2);
        sb2.append(this.f53769b);
        sb2.append(')');
        return sb2.toString();
    }
}
