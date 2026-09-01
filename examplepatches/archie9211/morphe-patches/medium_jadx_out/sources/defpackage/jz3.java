package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jz3 {
    public static final jz3 PostExit;
    public static final jz3 PreEnter;
    public static final jz3 Visible;
    public static final /* synthetic */ jz3[] a;
    public static final /* synthetic */ i04 b;

    static {
        jz3 jz3Var = new jz3("PreEnter", 0);
        PreEnter = jz3Var;
        jz3 jz3Var2 = new jz3("Visible", 1);
        Visible = jz3Var2;
        jz3 jz3Var3 = new jz3("PostExit", 2);
        PostExit = jz3Var3;
        jz3[] jz3VarArr = {jz3Var, jz3Var2, jz3Var3};
        a = jz3VarArr;
        b = new i04(jz3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static jz3 valueOf(String str) {
        return (jz3) Enum.valueOf(jz3.class, str);
    }

    public static jz3[] values() {
        return (jz3[]) a.clone();
    }
}
