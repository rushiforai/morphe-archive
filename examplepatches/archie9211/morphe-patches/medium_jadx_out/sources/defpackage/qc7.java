package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qc7 {
    public static final qc7 NONE;
    public static final qc7 PLAY;
    public static final qc7 RESUME;
    public static final /* synthetic */ qc7[] a;

    static {
        qc7 qc7Var = new qc7("NONE", 0);
        NONE = qc7Var;
        qc7 qc7Var2 = new qc7("PLAY", 1);
        PLAY = qc7Var2;
        qc7 qc7Var3 = new qc7("RESUME", 2);
        RESUME = qc7Var3;
        a = new qc7[]{qc7Var, qc7Var2, qc7Var3};
    }

    public static qc7 valueOf(String str) {
        return (qc7) Enum.valueOf(qc7.class, str);
    }

    public static qc7[] values() {
        return (qc7[]) a.clone();
    }
}
