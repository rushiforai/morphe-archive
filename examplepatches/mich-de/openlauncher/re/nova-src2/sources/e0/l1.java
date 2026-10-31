package e0;

import com.google.android.gms.internal.measurement.k2;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f50067a;

    /* renamed from: b, reason: collision with root package name */
    public final k0.p1 f50068b;

    public l1() {
        long jC = i2.r0.c(4284900966L);
        k0.p1 p1VarA = androidx.compose.foundation.layout.d.a(3, 0.0f, 0.0f);
        this.f50067a = jC;
        this.f50068b = p1VarA;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!l1.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.foundation.OverscrollConfiguration");
        l1 l1Var = (l1) obj;
        long j11 = l1Var.f50067a;
        int i5 = i2.s.n;
        return ULong.a(this.f50067a, j11) && Intrinsics.b(this.f50068b, l1Var.f50068b);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return this.f50068b.hashCode() + (Long.hashCode(this.f50067a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("OverscrollConfiguration(glowColor=");
        k2.v(this.f50067a, ", drawPadding=", sb2);
        sb2.append(this.f50068b);
        sb2.append(')');
        return sb2.toString();
    }
}
