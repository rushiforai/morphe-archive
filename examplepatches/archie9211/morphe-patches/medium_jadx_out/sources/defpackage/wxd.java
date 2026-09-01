package defpackage;

import android.content.Context;
import android.graphics.Paint;
import android.graphics.Typeface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wxd {
    public static final ThreadLocal a = new ThreadLocal();

    public static Typeface a(Typeface typeface, c05 c05Var, Context context) {
        if (typeface == null) {
            return null;
        }
        if (c05Var.a.isEmpty()) {
            return typeface;
        }
        ThreadLocal threadLocal = a;
        Paint paint = (Paint) threadLocal.get();
        if (paint == null) {
            paint = new Paint();
            threadLocal.set(paint);
        }
        paint.setFontVariationSettings(null);
        paint.setTypeface(typeface);
        paint.setFontVariationSettings(io.s(c05Var, context));
        return paint.getTypeface();
    }
}
