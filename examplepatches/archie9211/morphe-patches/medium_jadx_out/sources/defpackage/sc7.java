package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sc7 {
    public static final sc7 MergePathsApi19;
    public static final /* synthetic */ sc7[] a;
    public final int minRequiredSdkVersion = 19;

    static {
        sc7 sc7Var = new sc7();
        MergePathsApi19 = sc7Var;
        a = new sc7[]{sc7Var};
    }

    public static sc7 valueOf(String str) {
        return (sc7) Enum.valueOf(sc7.class, str);
    }

    public static sc7[] values() {
        return (sc7[]) a.clone();
    }
}
