package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yd4 {
    public static final yd4 CacheAndNetwork;
    public static final yd4 CacheFirst;
    public static final yd4 CacheOnly;
    public static final yd4 NetworkFirst;
    public static final yd4 NetworkOnly;
    public static final /* synthetic */ yd4[] a;
    public static final /* synthetic */ i04 b;

    static {
        yd4 yd4Var = new yd4("CacheFirst", 0);
        CacheFirst = yd4Var;
        yd4 yd4Var2 = new yd4("CacheOnly", 1);
        CacheOnly = yd4Var2;
        yd4 yd4Var3 = new yd4("NetworkFirst", 2);
        NetworkFirst = yd4Var3;
        yd4 yd4Var4 = new yd4("NetworkOnly", 3);
        NetworkOnly = yd4Var4;
        yd4 yd4Var5 = new yd4("CacheAndNetwork", 4);
        CacheAndNetwork = yd4Var5;
        yd4[] yd4VarArr = {yd4Var, yd4Var2, yd4Var3, yd4Var4, yd4Var5};
        a = yd4VarArr;
        b = new i04(yd4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static yd4 valueOf(String str) {
        return (yd4) Enum.valueOf(yd4.class, str);
    }

    public static yd4[] values() {
        return (yd4[]) a.clone();
    }
}
