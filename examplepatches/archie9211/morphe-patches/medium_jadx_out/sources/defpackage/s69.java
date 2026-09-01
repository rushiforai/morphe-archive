package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s69 {
    public static final s69 APPLE;
    public static final s69 BRAINTREE;
    public static final s69 GOOGLE;
    public static final s69 MEDIUM_GIFT;
    public static final s69 PAYPAL;
    public static final s69 STRIPE;
    public static final s69 UNKNOWN;
    public static final /* synthetic */ s69[] a;
    public static final /* synthetic */ i04 b;

    static {
        s69 s69Var = new s69("APPLE", 0);
        APPLE = s69Var;
        s69 s69Var2 = new s69("BRAINTREE", 1);
        BRAINTREE = s69Var2;
        s69 s69Var3 = new s69("GOOGLE", 2);
        GOOGLE = s69Var3;
        s69 s69Var4 = new s69("MEDIUM_GIFT", 3);
        MEDIUM_GIFT = s69Var4;
        s69 s69Var5 = new s69("PAYPAL", 4);
        PAYPAL = s69Var5;
        s69 s69Var6 = new s69("STRIPE", 5);
        STRIPE = s69Var6;
        s69 s69Var7 = new s69("UNKNOWN", 6);
        UNKNOWN = s69Var7;
        s69[] s69VarArr = {s69Var, s69Var2, s69Var3, s69Var4, s69Var5, s69Var6, s69Var7};
        a = s69VarArr;
        b = new i04(s69VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static s69 valueOf(String str) {
        return (s69) Enum.valueOf(s69.class, str);
    }

    public static s69[] values() {
        return (s69[]) a.clone();
    }
}
