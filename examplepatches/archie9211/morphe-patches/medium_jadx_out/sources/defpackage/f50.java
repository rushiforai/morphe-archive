package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f50 {
    public static final f50 AUTO;
    public static final f50 EXPLICIT_ONLY;
    public static final /* synthetic */ f50[] a;

    static {
        f50 f50Var = new f50("AUTO", 0);
        AUTO = f50Var;
        f50 f50Var2 = new f50("EXPLICIT_ONLY", 1);
        EXPLICIT_ONLY = f50Var2;
        a = new f50[]{f50Var, f50Var2};
    }

    public static f50 valueOf(String str) {
        return (f50) Enum.valueOf(f50.class, str);
    }

    public static f50[] values() {
        return (f50[]) a.clone();
    }
}
