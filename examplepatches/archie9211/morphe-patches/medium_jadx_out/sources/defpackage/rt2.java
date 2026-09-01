package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rt2 {
    public static final rt2 APOLLO;
    public static final rt2 OFFLINE;
    public static final /* synthetic */ rt2[] a;
    public static final /* synthetic */ i04 b;

    static {
        rt2 rt2Var = new rt2("OFFLINE", 0);
        OFFLINE = rt2Var;
        rt2 rt2Var2 = new rt2("APOLLO", 1);
        APOLLO = rt2Var2;
        rt2[] rt2VarArr = {rt2Var, rt2Var2};
        a = rt2VarArr;
        b = new i04(rt2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static rt2 valueOf(String str) {
        return (rt2) Enum.valueOf(rt2.class, str);
    }

    public static rt2[] values() {
        return (rt2[]) a.clone();
    }
}
