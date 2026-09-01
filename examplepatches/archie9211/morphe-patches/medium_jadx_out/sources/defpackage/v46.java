package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v46 {
    public static final v46 COMMON_SUPER_TYPE;
    public static final v46 INTERSECTION_TYPE;
    public static final /* synthetic */ v46[] a;

    static {
        v46 v46Var = new v46("COMMON_SUPER_TYPE", 0);
        COMMON_SUPER_TYPE = v46Var;
        v46 v46Var2 = new v46("INTERSECTION_TYPE", 1);
        INTERSECTION_TYPE = v46Var2;
        a = new v46[]{v46Var, v46Var2};
    }

    public static v46 valueOf(String str) {
        return (v46) Enum.valueOf(v46.class, str);
    }

    public static v46[] values() {
        return (v46[]) a.clone();
    }
}
