package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v55 extends bec {
    public v55(yv2 yv2Var, v55 v55Var, e41 e41Var, boolean z) {
        super(yv2Var, v55Var, cd7.e, tv8.g, e41Var, jkc.g0);
        this.n = true;
        this.v = z;
        this.w = false;
    }

    @Override // defpackage.bec, defpackage.u55
    public final u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        yv2Var.getClass();
        e41Var.getClass();
        lyVar.getClass();
        return new v55(yv2Var, (v55) s55Var, e41Var, this.v);
    }

    @Override // defpackage.u55
    public final u55 B0(t55 t55Var) throws gxd {
        n98 n98Var;
        v55 v55Var = (v55) super.B0(t55Var);
        if (v55Var == null) {
            return null;
        }
        List listI = v55Var.I();
        listI.getClass();
        if (listI.isEmpty()) {
            return v55Var;
        }
        Iterator it2 = listI.iterator();
        while (it2.hasNext()) {
            mn6 type = ((lqe) it2.next()).getType();
            type.getClass();
            if (vx0.L(type) != null) {
                List listI2 = v55Var.I();
                listI2.getClass();
                ArrayList arrayList = new ArrayList(cu1.k0(listI2, 10));
                Iterator it3 = listI2.iterator();
                while (it3.hasNext()) {
                    mn6 type2 = ((lqe) it3.next()).getType();
                    type2.getClass();
                    arrayList.add(vx0.L(type2));
                }
                int size = v55Var.I().size() - arrayList.size();
                boolean z = true;
                if (size == 0) {
                    List listI3 = v55Var.I();
                    listI3.getClass();
                    ArrayList<f09> arrayListT1 = bu1.t1(listI3, arrayList);
                    if (arrayListT1.isEmpty()) {
                        return v55Var;
                    }
                    for (f09 f09Var : arrayListT1) {
                        if (!g76.L((n98) f09Var.a, ((lqe) f09Var.b).getName())) {
                        }
                    }
                    return v55Var;
                }
                List<lqe> listI4 = v55Var.I();
                listI4.getClass();
                ArrayList arrayList2 = new ArrayList(cu1.k0(listI4, 10));
                for (lqe lqeVar : listI4) {
                    n98 name = lqeVar.getName();
                    name.getClass();
                    int i = lqeVar.g;
                    int i2 = i - size;
                    if (i2 >= 0 && (n98Var = (n98) arrayList.get(i2)) != null) {
                        name = n98Var;
                    }
                    arrayList2.add(lqeVar.y0(v55Var, name, i));
                }
                t55 t55VarE0 = v55Var.E0(ixd.b);
                if (arrayList.isEmpty()) {
                    z = false;
                } else {
                    Iterator it4 = arrayList.iterator();
                    while (it4.hasNext()) {
                        if (((n98) it4.next()) == null) {
                            break;
                        }
                    }
                    z = false;
                }
                t55VarE0.v = Boolean.valueOf(z);
                t55VarE0.g = arrayList2;
                t55VarE0.e = v55Var.a();
                u55 u55VarB0 = super.B0(t55VarE0);
                u55VarB0.getClass();
                return u55VarB0;
            }
        }
        return v55Var;
    }

    @Override // defpackage.u55, defpackage.s55
    public final boolean C() {
        return false;
    }

    @Override // defpackage.u55, defpackage.tu7
    public final boolean isExternal() {
        return false;
    }

    @Override // defpackage.u55, defpackage.s55
    public final boolean isInline() {
        return false;
    }
}
