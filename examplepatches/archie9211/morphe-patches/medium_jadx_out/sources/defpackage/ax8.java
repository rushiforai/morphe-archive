package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ax8 {
    public static final ax8 CONFLICT;
    public static final ax8 INCOMPATIBLE;
    public static final ax8 OVERRIDABLE;
    public static final /* synthetic */ ax8[] a;

    static {
        ax8 ax8Var = new ax8("OVERRIDABLE", 0);
        OVERRIDABLE = ax8Var;
        ax8 ax8Var2 = new ax8("INCOMPATIBLE", 1);
        INCOMPATIBLE = ax8Var2;
        ax8 ax8Var3 = new ax8("CONFLICT", 2);
        CONFLICT = ax8Var3;
        a = new ax8[]{ax8Var, ax8Var2, ax8Var3};
    }

    public static ax8 valueOf(String str) {
        return (ax8) Enum.valueOf(ax8.class, str);
    }

    public static ax8[] values() {
        return (ax8[]) a.clone();
    }
}
