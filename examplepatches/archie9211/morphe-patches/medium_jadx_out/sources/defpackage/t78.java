package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t78 {
    public static final t78 Default;
    public static final t78 PreventUserInput;
    public static final t78 UserInput;
    public static final /* synthetic */ t78[] a;
    public static final /* synthetic */ i04 b;

    static {
        t78 t78Var = new t78("Default", 0);
        Default = t78Var;
        t78 t78Var2 = new t78("UserInput", 1);
        UserInput = t78Var2;
        t78 t78Var3 = new t78("PreventUserInput", 2);
        PreventUserInput = t78Var3;
        t78[] t78VarArr = {t78Var, t78Var2, t78Var3};
        a = t78VarArr;
        b = new i04(t78VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static t78 valueOf(String str) {
        return (t78) Enum.valueOf(t78.class, str);
    }

    public static t78[] values() {
        return (t78[]) a.clone();
    }
}
