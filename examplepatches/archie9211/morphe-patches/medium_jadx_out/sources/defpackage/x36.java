package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x36 {
    public static final x36 Analysis;
    public static final x36 AnrReport;
    public static final x36 CrashReport;
    public static final x36 CrashShield;
    public static final x36 ThreadCheck;
    public static final x36 Unknown;
    public static final /* synthetic */ x36[] a;

    static {
        x36 x36Var = new x36("Unknown", 0);
        Unknown = x36Var;
        x36 x36Var2 = new x36("Analysis", 1);
        Analysis = x36Var2;
        x36 x36Var3 = new x36("AnrReport", 2);
        AnrReport = x36Var3;
        x36 x36Var4 = new x36("CrashReport", 3);
        CrashReport = x36Var4;
        x36 x36Var5 = new x36("CrashShield", 4);
        CrashShield = x36Var5;
        x36 x36Var6 = new x36("ThreadCheck", 5);
        ThreadCheck = x36Var6;
        a = new x36[]{x36Var, x36Var2, x36Var3, x36Var4, x36Var5, x36Var6};
    }

    public static x36 valueOf(String str) {
        return (x36) Enum.valueOf(x36.class, str);
    }

    public static x36[] values() {
        return (x36[]) a.clone();
    }

    public final String getLogPrefix() {
        int i = w36.a[ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? "Unknown" : "thread_check_log_" : "shield_log_" : "crash_log_" : "anr_log_" : "analysis_log_";
    }

    @Override // java.lang.Enum
    public String toString() {
        int i = w36.a[ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? "Unknown" : "ThreadCheck" : "CrashShield" : "CrashReport" : "AnrReport" : "Analysis";
    }
}
