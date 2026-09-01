package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z66 {
    public static final z66 Max;
    public static final z66 Min;
    public static final /* synthetic */ z66[] a;
    public static final /* synthetic */ i04 b;

    static {
        z66 z66Var = new z66("Min", 0);
        Min = z66Var;
        z66 z66Var2 = new z66("Max", 1);
        Max = z66Var2;
        z66[] z66VarArr = {z66Var, z66Var2};
        a = z66VarArr;
        b = new i04(z66VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static z66 valueOf(String str) {
        return (z66) Enum.valueOf(z66.class, str);
    }

    public static z66[] values() {
        return (z66[]) a.clone();
    }
}
