package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ht7 {
    public static final ht7 ACCENT;
    public static final ht7 DEFAULT;
    public static final ht7 ERROR;
    public static final /* synthetic */ ht7[] a;
    public static final /* synthetic */ i04 b;

    static {
        ht7 ht7Var = new ht7("DEFAULT", 0);
        DEFAULT = ht7Var;
        ht7 ht7Var2 = new ht7("ERROR", 1);
        ERROR = ht7Var2;
        ht7 ht7Var3 = new ht7("ACCENT", 2);
        ACCENT = ht7Var3;
        ht7[] ht7VarArr = {ht7Var, ht7Var2, ht7Var3};
        a = ht7VarArr;
        b = new i04(ht7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ht7 valueOf(String str) {
        return (ht7) Enum.valueOf(ht7.class, str);
    }

    public static ht7[] values() {
        return (ht7[]) a.clone();
    }
}
