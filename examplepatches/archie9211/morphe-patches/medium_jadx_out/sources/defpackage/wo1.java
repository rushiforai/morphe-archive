package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wo1 {
    public static final wo1 ANDROID_FIREBASE;
    public static final wo1 UNKNOWN;
    public static final /* synthetic */ wo1[] a;

    static {
        wo1 wo1Var = new wo1("UNKNOWN", 0);
        UNKNOWN = wo1Var;
        wo1 wo1Var2 = new wo1("ANDROID_FIREBASE", 1);
        ANDROID_FIREBASE = wo1Var2;
        a = new wo1[]{wo1Var, wo1Var2};
    }

    public static wo1 valueOf(String str) {
        return (wo1) Enum.valueOf(wo1.class, str);
    }

    public static wo1[] values() {
        return (wo1[]) a.clone();
    }
}
