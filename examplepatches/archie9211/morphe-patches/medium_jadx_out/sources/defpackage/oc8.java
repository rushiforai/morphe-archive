package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oc8 {
    public final xpc a = vv2.j(pc8.d);
    public final xpc b;
    public final wua c;
    public final m70 d;
    public final m70 e;
    public lc8 f;
    public int g;
    public nc8 h;
    public final LinkedHashSet i;
    public final LinkedHashSet j;
    public final LinkedHashSet k;
    public boolean l;
    public boolean m;
    public boolean n;

    public oc8() {
        xpc xpcVarJ = vv2.j(new mc8());
        this.b = xpcVarJ;
        this.c = bo.A(xpcVarJ);
        this.d = new m70();
        this.e = new m70();
        this.i = new LinkedHashSet();
        this.j = new LinkedHashSet();
        this.k = new LinkedHashSet();
    }

    public final void a(jc8 jc8Var, nc8 nc8Var, int i) {
        jc8Var.getClass();
        if (nc8Var.a == null) {
            (i != 0 ? i != 1 ? this.i : this.j : this.k).add(nc8Var);
            nc8Var.a = jc8Var;
            ((mc8) this.c.a.getValue()).getClass();
            nc8Var.b(i != 0 ? i != 1 ? this.n : this.l : this.m);
            return;
        }
        StringBuilder sb = new StringBuilder("Input '");
        sb.append(nc8Var);
        jc8 jc8Var2 = nc8Var.a;
        sb.append("' is already added to dispatcher ");
        sb.append(jc8Var2);
        sb.append('.');
        throw new IllegalArgumentException(sb.toString().toString());
    }

    public final void b() {
        boolean z;
        boolean z2;
        mc8 mc8Var;
        m70 m70Var = this.d;
        if (m70Var.isEmpty()) {
            z = false;
        } else {
            Iterator it2 = m70Var.iterator();
            while (it2.hasNext()) {
                if (((lc8) it2.next()).b) {
                    z = true;
                    break;
                }
            }
            z = false;
        }
        m70 m70Var2 = this.e;
        if (m70Var2.isEmpty()) {
            z2 = false;
        } else {
            Iterator it3 = m70Var2.iterator();
            while (it3.hasNext()) {
                if (((lc8) it3.next()).b) {
                    z2 = true;
                    break;
                }
            }
            z2 = false;
        }
        boolean z3 = z || z2;
        boolean z4 = this.m != z;
        boolean z5 = this.l != z2;
        boolean z6 = this.n != z3;
        LinkedHashSet linkedHashSet = this.k;
        if (z4) {
            Iterator it4 = linkedHashSet.iterator();
            while (it4.hasNext()) {
                ((nc8) it4.next()).b(z);
            }
        }
        LinkedHashSet linkedHashSet2 = this.j;
        if (z5) {
            Iterator it5 = linkedHashSet2.iterator();
            while (it5.hasNext()) {
                ((nc8) it5.next()).b(z2);
            }
        }
        LinkedHashSet linkedHashSet3 = this.i;
        if (z6) {
            Iterator it6 = linkedHashSet3.iterator();
            while (it6.hasNext()) {
                ((nc8) it6.next()).b(z3);
            }
        }
        this.m = z;
        this.l = z2;
        this.n = z3;
        lc8 lc8VarC = this.f;
        if (lc8VarC == null) {
            lc8VarC = c(0);
        }
        lc8 lc8VarC2 = this.f;
        if (lc8VarC2 == null) {
            lc8VarC2 = c(0);
        }
        if (g76.L(lc8VarC2, lc8VarC)) {
            if (lc8VarC2 == null) {
                mc8Var = new mc8();
            } else {
                ArrayList arrayList = new ArrayList();
                Iterator<E> it7 = m70Var.iterator();
                while (it7.hasNext()) {
                    boolean z7 = ((lc8) it7.next()).b;
                }
                Iterator<E> it8 = m70Var2.iterator();
                while (it8.hasNext()) {
                    boolean z8 = ((lc8) it8.next()).b;
                }
                vp7 vp7Var = lc8VarC2.a;
                f17 f17VarB = d46.B();
                bu1.n0(arrayList, f17VarB);
                f17VarB.add(vp7Var);
                bu1.n0(ey3.a, f17VarB);
                mc8Var = new mc8(d46.w(f17VarB), arrayList.size());
            }
            xpc xpcVar = this.b;
            if (g76.L((mc8) xpcVar.getValue(), mc8Var)) {
                return;
            }
            xpcVar.m(null, mc8Var);
            Iterator it9 = linkedHashSet.iterator();
            while (it9.hasNext()) {
                ((nc8) it9.next()).getClass();
            }
            Iterator it10 = linkedHashSet2.iterator();
            while (it10.hasNext()) {
                ((nc8) it10.next()).getClass();
            }
            Iterator it11 = linkedHashSet3.iterator();
            while (it11.hasNext()) {
                ((nc8) it11.next()).getClass();
            }
        }
    }

    public final lc8 c(int i) {
        Object next;
        Object next2;
        m70 m70Var = this.e;
        m70 m70Var2 = this.d;
        Object obj = null;
        if (i == -1) {
            Iterator it2 = m70Var2.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (((lc8) next).b) {
                    break;
                }
            }
            lc8 lc8Var = (lc8) next;
            if (lc8Var != null) {
                return lc8Var;
            }
            Iterator it3 = m70Var.iterator();
            while (true) {
                if (!it3.hasNext()) {
                    break;
                }
                Object next3 = it3.next();
                if (((lc8) next3).b) {
                    obj = next3;
                    break;
                }
            }
            return (lc8) obj;
        }
        if (i != 0) {
            if (i != 1) {
                throw new IllegalStateException(("Unsupported direction: '" + i + "'.").toString());
            }
            Iterator it4 = m70Var2.iterator();
            while (it4.hasNext()) {
                ((lc8) it4.next()).getClass();
            }
            Iterator it5 = m70Var.iterator();
            while (it5.hasNext()) {
                ((lc8) it5.next()).getClass();
            }
            return null;
        }
        Iterator it6 = m70Var2.iterator();
        while (true) {
            if (!it6.hasNext()) {
                next2 = null;
                break;
            }
            next2 = it6.next();
            if (((lc8) next2).b) {
                break;
            }
        }
        lc8 lc8Var2 = (lc8) next2;
        if (lc8Var2 != null) {
            return lc8Var2;
        }
        Iterator it7 = m70Var.iterator();
        while (true) {
            if (!it7.hasNext()) {
                break;
            }
            Object next4 = it7.next();
            if (((lc8) next4).b) {
                obj = next4;
                break;
            }
        }
        return (lc8) obj;
    }
}
