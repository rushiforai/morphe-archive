package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j54 {
    public static final j54 APPEND;
    public static final j54 APPEND_OR_REPLACE;
    public static final j54 KEEP;
    public static final j54 REPLACE;
    public static final /* synthetic */ j54[] a;
    public static final /* synthetic */ i04 b;

    static {
        j54 j54Var = new j54("REPLACE", 0);
        REPLACE = j54Var;
        j54 j54Var2 = new j54("KEEP", 1);
        KEEP = j54Var2;
        j54 j54Var3 = new j54("APPEND", 2);
        APPEND = j54Var3;
        j54 j54Var4 = new j54("APPEND_OR_REPLACE", 3);
        APPEND_OR_REPLACE = j54Var4;
        j54[] j54VarArr = {j54Var, j54Var2, j54Var3, j54Var4};
        a = j54VarArr;
        b = new i04(j54VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static j54 valueOf(String str) {
        return (j54) Enum.valueOf(j54.class, str);
    }

    public static j54[] values() {
        return (j54[]) a.clone();
    }
}
