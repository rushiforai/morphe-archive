package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yn7 {
    public static final yn7 L;
    public static final yn7 M;
    public static final yn7 S;
    public static final yn7 XS;
    public static final /* synthetic */ yn7[] d;
    public static final /* synthetic */ i04 e;
    public final jy8 a;
    public final float b;
    public final b55 c;

    static {
        yn7 yn7Var = new yn7("L", 0, new jy8(20.0f, 9.0f, 20.0f, 9.0f), 21.0f, new p44(24));
        L = yn7Var;
        yn7 yn7Var2 = new yn7("M", 1, new jy8(16.0f, 9.0f, 16.0f, 9.0f), 19.0f, new p44(25));
        M = yn7Var2;
        yn7 yn7Var3 = new yn7("S", 2, new jy8(12.0f, 6.0f, 12.0f, 6.0f), 16.0f, new p44(26));
        S = yn7Var3;
        yn7 yn7Var4 = new yn7("XS", 3, new jy8(8.0f, 2.0f, 8.0f, 2.0f), 12.0f, new p44(27));
        XS = yn7Var4;
        yn7[] yn7VarArr = {yn7Var, yn7Var2, yn7Var3, yn7Var4};
        d = yn7VarArr;
        e = new i04(yn7VarArr);
    }

    public yn7(String str, int i, jy8 jy8Var, float f, b55 b55Var) {
        this.a = jy8Var;
        this.b = f;
        this.c = b55Var;
    }

    public static g04 getEntries() {
        return e;
    }

    public static yn7 valueOf(String str) {
        return (yn7) Enum.valueOf(yn7.class, str);
    }

    public static yn7[] values() {
        return (yn7[]) d.clone();
    }

    public final hy8 getContentPadding() {
        return this.a;
    }

    /* JADX INFO: renamed from: getCornerSize-D9Ej5fM, reason: not valid java name */
    public final float m181getCornerSizeD9Ej5fM() {
        return this.b;
    }

    public final b55 getTextStyle() {
        return this.c;
    }
}
