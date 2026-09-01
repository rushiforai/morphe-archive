package defpackage;

import android.util.Log;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class db3 implements kn8 {
    public final /* synthetic */ fb3 a;

    public db3(fb3 fb3Var) {
        this.a = fb3Var;
    }

    @Override // defpackage.kn8
    public final void onChanged(Object obj) {
        if (((iy6) obj) != null) {
            fb3 fb3Var = this.a;
            if (fb3Var.t0) {
                View viewT = fb3Var.T();
                if (viewT.getParent() != null) {
                    ygf.f("DialogFragment can not be attached to a container view");
                    return;
                }
                if (fb3Var.x0 != null) {
                    if (f25.I(3)) {
                        Log.d("FragmentManager", "DialogFragment " + this + " setting the content view on " + fb3Var.x0);
                    }
                    fb3Var.x0.setContentView(viewT);
                }
            }
        }
    }
}
