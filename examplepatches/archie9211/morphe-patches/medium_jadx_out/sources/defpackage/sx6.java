package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sx6 {
    public static ux6 a(vx6 vx6Var) {
        vx6Var.getClass();
        int i = rx6.a[vx6Var.ordinal()];
        if (i == 1) {
            return ux6.ON_DESTROY;
        }
        if (i == 2) {
            return ux6.ON_STOP;
        }
        if (i != 3) {
            return null;
        }
        return ux6.ON_PAUSE;
    }

    public static ux6 b(vx6 vx6Var) {
        vx6Var.getClass();
        int i = rx6.a[vx6Var.ordinal()];
        if (i == 1) {
            return ux6.ON_START;
        }
        if (i == 2) {
            return ux6.ON_RESUME;
        }
        if (i != 5) {
            return null;
        }
        return ux6.ON_CREATE;
    }

    public static ux6 c(vx6 vx6Var) {
        vx6Var.getClass();
        int i = rx6.a[vx6Var.ordinal()];
        if (i == 1) {
            return ux6.ON_CREATE;
        }
        if (i == 2) {
            return ux6.ON_START;
        }
        if (i != 3) {
            return null;
        }
        return ux6.ON_RESUME;
    }
}
