package ads_mobile_sdk;

import b.k9;
import b.u1;
import kotlin.jvm.internal.Intrinsics;
import ti.d;
import ti.n;

/* loaded from: classes.dex */
public final class js2 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final d f5379a;

    /* renamed from: b, reason: collision with root package name */
    public final int f5380b;

    /* renamed from: c, reason: collision with root package name */
    public final ti.b f5381c;

    public js2(d appStats, int i5, ti.b bVar) {
        Intrinsics.g(appStats, "appStats");
        this.f5379a = appStats;
        this.f5380b = i5;
        this.f5381c = bVar;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        int i5 = this.f5380b;
        if (i5 > 0) {
            signals.numberOfRegisteredWebViews = Integer.valueOf(i5);
        }
        signals.qualitySignals = new n(this.f5379a);
        signals.adUnitQualitySignals = this.f5381c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof js2)) {
            return false;
        }
        js2 js2Var = (js2) obj;
        return Intrinsics.b(this.f5379a, js2Var.f5379a) && this.f5380b == js2Var.f5380b && Intrinsics.b(this.f5381c, js2Var.f5381c);
    }

    public final int hashCode() {
        return this.f5381c.hashCode() + k9.b(this.f5380b, this.f5379a.hashCode() * 31);
    }

    public final String toString() {
        return "QualitySignal(appStats=" + this.f5379a + ", numberOfRegisteredWebViews=" + this.f5380b + ", adUnitQualitySignals=" + this.f5381c + ")";
    }
}
