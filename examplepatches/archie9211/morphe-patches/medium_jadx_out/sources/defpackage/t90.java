package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t90 {
    public static final t90 AUTOMATIC;
    public static final t90 DISABLED;
    public static final t90 ENABLED;
    public static final /* synthetic */ t90[] a;

    static {
        t90 t90Var = new t90("AUTOMATIC", 0);
        AUTOMATIC = t90Var;
        t90 t90Var2 = new t90("ENABLED", 1);
        ENABLED = t90Var2;
        t90 t90Var3 = new t90("DISABLED", 2);
        DISABLED = t90Var3;
        a = new t90[]{t90Var, t90Var2, t90Var3};
    }

    public static t90 valueOf(String str) {
        return (t90) Enum.valueOf(t90.class, str);
    }

    public static t90[] values() {
        return (t90[]) a.clone();
    }
}
