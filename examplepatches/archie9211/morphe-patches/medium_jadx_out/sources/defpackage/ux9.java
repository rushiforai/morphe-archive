package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ux9 {
    public static final ux9 EXACT;
    public static final ux9 INEXACT;
    public static final /* synthetic */ ux9[] a;
    public static final /* synthetic */ i04 b;

    static {
        ux9 ux9Var = new ux9("EXACT", 0);
        EXACT = ux9Var;
        ux9 ux9Var2 = new ux9("INEXACT", 1);
        INEXACT = ux9Var2;
        ux9[] ux9VarArr = {ux9Var, ux9Var2};
        a = ux9VarArr;
        b = new i04(ux9VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ux9 valueOf(String str) {
        return (ux9) Enum.valueOf(ux9.class, str);
    }

    public static ux9[] values() {
        return (ux9[]) a.clone();
    }
}
