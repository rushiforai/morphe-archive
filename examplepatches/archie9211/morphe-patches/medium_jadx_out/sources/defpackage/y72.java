package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y72 {
    public static final y72 VIEW_APPEAR;
    public static final y72 VIEW_DISAPPEAR;
    public static final /* synthetic */ y72[] a;
    public static final /* synthetic */ i04 b;

    static {
        y72 y72Var = new y72("VIEW_APPEAR", 0);
        VIEW_APPEAR = y72Var;
        y72 y72Var2 = new y72("VIEW_DISAPPEAR", 1);
        VIEW_DISAPPEAR = y72Var2;
        y72[] y72VarArr = {y72Var, y72Var2};
        a = y72VarArr;
        b = new i04(y72VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static y72 valueOf(String str) {
        return (y72) Enum.valueOf(y72.class, str);
    }

    public static y72[] values() {
        return (y72[]) a.clone();
    }
}
