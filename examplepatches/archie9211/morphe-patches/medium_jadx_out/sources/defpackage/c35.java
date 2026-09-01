package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c35 {
    public static final c35 ON_CONFIGURE;
    public static final c35 ON_CREATE;
    public static final c35 ON_DOWNGRADE;
    public static final c35 ON_OPEN;
    public static final c35 ON_UPGRADE;
    public static final /* synthetic */ c35[] a;
    public static final /* synthetic */ i04 b;

    static {
        c35 c35Var = new c35("ON_CONFIGURE", 0);
        ON_CONFIGURE = c35Var;
        c35 c35Var2 = new c35("ON_CREATE", 1);
        ON_CREATE = c35Var2;
        c35 c35Var3 = new c35("ON_UPGRADE", 2);
        ON_UPGRADE = c35Var3;
        c35 c35Var4 = new c35("ON_DOWNGRADE", 3);
        ON_DOWNGRADE = c35Var4;
        c35 c35Var5 = new c35("ON_OPEN", 4);
        ON_OPEN = c35Var5;
        c35[] c35VarArr = {c35Var, c35Var2, c35Var3, c35Var4, c35Var5};
        a = c35VarArr;
        b = new i04(c35VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static c35 valueOf(String str) {
        return (c35) Enum.valueOf(c35.class, str);
    }

    public static c35[] values() {
        return (c35[]) a.clone();
    }
}
