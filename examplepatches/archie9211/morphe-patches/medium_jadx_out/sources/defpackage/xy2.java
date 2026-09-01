package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class xy2 {
    public static final x33 a;

    static {
        String property;
        x33 x33Var;
        int i = a7d.a;
        try {
            property = System.getProperty("kotlinx.coroutines.main.delay");
        } catch (SecurityException unused) {
            property = null;
        }
        if (property != null ? Boolean.parseBoolean(property) : false) {
            r13 r13Var = xg3.a;
            ei5 ei5Var = ff7.a;
            ei5 ei5Var2 = ei5Var.f;
            x33Var = ei5Var;
            if (ei5Var == null) {
                x33Var = wy2.k;
            }
        } else {
            x33Var = wy2.k;
        }
        a = x33Var;
    }
}
