package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cj3 {
    public static final cj3 Cancel;
    public static final cj3 Drag;
    public static final cj3 Timeout;
    public static final cj3 Up;
    public static final /* synthetic */ cj3[] a;
    public static final /* synthetic */ i04 b;

    static {
        cj3 cj3Var = new cj3("Up", 0);
        Up = cj3Var;
        cj3 cj3Var2 = new cj3("Drag", 1);
        Drag = cj3Var2;
        cj3 cj3Var3 = new cj3("Timeout", 2);
        Timeout = cj3Var3;
        cj3 cj3Var4 = new cj3("Cancel", 3);
        Cancel = cj3Var4;
        cj3[] cj3VarArr = {cj3Var, cj3Var2, cj3Var3, cj3Var4};
        a = cj3VarArr;
        b = new i04(cj3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static cj3 valueOf(String str) {
        return (cj3) Enum.valueOf(cj3.class, str);
    }

    public static cj3[] values() {
        return (cj3[]) a.clone();
    }
}
