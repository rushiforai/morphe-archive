package k0;

import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes2.dex */
public final class e1 extends d1 {

    /* renamed from: a, reason: collision with root package name */
    public c1 f70595a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f70596b;

    @Override // k0.d1
    public final long B(z2.q0 q0Var, long j11) {
        int iE = this.f70595a == c1.f70577a ? q0Var.E(y3.a.g(j11)) : q0Var.F(y3.a.g(j11));
        if (iE < 0) {
            iE = 0;
        }
        if (iE < 0) {
            y3.j.a("width must be >= 0");
        }
        return y3.b.h(iE, iE, 0, LayoutNode.NotPlacedPlaceOrder);
    }

    @Override // k0.d1
    public final boolean D() {
        return this.f70596b;
    }

    @Override // k0.d1, b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return this.f70595a == c1.f70577a ? sVar.E(i5) : sVar.F(i5);
    }

    @Override // k0.d1, b3.e0
    public final int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        return this.f70595a == c1.f70577a ? sVar.E(i5) : sVar.F(i5);
    }
}
