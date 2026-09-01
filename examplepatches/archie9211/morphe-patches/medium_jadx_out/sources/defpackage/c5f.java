package defpackage;

import android.view.View;
import android.view.Window;
import android.view.WindowInsetsController;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class c5f extends rr7 {
    public final WindowInsetsController d;
    public final Window e;

    public c5f(Window window) {
        this.d = window.getInsetsController();
        this.e = window;
    }

    @Override // defpackage.rr7
    public boolean A() {
        Window window = this.e;
        if (window == null) {
            this.d.setSystemBarsAppearance(0, 0);
            if ((this.d.getSystemBarsAppearance() & 8) != 0) {
                return true;
            }
        } else if ((window.getDecorView().getSystemUiVisibility() & 8192) != 0) {
            return true;
        }
        return false;
    }

    @Override // defpackage.rr7
    public void B(boolean z) {
        H(16, 16, z);
    }

    @Override // defpackage.rr7
    public void C(boolean z) {
        H(8192, 8, z);
    }

    public final void H(int i, int i2, boolean z) {
        Window window = this.e;
        if (window == null) {
            WindowInsetsController windowInsetsController = this.d;
            if (z) {
                windowInsetsController.setSystemBarsAppearance(i2, i2);
                return;
            } else {
                windowInsetsController.setSystemBarsAppearance(0, i2);
                return;
            }
        }
        if (z) {
            View decorView = window.getDecorView();
            decorView.setSystemUiVisibility(i | decorView.getSystemUiVisibility());
        } else {
            View decorView2 = window.getDecorView();
            decorView2.setSystemUiVisibility((~i) & decorView2.getSystemUiVisibility());
        }
    }
}
