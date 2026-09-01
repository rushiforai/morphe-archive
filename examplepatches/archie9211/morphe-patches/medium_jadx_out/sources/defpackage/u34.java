package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u34 {
    public static final u34 CRASH;
    public static final u34 DEFAULT;
    public static final u34 TELEMETRY;
    public static final /* synthetic */ u34[] a;

    static {
        u34 u34Var = new u34("DEFAULT", 0);
        DEFAULT = u34Var;
        u34 u34Var2 = new u34("CRASH", 1);
        CRASH = u34Var2;
        u34 u34Var3 = new u34("TELEMETRY", 2);
        TELEMETRY = u34Var3;
        a = new u34[]{u34Var, u34Var2, u34Var3};
    }

    public static u34 valueOf(String str) {
        return (u34) Enum.valueOf(u34.class, str);
    }

    public static u34[] values() {
        return (u34[]) a.clone();
    }
}
