package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gv2 {
    public static final gv2 BILLING;
    public static final gv2 GRAPHQL;
    public static final gv2 MEDIUM2_API;
    public static final gv2 SUSI;
    public static final /* synthetic */ gv2[] a;
    public static final /* synthetic */ i04 b;

    static {
        gv2 gv2Var = new gv2("GRAPHQL", 0);
        GRAPHQL = gv2Var;
        gv2 gv2Var2 = new gv2("SUSI", 1);
        SUSI = gv2Var2;
        gv2 gv2Var3 = new gv2("MEDIUM2_API", 2);
        MEDIUM2_API = gv2Var3;
        gv2 gv2Var4 = new gv2("BILLING", 3);
        BILLING = gv2Var4;
        gv2[] gv2VarArr = {gv2Var, gv2Var2, gv2Var3, gv2Var4};
        a = gv2VarArr;
        b = new i04(gv2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static gv2 valueOf(String str) {
        return (gv2) Enum.valueOf(gv2.class, str);
    }

    public static gv2[] values() {
        return (gv2[]) a.clone();
    }
}
