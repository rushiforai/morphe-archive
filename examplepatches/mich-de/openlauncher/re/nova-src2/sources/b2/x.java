package b2;

import androidx.compose.ui.Modifier$Node;
import b.c9;
import b3.e0;
import z2.i1;
import z2.q0;
import z2.s0;
import z2.t0;

/* loaded from: classes2.dex */
public final class x extends Modifier$Node implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public float f17028a;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final s0 mo25measure3p2s80s(t0 t0Var, q0 q0Var, long j11) {
        i1 i1VarH = q0Var.H(j11);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new b0.e(1, i1VarH, this));
    }

    public final String toString() {
        return c9.k(new StringBuilder("ZIndexModifier(zIndex="), this.f17028a, ')');
    }
}
