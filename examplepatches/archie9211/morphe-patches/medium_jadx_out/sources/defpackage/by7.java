package defpackage;

import android.widget.PopupWindow;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class by7 implements PopupWindow.OnDismissListener {
    public final /* synthetic */ cy7 a;

    public by7(cy7 cy7Var) {
        this.a = cy7Var;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        this.a.c();
    }
}
