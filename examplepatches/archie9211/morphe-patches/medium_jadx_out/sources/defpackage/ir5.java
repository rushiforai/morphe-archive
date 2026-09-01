package defpackage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ir5 extends qj1 {
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
                qpcVar.b(it2.next()).g();
            }
        }
        c62 c62Var = null;
        c62 c62Var2 = null;
        for (Object obj : arrayList) {
            c62 c62VarB = qpcVar.b(obj);
            if (c62Var2 == null) {
                Object obj2 = this.N;
                if (obj2 != null) {
                    c62VarB.o(obj2);
                    c62VarB.k(this.l).m(this.r);
                } else {
                    Object obj3 = this.O;
                    if (obj3 != null) {
                        c62VarB.d0 = mpc.START_TO_END;
                        c62VarB.O = obj3;
                        c62VarB.k(this.l).m(this.r);
                    } else {
                        Object obj4 = this.J;
                        if (obj4 != null) {
                            c62VarB.o(obj4);
                            c62VarB.k(this.j).m(this.p);
                        } else {
                            Object obj5 = this.K;
                            if (obj5 != null) {
                                c62VarB.d0 = mpc.START_TO_END;
                                c62VarB.O = obj5;
                                c62VarB.k(this.j).m(this.p);
                            } else {
                                String string = c62VarB.a.toString();
                                c62VarB.o(0);
                                c62VarB.l(Float.valueOf(w(string))).n(Float.valueOf(v(string)));
                            }
                        }
                    }
                }
                c62Var2 = c62VarB;
            }
            if (c62Var != null) {
                String string2 = c62Var.a.toString();
                String string3 = c62VarB.a.toString();
                Object obj6 = c62VarB.a;
                c62Var.d0 = mpc.END_TO_START;
                c62Var.P = obj6;
                c62Var.l(Float.valueOf(u(string2))).n(Float.valueOf(t(string2)));
                Object obj7 = c62Var.a;
                c62VarB.d0 = mpc.START_TO_END;
                c62VarB.O = obj7;
                c62VarB.l(Float.valueOf(w(string3))).n(Float.valueOf(v(string3)));
            }
            String string4 = obj.toString();
            HashMap map = this.o0;
            float fFloatValue = map.containsKey(string4) ? ((Float) map.get(string4)).floatValue() : -1.0f;
            if (fFloatValue != -1.0f) {
                c62VarB.f = fFloatValue;
            }
            c62Var = c62VarB;
        }
        if (c62Var != null) {
            Object obj8 = this.P;
            if (obj8 != null) {
                c62Var.d0 = mpc.END_TO_START;
                c62Var.P = obj8;
                c62Var.k(this.m).m(this.s);
            } else {
                Object obj9 = this.Q;
                if (obj9 != null) {
                    c62Var.i(obj9);
                    c62Var.k(this.m).m(this.s);
                } else {
                    Object obj10 = this.L;
                    if (obj10 != null) {
                        c62Var.d0 = mpc.END_TO_START;
                        c62Var.P = obj10;
                        c62Var.k(this.k).m(this.q);
                    } else {
                        Object obj11 = this.M;
                        if (obj11 != null) {
                            c62Var.i(obj11);
                            c62Var.k(this.k).m(this.q);
                        } else {
                            String string5 = c62Var.a.toString();
                            c62Var.i(0);
                            c62Var.l(Float.valueOf(u(string5))).n(Float.valueOf(t(string5)));
                        }
                    }
                }
            }
        }
        if (c62Var2 == null) {
            return;
        }
        float f = this.n0;
        if (f != 0.5f) {
            c62Var2.h = f;
        }
        int i = hr5.a[this.t0.ordinal()];
        if (i == 1) {
            c62Var2.d = 0;
        } else if (i == 2) {
            c62Var2.d = 1;
        } else {
            if (i != 3) {
                return;
            }
            c62Var2.d = 2;
        }
    }
}
