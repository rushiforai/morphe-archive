package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ip7 {
    public static final ip7 COMPACT;
    public static final ip7 EXPANDED;
    public static final ip7 MEDIUM;
    public static final /* synthetic */ ip7[] a;
    public static final /* synthetic */ i04 b;

    static {
        ip7 ip7Var = new ip7("COMPACT", 0);
        COMPACT = ip7Var;
        ip7 ip7Var2 = new ip7("MEDIUM", 1);
        MEDIUM = ip7Var2;
        ip7 ip7Var3 = new ip7("EXPANDED", 2);
        EXPANDED = ip7Var3;
        ip7[] ip7VarArr = {ip7Var, ip7Var2, ip7Var3};
        a = ip7VarArr;
        b = new i04(ip7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ip7 valueOf(String str) {
        return (ip7) Enum.valueOf(ip7.class, str);
    }

    public static ip7[] values() {
        return (ip7[]) a.clone();
    }
}
