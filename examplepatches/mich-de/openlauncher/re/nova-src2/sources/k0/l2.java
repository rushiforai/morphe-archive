package k0;

import androidx.compose.ui.Modifier$Node;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class l2 extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public g0 f70673a;

    /* renamed from: b, reason: collision with root package name */
    public Function2 f70674b;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        z2.i1 i1VarH = q0Var.H(y3.b.a(this.f70673a != g0.f70607a ? 0 : y3.a.j(j11), y3.a.h(j11), this.f70673a == g0.f70608b ? y3.a.i(j11) : 0, y3.a.g(j11)));
        int iE0 = kotlin.ranges.a.e0(i1VarH.f98081a, y3.a.j(j11), y3.a.h(j11));
        int iE02 = kotlin.ranges.a.e0(i1VarH.f98082b, y3.a.i(j11), y3.a.g(j11));
        return t0Var.y(iE0, iE02, b70.h.f17594a, new w1(this, iE0, i1VarH, iE02, t0Var));
    }
}
