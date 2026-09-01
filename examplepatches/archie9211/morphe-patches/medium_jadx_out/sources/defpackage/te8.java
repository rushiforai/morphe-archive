package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class te8 {
    public static final te8 CONNECTED;
    public static final te8 METERED;
    public static final te8 NOT_REQUIRED;
    public static final te8 NOT_ROAMING;
    public static final te8 TEMPORARILY_UNMETERED;
    public static final te8 UNMETERED;
    public static final /* synthetic */ te8[] a;
    public static final /* synthetic */ i04 b;

    static {
        te8 te8Var = new te8("NOT_REQUIRED", 0);
        NOT_REQUIRED = te8Var;
        te8 te8Var2 = new te8("CONNECTED", 1);
        CONNECTED = te8Var2;
        te8 te8Var3 = new te8("UNMETERED", 2);
        UNMETERED = te8Var3;
        te8 te8Var4 = new te8("NOT_ROAMING", 3);
        NOT_ROAMING = te8Var4;
        te8 te8Var5 = new te8("METERED", 4);
        METERED = te8Var5;
        te8 te8Var6 = new te8("TEMPORARILY_UNMETERED", 5);
        TEMPORARILY_UNMETERED = te8Var6;
        te8[] te8VarArr = {te8Var, te8Var2, te8Var3, te8Var4, te8Var5, te8Var6};
        a = te8VarArr;
        b = new i04(te8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static te8 valueOf(String str) {
        return (te8) Enum.valueOf(te8.class, str);
    }

    public static te8[] values() {
        return (te8[]) a.clone();
    }
}
