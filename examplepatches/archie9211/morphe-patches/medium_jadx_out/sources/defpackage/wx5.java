package defpackage;

import android.graphics.Bitmap;
import android.graphics.ColorSpace;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wx5 {
    public static final q84 a = new q84(yrd.a);
    public static final q84 b = new q84(spe.b);
    public static final q84 c = new q84(null);
    public static final q84 d;
    public static final q84 e;
    public static final q84 f;
    public static final q84 g;

    static {
        Boolean bool = Boolean.TRUE;
        d = new q84(bool);
        e = new q84(null);
        f = new q84(bool);
        g = new q84(Boolean.FALSE);
    }

    public static final Bitmap.Config a(ew8 ew8Var) {
        return (Bitmap.Config) k40.c0(ew8Var, b);
    }

    public static final ColorSpace b(ew8 ew8Var) {
        return z10.b(k40.c0(ew8Var, c));
    }
}
