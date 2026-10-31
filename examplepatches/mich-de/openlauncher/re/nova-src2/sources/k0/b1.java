package k0;

import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes2.dex */
public final class b1 extends d1 {

    /* renamed from: a, reason: collision with root package name */
    public c1 f70567a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f70568b;

    @Override // k0.d1
    public final long B(z2.q0 q0Var, long j11) {
        int iT = this.f70567a == c1.f70577a ? q0Var.t(y3.a.h(j11)) : q0Var.b(y3.a.h(j11));
        if (iT < 0) {
            iT = 0;
        }
        if (iT < 0) {
            y3.j.a("height must be >= 0");
        }
        return y3.b.h(0, LayoutNode.NotPlacedPlaceOrder, iT, iT);
    }

    @Override // k0.d1
    public final boolean D() {
        return this.f70568b;
    }

    @Override // k0.d1, b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return this.f70567a == c1.f70577a ? sVar.t(i5) : sVar.b(i5);
    }

    @Override // k0.d1, b3.e0
    public final int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        return this.f70567a == c1.f70577a ? sVar.t(i5) : sVar.b(i5);
    }
}
