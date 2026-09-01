package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nh7 {
    public static int a(Object obj, int i, Object obj2) {
        lh7 lh7Var = (lh7) obj;
        jh7 jh7Var = (jh7) obj2;
        int iU = 0;
        if (lh7Var.isEmpty()) {
            return 0;
        }
        for (Map.Entry entry : lh7Var.entrySet()) {
            Object key = entry.getKey();
            Object value = entry.getValue();
            jh7Var.getClass();
            int iH = aq1.h(i);
            ku3 ku3Var = jh7Var.a;
            int iA = yf4.a((j6f) ku3Var.c, 2, value) + yf4.a((j6f) ku3Var.b, 1, key);
            iU = ho2.u(iA, iA, iH, iU);
        }
        return iU;
    }

    public static lh7 b(Object obj, Object obj2) {
        lh7 lh7VarB = (lh7) obj;
        lh7 lh7Var = (lh7) obj2;
        if (!lh7Var.isEmpty()) {
            if (!lh7VarB.a) {
                lh7VarB = lh7VarB.b();
            }
            lh7VarB.a();
            if (!lh7Var.isEmpty()) {
                lh7VarB.putAll(lh7Var);
            }
        }
        return lh7VarB;
    }
}
