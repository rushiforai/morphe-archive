package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pm6 {
    public static final pm6 IN;
    public static final pm6 INVARIANT;
    public static final pm6 OUT;
    public static final /* synthetic */ pm6[] a;

    static {
        pm6 pm6Var = new pm6("INVARIANT", 0);
        INVARIANT = pm6Var;
        pm6 pm6Var2 = new pm6("IN", 1);
        IN = pm6Var2;
        pm6 pm6Var3 = new pm6("OUT", 2);
        OUT = pm6Var3;
        a = new pm6[]{pm6Var, pm6Var2, pm6Var3};
    }

    public static pm6 valueOf(String str) {
        return (pm6) Enum.valueOf(pm6.class, str);
    }

    public static pm6[] values() {
        return (pm6[]) a.clone();
    }
}
