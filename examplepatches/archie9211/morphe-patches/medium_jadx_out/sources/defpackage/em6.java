package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class em6 {
    public static final em6 CALLS;
    public static final em6 RETURNS_CONSTANT;
    public static final em6 RETURNS_NOT_NULL;
    public static final /* synthetic */ em6[] a;

    static {
        em6 em6Var = new em6("RETURNS_CONSTANT", 0);
        RETURNS_CONSTANT = em6Var;
        em6 em6Var2 = new em6("CALLS", 1);
        CALLS = em6Var2;
        em6 em6Var3 = new em6("RETURNS_NOT_NULL", 2);
        RETURNS_NOT_NULL = em6Var3;
        a = new em6[]{em6Var, em6Var2, em6Var3};
    }

    public static em6 valueOf(String str) {
        return (em6) Enum.valueOf(em6.class, str);
    }

    public static em6[] values() {
        return (em6[]) a.clone();
    }
}
