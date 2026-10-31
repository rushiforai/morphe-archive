package aa;

import android.content.Context;
import android.graphics.drawable.Drawable;
import com.android.launcher3.icons.BitmapInfo;
import o9.t1;

/* loaded from: classes.dex */
public final class i extends h {
    public static BitmapInfo o(Context context, j jVar) {
        Drawable drawableB = jVar.b(t1.c(context).f80135d);
        if (drawableB == null) {
            return BitmapInfo.f21150d;
        }
        g0 g0VarW = g0.w(context);
        try {
            BitmapInfo bitmapInfoC = g0VarW.c(drawableB, jVar.getUser(), 0);
            g0VarW.D();
            return bitmapInfoC;
        } catch (Throwable th2) {
            try {
                g0VarW.D();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    @Override // aa.h, ba.d
    public final /* bridge */ /* synthetic */ BitmapInfo e(Context context, Object obj) {
        return o(context, (j) obj);
    }

    @Override // aa.h
    /* renamed from: n */
    public final /* bridge */ /* synthetic */ BitmapInfo e(Context context, j jVar) {
        return o(context, jVar);
    }
}
