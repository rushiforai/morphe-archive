package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rm6 {
    public static final rm6 ERROR;
    public static final rm6 HIDDEN;
    public static final rm6 WARNING;
    public static final /* synthetic */ rm6[] a;

    static {
        rm6 rm6Var = new rm6("WARNING", 0);
        WARNING = rm6Var;
        rm6 rm6Var2 = new rm6("ERROR", 1);
        ERROR = rm6Var2;
        rm6 rm6Var3 = new rm6("HIDDEN", 2);
        HIDDEN = rm6Var3;
        a = new rm6[]{rm6Var, rm6Var2, rm6Var3};
    }

    public static rm6 valueOf(String str) {
        return (rm6) Enum.valueOf(rm6.class, str);
    }

    public static rm6[] values() {
        return (rm6[]) a.clone();
    }
}
