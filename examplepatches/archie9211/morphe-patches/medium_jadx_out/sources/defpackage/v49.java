package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v49 {
    public static final v49 ACTIVE;
    public static final v49 INACTIVE;
    public static final v49 PENDING_ACTION;
    public static final v49 SUSPENDED;
    public static final v49 UNKNOWN;
    public static final /* synthetic */ v49[] a;
    public static final /* synthetic */ i04 b;

    static {
        v49 v49Var = new v49("ACTIVE", 0);
        ACTIVE = v49Var;
        v49 v49Var2 = new v49("INACTIVE", 1);
        INACTIVE = v49Var2;
        v49 v49Var3 = new v49("PENDING_ACTION", 2);
        PENDING_ACTION = v49Var3;
        v49 v49Var4 = new v49("SUSPENDED", 3);
        SUSPENDED = v49Var4;
        v49 v49Var5 = new v49("UNKNOWN", 4);
        UNKNOWN = v49Var5;
        v49[] v49VarArr = {v49Var, v49Var2, v49Var3, v49Var4, v49Var5};
        a = v49VarArr;
        b = new i04(v49VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static v49 valueOf(String str) {
        return (v49) Enum.valueOf(v49.class, str);
    }

    public static v49[] values() {
        return (v49[]) a.clone();
    }
}
