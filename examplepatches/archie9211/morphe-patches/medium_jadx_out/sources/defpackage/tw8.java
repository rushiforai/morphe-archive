package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class tw8 {
    public static final tw8 L;
    public static final tw8 M;
    public static final tw8 S;
    public static final /* synthetic */ tw8[] d;
    public static final /* synthetic */ i04 e;
    public final jy8 a;
    public final float b;
    public final b55 c;

    public tw8(String str, int i, jy8 jy8Var, float f, b55 b55Var) {
        this.a = jy8Var;
        this.b = f;
        this.c = b55Var;
    }

    public static g04 getEntries() {
        return e;
    }

    public static tw8 valueOf(String str) {
        return (tw8) Enum.valueOf(tw8.class, str);
    }

    public static tw8[] values() {
        return (tw8[]) d.clone();
    }

    public final hy8 getContentPadding() {
        return this.a;
    }

    /* JADX INFO: renamed from: getCornerSize-D9Ej5fM, reason: not valid java name */
    public final float m177getCornerSizeD9Ej5fM() {
        return this.b;
    }

    public final b55 getTextStyle() {
        return this.c;
    }

    static {
        tw8 tw8Var = new tw8(uuLAxLN.hSpyoaIYkb, 0, new jy8(20.0f, 9.0f, 20.0f, 9.0f), 21.0f, new sw8(0));
        L = tw8Var;
        tw8 tw8Var2 = new tw8("M", 1, new jy8(16.0f, 9.0f, 16.0f, 9.0f), 19.0f, new sw8(1));
        M = tw8Var2;
        tw8 tw8Var3 = new tw8("S", 2, new jy8(12.0f, 6.0f, 12.0f, 6.0f), 16.0f, new sw8(2));
        S = tw8Var3;
        tw8[] tw8VarArr = {tw8Var, tw8Var2, tw8Var3};
        d = tw8VarArr;
        e = new i04(tw8VarArr);
    }
}
