package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z06 {
    public static final z06 No;
    public static final z06 NotInitialized;
    public static final z06 Yes;
    public static final /* synthetic */ z06[] a;
    public static final /* synthetic */ i04 b;

    static {
        z06 z06Var = new z06("Yes", 0);
        Yes = z06Var;
        z06 z06Var2 = new z06("No", 1);
        No = z06Var2;
        z06 z06Var3 = new z06("NotInitialized", 2);
        NotInitialized = z06Var3;
        z06[] z06VarArr = {z06Var, z06Var2, z06Var3};
        a = z06VarArr;
        b = new i04(z06VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static z06 valueOf(String str) {
        return (z06) Enum.valueOf(z06.class, str);
    }

    public static z06[] values() {
        return (z06[]) a.clone();
    }
}
