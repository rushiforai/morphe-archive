package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g89 {
    public static final g89 ATTEMPT_MIGRATION;
    public static final g89 NOT_GENERATED;
    public static final g89 REGISTERED;
    public static final g89 REGISTER_ERROR;
    public static final g89 UNREGISTERED;
    public static final /* synthetic */ g89[] a;

    static {
        g89 g89Var = new g89("ATTEMPT_MIGRATION", 0);
        ATTEMPT_MIGRATION = g89Var;
        g89 g89Var2 = new g89("NOT_GENERATED", 1);
        NOT_GENERATED = g89Var2;
        g89 g89Var3 = new g89("UNREGISTERED", 2);
        UNREGISTERED = g89Var3;
        g89 g89Var4 = new g89("REGISTERED", 3);
        REGISTERED = g89Var4;
        g89 g89Var5 = new g89("REGISTER_ERROR", 4);
        REGISTER_ERROR = g89Var5;
        a = new g89[]{g89Var, g89Var2, g89Var3, g89Var4, g89Var5};
    }

    public static g89 valueOf(String str) {
        return (g89) Enum.valueOf(g89.class, str);
    }

    public static g89[] values() {
        return (g89[]) a.clone();
    }
}
