package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class op6 {
    public static final op6 BOUNDS;
    public static final op6 NONE;
    public static final /* synthetic */ op6[] a;

    static {
        op6 op6Var = new op6("NONE", 0);
        NONE = op6Var;
        op6 op6Var2 = new op6("BOUNDS", 1);
        BOUNDS = op6Var2;
        a = new op6[]{op6Var, op6Var2};
    }

    public static op6 valueOf(String str) {
        return (op6) Enum.valueOf(op6.class, str);
    }

    public static op6[] values() {
        return (op6[]) a.clone();
    }
}
