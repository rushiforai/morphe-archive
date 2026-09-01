package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n55 extends f0 {
    public static final mn1 l = new mn1(mnc.k, n98.e("Function"));
    public static final mn1 m = new mn1(mnc.i, n98.e("KFunction"));
    public final x67 e;
    public final wx8 f;
    public final c65 g;
    public final int h;
    public final m55 i;
    public final q55 j;
    public final List k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n55(x67 x67Var, w01 w01Var, c65 c65Var, int i) {
        super(x67Var, c65Var.a(i));
        w01Var.getClass();
        this.e = x67Var;
        this.f = w01Var;
        this.g = c65Var;
        this.h = i;
        this.i = new m55(this);
        this.j = new q55(x67Var, this);
        ArrayList arrayList = new ArrayList();
        n46 n46Var = new n46(1, i, 1);
        ArrayList arrayList2 = new ArrayList(cu1.k0(n46Var, 10));
        Iterator it2 = n46Var.iterator();
        while (((m46) it2).c) {
            int iNextInt = ((g46) it2).nextInt();
            arrayList.add(twd.B0(this, pqe.IN_VARIANCE, n98.e("P" + iNextInt), arrayList.size(), this.e));
            arrayList2.add(c1e.a);
        }
        arrayList.add(twd.B0(this, pqe.OUT_VARIANCE, n98.e("R"), arrayList.size(), this.e));
        this.k = bu1.m1(arrayList);
        o55 o55Var = p55.Companion;
        c65 c65Var2 = this.g;
        o55Var.getClass();
        c65Var2.getClass();
        if (c65Var2.equals(y55.c) || c65Var2.equals(b65.c) || c65Var2.equals(z55.c)) {
            return;
        }
        c65Var2.equals(a65.c);
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        return qn1.INTERFACE;
    }

    @Override // defpackage.aw2
    public final jkc d() {
        return jkc.g0;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.do1
    public final boolean g() {
        return false;
    }

    @Override // defpackage.y28, defpackage.do1
    public final List g0() {
        return this.k;
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        return cd7.e;
    }

    @Override // defpackage.y28, defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = h93.e;
        g93Var.getClass();
        return g93Var;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        return this.f;
    }

    @Override // defpackage.tu7
    public final boolean isExternal() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.y28
    public final ev7 j0() {
        return dv7.b;
    }

    @Override // defpackage.co1
    public final zvd n() {
        return this.i;
    }

    @Override // defpackage.y28
    public final ev7 n0(sn6 sn6Var) {
        return this.j;
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        return c28.ABSTRACT;
    }

    @Override // defpackage.y28
    public final zm1 o0() {
        return null;
    }

    @Override // defpackage.y28
    public final cqe p0() {
        return null;
    }

    @Override // defpackage.y28
    public final boolean q0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean r0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean t0() {
        return false;
    }

    public final String toString() {
        String strB = getName().b();
        strB.getClass();
        return strB;
    }

    @Override // defpackage.y28
    public final Collection w() {
        return ey3.a;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }
}
