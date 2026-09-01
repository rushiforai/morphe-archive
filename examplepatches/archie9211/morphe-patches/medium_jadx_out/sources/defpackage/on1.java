package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.util.TreeMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class on1 extends jb6 {
    public static final n70 d = new n70(1);
    public final hlg a;
    public final nn1[] b;
    public final gg5 c;

    public on1(hlg hlgVar, TreeMap treeMap) {
        this.a = hlgVar;
        this.b = (nn1[]) treeMap.values().toArray(new nn1[treeMap.size()]);
        this.c = gg5.X((String[]) treeMap.keySet().toArray(new String[treeMap.size()]));
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) {
        try {
            Object objJ = this.a.J();
            try {
                hd6Var.m();
                while (hd6Var.hasNext()) {
                    int iN = hd6Var.N(this.c);
                    if (iN == -1) {
                        hd6Var.Q();
                        hd6Var.v();
                    } else {
                        nn1 nn1Var = this.b[iN];
                        nn1Var.b.set(objJ, nn1Var.c.a(hd6Var));
                    }
                }
                hd6Var.B();
                return objJ;
            } catch (IllegalAccessException unused) {
                ywb.d();
                return null;
            }
        } catch (IllegalAccessException unused2) {
            ywb.d();
            return null;
        } catch (InstantiationException e) {
            ik4.j(e);
            return null;
        } catch (InvocationTargetException e2) {
            yoe.i(e2);
            throw null;
        }
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) {
        try {
            zd6Var.m();
            for (nn1 nn1Var : this.b) {
                zd6Var.D(nn1Var.a);
                nn1Var.c.e(zd6Var, nn1Var.b.get(obj));
            }
            zd6Var.p();
        } catch (IllegalAccessException unused) {
            ywb.d();
        }
    }

    public final String toString() {
        return "JsonAdapter(" + this.a + ")";
    }
}
