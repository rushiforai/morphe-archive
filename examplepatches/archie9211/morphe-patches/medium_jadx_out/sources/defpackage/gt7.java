package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gt7 {
    public static final gt7 ACCENT;
    public static final gt7 DEFAULT;
    public static final gt7 ERROR;
    public static final /* synthetic */ gt7[] a;
    public static final /* synthetic */ i04 b;

    static {
        gt7 gt7Var = new gt7("DEFAULT", 0);
        DEFAULT = gt7Var;
        gt7 gt7Var2 = new gt7("ERROR", 1);
        ERROR = gt7Var2;
        gt7 gt7Var3 = new gt7("ACCENT", 2);
        ACCENT = gt7Var3;
        gt7[] gt7VarArr = {gt7Var, gt7Var2, gt7Var3};
        a = gt7VarArr;
        b = new i04(gt7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static gt7 valueOf(String str) {
        return (gt7) Enum.valueOf(gt7.class, str);
    }

    public static gt7[] values() {
        return (gt7[]) a.clone();
    }
}
