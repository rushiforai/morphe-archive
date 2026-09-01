package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tm0 {
    public static final tm0 EXPONENTIAL;
    public static final tm0 LINEAR;
    public static final /* synthetic */ tm0[] a;
    public static final /* synthetic */ i04 b;

    static {
        tm0 tm0Var = new tm0("EXPONENTIAL", 0);
        EXPONENTIAL = tm0Var;
        tm0 tm0Var2 = new tm0("LINEAR", 1);
        LINEAR = tm0Var2;
        tm0[] tm0VarArr = {tm0Var, tm0Var2};
        a = tm0VarArr;
        b = new i04(tm0VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static tm0 valueOf(String str) {
        return (tm0) Enum.valueOf(tm0.class, str);
    }

    public static tm0[] values() {
        return (tm0[]) a.clone();
    }
}
