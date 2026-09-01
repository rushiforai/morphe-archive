package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u29 {
    public static final u29 EDIT;
    public static final u29 VIEW;
    public static final /* synthetic */ u29[] a;
    public static final /* synthetic */ i04 b;

    static {
        u29 u29Var = new u29("VIEW", 0);
        VIEW = u29Var;
        u29 u29Var2 = new u29("EDIT", 1);
        EDIT = u29Var2;
        u29[] u29VarArr = {u29Var, u29Var2};
        a = u29VarArr;
        b = new i04(u29VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static u29 valueOf(String str) {
        return (u29) Enum.valueOf(u29.class, str);
    }

    public static u29[] values() {
        return (u29[]) a.clone();
    }
}
