package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mb9 {
    public static final mb9 Final;
    public static final mb9 Initial;
    public static final mb9 Main;
    public static final /* synthetic */ mb9[] a;
    public static final /* synthetic */ i04 b;

    static {
        mb9 mb9Var = new mb9("Initial", 0);
        Initial = mb9Var;
        mb9 mb9Var2 = new mb9("Main", 1);
        Main = mb9Var2;
        mb9 mb9Var3 = new mb9("Final", 2);
        Final = mb9Var3;
        mb9[] mb9VarArr = {mb9Var, mb9Var2, mb9Var3};
        a = mb9VarArr;
        b = new i04(mb9VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static mb9 valueOf(String str) {
        return (mb9) Enum.valueOf(mb9.class, str);
    }

    public static mb9[] values() {
        return (mb9[]) a.clone();
    }
}
