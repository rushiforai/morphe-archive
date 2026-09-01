package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nz0 {
    public static final nz0 DROP_LATEST;
    public static final nz0 DROP_OLDEST;
    public static final nz0 SUSPEND;
    public static final /* synthetic */ nz0[] a;
    public static final /* synthetic */ i04 b;

    static {
        nz0 nz0Var = new nz0("SUSPEND", 0);
        SUSPEND = nz0Var;
        nz0 nz0Var2 = new nz0("DROP_OLDEST", 1);
        DROP_OLDEST = nz0Var2;
        nz0 nz0Var3 = new nz0("DROP_LATEST", 2);
        DROP_LATEST = nz0Var3;
        nz0[] nz0VarArr = {nz0Var, nz0Var2, nz0Var3};
        a = nz0VarArr;
        b = new i04(nz0VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static nz0 valueOf(String str) {
        return (nz0) Enum.valueOf(nz0.class, str);
    }

    public static nz0[] values() {
        return (nz0[]) a.clone();
    }
}
