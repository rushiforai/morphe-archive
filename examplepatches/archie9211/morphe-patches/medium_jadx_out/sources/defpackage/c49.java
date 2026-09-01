package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c49 {
    public static final c49 ALL;
    public static final c49 NONE;
    public static final c49 ONLY_NON_SYNTHESIZED;
    public static final /* synthetic */ c49[] a;

    static {
        c49 c49Var = new c49("ALL", 0);
        ALL = c49Var;
        c49 c49Var2 = new c49("ONLY_NON_SYNTHESIZED", 1);
        ONLY_NON_SYNTHESIZED = c49Var2;
        c49 c49Var3 = new c49("NONE", 2);
        NONE = c49Var3;
        a = new c49[]{c49Var, c49Var2, c49Var3};
    }

    public static c49 valueOf(String str) {
        return (c49) Enum.valueOf(c49.class, str);
    }

    public static c49[] values() {
        return (c49[]) a.clone();
    }
}
