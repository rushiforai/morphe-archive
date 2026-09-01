package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uq5 {
    public static final uq5 Featured;
    public static final uq5 ForYou;
    public static final /* synthetic */ uq5[] a;
    public static final /* synthetic */ i04 b;

    static {
        uq5 uq5Var = new uq5("ForYou", 0);
        ForYou = uq5Var;
        uq5 uq5Var2 = new uq5("Featured", 1);
        Featured = uq5Var2;
        uq5[] uq5VarArr = {uq5Var, uq5Var2};
        a = uq5VarArr;
        b = new i04(uq5VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static uq5 valueOf(String str) {
        return (uq5) Enum.valueOf(uq5.class, str);
    }

    public static uq5[] values() {
        return (uq5[]) a.clone();
    }
}
