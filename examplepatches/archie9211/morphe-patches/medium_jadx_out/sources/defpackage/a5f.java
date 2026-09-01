package defpackage;

import android.view.View;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class a5f extends rr7 {
    public final Window d;

    public a5f(Window window) {
        this.d = window;
    }

    @Override // defpackage.rr7
    public final boolean A() {
        return (this.d.getDecorView().getSystemUiVisibility() & 8192) != 0;
    }

    @Override // defpackage.rr7
    public final void C(boolean z) {
        Window window = this.d;
        if (!z) {
            View decorView = window.getDecorView();
            decorView.setSystemUiVisibility(decorView.getSystemUiVisibility() & (-8193));
        } else {
            window.clearFlags(67108864);
            window.addFlags(Integer.MIN_VALUE);
            View decorView2 = window.getDecorView();
            decorView2.setSystemUiVisibility(decorView2.getSystemUiVisibility() | 8192);
        }
    }
}
