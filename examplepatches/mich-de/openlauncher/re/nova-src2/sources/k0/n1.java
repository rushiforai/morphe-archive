package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class n1 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public float f70685a;

    /* renamed from: b, reason: collision with root package name */
    public float f70686b;

    /* renamed from: c, reason: collision with root package name */
    public float f70687c;

    /* renamed from: d, reason: collision with root package name */
    public float f70688d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f70689e;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        int iMo96roundToPx0680j_4 = t0Var.mo96roundToPx0680j_4(this.f70687c) + t0Var.mo96roundToPx0680j_4(this.f70685a);
        int iMo96roundToPx0680j_42 = t0Var.mo96roundToPx0680j_4(this.f70688d) + t0Var.mo96roundToPx0680j_4(this.f70686b);
        z2.i1 i1VarH = q0Var.H(y3.b.i(-iMo96roundToPx0680j_4, -iMo96roundToPx0680j_42, j11));
        return t0Var.y(y3.b.g(i1VarH.f98081a + iMo96roundToPx0680j_4, j11), y3.b.f(i1VarH.f98082b + iMo96roundToPx0680j_42, j11), b70.h.f17594a, new b00.x(4, this, i1VarH));
    }
}
