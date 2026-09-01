package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a72 {
    public static final a72 FIXED;
    public static final a72 MATCH_CONSTRAINT;
    public static final a72 MATCH_PARENT;
    public static final a72 WRAP_CONTENT;
    public static final /* synthetic */ a72[] a;

    static {
        a72 a72Var = new a72("FIXED", 0);
        FIXED = a72Var;
        a72 a72Var2 = new a72("WRAP_CONTENT", 1);
        WRAP_CONTENT = a72Var2;
        a72 a72Var3 = new a72("MATCH_CONSTRAINT", 2);
        MATCH_CONSTRAINT = a72Var3;
        a72 a72Var4 = new a72("MATCH_PARENT", 3);
        MATCH_PARENT = a72Var4;
        a = new a72[]{a72Var, a72Var2, a72Var3, a72Var4};
    }

    public static a72 valueOf(String str) {
        return (a72) Enum.valueOf(a72.class, str);
    }

    public static a72[] values() {
        return (a72[]) a.clone();
    }
}
