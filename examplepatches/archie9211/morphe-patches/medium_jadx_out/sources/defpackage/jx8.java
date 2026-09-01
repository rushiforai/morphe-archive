package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jx8 {
    public static final jx8 Daily;
    public static final jx8 Hourly;
    public static final /* synthetic */ jx8[] a;
    public static final /* synthetic */ i04 b;

    static {
        jx8 jx8Var = new jx8("Hourly", 0);
        Hourly = jx8Var;
        jx8 jx8Var2 = new jx8("Daily", 1);
        Daily = jx8Var2;
        jx8[] jx8VarArr = {jx8Var, jx8Var2};
        a = jx8VarArr;
        b = new i04(jx8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static jx8 valueOf(String str) {
        return (jx8) Enum.valueOf(jx8.class, str);
    }

    public static jx8[] values() {
        return (jx8[]) a.clone();
    }
}
