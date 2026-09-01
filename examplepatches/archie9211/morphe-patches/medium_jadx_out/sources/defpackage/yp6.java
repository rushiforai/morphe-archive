package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yp6 {
    public static final yp6 InLayoutBlock;
    public static final yp6 InMeasureBlock;
    public static final yp6 NotUsed;
    public static final /* synthetic */ yp6[] a;
    public static final /* synthetic */ i04 b;

    static {
        yp6 yp6Var = new yp6("InMeasureBlock", 0);
        InMeasureBlock = yp6Var;
        yp6 yp6Var2 = new yp6("InLayoutBlock", 1);
        InLayoutBlock = yp6Var2;
        yp6 yp6Var3 = new yp6("NotUsed", 2);
        NotUsed = yp6Var3;
        yp6[] yp6VarArr = {yp6Var, yp6Var2, yp6Var3};
        a = yp6VarArr;
        b = new i04(yp6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static yp6 valueOf(String str) {
        return (yp6) Enum.valueOf(yp6.class, str);
    }

    public static yp6[] values() {
        return (yp6[]) a.clone();
    }
}
