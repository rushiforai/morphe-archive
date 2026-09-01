package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qy7 {
    public static final qy7 ADD;
    public static final qy7 EXCLUDE_INTERSECTIONS;
    public static final qy7 INTERSECT;
    public static final qy7 MERGE;
    public static final qy7 SUBTRACT;
    public static final /* synthetic */ qy7[] a;

    static {
        qy7 qy7Var = new qy7("MERGE", 0);
        MERGE = qy7Var;
        qy7 qy7Var2 = new qy7("ADD", 1);
        ADD = qy7Var2;
        qy7 qy7Var3 = new qy7("SUBTRACT", 2);
        SUBTRACT = qy7Var3;
        qy7 qy7Var4 = new qy7("INTERSECT", 3);
        INTERSECT = qy7Var4;
        qy7 qy7Var5 = new qy7("EXCLUDE_INTERSECTIONS", 4);
        EXCLUDE_INTERSECTIONS = qy7Var5;
        a = new qy7[]{qy7Var, qy7Var2, qy7Var3, qy7Var4, qy7Var5};
    }

    public static qy7 forId(int i) {
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? MERGE : EXCLUDE_INTERSECTIONS : INTERSECT : SUBTRACT : ADD : MERGE;
    }

    public static qy7 valueOf(String str) {
        return (qy7) Enum.valueOf(qy7.class, str);
    }

    public static qy7[] values() {
        return (qy7[]) a.clone();
    }
}
