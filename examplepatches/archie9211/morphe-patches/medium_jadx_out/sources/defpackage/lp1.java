package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lp1 {
    public static final lp1 FNC_1;
    public static final lp1 ONE_DIGIT;
    public static final lp1 TWO_DIGITS;
    public static final lp1 UNCODABLE;
    public static final /* synthetic */ lp1[] a;

    static {
        lp1 lp1Var = new lp1("UNCODABLE", 0);
        UNCODABLE = lp1Var;
        lp1 lp1Var2 = new lp1("ONE_DIGIT", 1);
        ONE_DIGIT = lp1Var2;
        lp1 lp1Var3 = new lp1("TWO_DIGITS", 2);
        TWO_DIGITS = lp1Var3;
        lp1 lp1Var4 = new lp1("FNC_1", 3);
        FNC_1 = lp1Var4;
        a = new lp1[]{lp1Var, lp1Var2, lp1Var3, lp1Var4};
    }

    public static lp1 valueOf(String str) {
        return (lp1) Enum.valueOf(lp1.class, str);
    }

    public static lp1[] values() {
        return (lp1[]) a.clone();
    }
}
