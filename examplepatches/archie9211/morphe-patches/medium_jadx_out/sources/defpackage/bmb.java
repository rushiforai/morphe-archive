package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class bmb {
    public static final amb a;

    static {
        b89 b89Var = new b89(50.0f);
        a = new amb(b89Var, b89Var, b89Var, b89Var);
    }

    public static final amb a(float f) {
        wj3 wj3Var = new wj3(f);
        return new amb(wj3Var, wj3Var, wj3Var, wj3Var);
    }

    public static final amb b(float f, float f2, float f3, float f4) {
        return new amb(new wj3(f), new wj3(f2), new wj3(f3), new wj3(f4));
    }

    public static amb c(float f, float f2, float f3, float f4, int i) {
        if ((i & 1) != 0) {
            f = 0.0f;
        }
        if ((i & 2) != 0) {
            f2 = 0.0f;
        }
        if ((i & 4) != 0) {
            f3 = 0.0f;
        }
        if ((i & 8) != 0) {
            f4 = 0.0f;
        }
        return b(f, f2, f3, f4);
    }
}
