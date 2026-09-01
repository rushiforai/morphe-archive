package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z54 {
    public static final z54 CANT_SHOW_MORE_OR_LESS;
    public static final z54 ERROR;
    public static final z54 NOT_SHOWING_MORE_OR_LESS;
    public static final z54 SHOWING_LESS;
    public static final z54 SHOWING_MORE;
    public static final /* synthetic */ z54[] a;
    public static final /* synthetic */ i04 b;

    static {
        z54 z54Var = new z54("SHOWING_MORE", 0);
        SHOWING_MORE = z54Var;
        z54 z54Var2 = new z54("SHOWING_LESS", 1);
        SHOWING_LESS = z54Var2;
        z54 z54Var3 = new z54("NOT_SHOWING_MORE_OR_LESS", 2);
        NOT_SHOWING_MORE_OR_LESS = z54Var3;
        z54 z54Var4 = new z54("CANT_SHOW_MORE_OR_LESS", 3);
        CANT_SHOW_MORE_OR_LESS = z54Var4;
        z54 z54Var5 = new z54("ERROR", 4);
        ERROR = z54Var5;
        z54[] z54VarArr = {z54Var, z54Var2, z54Var3, z54Var4, z54Var5};
        a = z54VarArr;
        b = new i04(z54VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static z54 valueOf(String str) {
        return (z54) Enum.valueOf(z54.class, str);
    }

    public static z54[] values() {
        return (z54[]) a.clone();
    }
}
