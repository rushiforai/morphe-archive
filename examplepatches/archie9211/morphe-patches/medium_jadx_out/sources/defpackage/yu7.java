package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yu7 {
    public final sj0 a;
    public final lig b;

    public yu7(sj0 sj0Var) {
        this.a = sj0Var;
        i93 i93Var = (i93) sj0Var.a;
        this.b = new lig(i93Var.b, i93Var.l);
    }

    public final j7a a(yv2 yv2Var) {
        if (yv2Var instanceof wx8) {
            y05 y05Var = ((xx8) ((wx8) yv2Var)).f;
            sj0 sj0Var = this.a;
            return new i7a(y05Var, (p98) sj0Var.b, (wjc) sj0Var.d, (u93) sj0Var.g);
        }
        if (yv2Var instanceof s93) {
            return ((s93) yv2Var).u;
        }
        return null;
    }

    public final ArrayList b(List list, List list2, q1 q1Var, hx hxVar) {
        yu7 yu7Var = this;
        sj0 sj0Var = yu7Var.a;
        yv2 yv2Var = (yv2) sj0Var.c;
        yv2Var.getClass();
        c41 c41Var = (c41) yv2Var;
        yv2 yv2VarH = c41Var.h();
        yv2VarH.getClass();
        j7a j7aVarA = yu7Var.a(yv2VarH);
        ArrayList arrayList = new ArrayList();
        int i = 0;
        for (Object obj : list) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            s6a s6aVar = (s6a) obj;
            a7a a7aVar = (a7a) bu1.A0(i, list2);
            yq6 yq6VarM = kng.m(c41Var, ((jz1) sj0Var.h).G(s6aVar), null, (j7aVarA == null || !cm4.c.d((a7aVar == null || (a7aVar.c & 1) != 1) ? 0 : a7aVar.d).booleanValue()) ? cd7.e : new mh8(((i93) sj0Var.a).a, new xu7(yu7Var, j7aVarA, q1Var, hxVar, i, a7aVar, 1)), i);
            if (yq6VarM != null) {
                arrayList.add(yq6VarM);
            }
            yu7Var = this;
            i = i2;
        }
        return arrayList;
    }

    public final ly c(q1 q1Var, int i, hx hxVar) {
        return !cm4.c.d(i).booleanValue() ? cd7.e : new mh8(((i93) this.a.a).a, new vu7(this, q1Var, hxVar, 0));
    }

    public final ly d(i6a i6aVar, boolean z) {
        return !cm4.c.d(i6aVar.d).booleanValue() ? cd7.e : new mh8(((i93) this.a.a).a, new wu7(this, z, i6aVar));
    }

    public final l93 e(n5a n5aVar, boolean z) {
        g93 g93Var;
        sj0 sj0Var = this.a;
        yv2 yv2Var = (yv2) sj0Var.c;
        yv2Var.getClass();
        y28 y28Var = (y28) yv2Var;
        int i = n5aVar.d;
        hx hxVar = hx.FUNCTION;
        l93 l93Var = new l93(y28Var, null, c(n5aVar, i, hxVar), z, e41.DECLARATION, n5aVar, (p98) sj0Var.b, (wjc) sj0Var.d, (kse) sj0Var.e, (u93) sj0Var.g, null);
        yu7 yu7Var = (yu7) sj0Var.a(l93Var, ey3.a, (p98) sj0Var.b, (wjc) sj0Var.d, (kse) sj0Var.e, (mr0) sj0Var.f).i;
        List list = n5aVar.e;
        list.getClass();
        List listH = yu7Var.h(list, n5aVar, hxVar);
        g7a g7aVar = (g7a) cm4.d.d(n5aVar.d);
        switch (g7aVar == null ? -1 : o7a.b[g7aVar.ordinal()]) {
            case 1:
                g93Var = h93.d;
                g93Var.getClass();
                break;
            case 2:
                g93Var = h93.a;
                g93Var.getClass();
                break;
            case 3:
                g93Var = h93.b;
                g93Var.getClass();
                break;
            case 4:
                g93Var = h93.c;
                g93Var.getClass();
                break;
            case 5:
                g93Var = h93.e;
                g93Var.getClass();
                break;
            case 6:
                g93Var = h93.f;
                g93Var.getClass();
                break;
            default:
                g93Var = h93.a;
                g93Var.getClass();
                break;
        }
        l93Var.L0(listH, g93Var);
        l93Var.H0(y28Var.T());
        l93Var.s = y28Var.y();
        l93Var.w = !cm4.o.d(n5aVar.d).booleanValue();
        return l93Var;
    }

    public final ga3 f(a6a a6aVar) {
        int i;
        mn6 mn6VarG;
        sj0 sj0Var = this.a;
        p98 p98Var = (p98) sj0Var.b;
        wjc wjcVar = (wjc) sj0Var.d;
        int i2 = 1;
        if ((a6aVar.c & 1) == 1) {
            i = a6aVar.d;
        } else {
            int i3 = a6aVar.e;
            i = ((i3 >> 8) << 6) + (i3 & 63);
        }
        int i4 = i;
        hx hxVar = hx.FUNCTION;
        ly lyVarC = c(a6aVar, i4, hxVar);
        int i5 = a6aVar.c;
        ly j93Var = ((i5 & 32) == 32 || (i5 & 64) == 64) ? new j93(((i93) sj0Var.a).a, new vu7(this, a6aVar, hxVar, i2)) : cd7.e;
        ga3 ga3Var = new ga3((yv2) sj0Var.c, null, lyVarC, vn7.C(p98Var, a6aVar.f), en7.J((b6a) cm4.p.d(i4)), a6aVar, (p98) sj0Var.b, wjcVar, f93.g((yv2) sj0Var.c).a(vn7.C(p98Var, a6aVar.f)).equals(n4d.a) ? kse.b : (kse) sj0Var.e, (u93) sj0Var.g, null);
        List list = a6aVar.i;
        list.getClass();
        sj0 sj0VarA = sj0Var.a(ga3Var, list, (p98) sj0Var.b, (wjc) sj0Var.d, (kse) sj0Var.e, (mr0) sj0Var.f);
        yu7 yu7Var = (yu7) sj0VarA.i;
        jz1 jz1Var = (jz1) sj0VarA.h;
        s6a s6aVarQ = vn7.Q(a6aVar, wjcVar);
        yq6 yq6VarS = (s6aVarQ == null || (mn6VarG = jz1Var.G(s6aVarQ)) == null) ? null : kng.s(ga3Var, mn6VarG, j93Var);
        yv2 yv2Var = (yv2) sj0Var.c;
        y28 y28Var = yv2Var instanceof y28 ? (y28) yv2Var : null;
        yq6 yq6VarK0 = y28Var != null ? y28Var.k0() : null;
        List listK = vn7.k(a6aVar, wjcVar);
        List list2 = a6aVar.o;
        list2.getClass();
        ArrayList arrayListB = yu7Var.b(listK, list2, a6aVar, hxVar);
        List listU = jz1Var.u();
        List list3 = a6aVar.p;
        list3.getClass();
        ga3Var.L0(yq6VarS, yq6VarK0, arrayListB, listU, yu7Var.h(list3, a6aVar, hxVar), jz1Var.G(vn7.U(a6aVar, wjcVar)), zi5.m((c6a) cm4.e.d(i4)), en7.t((g7a) cm4.d.d(i4)), fy3.a);
        ga3Var.n = cm4.q.d(i4).booleanValue();
        ga3Var.o = cm4.r.d(i4).booleanValue();
        ga3Var.p = cm4.u.d(i4).booleanValue();
        ga3Var.q = cm4.s.d(i4).booleanValue();
        ga3Var.r = cm4.t.d(i4).booleanValue();
        ga3Var.v = cm4.v.d(i4).booleanValue();
        ga3Var.s = cm4.w.d(i4).booleanValue();
        ga3Var.w = !cm4.x.d(i4).booleanValue();
        ((i93) sj0Var.a).m.getClass();
        return ga3Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0156  */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6, types: [y28] */
    /* JADX WARN: Type inference failed for: r14v6 */
    /* JADX WARN: Type inference failed for: r14v7, types: [yu7] */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r3v12, types: [boolean] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.fa3 g(defpackage.i6a r36, boolean r37) {
        /*
            Method dump skipped, instruction units count: 795
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu7.g(i6a, boolean):fa3");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r21v0 */
    /* JADX WARN: Type inference failed for: r21v1, types: [mn6] */
    /* JADX WARN: Type inference failed for: r21v2 */
    public final List h(List list, q1 q1Var, hx hxVar) {
        int i;
        s6a s6aVar;
        ly mh8Var;
        yu7 yu7Var = this;
        sj0 sj0Var = yu7Var.a;
        wjc wjcVar = (wjc) sj0Var.d;
        jz1 jz1Var = (jz1) sj0Var.h;
        yv2 yv2Var = (yv2) sj0Var.c;
        yv2Var.getClass();
        c41 c41Var = (c41) yv2Var;
        yv2 yv2VarH = c41Var.h();
        yv2VarH.getClass();
        j7a j7aVarA = yu7Var.a(yv2VarH);
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        int i2 = 0;
        for (Object obj : list) {
            int i3 = i2 + 1;
            if (i2 < 0) {
                d46.i0();
                throw null;
            }
            a7a a7aVar = (a7a) obj;
            int i4 = (a7aVar.c & 1) == 1 ? a7aVar.d : 0;
            if (j7aVarA == null || !cm4.c.d(i4).booleanValue()) {
                i = i2;
                s6aVar = null;
                mh8Var = cd7.e;
            } else {
                i = i2;
                s6aVar = null;
                mh8Var = new mh8(((i93) sj0Var.a).a, new xu7(yu7Var, j7aVarA, q1Var, hxVar, i, a7aVar, 0));
            }
            n98 n98VarC = vn7.C((p98) sj0Var.b, a7aVar.e);
            mn6 mn6VarG = jz1Var.G(vn7.f0(a7aVar, wjcVar));
            boolean zBooleanValue = cm4.H.d(i4).booleanValue();
            boolean zBooleanValue2 = cm4.I.d(i4).booleanValue();
            boolean zBooleanValue3 = cm4.J.d(i4).booleanValue();
            int i5 = a7aVar.c;
            s6a s6aVarF = (i5 & 16) == 16 ? a7aVar.h : (i5 & 32) == 32 ? wjcVar.f(a7aVar.i) : s6aVar;
            ?? G = s6aVarF != null ? jz1Var.G(s6aVarF) : s6aVar;
            ArrayList arrayList2 = arrayList;
            arrayList2.add(new lqe(c41Var, null, i, mh8Var, n98VarC, mn6VarG, zBooleanValue, zBooleanValue2, zBooleanValue3, G, jkc.g0));
            arrayList = arrayList2;
            i2 = i3;
            yu7Var = this;
        }
        return bu1.m1(arrayList);
    }
}
