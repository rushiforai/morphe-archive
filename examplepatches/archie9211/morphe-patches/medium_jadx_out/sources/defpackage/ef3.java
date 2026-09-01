package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ef3 {
    public static final ef3 Both;
    public static final ef3 Horizontal;
    public static final ef3 Vertical;
    public static final /* synthetic */ ef3[] a;
    public static final /* synthetic */ i04 b;

    static {
        ef3 ef3Var = new ef3("Vertical", 0);
        Vertical = ef3Var;
        ef3 ef3Var2 = new ef3("Horizontal", 1);
        Horizontal = ef3Var2;
        ef3 ef3Var3 = new ef3("Both", 2);
        Both = ef3Var3;
        ef3[] ef3VarArr = {ef3Var, ef3Var2, ef3Var3};
        a = ef3VarArr;
        b = new i04(ef3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ef3 valueOf(String str) {
        return (ef3) Enum.valueOf(ef3.class, str);
    }

    public static ef3[] values() {
        return (ef3[]) a.clone();
    }
}
