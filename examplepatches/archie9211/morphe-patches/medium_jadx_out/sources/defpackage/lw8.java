package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lw8 {
    public static final lw8 DROP_WORK_REQUEST;
    public static final lw8 RUN_AS_NON_EXPEDITED_WORK_REQUEST;
    public static final /* synthetic */ lw8[] a;
    public static final /* synthetic */ i04 b;

    static {
        lw8 lw8Var = new lw8("RUN_AS_NON_EXPEDITED_WORK_REQUEST", 0);
        RUN_AS_NON_EXPEDITED_WORK_REQUEST = lw8Var;
        lw8 lw8Var2 = new lw8("DROP_WORK_REQUEST", 1);
        DROP_WORK_REQUEST = lw8Var2;
        lw8[] lw8VarArr = {lw8Var, lw8Var2};
        a = lw8VarArr;
        b = new i04(lw8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static lw8 valueOf(String str) {
        return (lw8) Enum.valueOf(lw8.class, str);
    }

    public static lw8[] values() {
        return (lw8[]) a.clone();
    }
}
