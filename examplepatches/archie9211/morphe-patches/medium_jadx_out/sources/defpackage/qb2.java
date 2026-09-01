package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qb2 {
    public static final qb2 BLOCKING;
    public static final qb2 CPU_ACQUIRED;
    public static final qb2 DORMANT;
    public static final qb2 PARKING;
    public static final qb2 TERMINATED;
    public static final /* synthetic */ qb2[] a;
    public static final /* synthetic */ i04 b;

    static {
        qb2 qb2Var = new qb2("CPU_ACQUIRED", 0);
        CPU_ACQUIRED = qb2Var;
        qb2 qb2Var2 = new qb2("BLOCKING", 1);
        BLOCKING = qb2Var2;
        qb2 qb2Var3 = new qb2("PARKING", 2);
        PARKING = qb2Var3;
        qb2 qb2Var4 = new qb2("DORMANT", 3);
        DORMANT = qb2Var4;
        qb2 qb2Var5 = new qb2("TERMINATED", 4);
        TERMINATED = qb2Var5;
        qb2[] qb2VarArr = {qb2Var, qb2Var2, qb2Var3, qb2Var4, qb2Var5};
        a = qb2VarArr;
        b = new i04(qb2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static qb2 valueOf(String str) {
        return (qb2) Enum.valueOf(qb2.class, str);
    }

    public static qb2[] values() {
        return (qb2[]) a.clone();
    }
}
