package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n69 {
    public static final n69 Applied;
    public static final n69 ApplyPending;
    public static final n69 Cancelled;
    public static final n69 InitialPending;
    public static final n69 Invalid;
    public static final n69 RecomposePending;
    public static final n69 Recomposing;
    public static final /* synthetic */ n69[] a;
    public static final /* synthetic */ i04 b;

    static {
        n69 n69Var = new n69("Invalid", 0);
        Invalid = n69Var;
        n69 n69Var2 = new n69("Cancelled", 1);
        Cancelled = n69Var2;
        n69 n69Var3 = new n69("InitialPending", 2);
        InitialPending = n69Var3;
        n69 n69Var4 = new n69("RecomposePending", 3);
        RecomposePending = n69Var4;
        n69 n69Var5 = new n69("Recomposing", 4);
        Recomposing = n69Var5;
        n69 n69Var6 = new n69("ApplyPending", 5);
        ApplyPending = n69Var6;
        n69 n69Var7 = new n69("Applied", 6);
        Applied = n69Var7;
        n69[] n69VarArr = {n69Var, n69Var2, n69Var3, n69Var4, n69Var5, n69Var6, n69Var7};
        a = n69VarArr;
        b = new i04(n69VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static n69 valueOf(String str) {
        return (n69) Enum.valueOf(n69.class, str);
    }

    public static n69[] values() {
        return (n69[]) a.clone();
    }
}
