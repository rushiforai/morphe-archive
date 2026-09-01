package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wq9 {
    public static final wq9 DO_NOTHING;
    public static final wq9 OPEN_EDITOR;
    public static final wq9 OPEN_POST_PAGE;
    public static final /* synthetic */ wq9[] a;
    public static final /* synthetic */ i04 b;

    static {
        wq9 wq9Var = new wq9("OPEN_POST_PAGE", 0);
        OPEN_POST_PAGE = wq9Var;
        wq9 wq9Var2 = new wq9("OPEN_EDITOR", 1);
        OPEN_EDITOR = wq9Var2;
        wq9 wq9Var3 = new wq9("DO_NOTHING", 2);
        DO_NOTHING = wq9Var3;
        wq9[] wq9VarArr = {wq9Var, wq9Var2, wq9Var3};
        a = wq9VarArr;
        b = new i04(wq9VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static wq9 valueOf(String str) {
        return (wq9) Enum.valueOf(wq9.class, str);
    }

    public static wq9[] values() {
        return (wq9[]) a.clone();
    }
}
