package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hx1 {
    public static final hx1 AUTO;
    public static final hx1 BYTE;
    public static final hx1 NUMERIC;
    public static final hx1 TEXT;
    public static final /* synthetic */ hx1[] a;

    static {
        hx1 hx1Var = new hx1("AUTO", 0);
        AUTO = hx1Var;
        hx1 hx1Var2 = new hx1("TEXT", 1);
        TEXT = hx1Var2;
        hx1 hx1Var3 = new hx1("BYTE", 2);
        BYTE = hx1Var3;
        hx1 hx1Var4 = new hx1("NUMERIC", 3);
        NUMERIC = hx1Var4;
        a = new hx1[]{hx1Var, hx1Var2, hx1Var3, hx1Var4};
    }

    public static hx1 valueOf(String str) {
        return (hx1) Enum.valueOf(hx1.class, str);
    }

    public static hx1[] values() {
        return (hx1[]) a.clone();
    }
}
