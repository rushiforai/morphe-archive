package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q76 {
    public static final q76 LookaheadMeasurement;
    public static final q76 LookaheadPlacement;
    public static final q76 Measurement;
    public static final q76 Placement;
    public static final /* synthetic */ q76[] a;
    public static final /* synthetic */ i04 b;

    static {
        q76 q76Var = new q76("LookaheadMeasurement", 0);
        LookaheadMeasurement = q76Var;
        q76 q76Var2 = new q76("LookaheadPlacement", 1);
        LookaheadPlacement = q76Var2;
        q76 q76Var3 = new q76("Measurement", 2);
        Measurement = q76Var3;
        q76 q76Var4 = new q76("Placement", 3);
        Placement = q76Var4;
        q76[] q76VarArr = {q76Var, q76Var2, q76Var3, q76Var4};
        a = q76VarArr;
        b = new i04(q76VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static q76 valueOf(String str) {
        return (q76) Enum.valueOf(q76.class, str);
    }

    public static q76[] values() {
        return (q76[]) a.clone();
    }
}
