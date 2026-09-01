package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class my5 {
    public static final my5 FIT_HEIGHT;
    public static final my5 FIT_IF_BIGGER;
    public static final my5 FIT_TO_SCREEN;
    public static final my5 FIT_WIDTH;
    public static final my5 NONE;
    public static final /* synthetic */ my5[] a;

    static {
        my5 my5Var = new my5("NONE", 0);
        NONE = my5Var;
        my5 my5Var2 = new my5("FIT_TO_SCREEN", 1);
        FIT_TO_SCREEN = my5Var2;
        my5 my5Var3 = new my5("FIT_IF_BIGGER", 2);
        FIT_IF_BIGGER = my5Var3;
        my5 my5Var4 = new my5("FIT_HEIGHT", 3);
        FIT_HEIGHT = my5Var4;
        my5 my5Var5 = new my5("FIT_WIDTH", 4);
        FIT_WIDTH = my5Var5;
        a = new my5[]{my5Var, my5Var2, my5Var3, my5Var4, my5Var5};
    }

    public static my5 valueOf(String str) {
        return (my5) Enum.valueOf(my5.class, str);
    }

    public static my5[] values() {
        return (my5[]) a.clone();
    }
}
