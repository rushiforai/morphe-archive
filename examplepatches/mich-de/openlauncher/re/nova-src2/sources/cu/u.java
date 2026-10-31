package cu;

import hv.p0;
import hv.p4;
import hv.y4;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import p1.n1;
import w70.g2;

/* loaded from: classes4.dex */
public final class u extends v {

    /* renamed from: a, reason: collision with root package name */
    public final p0 f47967a;

    public u(p0 p0Var) {
        this.f47967a = p0Var;
    }

    @Override // cu.v
    public final void a(p1.t tVar) {
        tVar.b0(1472404668);
        k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.f17009m, tVar, 0);
        int iHashCode = Long.hashCode(tVar.T);
        n1 n1VarL = tVar.l();
        b2.r rVar = b2.r.f17024a;
        b2.t tVarI = fg.a.I(rVar, tVar);
        b3.l.Po.getClass();
        Function0 function0 = b3.k.f17270b;
        tVar.f0();
        if (tVar.S) {
            tVar.k(function0);
        } else {
            tVar.p0();
        }
        p1.a0.j(xVarA, b3.k.f17275g, tVar);
        p1.a0.j(n1VarL, b3.k.f17274f, tVar);
        b3.i iVar = b3.k.f17278j;
        if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
            a2.c.u(iHashCode, tVar, iHashCode, iVar);
        }
        p1.a0.j(tVarI, b3.k.f17272d, tVar);
        y4.i(this.f47967a, rVar, tVar, 48);
        wh.f.o(16, tVar, 6, 0);
        tVar.p(true);
        tVar.p(false);
    }

    @Override // cu.v
    public final boolean b() {
        return ((p4) this.f47967a.E.f91586b.invoke()).f60500b.f60533a;
    }

    @Override // cu.v
    public final g2 c() {
        return ps.v.y(this.f47967a.f60487y);
    }

    @Override // cu.v
    public final g2 d() {
        return ps.v.y(this.f47967a.f60488z);
    }
}
