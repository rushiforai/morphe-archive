package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vx6 {
    public static final vx6 CREATED;
    public static final vx6 DESTROYED;
    public static final vx6 INITIALIZED;
    public static final vx6 RESUMED;
    public static final vx6 STARTED;
    public static final /* synthetic */ vx6[] a;
    public static final /* synthetic */ i04 b;

    static {
        vx6 vx6Var = new vx6("DESTROYED", 0);
        DESTROYED = vx6Var;
        vx6 vx6Var2 = new vx6("INITIALIZED", 1);
        INITIALIZED = vx6Var2;
        vx6 vx6Var3 = new vx6("CREATED", 2);
        CREATED = vx6Var3;
        vx6 vx6Var4 = new vx6("STARTED", 3);
        STARTED = vx6Var4;
        vx6 vx6Var5 = new vx6("RESUMED", 4);
        RESUMED = vx6Var5;
        vx6[] vx6VarArr = {vx6Var, vx6Var2, vx6Var3, vx6Var4, vx6Var5};
        a = vx6VarArr;
        b = new i04(vx6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static vx6 valueOf(String str) {
        return (vx6) Enum.valueOf(vx6.class, str);
    }

    public static vx6[] values() {
        return (vx6[]) a.clone();
    }

    public final boolean isAtLeast(vx6 vx6Var) {
        vx6Var.getClass();
        return compareTo(vx6Var) >= 0;
    }
}
