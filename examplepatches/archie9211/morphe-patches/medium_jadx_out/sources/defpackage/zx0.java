package defpackage;

import android.app.Activity;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.view.WindowManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zx0 implements yx0, o5f {
    public static final zx0 a = new zx0();
    public static final zx0 b = new zx0();

    @Override // defpackage.o5f
    public k5f b(ContextWrapper contextWrapper, n73 n73Var) {
        WindowManager windowManager = (WindowManager) contextWrapper.getSystemService(WindowManager.class);
        float f = contextWrapper.getResources().getDisplayMetrics().density;
        Rect bounds = windowManager.getCurrentWindowMetrics().getBounds();
        bounds.getClass();
        return new k5f(bounds, f);
    }

    @Override // defpackage.yx0
    public Rect p(Activity activity) {
        Rect bounds = ((WindowManager) activity.getSystemService(WindowManager.class)).getCurrentWindowMetrics().getBounds();
        bounds.getClass();
        return bounds;
    }
}
