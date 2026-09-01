package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sm6 {
    public static final sm6 API_VERSION;
    public static final sm6 COMPILER_VERSION;
    public static final sm6 LANGUAGE_VERSION;
    public static final sm6 UNKNOWN;
    public static final /* synthetic */ sm6[] a;

    static {
        sm6 sm6Var = new sm6("LANGUAGE_VERSION", 0);
        LANGUAGE_VERSION = sm6Var;
        sm6 sm6Var2 = new sm6("COMPILER_VERSION", 1);
        COMPILER_VERSION = sm6Var2;
        sm6 sm6Var3 = new sm6("API_VERSION", 2);
        API_VERSION = sm6Var3;
        sm6 sm6Var4 = new sm6("UNKNOWN", 3);
        UNKNOWN = sm6Var4;
        a = new sm6[]{sm6Var, sm6Var2, sm6Var3, sm6Var4};
    }

    public static sm6 valueOf(String str) {
        return (sm6) Enum.valueOf(sm6.class, str);
    }

    public static sm6[] values() {
        return (sm6[]) a.clone();
    }
}
