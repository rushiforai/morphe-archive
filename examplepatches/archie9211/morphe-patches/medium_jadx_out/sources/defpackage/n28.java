package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n28 {
    public static final n28 FINISHED;
    public static final n28 PENDING;
    public static final n28 RUNNING;
    public static final /* synthetic */ n28[] a;

    static {
        n28 n28Var = new n28("PENDING", 0);
        PENDING = n28Var;
        n28 n28Var2 = new n28("RUNNING", 1);
        RUNNING = n28Var2;
        n28 n28Var3 = new n28("FINISHED", 2);
        FINISHED = n28Var3;
        a = new n28[]{n28Var, n28Var2, n28Var3};
    }

    public static n28 valueOf(String str) {
        return (n28) Enum.valueOf(n28.class, str);
    }

    public static n28[] values() {
        return (n28[]) a.clone();
    }
}
