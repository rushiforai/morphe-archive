package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vw8 {
    public static final vw8 COLLAPSED;
    public static final vw8 EXPANDED;
    public static final vw8 NONE;
    public static final /* synthetic */ vw8[] a;
    public static final /* synthetic */ i04 b;

    static {
        vw8 vw8Var = new vw8("NONE", 0);
        NONE = vw8Var;
        vw8 vw8Var2 = new vw8("COLLAPSED", 1);
        COLLAPSED = vw8Var2;
        vw8 vw8Var3 = new vw8("EXPANDED", 2);
        EXPANDED = vw8Var3;
        vw8[] vw8VarArr = {vw8Var, vw8Var2, vw8Var3};
        a = vw8VarArr;
        b = new i04(vw8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static vw8 valueOf(String str) {
        return (vw8) Enum.valueOf(vw8.class, str);
    }

    public static vw8[] values() {
        return (vw8[]) a.clone();
    }
}
