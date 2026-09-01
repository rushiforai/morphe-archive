package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pn3 {
    public static final pn3 ASPIRATIONAL;
    public static final pn3 PROGRAMMING;
    public static final /* synthetic */ pn3[] a;
    public static final /* synthetic */ i04 b;

    static {
        pn3 pn3Var = new pn3("ASPIRATIONAL", 0);
        ASPIRATIONAL = pn3Var;
        pn3 pn3Var2 = new pn3("PROGRAMMING", 1);
        PROGRAMMING = pn3Var2;
        pn3[] pn3VarArr = {pn3Var, pn3Var2};
        a = pn3VarArr;
        b = new i04(pn3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static pn3 valueOf(String str) {
        return (pn3) Enum.valueOf(pn3.class, str);
    }

    public static pn3[] values() {
        return (pn3[]) a.clone();
    }
}
