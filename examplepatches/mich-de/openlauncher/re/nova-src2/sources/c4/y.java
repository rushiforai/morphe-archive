package c4;

import b.c9;

/* loaded from: classes2.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f19643a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f19644b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f19645c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f19646d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f19647e;

    /* renamed from: f, reason: collision with root package name */
    public final String f19648f;

    public y(int i5) {
        boolean z11 = (i5 & 2) != 0;
        boolean z12 = (i5 & 4) != 0;
        h0 h0Var = h0.f19604a;
        this.f19643a = true;
        this.f19644b = z11;
        this.f19645c = h0Var;
        this.f19646d = z12;
        this.f19647e = true;
        this.f19648f = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y)) {
            return false;
        }
        y yVar = (y) obj;
        return this.f19643a == yVar.f19643a && this.f19644b == yVar.f19644b && this.f19645c == yVar.f19645c && this.f19646d == yVar.f19646d && this.f19647e == yVar.f19647e;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f19647e) + c9.f((this.f19645c.hashCode() + c9.f(Boolean.hashCode(this.f19643a) * 31, 31, this.f19644b)) * 31, 31, this.f19646d);
    }
}
