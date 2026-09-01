package defpackage;

import android.view.animation.Interpolator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wu {
    public static final hx4 a = hx4.d1("a", "p", "s", "rz", "r", "o", "so", "eo", "sk", "sa", "rx", "ry");
    public static final hx4 b = hx4.d1("k");

    public static void a(qu quVar, bc7 bc7Var) {
        Float fValueOf = Float.valueOf(0.0f);
        List list = (List) quVar.b;
        if (list.isEmpty()) {
            list.add(new uk6(bc7Var, fValueOf, fValueOf, (Interpolator) null, 0.0f, Float.valueOf(bc7Var.m)));
        } else if (((uk6) list.get(0)).b == null) {
            list.set(0, new uk6(bc7Var, fValueOf, fValueOf, (Interpolator) null, 0.0f, Float.valueOf(bc7Var.m)));
        }
    }

    public static boolean b(qu quVar) {
        if (quVar != null) {
            return quVar.b0() && ((Float) ((uk6) ((List) quVar.b).get(0)).b).floatValue() == 0.0f;
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:65:0x0122  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.vu c(defpackage.td6 r27, defpackage.bc7 r28) {
        /*
            Method dump skipped, instruction units count: 432
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wu.c(td6, bc7):vu");
    }
}
