package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x74 {
    public static final x74 INCOMPATIBLE;
    public static final x74 OVERRIDABLE;
    public static final x74 UNKNOWN;
    public static final /* synthetic */ x74[] a;

    static {
        x74 x74Var = new x74("OVERRIDABLE", 0);
        OVERRIDABLE = x74Var;
        x74 x74Var2 = new x74("INCOMPATIBLE", 1);
        INCOMPATIBLE = x74Var2;
        x74 x74Var3 = new x74("UNKNOWN", 2);
        UNKNOWN = x74Var3;
        a = new x74[]{x74Var, x74Var2, x74Var3};
    }

    public static x74 valueOf(String str) {
        return (x74) Enum.valueOf(x74.class, str);
    }

    public static x74[] values() {
        return (x74[]) a.clone();
    }
}
