package f9;

import android.content.Context;
import android.graphics.Typeface;
import z.c1;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final c1 f54356a = new c1(0);

    public static Typeface a(Context context, String str) {
        c1 c1Var = f54356a;
        synchronized (c1Var) {
            try {
                if (c1Var.containsKey(str)) {
                    return (Typeface) c1Var.get(str);
                }
                try {
                    Typeface typefaceCreateFromAsset = Typeface.createFromAsset(context.getAssets(), "fonts/".concat(str));
                    c1Var.put(str, typefaceCreateFromAsset);
                    return typefaceCreateFromAsset;
                } catch (RuntimeException unused) {
                    return null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
