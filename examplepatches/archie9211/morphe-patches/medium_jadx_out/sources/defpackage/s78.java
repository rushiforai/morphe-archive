package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s78 {
    public static final s78 Default;
    public static final s78 PreventUserInput;
    public static final s78 UserInput;
    public static final /* synthetic */ s78[] a;
    public static final /* synthetic */ i04 b;

    static {
        s78 s78Var = new s78("Default", 0);
        Default = s78Var;
        s78 s78Var2 = new s78("UserInput", 1);
        UserInput = s78Var2;
        s78 s78Var3 = new s78("PreventUserInput", 2);
        PreventUserInput = s78Var3;
        s78[] s78VarArr = {s78Var, s78Var2, s78Var3};
        a = s78VarArr;
        b = new i04(s78VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static s78 valueOf(String str) {
        return (s78) Enum.valueOf(s78.class, str);
    }

    public static s78[] values() {
        return (s78[]) a.clone();
    }
}
