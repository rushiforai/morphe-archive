package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w96 {
    public static final w96 FLEXIBLE_LOWER_BOUND;
    public static final w96 FLEXIBLE_UPPER_BOUND;
    public static final w96 INFLEXIBLE;
    public static final /* synthetic */ w96[] a;

    static {
        w96 w96Var = new w96("INFLEXIBLE", 0);
        INFLEXIBLE = w96Var;
        w96 w96Var2 = new w96("FLEXIBLE_UPPER_BOUND", 1);
        FLEXIBLE_UPPER_BOUND = w96Var2;
        w96 w96Var3 = new w96("FLEXIBLE_LOWER_BOUND", 2);
        FLEXIBLE_LOWER_BOUND = w96Var3;
        a = new w96[]{w96Var, w96Var2, w96Var3};
    }

    public static w96 valueOf(String str) {
        return (w96) Enum.valueOf(w96.class, str);
    }

    public static w96[] values() {
        return (w96[]) a.clone();
    }
}
