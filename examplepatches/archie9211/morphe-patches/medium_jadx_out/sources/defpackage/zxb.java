package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zxb {
    public final q28 a;
    public final boolean b;
    public final aq6 c;
    public final txb d;
    public zxb e;
    public final int f;

    public zxb(q28 q28Var, boolean z, aq6 aq6Var, txb txbVar) {
        this.a = q28Var;
        this.b = z;
        this.c = aq6Var;
        this.d = txbVar;
        this.f = aq6Var.b;
    }

    public static /* synthetic */ List j(int i, zxb zxbVar) {
        return zxbVar.i((i & 1) != 0 ? !zxbVar.b : false, (i & 2) == 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v10, types: [q28] */
    /* JADX WARN: Type inference failed for: r1v11 */
    /* JADX WARN: Type inference failed for: r1v12, types: [q28] */
    /* JADX WARN: Type inference failed for: r1v13, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v14 */
    /* JADX WARN: Type inference failed for: r1v15 */
    /* JADX WARN: Type inference failed for: r1v16 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18 */
    /* JADX WARN: Type inference failed for: r1v19 */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v9 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v7 */
    public final zwa a(eh8 eh8Var) {
        ?? Q0;
        zxb zxbVarL = l();
        if (zxbVarL == null) {
            return zwa.e;
        }
        q28 q28Var = (q28) zxbVarL.c.F.g;
        if ((q28Var.d & 8) != 0) {
            loop0: while (q28Var != null) {
                if ((q28Var.c & 8) != 0) {
                    Q0 = q28Var;
                    ?? o78Var = 0;
                    while (Q0 != 0) {
                        if (Q0 instanceof xxb) {
                            if (((xxb) Q0).i()) {
                                break loop0;
                            }
                        } else if ((Q0.c & 8) != 0 && (Q0 instanceof b43)) {
                            q28 q28Var2 = ((b43) Q0).p;
                            int i = 0;
                            Q0 = Q0;
                            o78Var = o78Var;
                            while (q28Var2 != null) {
                                if ((q28Var2.c & 8) != 0) {
                                    i++;
                                    o78Var = o78Var;
                                    if (i == 1) {
                                        Q0 = q28Var2;
                                    } else {
                                        if (o78Var == 0) {
                                            o78Var = new o78(new q28[16]);
                                        }
                                        if (Q0 != 0) {
                                            o78Var.b(Q0);
                                            Q0 = 0;
                                        }
                                        o78Var.b(q28Var2);
                                    }
                                }
                                q28Var2 = q28Var2.f;
                                Q0 = Q0;
                                o78Var = o78Var;
                            }
                            if (i == 1) {
                            }
                        }
                        Q0 = flb.q0(o78Var);
                    }
                }
                if ((q28Var.d & 8) == 0) {
                    break;
                }
                q28Var = q28Var.f;
            }
            Q0 = 0;
        } else {
            Q0 = 0;
        }
        xxb xxbVar = (xxb) Q0;
        eh8 eh8VarT0 = xxbVar != null ? flb.t0(xxbVar, 8) : null;
        return eh8VarT0 == null ? zxbVarL.a(eh8Var) : eh8VarT0.H(eh8Var, true);
    }

    public final zxb b(vkb vkbVar, x45 x45Var) {
        txb txbVar = new txb();
        txbVar.c = false;
        txbVar.d = false;
        x45Var.invoke(txbVar);
        zxb zxbVar = new zxb(new yxb(x45Var), false, new aq6(this.f + (vkbVar != null ? 1000000000 : 2000000000), true), txbVar);
        zxbVar.e = this;
        return zxbVar;
    }

    public final void c(aq6 aq6Var, ArrayList arrayList) {
        o78 o78VarY = aq6Var.y();
        Object[] objArr = o78VarY.a;
        int i = o78VarY.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if (aq6Var2.H() && !aq6Var2.Q) {
                if (aq6Var2.F.e(8)) {
                    arrayList.add(il7.h(aq6Var2, this.b));
                } else {
                    c(aq6Var2, arrayList);
                }
            }
        }
    }

    public final eh8 d() {
        if (!n()) {
            xxb xxbVarF = f();
            return xxbVarF != null ? flb.t0(xxbVarF, 8) : (l26) this.c.F.d;
        }
        zxb zxbVarL = l();
        if (zxbVarL != null) {
            return zxbVarL.d();
        }
        return null;
    }

    public final void e(ArrayList arrayList, ArrayList arrayList2) {
        r(arrayList, false);
        int size = arrayList.size();
        for (int size2 = arrayList.size(); size2 < size; size2++) {
            zxb zxbVar = (zxb) arrayList.get(size2);
            if (zxbVar.o()) {
                arrayList2.add(zxbVar);
            } else if (!zxbVar.d.d) {
                zxbVar.e(arrayList, arrayList2);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11, types: [q28] */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15 */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v17 */
    /* JADX WARN: Type inference failed for: r0v20 */
    /* JADX WARN: Type inference failed for: r0v21 */
    /* JADX WARN: Type inference failed for: r0v22 */
    /* JADX WARN: Type inference failed for: r0v23 */
    /* JADX WARN: Type inference failed for: r0v24 */
    /* JADX WARN: Type inference failed for: r0v25 */
    /* JADX WARN: Type inference failed for: r0v26 */
    /* JADX WARN: Type inference failed for: r0v27 */
    /* JADX WARN: Type inference failed for: r0v28 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v30 */
    /* JADX WARN: Type inference failed for: r0v31 */
    /* JADX WARN: Type inference failed for: r0v32 */
    /* JADX WARN: Type inference failed for: r0v33 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v21 */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v23 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v7 */
    public final xxb f() {
        ?? Q0;
        boolean z;
        boolean z2 = this.d.c;
        ?? r4 = 0;
        r4 = 0;
        r4 = 0;
        r4 = 0;
        aq6 aq6Var = this.c;
        if (z2) {
            q28 q28Var = (q28) aq6Var.F.g;
            if ((q28Var.d & 8) != 0) {
                Q0 = 0;
                while (q28Var != null) {
                    if ((q28Var.c & 8) != 0) {
                        q28 q28VarQ0 = q28Var;
                        o78 o78Var = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof xxb) {
                                xxb xxbVar = (xxb) q28VarQ0;
                                ?? r0 = Q0;
                                if (xxbVar.i()) {
                                    r0 = Q0;
                                    if (xxbVar.s0()) {
                                        return xxbVar;
                                    }
                                    if (Q0 == 0) {
                                        r0 = xxbVar;
                                    }
                                }
                                z = false;
                                Q0 = r0;
                            } else {
                                z = true;
                                Q0 = Q0;
                            }
                            if (z && (q28VarQ0.c & 8) != 0 && (q28VarQ0 instanceof b43)) {
                                int i = 0;
                                for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                    if ((q28Var2.c & 8) != 0) {
                                        i++;
                                        if (i == 1) {
                                            q28VarQ0 = q28Var2;
                                        } else {
                                            if (o78Var == null) {
                                                o78Var = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var.b(q28Var2);
                                        }
                                    }
                                }
                                if (i == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var);
                        }
                    }
                    if ((q28Var.d & 8) == 0) {
                        break;
                    }
                    q28Var = q28Var.f;
                    Q0 = Q0;
                }
                r4 = Q0;
            }
        } else {
            q28 q28Var3 = (q28) aq6Var.F.g;
            if ((q28Var3.d & 8) != 0) {
                loop3: while (q28Var3 != null) {
                    if ((q28Var3.c & 8) != 0) {
                        Q0 = q28Var3;
                        ?? o78Var2 = 0;
                        while (Q0 != 0) {
                            if (Q0 instanceof xxb) {
                                if (((xxb) Q0).i()) {
                                    r4 = Q0;
                                }
                            } else if ((Q0.c & 8) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var4 = ((b43) Q0).p;
                                int i2 = 0;
                                Q0 = Q0;
                                o78Var2 = o78Var2;
                                while (q28Var4 != null) {
                                    if ((q28Var4.c & 8) != 0) {
                                        i2++;
                                        o78Var2 = o78Var2;
                                        if (i2 == 1) {
                                            Q0 = q28Var4;
                                        } else {
                                            if (o78Var2 == 0) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (Q0 != 0) {
                                                o78Var2.b(Q0);
                                                Q0 = 0;
                                            }
                                            o78Var2.b(q28Var4);
                                        }
                                    }
                                    q28Var4 = q28Var4.f;
                                    Q0 = Q0;
                                    o78Var2 = o78Var2;
                                }
                                if (i2 == 1) {
                                }
                            }
                            Q0 = flb.q0(o78Var2);
                        }
                    }
                    if ((q28Var3.d & 8) == 0) {
                        break;
                    }
                    q28Var3 = q28Var3.f;
                }
            }
        }
        return (xxb) r4;
    }

    public final zwa g() {
        eh8 eh8VarD = d();
        if (eh8VarD != null) {
            if (!eh8VarD.O0().n) {
                eh8VarD = null;
            }
            if (eh8VarD != null) {
                return sgg.K(eh8VarD).H(eh8VarD, true);
            }
        }
        return zwa.e;
    }

    public final zwa h() {
        eh8 eh8VarD = d();
        if (eh8VarD != null) {
            if (!eh8VarD.O0().n) {
                eh8VarD = null;
            }
            if (eh8VarD != null) {
                return sgg.B(eh8VarD, true);
            }
        }
        return zwa.e;
    }

    public final List i(boolean z, boolean z2) {
        if (!z && this.d.d) {
            return ey3.a;
        }
        ArrayList arrayList = new ArrayList();
        if (!o()) {
            return r(arrayList, z2);
        }
        ArrayList arrayList2 = new ArrayList();
        e(arrayList, arrayList2);
        return arrayList2;
    }

    public final txb k() {
        boolean zO = o();
        txb txbVar = this.d;
        if (!zO) {
            return txbVar;
        }
        txb txbVarF = txbVar.f();
        q(new ArrayList(), txbVarF);
        return txbVarF;
    }

    public final zxb l() {
        aq6 aq6VarV;
        zxb zxbVar = this.e;
        if (zxbVar != null) {
            return zxbVar;
        }
        aq6 aq6Var = this.c;
        boolean z = this.b;
        if (z) {
            aq6VarV = aq6Var.v();
            while (aq6VarV != null) {
                txb txbVarX = aq6VarV.x();
                if (txbVarX != null && txbVarX.c) {
                    break;
                }
                aq6VarV = aq6VarV.v();
            }
            aq6VarV = null;
        } else {
            aq6VarV = null;
        }
        if (aq6VarV == null) {
            aq6 aq6VarV2 = aq6Var.v();
            while (true) {
                if (aq6VarV2 == null) {
                    aq6VarV = null;
                    break;
                }
                if (aq6VarV2.F.e(8)) {
                    aq6VarV = aq6VarV2;
                    break;
                }
                aq6VarV2 = aq6VarV2.v();
            }
        }
        if (aq6VarV == null) {
            return null;
        }
        return il7.h(aq6VarV, z);
    }

    public final zwa m() {
        a43 a43VarF = f();
        if (a43VarF == null) {
            return ((l26) this.c.F.d).k1();
        }
        q28 q28Var = ((q28) a43VarF).a;
        Object objG = this.d.a.g(sxb.b);
        if (objG == null) {
            objG = null;
        }
        return dl7.l(q28Var, objG != null, true);
    }

    public final boolean n() {
        return this.e != null;
    }

    public final boolean o() {
        return this.b && this.d.c;
    }

    public final boolean p() {
        if (n() || !j(4, this).isEmpty()) {
            return false;
        }
        aq6 aq6VarV = this.c.v();
        while (true) {
            if (aq6VarV == null) {
                aq6VarV = null;
                break;
            }
            txb txbVarX = aq6VarV.x();
            if (txbVarX != null && txbVarX.c) {
                break;
            }
            aq6VarV = aq6VarV.v();
        }
        return aq6VarV == null;
    }

    public final void q(ArrayList arrayList, txb txbVar) {
        if (this.d.d) {
            return;
        }
        r(arrayList, false);
        int size = arrayList.size();
        for (int size2 = arrayList.size(); size2 < size; size2++) {
            zxb zxbVar = (zxb) arrayList.get(size2);
            if (!zxbVar.o()) {
                txbVar.p(zxbVar.d);
                zxbVar.q(arrayList, txbVar);
            }
        }
    }

    public final List r(ArrayList arrayList, boolean z) {
        if (n()) {
            return ey3.a;
        }
        c(this.c, arrayList);
        if (z) {
            txb txbVar = this.d;
            f78 f78Var = txbVar.a;
            Object objG = f78Var.g(eyb.z);
            if (objG == null) {
                objG = null;
            }
            vkb vkbVar = (vkb) objG;
            if (vkbVar != null && txbVar.c && !arrayList.isEmpty()) {
                arrayList.add(b(vkbVar, new fw8(3, vkbVar)));
            }
            iyb iybVar = eyb.a;
            if (f78Var.c(iybVar) && !arrayList.isEmpty() && txbVar.c) {
                Object objG2 = f78Var.g(iybVar);
                if (objG2 == null) {
                    objG2 = null;
                }
                List list = (List) objG2;
                String str = list != null ? (String) bu1.z0(list) : null;
                if (str != null) {
                    arrayList.add(0, b(null, new fw8(4, str)));
                }
            }
        }
        return arrayList;
    }
}
