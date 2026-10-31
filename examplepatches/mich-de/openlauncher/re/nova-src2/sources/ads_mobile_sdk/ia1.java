package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ia1 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f4689a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f4690b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f4691c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f4692d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f4693e;

    public ia1(String str, boolean z11, boolean z12, boolean z13, boolean z14) {
        this.f4689a = str;
        this.f4690b = z11;
        this.f4691c = z12;
        this.f4692d = z13;
        this.f4693e = z14;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        String str = this.f4689a;
        if (str != null) {
            signals.inspectorExtras = str;
        }
        boolean z11 = this.f4690b;
        signals.testMode = z11 ? 1 : 0;
        boolean z12 = this.f4691c;
        signals.linkedDevice = z12 ? 1 : 0;
        if (z11 || z12) {
            signals.requestServerData = Integer.valueOf(this.f4692d ? 0 : 1);
            signals.shouldCollectAdResponseLogs = Boolean.valueOf(this.f4693e);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ia1)) {
            return false;
        }
        ia1 ia1Var = (ia1) obj;
        return Intrinsics.b(this.f4689a, ia1Var.f4689a) && this.f4690b == ia1Var.f4690b && this.f4691c == ia1Var.f4691c && this.f4692d == ia1Var.f4692d && this.f4693e == ia1Var.f4693e;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        String str = this.f4689a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        boolean z11 = this.f4690b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        boolean z12 = this.f4691c;
        int i12 = z12;
        if (z12 != 0) {
            i12 = 1;
        }
        int i13 = (i11 + i12) * 31;
        boolean z13 = this.f4692d;
        int i14 = z13;
        if (z13 != 0) {
            i14 = 1;
        }
        int i15 = (i13 + i14) * 31;
        boolean z14 = this.f4693e;
        return i15 + (z14 ? 1 : z14 ? 1 : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("InspectorSignal(requestExtras=");
        sb2.append(this.f4689a);
        sb2.append(", isTestMode=");
        sb2.append(this.f4690b);
        sb2.append(", isLinkedDevice=");
        a80.m.s(sb2, this.f4691c, ", hasServerData=", this.f4692d, ", shouldCollectAdResponseLogs=");
        return a80.m.k(sb2, this.f4693e, ")");
    }
}
