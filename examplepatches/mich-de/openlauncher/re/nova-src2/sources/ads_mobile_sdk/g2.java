package ads_mobile_sdk;

import b.c0;
import b.k9;

/* loaded from: classes.dex */
public final class g2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f3618a;

    /* renamed from: b, reason: collision with root package name */
    public final int f3619b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f3620c;

    public g2(int i5, int i11, boolean z11) {
        this.f3618a = i5;
        this.f3619b = i11;
        this.f3620c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g2)) {
            return false;
        }
        g2 g2Var = (g2) obj;
        return this.f3618a == g2Var.f3618a && this.f3619b == g2Var.f3619b && this.f3620c == g2Var.f3620c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f3619b, Integer.hashCode(this.f3618a) * 31);
        boolean z11 = this.f3620c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iB + i5;
    }

    public final String toString() {
        return a80.m.k(c0.t(this.f3618a, "AdDimensions(width=", ", height=", this.f3619b, ", isFluidHeight="), this.f3620c, ")");
    }
}
