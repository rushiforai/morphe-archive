package j$.time.format;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class a0 {
    public static final a0 FULL;
    public static final a0 FULL_STANDALONE;
    public static final a0 NARROW;
    public static final a0 NARROW_STANDALONE;
    public static final a0 SHORT;
    public static final a0 SHORT_STANDALONE;
    public static final /* synthetic */ a0[] a;

    static {
        a0 a0Var = new a0("FULL", 0);
        FULL = a0Var;
        a0 a0Var2 = new a0("FULL_STANDALONE", 1);
        FULL_STANDALONE = a0Var2;
        a0 a0Var3 = new a0("SHORT", 2);
        SHORT = a0Var3;
        a0 a0Var4 = new a0("SHORT_STANDALONE", 3);
        SHORT_STANDALONE = a0Var4;
        a0 a0Var5 = new a0("NARROW", 4);
        NARROW = a0Var5;
        a0 a0Var6 = new a0("NARROW_STANDALONE", 5);
        NARROW_STANDALONE = a0Var6;
        a = new a0[]{a0Var, a0Var2, a0Var3, a0Var4, a0Var5, a0Var6};
    }

    public static a0 valueOf(String str) {
        return (a0) Enum.valueOf(a0.class, str);
    }

    public static a0[] values() {
        return (a0[]) a.clone();
    }
}
