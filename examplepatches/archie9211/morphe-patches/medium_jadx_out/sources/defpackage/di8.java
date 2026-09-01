package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class di8 extends dn1 {
    public final boolean g;
    public final ArrayList h;
    public final wn1 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public di8(x67 x67Var, tn1 tn1Var, n98 n98Var, boolean z, int i) {
        super(x67Var, tn1Var, n98Var, jkc.g0);
        tn1Var.getClass();
        this.g = z;
        n46 n46VarW = iq7.W(0, i);
        ArrayList arrayList = new ArrayList(cu1.k0(n46VarW, 10));
        Iterator it2 = n46VarW.iterator();
        while (((m46) it2).c) {
            int iNextInt = ((g46) it2).nextInt();
            arrayList.add(twd.B0(this, pqe.INVARIANT, n98.e("T" + iNextInt), iNextInt, x67Var));
        }
        this.h = arrayList;
        List listR = hk7.r(this);
        int i2 = f93.a;
        b38 b38VarD = d93.d(this);
        b38VarD.getClass();
        this.i = new wn1(this, listR, qo7.B(b38VarD.e().e()), x67Var);
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        return qn1.CLASS;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.do1
    public final boolean g() {
        return this.g;
    }

    @Override // defpackage.y28, defpackage.do1
    public final List g0() {
        return this.h;
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

    @Override // defpackage.dn1, defpackage.tu7
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
        return dv7.b;
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        return c28.FINAL;
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
        return "class " + getName() + " (not found)";
    }

    @Override // defpackage.y28
    public final Collection w() {
        return ny3.a;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }
}
