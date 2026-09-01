package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uj7 {
    public static final uj7 BOTH;
    public static final uj7 END;
    public static final uj7 NONE;
    public static final uj7 START;
    public static final /* synthetic */ uj7[] a;

    static {
        uj7 uj7Var = new uj7("NONE", 0);
        NONE = uj7Var;
        uj7 uj7Var2 = new uj7("START", 1);
        START = uj7Var2;
        uj7 uj7Var3 = new uj7("END", 2);
        END = uj7Var3;
        uj7 uj7Var4 = new uj7("BOTH", 3);
        BOTH = uj7Var4;
        a = new uj7[]{uj7Var, uj7Var2, uj7Var3, uj7Var4};
    }

    public static uj7 valueOf(String str) {
        return (uj7) Enum.valueOf(uj7.class, str);
    }

    public static uj7[] values() {
        return (uj7[]) a.clone();
    }
}
