package defpackage;

import android.view.ViewTreeObserver;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ha2 implements ViewTreeObserver.OnPreDrawListener {
    public final /* synthetic */ CoordinatorLayout a;

    public ha2(CoordinatorLayout coordinatorLayout) {
        this.a = coordinatorLayout;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        this.a.i(0);
        return true;
    }
}
