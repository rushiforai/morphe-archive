package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p55 {
    public static final o55 Companion;
    public static final p55 Function;
    public static final p55 KFunction;
    public static final p55 KSuspendFunction;
    public static final p55 SuspendFunction;
    public static final p55 UNKNOWN;
    public static final /* synthetic */ p55[] a;

    static {
        p55 p55Var = new p55("Function", 0);
        Function = p55Var;
        p55 p55Var2 = new p55("SuspendFunction", 1);
        SuspendFunction = p55Var2;
        p55 p55Var3 = new p55("KFunction", 2);
        KFunction = p55Var3;
        p55 p55Var4 = new p55("KSuspendFunction", 3);
        KSuspendFunction = p55Var4;
        p55 p55Var5 = new p55("UNKNOWN", 4);
        UNKNOWN = p55Var5;
        a = new p55[]{p55Var, p55Var2, p55Var3, p55Var4, p55Var5};
        Companion = new o55();
    }

    public static p55 valueOf(String str) {
        return (p55) Enum.valueOf(p55.class, str);
    }

    public static p55[] values() {
        return (p55[]) a.clone();
    }
}
