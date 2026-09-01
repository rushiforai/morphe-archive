package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pm3 {
    public static final pm3 Closed;
    public static final pm3 Open;
    public static final /* synthetic */ pm3[] a;
    public static final /* synthetic */ i04 b;

    static {
        pm3 pm3Var = new pm3("Closed", 0);
        Closed = pm3Var;
        pm3 pm3Var2 = new pm3("Open", 1);
        Open = pm3Var2;
        pm3[] pm3VarArr = {pm3Var, pm3Var2};
        a = pm3VarArr;
        b = new i04(pm3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static pm3 valueOf(String str) {
        return (pm3) Enum.valueOf(pm3.class, str);
    }

    public static pm3[] values() {
        return (pm3[]) a.clone();
    }
}
