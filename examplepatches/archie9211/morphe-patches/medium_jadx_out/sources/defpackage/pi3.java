package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pi3 {
    public static final pi3 CENTER;
    public static final pi3 LEFT_ALIGN;
    public static final pi3 RIGHT_ALIGN;
    public static final /* synthetic */ pi3[] a;

    static {
        pi3 pi3Var = new pi3("LEFT_ALIGN", 0);
        LEFT_ALIGN = pi3Var;
        pi3 pi3Var2 = new pi3("RIGHT_ALIGN", 1);
        RIGHT_ALIGN = pi3Var2;
        pi3 pi3Var3 = new pi3("CENTER", 2);
        CENTER = pi3Var3;
        a = new pi3[]{pi3Var, pi3Var2, pi3Var3};
    }

    public static pi3 valueOf(String str) {
        return (pi3) Enum.valueOf(pi3.class, str);
    }

    public static pi3[] values() {
        return (pi3[]) a.clone();
    }
}
