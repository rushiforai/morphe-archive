package b0;

import kotlin.coroutines.Continuation;
import p1.s2;

/* loaded from: classes.dex */
public final class r1 extends l1 {

    /* renamed from: a, reason: collision with root package name */
    public c0.m f16222a;

    /* renamed from: e, reason: collision with root package name */
    public boolean f16226e;

    /* renamed from: b, reason: collision with root package name */
    public b2.k f16223b = b2.d.f16997a;

    /* renamed from: c, reason: collision with root package name */
    public long f16224c = androidx.compose.animation.c.f13871a;

    /* renamed from: d, reason: collision with root package name */
    public long f16225d = y3.b.b(0, 0, 15);

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f16227f = androidx.compose.runtime.d.k(null);

    public r1(c0.m mVar) {
        this.f16222a = mVar;
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        z2.i1 i1VarH;
        char c11;
        long j12;
        o1 o1Var;
        long jD;
        o1 o1Var2;
        if (t0Var.l()) {
            this.f16225d = j11;
            this.f16226e = true;
            i1VarH = q0Var.H(j11);
        } else {
            i1VarH = q0Var.H(this.f16226e ? this.f16225d : j11);
        }
        z2.i1 i1Var = i1VarH;
        long j13 = (i1Var.f98082b & 4294967295L) | (i1Var.f98081a << 32);
        if (t0Var.l()) {
            this.f16224c = j13;
            c11 = ' ';
            jD = j13;
            j12 = jD;
        } else {
            long j14 = !y3.m.a(this.f16224c, androidx.compose.animation.c.f13871a) ? this.f16224c : j13;
            p1.e1 e1Var = this.f16227f;
            o1 o1Var3 = (o1) ((s2) e1Var).getValue();
            if (o1Var3 != null) {
                c0.e eVar = o1Var3.f16198a;
                c11 = ' ';
                j12 = j13;
                boolean z11 = (y3.m.a(j14, ((y3.m) eVar.e()).f96611a) || eVar.f()) ? false : true;
                if (!y3.m.a(j14, ((y3.m) ((s2) eVar.f18758e).getValue()).f96611a) || z11) {
                    o1Var3.f16199b = ((y3.m) eVar.e()).f96611a;
                    o1Var2 = o1Var3;
                    t70.m0.t(getCoroutineScope(), null, null, new p1(o1Var2, j14, this, (Continuation) null), 3);
                } else {
                    o1Var2 = o1Var3;
                }
                o1Var = o1Var2;
            } else {
                c11 = ' ';
                j12 = j13;
                long j15 = 1;
                o1Var = new o1(new c0.e(new y3.m(j14), c0.f.f18789p, new y3.m((j15 << 32) | (j15 & 4294967295L)), 8), j14);
            }
            ((s2) e1Var).setValue(o1Var);
            jD = y3.b.d(j11, ((y3.m) o1Var.f16198a.e()).f96611a);
        }
        int i5 = (int) (jD >> c11);
        int i11 = (int) (jD & 4294967295L);
        return t0Var.y(i5, i11, b70.h.f17594a, new q1(this, j12, i5, i11, t0Var, i1Var));
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        super.onAttach();
        this.f16224c = androidx.compose.animation.c.f13871a;
        this.f16226e = false;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onReset() {
        super.onReset();
        ((s2) this.f16227f).setValue(null);
    }
}
