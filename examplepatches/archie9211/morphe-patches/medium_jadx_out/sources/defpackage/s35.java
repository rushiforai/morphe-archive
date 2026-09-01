package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s35 {
    public static final s35 Daily;
    public static final s35 Hourly;
    public static final /* synthetic */ s35[] a;
    public static final /* synthetic */ i04 b;

    static {
        s35 s35Var = new s35("Hourly", 0);
        Hourly = s35Var;
        s35 s35Var2 = new s35("Daily", 1);
        Daily = s35Var2;
        s35[] s35VarArr = {s35Var, s35Var2};
        a = s35VarArr;
        b = new i04(s35VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static s35 valueOf(String str) {
        return (s35) Enum.valueOf(s35.class, str);
    }

    public static s35[] values() {
        return (s35[]) a.clone();
    }
}
