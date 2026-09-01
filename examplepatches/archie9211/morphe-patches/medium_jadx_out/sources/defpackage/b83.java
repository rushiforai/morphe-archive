package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b83 {
    public static final b83 ERROR;
    public static final b83 HIDDEN;
    public static final b83 WARNING;
    public static final /* synthetic */ b83[] a;
    public static final /* synthetic */ i04 b;

    static {
        b83 b83Var = new b83("WARNING", 0);
        WARNING = b83Var;
        b83 b83Var2 = new b83("ERROR", 1);
        ERROR = b83Var2;
        b83 b83Var3 = new b83("HIDDEN", 2);
        HIDDEN = b83Var3;
        b83[] b83VarArr = {b83Var, b83Var2, b83Var3};
        a = b83VarArr;
        b = new i04(b83VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static b83 valueOf(String str) {
        return (b83) Enum.valueOf(b83.class, str);
    }

    public static b83[] values() {
        return (b83[]) a.clone();
    }
}
