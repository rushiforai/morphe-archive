package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t36 {
    public static final t36 BAD_CONFIG;
    public static final t36 OK;
    public static final /* synthetic */ t36[] a;

    static {
        t36 t36Var = new t36("OK", 0);
        OK = t36Var;
        t36 t36Var2 = new t36("BAD_CONFIG", 1);
        BAD_CONFIG = t36Var2;
        a = new t36[]{t36Var, t36Var2};
    }

    public static t36 valueOf(String str) {
        return (t36) Enum.valueOf(t36.class, str);
    }

    public static t36[] values() {
        return (t36[]) a.clone();
    }
}
