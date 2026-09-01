package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k52 {
    public static final k52 BASELINE;
    public static final k52 BOTTOM;
    public static final k52 CENTER;
    public static final k52 CENTER_X;
    public static final k52 CENTER_Y;
    public static final k52 LEFT;
    public static final k52 NONE;
    public static final k52 RIGHT;
    public static final k52 TOP;
    public static final /* synthetic */ k52[] a;

    static {
        k52 k52Var = new k52("NONE", 0);
        NONE = k52Var;
        k52 k52Var2 = new k52("LEFT", 1);
        LEFT = k52Var2;
        k52 k52Var3 = new k52("TOP", 2);
        TOP = k52Var3;
        k52 k52Var4 = new k52("RIGHT", 3);
        RIGHT = k52Var4;
        k52 k52Var5 = new k52("BOTTOM", 4);
        BOTTOM = k52Var5;
        k52 k52Var6 = new k52("BASELINE", 5);
        BASELINE = k52Var6;
        k52 k52Var7 = new k52("CENTER", 6);
        CENTER = k52Var7;
        k52 k52Var8 = new k52("CENTER_X", 7);
        CENTER_X = k52Var8;
        k52 k52Var9 = new k52("CENTER_Y", 8);
        CENTER_Y = k52Var9;
        a = new k52[]{k52Var, k52Var2, k52Var3, k52Var4, k52Var5, k52Var6, k52Var7, k52Var8, k52Var9};
    }

    public static k52 valueOf(String str) {
        return (k52) Enum.valueOf(k52.class, str);
    }

    public static k52[] values() {
        return (k52[]) a.clone();
    }
}
