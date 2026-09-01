package defpackage;

import android.view.View;
import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nte {
    public static z4f a(View view) {
        WindowInsets rootWindowInsets = view.getRootWindowInsets();
        if (rootWindowInsets == null) {
            return null;
        }
        z4f z4fVarH = z4f.h(rootWindowInsets, null);
        w4f w4fVar = z4fVarH.a;
        w4fVar.y(z4fVarH);
        View rootView = view.getRootView();
        w4fVar.d(rootView);
        w4fVar.p(rootView);
        w4fVar.q();
        return z4fVarH;
    }
}
