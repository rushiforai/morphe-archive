package defpackage;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class um8 extends jud {
    public static final dm8 c = new dm8(1, umd.DOUBLE);
    public final ch5 a;
    public final umd b;

    public um8(ch5 ch5Var, umd umdVar) {
        this.a = ch5Var;
        this.b = umdVar;
    }

    public static Serializable e(gd6 gd6Var, jd6 jd6Var) throws IOException {
        int i = tm8.a[jd6Var.ordinal()];
        if (i == 1) {
            gd6Var.f();
            return new ArrayList();
        }
        if (i != 2) {
            return null;
        }
        gd6Var.m();
        return new b17(true);
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        jd6 jd6VarP0 = gd6Var.p0();
        Object objE = e(gd6Var, jd6VarP0);
        if (objE == null) {
            return d(gd6Var, jd6VarP0);
        }
        ArrayDeque arrayDeque = new ArrayDeque();
        while (true) {
            if (gd6Var.hasNext()) {
                String strX = objE instanceof Map ? gd6Var.X() : null;
                jd6 jd6VarP02 = gd6Var.p0();
                Serializable serializableE = e(gd6Var, jd6VarP02);
                boolean z = serializableE != null;
                if (serializableE == null) {
                    serializableE = d(gd6Var, jd6VarP02);
                }
                if (objE instanceof List) {
                    ((List) objE).add(serializableE);
                } else {
                    ((Map) objE).put(strX, serializableE);
                }
                if (z) {
                    arrayDeque.addLast(objE);
                    objE = serializableE;
                }
            } else {
                if (objE instanceof List) {
                    gd6Var.D();
                } else {
                    gd6Var.I();
                }
                if (arrayDeque.isEmpty()) {
                    return objE;
                }
                objE = arrayDeque.removeLast();
            }
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        if (obj == null) {
            yd6Var.Q();
            return;
        }
        jud judVarE = this.a.e(obj.getClass());
        if (!(judVarE instanceof um8)) {
            judVarE.c(yd6Var, obj);
        } else {
            yd6Var.p();
            yd6Var.I();
        }
    }

    public final Serializable d(gd6 gd6Var, jd6 jd6Var) throws IOException {
        int i = tm8.a[jd6Var.ordinal()];
        if (i == 3) {
            return gd6Var.q();
        }
        if (i == 4) {
            return this.b.readNumber(gd6Var);
        }
        if (i == 5) {
            return Boolean.valueOf(gd6Var.nextBoolean());
        }
        if (i == 6) {
            gd6Var.a0();
            return null;
        }
        ik4.o("Unexpected token: ", jd6Var);
        return null;
    }
}
