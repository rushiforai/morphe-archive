package k0;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public static final z.o0 f70694a = c(true);

    /* renamed from: b, reason: collision with root package name */
    public static final z.o0 f70695b = c(false);

    /* renamed from: c, reason: collision with root package name */
    public static final s f70696c = new s(b2.d.f16997a, false);

    /* renamed from: d, reason: collision with root package name */
    public static final o f70697d = o.f70690b;

    public static final void a(final b2.t tVar, p1.o oVar, final int i5) {
        int i11;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-211209833);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if (tVar2.S(i11 & 1, (i11 & 3) != 2)) {
            int iHashCode = Long.hashCode(tVar2.T);
            b2.t tVarI = fg.a.I(tVar, tVar2);
            p1.n1 n1VarL = tVar2.l();
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(f70697d, b3.k.f17275g, tVar2);
            p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
            p1.a0.j(tVarI, b3.k.f17272d, tVar2);
            b3.i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            tVar2.p(true);
        } else {
            tVar2.V();
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: k0.n
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iL = p1.a0.l(i5 | 1);
                    p.a(tVar, (p1.o) obj, iL);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void b(z2.h1 h1Var, z2.i1 i1Var, z2.q0 q0Var, y3.n nVar, int i5, int i11, b2.f fVar) {
        b2.f fVar2;
        Object objK = q0Var.k();
        m mVar = objK instanceof m ? (m) objK : null;
        z2.h1.k(h1Var, i1Var, ((mVar == null || (fVar2 = mVar.f70675a) == null) ? fVar : fVar2).a((i1Var.f98081a << 32) | (i1Var.f98082b & 4294967295L), (i5 << 32) | (i11 & 4294967295L), nVar));
    }

    public static final z.o0 c(boolean z11) {
        z.o0 o0Var = new z.o0(9);
        b2.k kVar = b2.d.f16997a;
        o0Var.m(kVar, new s(kVar, z11));
        b2.k kVar2 = b2.d.f16998b;
        o0Var.m(kVar2, new s(kVar2, z11));
        b2.k kVar3 = b2.d.f16999c;
        o0Var.m(kVar3, new s(kVar3, z11));
        b2.k kVar4 = b2.d.f17000d;
        o0Var.m(kVar4, new s(kVar4, z11));
        b2.k kVar5 = b2.d.f17001e;
        o0Var.m(kVar5, new s(kVar5, z11));
        b2.k kVar6 = b2.d.f17002f;
        o0Var.m(kVar6, new s(kVar6, z11));
        b2.k kVar7 = b2.d.f17003g;
        o0Var.m(kVar7, new s(kVar7, z11));
        b2.k kVar8 = b2.d.f17004h;
        o0Var.m(kVar8, new s(kVar8, z11));
        b2.k kVar9 = b2.d.f17005i;
        o0Var.m(kVar9, new s(kVar9, z11));
        return o0Var;
    }

    public static final z2.r0 d(b2.f fVar, boolean z11) {
        z2.r0 r0Var = (z2.r0) (z11 ? f70694a : f70695b).d(fVar);
        return r0Var == null ? new s(fVar, z11) : r0Var;
    }

    public static final s e(b2.f fVar, p1.o oVar, int i5) {
        if (Intrinsics.b(fVar, b2.d.f16997a)) {
            p1.t tVar = (p1.t) oVar;
            tVar.b0(244367063);
            tVar.p(false);
            return f70696c;
        }
        p1.t tVar2 = (p1.t) oVar;
        tVar2.b0(244414741);
        boolean zG = ((((i5 & 14) ^ 6) > 4 && tVar2.f(fVar)) || (i5 & 6) == 4) | tVar2.g(false);
        Object objP = tVar2.P();
        if (zG || objP == p1.n.f81514a) {
            objP = new s(fVar, false);
            tVar2.m0(objP);
        }
        s sVar = (s) objP;
        tVar2.p(false);
        return sVar;
    }
}
