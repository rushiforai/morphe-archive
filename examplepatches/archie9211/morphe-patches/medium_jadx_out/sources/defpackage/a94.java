package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a94 {
    public static final a94 LOGIN_RECOVERABLE;
    public static final a94 OTHER;
    public static final a94 TRANSIENT;
    public static final /* synthetic */ a94[] a;

    static {
        a94 a94Var = new a94("LOGIN_RECOVERABLE", 0);
        LOGIN_RECOVERABLE = a94Var;
        a94 a94Var2 = new a94("OTHER", 1);
        OTHER = a94Var2;
        a94 a94Var3 = new a94("TRANSIENT", 2);
        TRANSIENT = a94Var3;
        a = new a94[]{a94Var, a94Var2, a94Var3};
    }

    public static a94 valueOf(String str) {
        return (a94) Enum.valueOf(a94.class, str);
    }

    public static a94[] values() {
        return (a94[]) a.clone();
    }
}
