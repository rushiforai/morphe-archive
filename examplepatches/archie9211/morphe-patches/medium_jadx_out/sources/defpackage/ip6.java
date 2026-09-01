package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ip6 {
    public static final ip6 Ltr;
    public static final ip6 Rtl;
    public static final /* synthetic */ ip6[] a;
    public static final /* synthetic */ i04 b;

    static {
        ip6 ip6Var = new ip6("Ltr", 0);
        Ltr = ip6Var;
        ip6 ip6Var2 = new ip6("Rtl", 1);
        Rtl = ip6Var2;
        ip6[] ip6VarArr = {ip6Var, ip6Var2};
        a = ip6VarArr;
        b = new i04(ip6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ip6 valueOf(String str) {
        return (ip6) Enum.valueOf(ip6.class, str);
    }

    public static ip6[] values() {
        return (ip6[]) a.clone();
    }
}
