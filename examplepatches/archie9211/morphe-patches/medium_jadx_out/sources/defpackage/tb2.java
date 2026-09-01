package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tb2 {
    public static final tb2 COROUTINE_SUSPENDED;
    public static final tb2 RESUMED;
    public static final tb2 UNDECIDED;
    public static final /* synthetic */ tb2[] a;
    public static final /* synthetic */ i04 b;

    static {
        tb2 tb2Var = new tb2("COROUTINE_SUSPENDED", 0);
        COROUTINE_SUSPENDED = tb2Var;
        tb2 tb2Var2 = new tb2("UNDECIDED", 1);
        UNDECIDED = tb2Var2;
        tb2 tb2Var3 = new tb2("RESUMED", 2);
        RESUMED = tb2Var3;
        tb2[] tb2VarArr = {tb2Var, tb2Var2, tb2Var3};
        a = tb2VarArr;
        b = new i04(tb2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static tb2 valueOf(String str) {
        return (tb2) Enum.valueOf(tb2.class, str);
    }

    public static tb2[] values() {
        return (tb2[]) a.clone();
    }
}
