package ads_mobile_sdk;

import b.c0;
import b.k9;
import b.u1;
import kotlin.jvm.internal.Intrinsics;
import ti.h;

/* loaded from: classes2.dex */
public final class ce3 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f1840a;

    /* renamed from: b, reason: collision with root package name */
    public final int f1841b;

    /* renamed from: c, reason: collision with root package name */
    public final int f1842c;

    /* renamed from: d, reason: collision with root package name */
    public final int f1843d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f1844e;

    /* renamed from: f, reason: collision with root package name */
    public final int f1845f;

    public ce3(String str, int i5, int i11, int i12, boolean z11, int i13) {
        this.f1840a = str;
        this.f1841b = i5;
        this.f1842c = i11;
        this.f1843d = i12;
        this.f1844e = z11;
        this.f1845f = i13;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.carrierCode = this.f1840a;
        signals.networkTypeCoarse = Integer.valueOf(this.f1841b);
        signals.networkTypeFine = Integer.valueOf(this.f1842c);
        signals.phoneType = Integer.valueOf(this.f1843d);
        h hVar = signals.deviceSignals;
        hVar.networkSignals.isActiveNetworkMetered = Boolean.valueOf(this.f1844e);
        hVar.networkSignals.activeNetworkState = Integer.valueOf(this.f1845f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ce3)) {
            return false;
        }
        ce3 ce3Var = (ce3) obj;
        return Intrinsics.b(this.f1840a, ce3Var.f1840a) && this.f1841b == ce3Var.f1841b && this.f1842c == ce3Var.f1842c && this.f1843d == ce3Var.f1843d && this.f1844e == ce3Var.f1844e && this.f1845f == ce3Var.f1845f;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f1843d, k9.b(this.f1842c, k9.b(this.f1841b, this.f1840a.hashCode() * 31)));
        boolean z11 = this.f1844e;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return Integer.hashCode(this.f1845f) + ((iB + i5) * 31);
    }

    public final String toString() {
        StringBuilder sbV = c0.v("TelephonySignal(carrierCode=", this.f1841b, this.f1840a, ", networkTypeCoarse=", ", networkTypeFine=");
        c0.A(sbV, this.f1842c, ", phoneType=", this.f1843d, ", isActiveNetworkMetered=");
        sbV.append(this.f1844e);
        sbV.append(", activeNetworkState=");
        sbV.append(this.f1845f);
        sbV.append(")");
        return sbV.toString();
    }
}
