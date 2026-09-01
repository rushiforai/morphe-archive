package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.view.WindowManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o73 implements n73, o5f {
    public static final o73 a = new o73();
    public static final o73 b = new o73();

    @Override // defpackage.o5f
    public k5f b(ContextWrapper contextWrapper, n73 n73Var) {
        WindowManager windowManager = contextWrapper.isUiContext() ? (WindowManager) contextWrapper.getSystemService(WindowManager.class) : (WindowManager) contextWrapper.getApplicationContext().getSystemService(WindowManager.class);
        Rect bounds = windowManager.getCurrentWindowMetrics().getBounds();
        bounds.getClass();
        return new k5f(bounds, windowManager.getCurrentWindowMetrics().getDensity());
    }

    @Override // defpackage.n73
    public float c(Context context) {
        return ((WindowManager) context.getSystemService(WindowManager.class)).getCurrentWindowMetrics().getDensity();
    }
}
