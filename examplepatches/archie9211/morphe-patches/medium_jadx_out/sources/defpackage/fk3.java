package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fk3 {
    public static final fk3 No;
    public static final fk3 NotInitialized;
    public static final fk3 Yes;
    public static final /* synthetic */ fk3[] a;
    public static final /* synthetic */ i04 b;

    static {
        fk3 fk3Var = new fk3("Yes", 0);
        Yes = fk3Var;
        fk3 fk3Var2 = new fk3("No", 1);
        No = fk3Var2;
        fk3 fk3Var3 = new fk3("NotInitialized", 2);
        NotInitialized = fk3Var3;
        fk3[] fk3VarArr = {fk3Var, fk3Var2, fk3Var3};
        a = fk3VarArr;
        b = new i04(fk3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static fk3 valueOf(String str) {
        return (fk3) Enum.valueOf(fk3.class, str);
    }

    public static fk3[] values() {
        return (fk3[]) a.clone();
    }
}
