package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d28 {
    public static final d28 ERROR;
    public static final d28 LOADED;
    public static final d28 LOADING;
    public static final d28 OFFLINE;
    public static final /* synthetic */ d28[] a;
    public static final /* synthetic */ i04 b;

    static {
        d28 d28Var = new d28("LOADING", 0);
        LOADING = d28Var;
        d28 d28Var2 = new d28("LOADED", 1);
        LOADED = d28Var2;
        d28 d28Var3 = new d28("ERROR", 2);
        ERROR = d28Var3;
        d28 d28Var4 = new d28("OFFLINE", 3);
        OFFLINE = d28Var4;
        d28[] d28VarArr = {d28Var, d28Var2, d28Var3, d28Var4};
        a = d28VarArr;
        b = new i04(d28VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static d28 valueOf(String str) {
        return (d28) Enum.valueOf(d28.class, str);
    }

    public static d28[] values() {
        return (d28[]) a.clone();
    }
}
