package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f73 {
    public static b1 a(z63 z63Var) {
        z63Var.getClass();
        z26 z26Var = (z26) ((Map) g73.b.getValue()).get(z63Var.a());
        if (z26Var == null) {
            return null;
        }
        switch (z26Var.b) {
            case 0:
                z63Var.getClass();
                return new a36(z26Var.a, (g63) z63Var);
            case 1:
                z63Var.getClass();
                return new a36(z26Var.a, (h63) z63Var);
            case 2:
                z63Var.getClass();
                return new k4b(z26Var.a, (k63) z63Var);
            case 3:
                z63Var.getClass();
                return new k4b(z26Var.a, (l63) z63Var);
            case 4:
                z63Var.getClass();
                return new e4e(z26Var.a, (p63) z63Var, 0);
            case 5:
                z63Var.getClass();
                return new e4e(z26Var.a, (q63) z63Var, 1);
            case 6:
                z63Var.getClass();
                return new a36(z26Var.a, (s63) z63Var);
            case 7:
                z63Var.getClass();
                return new e4e(z26Var.a, (t63) z63Var, 2);
            case 8:
                z63Var.getClass();
                return new a36(z26Var.a, (v63) z63Var);
            case 9:
                z63Var.getClass();
                return new e4e(z26Var.a, (x63) z63Var, 3);
            default:
                z63Var.getClass();
                return new e4e(z26Var.a, (y63) z63Var, 4);
        }
    }
}
