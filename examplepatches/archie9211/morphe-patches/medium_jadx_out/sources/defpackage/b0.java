package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b0 {
    public static final b0 BACKING_FIELD;
    public static final b0 DELEGATE_FIELD;
    public static final b0 PROPERTY;
    public static final /* synthetic */ b0[] a;

    static {
        b0 b0Var = new b0("PROPERTY", 0);
        PROPERTY = b0Var;
        b0 b0Var2 = new b0("BACKING_FIELD", 1);
        BACKING_FIELD = b0Var2;
        b0 b0Var3 = new b0("DELEGATE_FIELD", 2);
        DELEGATE_FIELD = b0Var3;
        a = new b0[]{b0Var, b0Var2, b0Var3};
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) a.clone();
    }
}
