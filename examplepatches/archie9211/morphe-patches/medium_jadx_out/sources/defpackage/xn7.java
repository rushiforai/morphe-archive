package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xn7 {
    public static final xn7 L;
    public static final xn7 M;
    public static final xn7 S;
    public static final xn7 XS;
    public static final /* synthetic */ xn7[] d;
    public static final /* synthetic */ i04 e;
    public final jy8 a;
    public final float b;
    public final b55 c;

    static {
        xn7 xn7Var = new xn7("L", 0, new jy8(20.0f, 9.0f, 20.0f, 9.0f), 21.0f, new p44(28));
        L = xn7Var;
        xn7 xn7Var2 = new xn7("M", 1, new jy8(16.0f, 9.0f, 16.0f, 9.0f), 19.0f, new p44(29));
        M = xn7Var2;
        xn7 xn7Var3 = new xn7("S", 2, new jy8(12.0f, 6.0f, 12.0f, 6.0f), 16.0f, new wn7(0));
        S = xn7Var3;
        xn7 xn7Var4 = new xn7("XS", 3, new jy8(8.0f, 2.0f, 8.0f, 2.0f), 12.0f, new wn7(1));
        XS = xn7Var4;
        xn7[] xn7VarArr = {xn7Var, xn7Var2, xn7Var3, xn7Var4};
        d = xn7VarArr;
        e = new i04(xn7VarArr);
    }

    public xn7(String str, int i, jy8 jy8Var, float f, b55 b55Var) {
        this.a = jy8Var;
        this.b = f;
        this.c = b55Var;
    }

    public static g04 getEntries() {
        return e;
    }

    public static xn7 valueOf(String str) {
        return (xn7) Enum.valueOf(xn7.class, str);
    }

    public static xn7[] values() {
        return (xn7[]) d.clone();
    }

    public final hy8 getContentPadding() {
        return this.a;
    }

    /* JADX INFO: renamed from: getCornerSize-D9Ej5fM, reason: not valid java name */
    public final float m180getCornerSizeD9Ej5fM() {
        return this.b;
    }

    public final b55 getTextStyle() {
        return this.c;
    }
}
