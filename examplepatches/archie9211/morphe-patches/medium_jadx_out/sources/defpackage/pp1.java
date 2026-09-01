package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pp1 {
    public static final pp1 PLAIN;
    public static final pp1 S256;
    public static final /* synthetic */ pp1[] a;

    static {
        pp1 pp1Var = new pp1("S256", 0);
        S256 = pp1Var;
        pp1 pp1Var2 = new pp1("PLAIN", 1);
        PLAIN = pp1Var2;
        a = new pp1[]{pp1Var, pp1Var2};
    }

    public static pp1 valueOf(String str) {
        return (pp1) Enum.valueOf(pp1.class, str);
    }

    public static pp1[] values() {
        return (pp1[]) a.clone();
    }
}
