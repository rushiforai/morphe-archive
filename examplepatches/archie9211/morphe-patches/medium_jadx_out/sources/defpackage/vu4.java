package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vu4 {
    public static final vu4 DEFAULT;
    public static final vu4 PRIMARY;
    public static final /* synthetic */ vu4[] a;
    public static final /* synthetic */ i04 b;

    static {
        vu4 vu4Var = new vu4("DEFAULT", 0);
        DEFAULT = vu4Var;
        vu4 vu4Var2 = new vu4("PRIMARY", 1);
        PRIMARY = vu4Var2;
        vu4[] vu4VarArr = {vu4Var, vu4Var2};
        a = vu4VarArr;
        b = new i04(vu4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static vu4 valueOf(String str) {
        return (vu4) Enum.valueOf(vu4.class, str);
    }

    public static vu4[] values() {
        return (vu4[]) a.clone();
    }
}
