package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wp6 {
    public static final wp6 Idle;
    public static final wp6 LayingOut;
    public static final wp6 LookaheadLayingOut;
    public static final wp6 LookaheadMeasuring;
    public static final wp6 Measuring;
    public static final /* synthetic */ wp6[] a;
    public static final /* synthetic */ i04 b;

    static {
        wp6 wp6Var = new wp6("Measuring", 0);
        Measuring = wp6Var;
        wp6 wp6Var2 = new wp6("LookaheadMeasuring", 1);
        LookaheadMeasuring = wp6Var2;
        wp6 wp6Var3 = new wp6("LayingOut", 2);
        LayingOut = wp6Var3;
        wp6 wp6Var4 = new wp6("LookaheadLayingOut", 3);
        LookaheadLayingOut = wp6Var4;
        wp6 wp6Var5 = new wp6("Idle", 4);
        Idle = wp6Var5;
        wp6[] wp6VarArr = {wp6Var, wp6Var2, wp6Var3, wp6Var4, wp6Var5};
        a = wp6VarArr;
        b = new i04(wp6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static wp6 valueOf(String str) {
        return (wp6) Enum.valueOf(wp6.class, str);
    }

    public static wp6[] values() {
        return (wp6[]) a.clone();
    }
}
