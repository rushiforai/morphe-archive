package defpackage;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class jc6 extends jud {
    public static final jc6 a = new jc6();

    private jc6() {
    }

    public static dc6 d(gd6 gd6Var) throws IOException {
        if (gd6Var instanceof od6) {
            od6 od6Var = (od6) gd6Var;
            jd6 jd6VarP0 = od6Var.p0();
            if (jd6VarP0 == jd6.NAME || jd6VarP0 == jd6.END_ARRAY || jd6VarP0 == jd6.END_OBJECT || jd6VarP0 == jd6.END_DOCUMENT) {
                rd6.w("Unexpected ", jd6VarP0, " when reading a JsonElement.");
                return null;
            }
            dc6 dc6Var = (dc6) od6Var.P0();
            od6Var.v();
            return dc6Var;
        }
        jd6 jd6VarP02 = gd6Var.p0();
        dc6 dc6VarF = f(gd6Var, jd6VarP02);
        if (dc6VarF == null) {
            return e(gd6Var, jd6VarP02);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        while (true) {
            if (gd6Var.hasNext()) {
                String strX = dc6VarF instanceof uc6 ? gd6Var.X() : null;
                jd6 jd6VarP03 = gd6Var.p0();
                dc6 dc6VarF2 = f(gd6Var, jd6VarP03);
                boolean z = dc6VarF2 != null;
                if (dc6VarF2 == null) {
                    dc6VarF2 = e(gd6Var, jd6VarP03);
                }
                if (dc6VarF instanceof pb6) {
                    ((pb6) dc6VarF).p(dc6VarF2);
                } else {
                    ((uc6) dc6VarF).p(strX, dc6VarF2);
                }
                if (z) {
                    arrayDeque.addLast(dc6VarF);
                    dc6VarF = dc6VarF2;
                }
            } else {
                if (dc6VarF instanceof pb6) {
                    gd6Var.D();
                } else {
                    gd6Var.I();
                }
                if (arrayDeque.isEmpty()) {
                    return dc6VarF;
                }
                dc6VarF = (dc6) arrayDeque.removeLast();
            }
        }
    }

    public static dc6 e(gd6 gd6Var, jd6 jd6Var) throws IOException {
        int i = ic6.a[jd6Var.ordinal()];
        if (i == 3) {
            return new zc6(gd6Var.q());
        }
        if (i == 4) {
            return new zc6(new uq6(gd6Var.q()));
        }
        if (i == 5) {
            return new zc6(Boolean.valueOf(gd6Var.nextBoolean()));
        }
        if (i == 6) {
            gd6Var.a0();
            return pc6.a;
        }
        ik4.o("Unexpected token: ", jd6Var);
        return null;
    }

    public static dc6 f(gd6 gd6Var, jd6 jd6Var) throws IOException {
        int i = ic6.a[jd6Var.ordinal()];
        if (i == 1) {
            gd6Var.f();
            return new pb6();
        }
        if (i != 2) {
            return null;
        }
        gd6Var.m();
        return new uc6();
    }

    public static void g(yd6 yd6Var, dc6 dc6Var) throws IOException {
        if (dc6Var == null || (dc6Var instanceof pc6)) {
            yd6Var.Q();
            return;
        }
        if (dc6Var instanceof zc6) {
            zc6 zc6Var = (zc6) dc6Var;
            Serializable serializable = zc6Var.a;
            if (serializable instanceof Number) {
                yd6Var.z0(zc6Var.s());
                return;
            } else if (serializable instanceof Boolean) {
                yd6Var.E0(zc6Var.q());
                return;
            } else {
                yd6Var.A0(zc6Var.m());
                return;
            }
        }
        if (dc6Var instanceof pb6) {
            yd6Var.m();
            Iterator it2 = ((pb6) dc6Var).a.iterator();
            while (it2.hasNext()) {
                g(yd6Var, (dc6) it2.next());
            }
            yd6Var.D();
            return;
        }
        if (!(dc6Var instanceof uc6)) {
            z72.d("Couldn't write ", dc6Var.getClass());
            return;
        }
        yd6Var.p();
        Iterator it3 = ((z07) dc6Var.e().a.entrySet()).iterator();
        while (((u07) it3).hasNext()) {
            a17 a17VarB = ((y07) it3).b();
            yd6Var.L((String) a17VarB.getKey());
            g(yd6Var, (dc6) a17VarB.getValue());
        }
        yd6Var.I();
    }

    @Override // defpackage.jud
    public final /* bridge */ /* synthetic */ Object b(gd6 gd6Var) {
        return d(gd6Var);
    }

    @Override // defpackage.jud
    public final /* bridge */ /* synthetic */ void c(yd6 yd6Var, Object obj) throws IOException {
        g(yd6Var, (dc6) obj);
    }
}
