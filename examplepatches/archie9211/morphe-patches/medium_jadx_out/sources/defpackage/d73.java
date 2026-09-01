package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d73 {
    public static final d73 COMMAND;
    public static final d73 INIT;
    public static final d73 VIEW_SYNC;
    public static final /* synthetic */ d73[] a;
    public static final /* synthetic */ i04 b;

    static {
        d73 d73Var = new d73("COMMAND", 0);
        COMMAND = d73Var;
        d73 d73Var2 = new d73("INIT", 1);
        INIT = d73Var2;
        d73 d73Var3 = new d73("VIEW_SYNC", 2);
        VIEW_SYNC = d73Var3;
        d73[] d73VarArr = {d73Var, d73Var2, d73Var3};
        a = d73VarArr;
        b = new i04(d73VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static d73 valueOf(String str) {
        return (d73) Enum.valueOf(d73.class, str);
    }

    public static d73[] values() {
        return (d73[]) a.clone();
    }
}
