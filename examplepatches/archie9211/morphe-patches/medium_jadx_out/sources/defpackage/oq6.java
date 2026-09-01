package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oq6 {
    public static final oq6 Horizontal;
    public static final oq6 Vertical;
    public static final /* synthetic */ oq6[] a;
    public static final /* synthetic */ i04 b;

    static {
        oq6 oq6Var = new oq6("Horizontal", 0);
        Horizontal = oq6Var;
        oq6 oq6Var2 = new oq6("Vertical", 1);
        Vertical = oq6Var2;
        oq6[] oq6VarArr = {oq6Var, oq6Var2};
        a = oq6VarArr;
        b = new i04(oq6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static oq6 valueOf(String str) {
        return (oq6) Enum.valueOf(oq6.class, str);
    }

    public static oq6[] values() {
        return (oq6[]) a.clone();
    }
}
