package defpackage;

import androidx.appcompat.widget.ActionBarOverlayLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w5 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ActionBarOverlayLayout b;

    public /* synthetic */ w5(ActionBarOverlayLayout actionBarOverlayLayout, int i) {
        this.a = i;
        this.b = actionBarOverlayLayout;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        ActionBarOverlayLayout actionBarOverlayLayout = this.b;
        switch (i) {
            case 0:
                actionBarOverlayLayout.b();
                actionBarOverlayLayout.w = actionBarOverlayLayout.d.animate().translationY(0.0f).setListener(actionBarOverlayLayout.x);
                break;
            default:
                actionBarOverlayLayout.b();
                actionBarOverlayLayout.w = actionBarOverlayLayout.d.animate().translationY(-actionBarOverlayLayout.d.getHeight()).setListener(actionBarOverlayLayout.x);
                break;
        }
    }
}
