package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum e14 {
    L(1),
    M(0),
    Q(3),
    H(2);

    public static final e14[] b;
    public final int a;

    static {
        e14 e14Var = L;
        e14 e14Var2 = M;
        e14 e14Var3 = Q;
        b = new e14[]{e14Var2, e14Var, H, e14Var3};
    }

    e14(int i) {
        this.a = i;
    }

    public static e14 forBits(int i) {
        if (i >= 0 && i < 4) {
            return b[i];
        }
        lg8.r();
        return null;
    }

    public int getBits() {
        return this.a;
    }
}
