package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bk6 {
    public static final bk6 IN;
    public static final bk6 INVARIANT;
    public static final bk6 OUT;
    public static final /* synthetic */ bk6[] a;
    public static final /* synthetic */ i04 b;

    static {
        bk6 bk6Var = new bk6("INVARIANT", 0);
        INVARIANT = bk6Var;
        bk6 bk6Var2 = new bk6("IN", 1);
        IN = bk6Var2;
        bk6 bk6Var3 = new bk6("OUT", 2);
        OUT = bk6Var3;
        bk6[] bk6VarArr = {bk6Var, bk6Var2, bk6Var3};
        a = bk6VarArr;
        b = new i04(bk6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static bk6 valueOf(String str) {
        return (bk6) Enum.valueOf(bk6.class, str);
    }

    public static bk6[] values() {
        return (bk6[]) a.clone();
    }
}
