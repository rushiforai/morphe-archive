package c1;

import androidx.compose.ui.text.input.ImeOptions;
import c3.b2;
import c3.c3;
import c3.z1;
import m3.l0;
import r3.u;
import r3.z;
import t0.x0;
import t70.g2;
import t70.m0;
import w70.l1;
import w70.t1;
import w70.u1;

/* loaded from: classes.dex */
public final class c implements u {

    /* renamed from: a, reason: collision with root package name */
    public n f19073a;

    /* renamed from: b, reason: collision with root package name */
    public g2 f19074b;

    /* renamed from: c, reason: collision with root package name */
    public r f19075c;

    /* renamed from: d, reason: collision with root package name */
    public t1 f19076d;

    @Override // r3.u
    public final void a() {
        j(null);
    }

    @Override // r3.u
    public final void b(z zVar, ImeOptions imeOptions, n00.u uVar, x0 x0Var) {
        j(new a(zVar, this, imeOptions, uVar, x0Var, 0));
    }

    @Override // r3.u
    public final void c(z zVar, z zVar2) {
        r rVar = this.f19075c;
        if (rVar != null) {
            rVar.c(zVar, zVar2);
        }
    }

    @Override // r3.u
    public final void d() throws Throwable {
        g2 g2Var = this.f19074b;
        if (g2Var != null) {
            g2Var.c(null);
        }
        this.f19074b = null;
        l1 l1VarI = i();
        if (l1VarI != null) {
            ((t1) l1VarI).d();
        }
    }

    @Override // r3.u
    public final void e(z zVar, r3.s sVar, l0 l0Var, cs.h hVar, h2.c cVar, h2.c cVar2) {
        r rVar = this.f19075c;
        if (rVar != null) {
            rVar.d(zVar, sVar, l0Var, cVar, cVar2);
        }
    }

    @Override // r3.u
    public final void f() {
        c3 c3Var;
        n nVar = this.f19073a;
        if (nVar == null || (c3Var = (c3) b3.g.c(nVar, z1.f19503p)) == null) {
            return;
        }
        ((b2) c3Var).a();
    }

    @Override // r3.u
    public final void g(h2.c cVar) {
        r rVar = this.f19075c;
        if (rVar != null) {
            rVar.b(cVar);
        }
    }

    @Override // r3.u
    public final void h() {
        c3 c3Var;
        n nVar = this.f19073a;
        if (nVar == null || (c3Var = (c3) b3.g.c(nVar, z1.f19503p)) == null) {
            return;
        }
        ((b2) c3Var).b();
    }

    public final l1 i() {
        t1 t1Var = this.f19076d;
        if (t1Var != null) {
            return t1Var;
        }
        if (!b1.d.f16525a) {
            return null;
        }
        t1 t1VarB = u1.b(1, 0, v70.a.f92143c, 2);
        this.f19076d = t1VarB;
        return t1VarB;
    }

    public final void j(a aVar) {
        n nVar = this.f19073a;
        if (nVar == null) {
            return;
        }
        this.f19074b = nVar.getIsAttached() ? m0.t(nVar.getCoroutineScope(), null, t70.l0.f88816d, new ar.a(nVar, new androidx.room.p(aVar, this, nVar, g2Var, 6), g2Var, 28), 1) : null;
    }

    public final void k(n nVar) {
        if (this.f19073a != nVar) {
            j0.b.c("Expected textInputModifierNode to be " + nVar + " but was " + this.f19073a);
        }
        this.f19073a = null;
    }
}
