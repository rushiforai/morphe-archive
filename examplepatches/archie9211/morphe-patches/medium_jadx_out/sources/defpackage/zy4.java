package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy4 {
    public static final zy4 DEFAULT;
    public static final zy4 OPEN_DYSLEXIC;
    public static final /* synthetic */ zy4[] a;
    public static final /* synthetic */ i04 b;

    static {
        zy4 zy4Var = new zy4("DEFAULT", 0);
        DEFAULT = zy4Var;
        zy4 zy4Var2 = new zy4("OPEN_DYSLEXIC", 1);
        OPEN_DYSLEXIC = zy4Var2;
        zy4[] zy4VarArr = {zy4Var, zy4Var2};
        a = zy4VarArr;
        b = new i04(zy4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static zy4 valueOf(String str) {
        return (zy4) Enum.valueOf(zy4.class, str);
    }

    public static zy4[] values() {
        return (zy4[]) a.clone();
    }
}
