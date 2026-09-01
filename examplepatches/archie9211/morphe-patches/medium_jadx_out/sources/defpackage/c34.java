package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c34 {
    public static final c34 INFERENCE;
    public static final c34 MANUAL;
    public static final /* synthetic */ c34[] a;

    static {
        c34 c34Var = new c34("MANUAL", 0);
        MANUAL = c34Var;
        c34 c34Var2 = new c34("INFERENCE", 1);
        INFERENCE = c34Var2;
        a = new c34[]{c34Var, c34Var2};
    }

    public static c34 valueOf(String str) {
        return (c34) Enum.valueOf(c34.class, str);
    }

    public static c34[] values() {
        return (c34[]) a.clone();
    }
}
