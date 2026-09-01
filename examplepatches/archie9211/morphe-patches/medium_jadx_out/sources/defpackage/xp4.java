package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xp4 {
    public static final xp4 Clip;
    public static final xp4 ExpandIndicator;
    public static final xp4 ExpandOrCollapseIndicator;
    public static final xp4 Visible;
    public static final /* synthetic */ xp4[] a;
    public static final /* synthetic */ i04 b;

    static {
        xp4 xp4Var = new xp4("Visible", 0);
        Visible = xp4Var;
        xp4 xp4Var2 = new xp4("Clip", 1);
        Clip = xp4Var2;
        xp4 xp4Var3 = new xp4("ExpandIndicator", 2);
        ExpandIndicator = xp4Var3;
        xp4 xp4Var4 = new xp4("ExpandOrCollapseIndicator", 3);
        ExpandOrCollapseIndicator = xp4Var4;
        xp4[] xp4VarArr = {xp4Var, xp4Var2, xp4Var3, xp4Var4};
        a = xp4VarArr;
        b = new i04(xp4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static xp4 valueOf(String str) {
        return (xp4) Enum.valueOf(xp4.class, str);
    }

    public static xp4[] values() {
        return (xp4[]) a.clone();
    }
}
