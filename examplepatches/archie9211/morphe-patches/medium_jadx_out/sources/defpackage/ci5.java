package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ci5 {
    public static final ci5 Cursor;
    public static final ci5 None;
    public static final ci5 Selection;
    public static final /* synthetic */ ci5[] a;
    public static final /* synthetic */ i04 b;

    static {
        ci5 ci5Var = new ci5("None", 0);
        None = ci5Var;
        ci5 ci5Var2 = new ci5("Selection", 1);
        Selection = ci5Var2;
        ci5 ci5Var3 = new ci5("Cursor", 2);
        Cursor = ci5Var3;
        ci5[] ci5VarArr = {ci5Var, ci5Var2, ci5Var3};
        a = ci5VarArr;
        b = new i04(ci5VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ci5 valueOf(String str) {
        return (ci5) Enum.valueOf(ci5.class, str);
    }

    public static ci5[] values() {
        return (ci5[]) a.clone();
    }
}
