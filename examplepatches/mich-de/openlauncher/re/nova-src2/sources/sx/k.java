package sx;

import b.c0;
import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final String f87796a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87797b;

    /* renamed from: c, reason: collision with root package name */
    public final double f87798c;

    /* renamed from: d, reason: collision with root package name */
    public final double f87799d;

    /* renamed from: e, reason: collision with root package name */
    public final double f87800e;

    public k(String str, int i5, double d5, double d11, double d12) {
        this.f87796a = str;
        this.f87797b = i5;
        this.f87798c = d5;
        this.f87799d = d11;
        this.f87800e = d12;
    }

    public final double a() {
        double d5 = this.f87798c;
        if (d5 > 0.0d) {
            return this.f87800e / d5;
        }
        return 0.0d;
    }

    public final double b() {
        double d5 = this.f87799d;
        if (d5 > 0.0d) {
            return this.f87798c / d5;
        }
        return 0.0d;
    }

    public final double c(int i5) {
        double dPow = 0.0d;
        int i11 = this.f87797b;
        double dSqrt = (i11 <= 0 || i5 <= 0) ? Double.MAX_VALUE : i11 >= i5 ? 0.0d : Math.sqrt(Math.log(i5) / i11) * 1.41d;
        double dB = b();
        double dA = a();
        if (dB > 0.0d) {
            if (dA <= 0.0d) {
                dA = 1.0d;
            }
            dPow = Math.pow(dA, 1.1d) * dB;
        }
        return dPow + dSqrt;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f87796a, kVar.f87796a) && this.f87797b == kVar.f87797b && Double.compare(this.f87798c, kVar.f87798c) == 0 && Double.compare(this.f87799d, kVar.f87799d) == 0 && Double.compare(this.f87800e, kVar.f87800e) == 0;
    }

    public final int hashCode() {
        return Double.hashCode(this.f87800e) + c9.c(this.f87799d, c9.c(this.f87798c, u4.a(this.f87797b, this.f87796a.hashCode() * 31, 31), 31), 31);
    }

    public final String toString() {
        StringBuilder sbV = c0.v("ArmStats(armId=", this.f87797b, this.f87796a, ", observations=", ", timeDecayedFills=");
        sbV.append(this.f87798c);
        sbV.append(", timeDecayedTotal=");
        sbV.append(this.f87799d);
        sbV.append(", timeDecayedCpmSum=");
        sbV.append(this.f87800e);
        sbV.append(")");
        return sbV.toString();
    }
}
