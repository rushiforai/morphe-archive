package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xw6 extends y28 {
    public final y28 a;
    public final ixd b;
    public ixd c;
    public ArrayList d;
    public ArrayList e;
    public wn1 f;

    public xw6(y28 y28Var, ixd ixdVar) {
        this.a = y28Var;
        this.b = ixdVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void u0(int r15) {
        /*
            Method dump skipped, instruction units count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xw6.u0(int):void");
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.Q(this, obj);
    }

    @Override // defpackage.y28, defpackage.co1
    public final hec T() {
        uvd uvdVarI;
        List listD = nxd.d(n().getParameters());
        ly annotations = getAnnotations();
        if (annotations.isEmpty()) {
            uvd.b.getClass();
            uvdVarI = uvd.c;
        } else {
            a1a a1aVar = uvd.b;
            List listQ = d46.Q(new oy(annotations));
            a1aVar.getClass();
            uvdVarI = a1a.i(listQ);
        }
        return pwd.Z(m0(), uvdVarI, n(), listD, false);
    }

    @Override // defpackage.y28
    public final List a0() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        u0(17);
        throw null;
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        qn1 qn1VarB0 = this.a.b0();
        if (qn1VarB0 != null) {
            return qn1VarB0;
        }
        u0(25);
        throw null;
    }

    @Override // defpackage.aw2
    public final jkc d() {
        return jkc.g0;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return this.a.e0();
    }

    @Override // defpackage.s0d
    public final aw2 f(ixd ixdVar) {
        if (ixdVar != null) {
            exd exdVar = ixdVar.a;
            return exdVar.e() ? this : new xw6(this, ixd.e(exdVar, v0().a));
        }
        u0(23);
        throw null;
    }

    @Override // defpackage.y28
    public final ev7 f0(exd exdVar) {
        f93.h(d93.d(this));
        return h0(exdVar, sn6.a);
    }

    @Override // defpackage.do1
    public final boolean g() {
        return this.a.g();
    }

    @Override // defpackage.y28, defpackage.do1
    public final List g0() {
        v0();
        ArrayList arrayList = this.e;
        if (arrayList != null) {
            return arrayList;
        }
        u0(30);
        throw null;
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        ly annotations = this.a.getAnnotations();
        if (annotations != null) {
            return annotations;
        }
        u0(19);
        throw null;
    }

    @Override // defpackage.yv2
    public final n98 getName() {
        n98 name = this.a.getName();
        if (name != null) {
            return name;
        }
        u0(20);
        throw null;
    }

    @Override // defpackage.y28, defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        g93 visibility = this.a.getVisibility();
        if (visibility != null) {
            return visibility;
        }
        u0(27);
        throw null;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        yv2 yv2VarH = this.a.h();
        if (yv2VarH != null) {
            return yv2VarH;
        }
        u0(22);
        throw null;
    }

    @Override // defpackage.y28
    public final ev7 h0(exd exdVar, sn6 sn6Var) {
        ev7 ev7VarH0 = this.a.h0(exdVar, sn6Var);
        if (!this.b.a.e()) {
            return new t0d(ev7VarH0, v0());
        }
        if (ev7VarH0 != null) {
            return ev7VarH0;
        }
        u0(7);
        throw null;
    }

    @Override // defpackage.y28
    /* JADX INFO: renamed from: i0 */
    public final y28 x0() {
        y28 y28VarX0 = this.a.x0();
        if (y28VarX0 != null) {
            return y28VarX0;
        }
        u0(21);
        throw null;
    }

    @Override // defpackage.tu7
    public final boolean isExternal() {
        return this.a.isExternal();
    }

    @Override // defpackage.y28
    public final boolean isInline() {
        return this.a.isInline();
    }

    @Override // defpackage.y28
    public final ev7 j0() {
        ev7 ev7VarJ0 = this.a.j0();
        if (ev7VarJ0 != null) {
            return ev7VarJ0;
        }
        u0(15);
        throw null;
    }

    @Override // defpackage.y28
    public final yq6 k0() {
        throw new UnsupportedOperationException();
    }

    @Override // defpackage.y28
    public final ev7 l0() {
        ev7 ev7VarL0 = this.a.l0();
        if (ev7VarL0 != null) {
            return ev7VarL0;
        }
        u0(28);
        throw null;
    }

    @Override // defpackage.y28
    public final ev7 m0() {
        f93.h(d93.d(this.a));
        return n0(sn6.a);
    }

    @Override // defpackage.co1
    public final zvd n() {
        zvd zvdVarN = this.a.n();
        if (this.b.a.e()) {
            if (zvdVarN != null) {
                return zvdVarN;
            }
            u0(0);
            throw null;
        }
        wn1 wn1Var = this.f;
        if (wn1Var != null) {
            return wn1Var;
        }
        ixd ixdVarV0 = v0();
        Collection collectionB = zvdVarN.b();
        ArrayList arrayList = new ArrayList(collectionB.size());
        Iterator it2 = collectionB.iterator();
        while (it2.hasNext()) {
            arrayList.add(ixdVarV0.h((mn6) it2.next(), pqe.INVARIANT));
        }
        wn1 wn1Var2 = new wn1(this, this.d, arrayList, x67.e);
        this.f = wn1Var2;
        return wn1Var2;
    }

    @Override // defpackage.y28
    public final ev7 n0(sn6 sn6Var) {
        ev7 ev7VarN0 = this.a.n0(sn6Var);
        if (!this.b.a.e()) {
            return new t0d(ev7VarN0, v0());
        }
        if (ev7VarN0 != null) {
            return ev7VarN0;
        }
        u0(14);
        throw null;
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        c28 c28VarO = this.a.o();
        if (c28VarO != null) {
            return c28VarO;
        }
        u0(26);
        throw null;
    }

    @Override // defpackage.y28
    public final zm1 o0() {
        return this.a.o0();
    }

    @Override // defpackage.y28
    public final cqe p0() {
        cqe cqeVarP0 = this.a.p0();
        if (cqeVarP0 == null) {
            return null;
        }
        boolean z = cqeVarP0 instanceof f26;
        ixd ixdVar = this.b;
        if (z) {
            f26 f26Var = (f26) cqeVarP0;
            n98 n98Var = f26Var.a;
            hec hecVar = (hec) f26Var.b;
            if (hecVar != null && !ixdVar.a.e()) {
                hecVar = (hec) v0().h(hecVar, pqe.INVARIANT);
            }
            return new f26(n98Var, hecVar);
        }
        if (!(cqeVarP0 instanceof z48)) {
            ygf.a();
            return null;
        }
        ArrayList<f09> arrayList = ((z48) cqeVarP0).a;
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        for (f09 f09Var : arrayList) {
            n98 n98Var2 = (n98) f09Var.a;
            hec hecVar2 = (hec) ((hkb) f09Var.b);
            if (hecVar2 != null && !ixdVar.a.e()) {
                hecVar2 = (hec) v0().h(hecVar2, pqe.INVARIANT);
            }
            arrayList2.add(new f09(n98Var2, hecVar2));
        }
        return new z48(arrayList2);
    }

    @Override // defpackage.y28
    public final boolean q0() {
        return this.a.q0();
    }

    @Override // defpackage.y28
    public final boolean r0() {
        return this.a.r0();
    }

    @Override // defpackage.y28
    public final boolean s0() {
        return this.a.s0();
    }

    @Override // defpackage.y28
    public final boolean t0() {
        return this.a.t0();
    }

    public final ixd v0() {
        if (this.c == null) {
            ixd ixdVar = this.b;
            if (ixdVar.a.e()) {
                this.c = ixdVar;
            } else {
                List parameters = this.a.n().getParameters();
                ArrayList arrayList = new ArrayList(parameters.size());
                this.d = arrayList;
                this.c = dm2.Z(parameters, ixdVar.a, this, arrayList);
                ArrayList arrayList2 = this.d;
                arrayList2.getClass();
                ArrayList arrayList3 = new ArrayList();
                for (Object obj : arrayList2) {
                    if (!((swd) obj).R()) {
                        arrayList3.add(obj);
                    }
                }
                this.e = arrayList3;
            }
        }
        return this.c;
    }

    @Override // defpackage.y28
    public final Collection w() {
        Collection<zm1> collectionW = this.a.w();
        ArrayList arrayList = new ArrayList(collectionW.size());
        for (zm1 zm1Var : collectionW) {
            zm1Var.getClass();
            t55 t55VarE0 = zm1Var.E0(ixd.b);
            t55VarE0.e = zm1Var.x0();
            t55VarE0.x(zm1Var.o());
            t55VarE0.t(zm1Var.getVisibility());
            t55VarE0.b(zm1Var.j());
            t55VarE0.m = false;
            arrayList.add(((zm1) t55VarE0.x.B0(t55VarE0)).f(v0()));
        }
        return arrayList;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return this.a.y();
    }
}
