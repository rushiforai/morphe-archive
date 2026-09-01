package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ya3 {
    public static final ya3 BOT;
    public static final ya3 DESKTOP;
    public static final ya3 GAMING_CONSOLE;
    public static final ya3 MOBILE;
    public static final ya3 OTHER;
    public static final ya3 TABLET;
    public static final ya3 TV;
    public static final /* synthetic */ ya3[] a;

    static {
        ya3 ya3Var = new ya3("MOBILE", 0);
        MOBILE = ya3Var;
        ya3 ya3Var2 = new ya3("TABLET", 1);
        TABLET = ya3Var2;
        ya3 ya3Var3 = new ya3("TV", 2);
        TV = ya3Var3;
        ya3 ya3Var4 = new ya3("DESKTOP", 3);
        DESKTOP = ya3Var4;
        ya3 ya3Var5 = new ya3("GAMING_CONSOLE", 4);
        GAMING_CONSOLE = ya3Var5;
        ya3 ya3Var6 = new ya3("BOT", 5);
        BOT = ya3Var6;
        ya3 ya3Var7 = new ya3("OTHER", 6);
        OTHER = ya3Var7;
        a = new ya3[]{ya3Var, ya3Var2, ya3Var3, ya3Var4, ya3Var5, ya3Var6, ya3Var7};
    }

    public static ya3 valueOf(String str) {
        return (ya3) Enum.valueOf(ya3.class, str);
    }

    public static ya3[] values() {
        return (ya3[]) a.clone();
    }
}
