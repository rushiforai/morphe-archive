package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vjd {
    public final k49 a = qo7.u(null);
    public mx b;
    public final ejc c;

    public vjd(mx mxVar) {
        d3d d3dVar = new d3d(29);
        mxVar.getClass();
        kx kxVar = new kx(mxVar);
        ArrayList arrayList = kxVar.c;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            List list = (List) d3dVar.invoke(((jx) arrayList.get(i)).a(Integer.MIN_VALUE));
            ArrayList arrayList3 = new ArrayList(list.size());
            int size2 = list.size();
            for (int i2 = 0; i2 < size2; i2++) {
                lx lxVar = (lx) list.get(i2);
                arrayList3.add(new jx(lxVar.a, lxVar.b, lxVar.c, lxVar.d));
            }
            bu1.n0(arrayList3, arrayList2);
        }
        arrayList.clear();
        arrayList.addAll(arrayList2);
        this.b = kxVar.i();
        this.c = new ejc();
    }

    public static lx c(lx lxVar, qjd qjdVar) {
        int iC = qjdVar.b.c(r3.f - 1, false);
        if (lxVar.b < iC) {
            return lx.a(lxVar, null, Math.min(lxVar.c, iC), 11);
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r8v2 */
    public final void a(x12 x12Var, int i) {
        int i2;
        char c;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1154651354);
        char c2 = 2;
        int i3 = (p65Var.h(this) ? 4 : 2) | i;
        ?? r8 = 0;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            jt jtVar = (jt) p65Var.j(z22.t);
            mx mxVar = this.b;
            List listA = mxVar.a(mxVar.b.length());
            int size = listA.size();
            int i4 = 0;
            while (i4 < size) {
                lx lxVar = (lx) listA.get(i4);
                int i5 = lxVar.b;
                Object obj = lxVar.a;
                if (i5 != lxVar.c) {
                    p65Var.Y(725478935);
                    Object objM = p65Var.M();
                    Object obj2 = w12.a;
                    if (objM == obj2) {
                        objM = ka1.k(p65Var);
                    }
                    m68 m68Var = (m68) objM;
                    c = c2;
                    r28 r28VarW = xz5.W(o28.b, new pda(this, 27, lxVar));
                    Object objM2 = p65Var.M();
                    if (objM2 == obj2) {
                        objM2 = new tjd((int) r8);
                        p65Var.j0(objM2);
                    }
                    r28 r28VarE = rv8.E(wxb.a(r28VarW, r8, (x45) objM2).b(new ckd(new lt(this, 16, lxVar))), m68Var);
                    pb9.a.getClass();
                    r28 r28VarV = qq7.v(r28VarE, t40.j);
                    boolean zH = p65Var.h(this) | p65Var.f(lxVar) | p65Var.h(jtVar);
                    Object objM3 = p65Var.M();
                    if (zH || objM3 == obj2) {
                        objM3 = new nbb(this, lxVar, jtVar);
                        p65Var.j0(objM3);
                    }
                    dy0.a(hlg.s(r28VarV, m68Var, (m45) objM3), p65Var, 0);
                    d07 d07Var = (d07) obj;
                    wjd wjdVarB = d07Var.b();
                    if (wjdVarB == null || (wjdVarB.a == null && wjdVarB.b == null && wjdVarB.c == null && wjdVarB.d == null)) {
                        i2 = i3;
                        z = 0;
                        p65Var.Y(728331710);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(726303039);
                        Object objM4 = p65Var.M();
                        if (objM4 == obj2) {
                            objM4 = new p07(m68Var);
                            p65Var.j0(objM4);
                        }
                        p07 p07Var = (p07) objM4;
                        Object objM5 = p65Var.M();
                        n92 n92Var = null;
                        if (objM5 == obj2) {
                            objM5 = new xi7(p07Var, n92Var, 27);
                            p65Var.j0(objM5);
                        }
                        kyd.k(p65Var, (b55) objM5, c1e.a);
                        h49 h49Var = p07Var.b;
                        h49 h49Var2 = p07Var.b;
                        Object objValueOf = Boolean.valueOf((h49Var.g() & 2) != 0);
                        Object objValueOf2 = Boolean.valueOf((h49Var2.g() & 1) != 0);
                        Object objValueOf3 = Boolean.valueOf((h49Var2.g() & 4) != 0);
                        wjd wjdVarB2 = d07Var.b();
                        Object obj3 = wjdVarB2 != null ? wjdVarB2.a : null;
                        i2 = i3;
                        wjd wjdVarB3 = d07Var.b();
                        Object obj4 = wjdVarB3 != null ? wjdVarB3.b : null;
                        wjd wjdVarB4 = d07Var.b();
                        Object obj5 = wjdVarB4 != null ? wjdVarB4.c : null;
                        wjd wjdVarB5 = d07Var.b();
                        Object obj6 = wjdVarB5 != null ? wjdVarB5.d : null;
                        Object obj7 = obj5;
                        Object[] objArr = new Object[7];
                        objArr[0] = objValueOf;
                        objArr[1] = objValueOf2;
                        objArr[c] = objValueOf3;
                        objArr[3] = obj3;
                        objArr[4] = obj4;
                        objArr[5] = obj7;
                        objArr[6] = obj6;
                        boolean zH2 = p65Var.h(this) | p65Var.f(lxVar);
                        Object objM6 = p65Var.M();
                        if (zH2 || objM6 == obj2) {
                            objM6 = new pda(this, lxVar, p07Var);
                            p65Var.j0(objM6);
                        }
                        b(objArr, (x45) objM6, p65Var, (i2 << 6) & 896);
                        z = 0;
                        p65Var.p(false);
                    }
                    p65Var.p(z);
                } else {
                    i2 = i3;
                    c = c2;
                    z = r8;
                    p65Var.Y(728345598);
                    p65Var.p(z);
                }
                i4++;
                r8 = z;
                c2 = c;
                i3 = i2;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h9b(i, 26, this);
        }
    }

    public final void b(Object[] objArr, x45 x45Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2083052099);
        int i2 = (i & 48) == 0 ? (p65Var.h(x45Var) ? 32 : 16) | i : i;
        if ((i & 384) == 0) {
            i2 |= p65Var.h(this) ? 256 : 128;
        }
        p65Var.W(-358306546, Integer.valueOf(objArr.length));
        int i3 = i2 | (p65Var.d(objArr.length) ? 4 : 0);
        for (Object obj : objArr) {
            i3 |= p65Var.h(obj) ? 4 : 0;
        }
        p65Var.p(false);
        if ((i3 & 14) == 0) {
            i3 |= 2;
        }
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            nec necVar = new nec(2);
            ArrayList arrayList = (ArrayList) necVar.b;
            necVar.b(x45Var);
            necVar.e(objArr);
            Object[] array = arrayList.toArray(new Object[arrayList.size()]);
            boolean zH = p65Var.h(this) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new cp0(this, x45Var, i4);
                p65Var.j0(objM);
            }
            kyd.j(array, (x45) objM, p65Var);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 15, this, objArr, x45Var);
        }
    }
}
