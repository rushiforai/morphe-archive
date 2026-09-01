package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gj2 {
    public static final gj2 COLLAPSED;
    public static final gj2 CROSSED;
    public static final gj2 NOT_CROSSED;
    public static final /* synthetic */ gj2[] a;
    public static final /* synthetic */ i04 b;

    static {
        gj2 gj2Var = new gj2("CROSSED", 0);
        CROSSED = gj2Var;
        gj2 gj2Var2 = new gj2("NOT_CROSSED", 1);
        NOT_CROSSED = gj2Var2;
        gj2 gj2Var3 = new gj2("COLLAPSED", 2);
        COLLAPSED = gj2Var3;
        gj2[] gj2VarArr = {gj2Var, gj2Var2, gj2Var3};
        a = gj2VarArr;
        b = new i04(gj2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static gj2 valueOf(String str) {
        return (gj2) Enum.valueOf(gj2.class, str);
    }

    public static gj2[] values() {
        return (gj2[]) a.clone();
    }
}
