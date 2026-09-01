package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x73 {
    public static final x73 BASELINE;
    public static final x73 BOTTOM;
    public static final x73 HORIZONTAL_DIMENSION;
    public static final x73 LEFT;
    public static final x73 RIGHT;
    public static final x73 TOP;
    public static final x73 UNKNOWN;
    public static final x73 VERTICAL_DIMENSION;
    public static final /* synthetic */ x73[] a;

    static {
        x73 x73Var = new x73("UNKNOWN", 0);
        UNKNOWN = x73Var;
        x73 x73Var2 = new x73("HORIZONTAL_DIMENSION", 1);
        HORIZONTAL_DIMENSION = x73Var2;
        x73 x73Var3 = new x73("VERTICAL_DIMENSION", 2);
        VERTICAL_DIMENSION = x73Var3;
        x73 x73Var4 = new x73("LEFT", 3);
        LEFT = x73Var4;
        x73 x73Var5 = new x73("RIGHT", 4);
        RIGHT = x73Var5;
        x73 x73Var6 = new x73("TOP", 5);
        TOP = x73Var6;
        x73 x73Var7 = new x73("BOTTOM", 6);
        BOTTOM = x73Var7;
        x73 x73Var8 = new x73("BASELINE", 7);
        BASELINE = x73Var8;
        a = new x73[]{x73Var, x73Var2, x73Var3, x73Var4, x73Var5, x73Var6, x73Var7, x73Var8};
    }

    public static x73 valueOf(String str) {
        return (x73) Enum.valueOf(x73.class, str);
    }

    public static x73[] values() {
        return (x73[]) a.clone();
    }
}
