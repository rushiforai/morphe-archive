package defpackage;

import android.view.View;
import android.widget.FrameLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gve implements ete {
    public final FrameLayout a;
    public final FrameLayout b;

    public gve(FrameLayout frameLayout, FrameLayout frameLayout2) {
        this.a = frameLayout;
        this.b = frameLayout2;
    }

    @Override // defpackage.ete
    public final View getRoot() {
        return this.a;
    }
}
