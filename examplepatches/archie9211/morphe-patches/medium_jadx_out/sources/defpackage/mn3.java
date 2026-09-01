package defpackage;

import java.util.concurrent.TimeUnit;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mn3 {
    public static final mn3 DAYS;
    public static final mn3 HOURS;
    public static final mn3 MICROSECONDS;
    public static final mn3 MILLISECONDS;
    public static final mn3 MINUTES;
    public static final mn3 NANOSECONDS;
    public static final mn3 SECONDS;
    public static final /* synthetic */ mn3[] b;
    public static final /* synthetic */ i04 c;
    public final TimeUnit a;

    static {
        mn3 mn3Var = new mn3("NANOSECONDS", 0, TimeUnit.NANOSECONDS);
        NANOSECONDS = mn3Var;
        mn3 mn3Var2 = new mn3("MICROSECONDS", 1, TimeUnit.MICROSECONDS);
        MICROSECONDS = mn3Var2;
        mn3 mn3Var3 = new mn3("MILLISECONDS", 2, TimeUnit.MILLISECONDS);
        MILLISECONDS = mn3Var3;
        mn3 mn3Var4 = new mn3("SECONDS", 3, TimeUnit.SECONDS);
        SECONDS = mn3Var4;
        mn3 mn3Var5 = new mn3("MINUTES", 4, TimeUnit.MINUTES);
        MINUTES = mn3Var5;
        mn3 mn3Var6 = new mn3("HOURS", 5, TimeUnit.HOURS);
        HOURS = mn3Var6;
        mn3 mn3Var7 = new mn3("DAYS", 6, TimeUnit.DAYS);
        DAYS = mn3Var7;
        mn3[] mn3VarArr = {mn3Var, mn3Var2, mn3Var3, mn3Var4, mn3Var5, mn3Var6, mn3Var7};
        b = mn3VarArr;
        c = new i04(mn3VarArr);
    }

    public mn3(String str, int i, TimeUnit timeUnit) {
        this.a = timeUnit;
    }

    public static g04 getEntries() {
        return c;
    }

    public static mn3 valueOf(String str) {
        return (mn3) Enum.valueOf(mn3.class, str);
    }

    public static mn3[] values() {
        return (mn3[]) b.clone();
    }

    public final TimeUnit getTimeUnit$kotlin_stdlib() {
        return this.a;
    }
}
