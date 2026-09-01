package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nh6 {
    public static final nh6 DECLARED;
    public static final nh6 INHERITED;
    public static final /* synthetic */ nh6[] a;

    static {
        nh6 nh6Var = new nh6("DECLARED", 0);
        DECLARED = nh6Var;
        nh6 nh6Var2 = new nh6("INHERITED", 1);
        INHERITED = nh6Var2;
        a = new nh6[]{nh6Var, nh6Var2};
    }

    public static nh6 valueOf(String str) {
        return (nh6) Enum.valueOf(nh6.class, str);
    }

    public static nh6[] values() {
        return (nh6[]) a.clone();
    }

    public final boolean accept(f41 f41Var) {
        f41Var.getClass();
        return f41Var.j().isReal() == (this == DECLARED);
    }
}
