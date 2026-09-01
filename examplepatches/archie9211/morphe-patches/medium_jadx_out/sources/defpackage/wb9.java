package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wb9 {
    public static final wb9 Dispatching;
    public static final wb9 NotDispatching;
    public static final wb9 Unknown;
    public static final /* synthetic */ wb9[] a;
    public static final /* synthetic */ i04 b;

    static {
        wb9 wb9Var = new wb9("Unknown", 0);
        Unknown = wb9Var;
        wb9 wb9Var2 = new wb9("Dispatching", 1);
        Dispatching = wb9Var2;
        wb9 wb9Var3 = new wb9("NotDispatching", 2);
        NotDispatching = wb9Var3;
        wb9[] wb9VarArr = {wb9Var, wb9Var2, wb9Var3};
        a = wb9VarArr;
        b = new i04(wb9VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static wb9 valueOf(String str) {
        return (wb9) Enum.valueOf(wb9.class, str);
    }

    public static wb9[] values() {
        return (wb9[]) a.clone();
    }
}
