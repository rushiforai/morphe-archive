package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uo6 {
    public static final uo6 IMAGE;
    public static final uo6 NULL;
    public static final uo6 PRE_COMP;
    public static final uo6 SHAPE;
    public static final uo6 SOLID;
    public static final uo6 TEXT;
    public static final uo6 UNKNOWN;
    public static final /* synthetic */ uo6[] a;

    static {
        uo6 uo6Var = new uo6("PRE_COMP", 0);
        PRE_COMP = uo6Var;
        uo6 uo6Var2 = new uo6("SOLID", 1);
        SOLID = uo6Var2;
        uo6 uo6Var3 = new uo6("IMAGE", 2);
        IMAGE = uo6Var3;
        uo6 uo6Var4 = new uo6("NULL", 3);
        NULL = uo6Var4;
        uo6 uo6Var5 = new uo6("SHAPE", 4);
        SHAPE = uo6Var5;
        uo6 uo6Var6 = new uo6("TEXT", 5);
        TEXT = uo6Var6;
        uo6 uo6Var7 = new uo6("UNKNOWN", 6);
        UNKNOWN = uo6Var7;
        a = new uo6[]{uo6Var, uo6Var2, uo6Var3, uo6Var4, uo6Var5, uo6Var6, uo6Var7};
    }

    public static uo6 valueOf(String str) {
        return (uo6) Enum.valueOf(uo6.class, str);
    }

    public static uo6[] values() {
        return (uo6[]) a.clone();
    }
}
