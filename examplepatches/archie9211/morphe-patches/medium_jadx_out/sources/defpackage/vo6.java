package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vo6 {
    public static final vo6 ADD;
    public static final vo6 INVERT;
    public static final vo6 LUMA;
    public static final vo6 LUMA_INVERTED;
    public static final vo6 NONE;
    public static final vo6 UNKNOWN;
    public static final /* synthetic */ vo6[] a;

    static {
        vo6 vo6Var = new vo6("NONE", 0);
        NONE = vo6Var;
        vo6 vo6Var2 = new vo6("ADD", 1);
        ADD = vo6Var2;
        vo6 vo6Var3 = new vo6("INVERT", 2);
        INVERT = vo6Var3;
        vo6 vo6Var4 = new vo6("LUMA", 3);
        LUMA = vo6Var4;
        vo6 vo6Var5 = new vo6("LUMA_INVERTED", 4);
        LUMA_INVERTED = vo6Var5;
        vo6 vo6Var6 = new vo6("UNKNOWN", 5);
        UNKNOWN = vo6Var6;
        a = new vo6[]{vo6Var, vo6Var2, vo6Var3, vo6Var4, vo6Var5, vo6Var6};
    }

    public static vo6 valueOf(String str) {
        return (vo6) Enum.valueOf(vo6.class, str);
    }

    public static vo6[] values() {
        return (vo6[]) a.clone();
    }
}
