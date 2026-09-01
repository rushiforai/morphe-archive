package defpackage;

import android.app.Dialog;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mvf extends z15 {
    public final wjc c;

    public mvf(wjc wjcVar) {
        this.c = wjcVar;
    }

    @Override // defpackage.z15
    public final void onFragmentResumed(f25 f25Var, j15 j15Var) {
        Dialog dialog;
        Window window;
        fb3 fb3Var = j15Var instanceof fb3 ? (fb3) j15Var : null;
        if (fb3Var == null || (dialog = fb3Var.x0) == null || (window = dialog.getWindow()) == null) {
            return;
        }
        window.setCallback(new awf(window.getCallback(), new zjf(window, j15Var.getClass().getSimpleName(), this.c, 4)));
    }
}
