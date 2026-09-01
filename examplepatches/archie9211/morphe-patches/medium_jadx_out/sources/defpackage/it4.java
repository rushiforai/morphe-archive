package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class it4 {
    public static final it4 L;
    public static final it4 M;
    public static final it4 S;
    public static final /* synthetic */ it4[] d;
    public static final /* synthetic */ i04 e;
    public final jy8 a;
    public final float b;
    public final b55 c;

    static {
        it4 it4Var = new it4("L", 0, new jy8(20.0f, 9.0f, 20.0f, 9.0f), 21.0f, new p44(7));
        L = it4Var;
        it4 it4Var2 = new it4("M", 1, new jy8(16.0f, 9.0f, 16.0f, 9.0f), 19.0f, new p44(8));
        M = it4Var2;
        it4 it4Var3 = new it4("S", 2, new jy8(12.0f, 6.0f, 12.0f, 6.0f), 16.0f, new p44(9));
        S = it4Var3;
        it4[] it4VarArr = {it4Var, it4Var2, it4Var3};
        d = it4VarArr;
        e = new i04(it4VarArr);
    }

    public it4(String str, int i, jy8 jy8Var, float f, b55 b55Var) {
        this.a = jy8Var;
        this.b = f;
        this.c = b55Var;
    }

    public static g04 getEntries() {
        return e;
    }

    public static it4 valueOf(String str) {
        return (it4) Enum.valueOf(it4.class, str);
    }

    public static it4[] values() {
        return (it4[]) d.clone();
    }

    public final hy8 getContentPadding() {
        return this.a;
    }

    /* JADX INFO: renamed from: getCornerSize-D9Ej5fM, reason: not valid java name */
    public final float m115getCornerSizeD9Ej5fM() {
        return this.b;
    }

    public final b55 getTextStyle() {
        return this.c;
    }
}
