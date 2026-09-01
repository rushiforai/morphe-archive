package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j45 {
    public static final j45 Collapsed;
    public static final j45 Expanded;
    public static final /* synthetic */ j45[] a;
    public static final /* synthetic */ i04 b;

    static {
        j45 j45Var = new j45("Expanded", 0);
        Expanded = j45Var;
        j45 j45Var2 = new j45("Collapsed", 1);
        Collapsed = j45Var2;
        j45[] j45VarArr = {j45Var, j45Var2};
        a = j45VarArr;
        b = new i04(j45VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static j45 valueOf(String str) {
        return (j45) Enum.valueOf(j45.class, str);
    }

    public static j45[] values() {
        return (j45[]) a.clone();
    }
}
