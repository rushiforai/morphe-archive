package m1;

import androidx.compose.ui.Modifier$Node;
import b3.b1;
import g0.d1;
import kotlin.Pair;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;
import z2.i1;

/* loaded from: classes2.dex */
public final class s extends Modifier$Node implements b3.e0 {

    /* renamed from: a, reason: collision with root package name */
    public f1.y f75755a;

    /* renamed from: b, reason: collision with root package name */
    public Function2 f75756b;

    /* renamed from: c, reason: collision with root package name */
    public d1 f75757c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f75758d;

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        i1 i1VarH = q0Var.H(j11);
        if (!t0Var.l() || !this.f75758d) {
            Pair pair = (Pair) this.f75756b.invoke(new y3.m((i1VarH.f98082b & 4294967295L) | (i1VarH.f98081a << 32)), new y3.a(j11));
            f1.y yVar = this.f75755a;
            d0 d0Var = (d0) pair.f71683a;
            Object obj = pair.f71684b;
            if (!Intrinsics.b(yVar.h(), d0Var)) {
                ((s2) yVar.f54120j).setValue(d0Var);
                y yVar2 = (y) yVar.f54123m;
                b1 b1Var = new b1(15, yVar, obj);
                c80.d dVar = yVar2.f75795b;
                boolean zF = dVar.f();
                if (zF) {
                    try {
                        b1Var.invoke();
                    } finally {
                        dVar.g(null);
                    }
                }
                if (!zF) {
                    yVar.n(obj);
                }
            }
        }
        this.f75758d = t0Var.l() || this.f75758d;
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new b0.i(7, t0Var, this, i1VarH));
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f75758d = false;
    }
}
