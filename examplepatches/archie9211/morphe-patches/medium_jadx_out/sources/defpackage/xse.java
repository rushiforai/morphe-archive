package defpackage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xse extends qj1 {
    @Override // defpackage.hj5, defpackage.c62, defpackage.sya
    public final void apply() {
        qpc qpcVar;
        ArrayList arrayList = this.m0;
        Iterator it2 = arrayList.iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            qpcVar = this.k0;
            if (!zHasNext) {
                break;
            } else {
                qpcVar.b(it2.next()).h();
            }
        }
        c62 c62Var = null;
        c62 c62Var2 = null;
        for (Object obj : arrayList) {
            c62 c62VarB = qpcVar.b(obj);
            if (c62Var2 == null) {
                Object obj2 = this.R;
                if (obj2 != null) {
                    c62VarB.p(obj2);
                    c62VarB.k(this.n).m(this.t);
                } else {
                    Object obj3 = this.S;
                    if (obj3 != null) {
                        c62VarB.d0 = mpc.TOP_TO_BOTTOM;
                        c62VarB.S = obj3;
                        c62VarB.k(this.n).m(this.t);
                    } else {
                        String string = c62VarB.a.toString();
                        c62VarB.p(0);
                        c62VarB.l(Float.valueOf(w(string))).n(Float.valueOf(v(string)));
                    }
                }
                c62Var2 = c62VarB;
            }
            if (c62Var != null) {
                String string2 = c62Var.a.toString();
                String string3 = c62VarB.a.toString();
                Object obj4 = c62VarB.a;
                c62Var.d0 = mpc.BOTTOM_TO_TOP;
                c62Var.U = obj4;
                c62Var.l(Float.valueOf(u(string2))).n(Float.valueOf(t(string2)));
                Object obj5 = c62Var.a;
                c62VarB.d0 = mpc.TOP_TO_BOTTOM;
                c62VarB.S = obj5;
                c62VarB.l(Float.valueOf(w(string3))).n(Float.valueOf(v(string3)));
            }
            String string4 = obj.toString();
            HashMap map = this.o0;
            float fFloatValue = map.containsKey(string4) ? ((Float) map.get(string4)).floatValue() : -1.0f;
            if (fFloatValue != -1.0f) {
                c62VarB.g = fFloatValue;
            }
            c62Var = c62VarB;
        }
        if (c62Var != null) {
            Object obj6 = this.U;
            if (obj6 != null) {
                c62Var.d0 = mpc.BOTTOM_TO_TOP;
                c62Var.U = obj6;
                c62Var.k(this.o).m(this.u);
            } else {
                Object obj7 = this.V;
                if (obj7 != null) {
                    c62Var.e(obj7);
                    c62Var.k(this.o).m(this.u);
                } else {
                    String string5 = c62Var.a.toString();
                    c62Var.e(0);
                    c62Var.l(Float.valueOf(u(string5))).n(Float.valueOf(t(string5)));
                }
            }
        }
        if (c62Var2 == null) {
            return;
        }
        float f = this.n0;
        if (f != 0.5f) {
            c62Var2.i = f;
        }
        int i = wse.a[this.t0.ordinal()];
        if (i == 1) {
            c62Var2.e = 0;
        } else if (i == 2) {
            c62Var2.e = 1;
        } else {
            if (i != 3) {
                return;
            }
            c62Var2.e = 2;
        }
    }
}
