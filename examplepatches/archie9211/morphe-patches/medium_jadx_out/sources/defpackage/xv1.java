package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xv1 {
    public static final xv1 a = new xv1();

    public static r28 a(yq0 yq0Var, r28 r28Var) {
        return ka1.i(yq0Var, r28Var);
    }

    public static r28 b(float f, r28 r28Var, boolean z) {
        if (f <= 0.0d) {
            z16.a("invalid weight; must be greater than zero");
        }
        if (f > Float.MAX_VALUE) {
            f = Float.MAX_VALUE;
        }
        return r28Var.b(new sq6(f, z));
    }
}
