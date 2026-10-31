package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class j1 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public float f70651a;

    /* renamed from: b, reason: collision with root package name */
    public float f70652b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f70653c;

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        z2.i1 i1VarH = q0Var.H(j11);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new b00.x(2, this, i1VarH));
    }
}
