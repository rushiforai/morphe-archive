package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ul2 {
    public static final ul2 Cancelled;
    public static final ul2 None;
    public static final ul2 RedirectCancelled;
    public static final ul2 Redirected;
    public static final /* synthetic */ ul2[] a;
    public static final /* synthetic */ i04 b;

    static {
        ul2 ul2Var = new ul2("None", 0);
        None = ul2Var;
        ul2 ul2Var2 = new ul2("Cancelled", 1);
        Cancelled = ul2Var2;
        ul2 ul2Var3 = new ul2("Redirected", 2);
        Redirected = ul2Var3;
        ul2 ul2Var4 = new ul2("RedirectCancelled", 3);
        RedirectCancelled = ul2Var4;
        ul2[] ul2VarArr = {ul2Var, ul2Var2, ul2Var3, ul2Var4};
        a = ul2VarArr;
        b = new i04(ul2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ul2 valueOf(String str) {
        return (ul2) Enum.valueOf(ul2.class, str);
    }

    public static ul2[] values() {
        return (ul2[]) a.clone();
    }
}
