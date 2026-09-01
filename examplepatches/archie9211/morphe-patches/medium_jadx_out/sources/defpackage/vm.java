package defpackage;

import android.os.Trace;
import android.view.MotionEvent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vm implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ mn b;

    public /* synthetic */ vm(mn mnVar, int i) {
        this.a = i;
        this.b = mnVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        mn mnVar = this.b;
        switch (i) {
            case 0:
                m70 m70Var = mnVar.i;
                Trace.beginSection("AndroidOwner:outOfFrameExecutor");
                while (!m70Var.isEmpty()) {
                    try {
                        ((m45) m70Var.removeLast()).invoke();
                    } finally {
                        Trace.endSection();
                    }
                    break;
                }
                return;
            case 1:
                mnVar.T0 = false;
                MotionEvent motionEvent = mnVar.L0;
                motionEvent.getClass();
                if (motionEvent.getActionMasked() == 10) {
                    mnVar.I(motionEvent);
                    return;
                } else {
                    ygf.f("The ACTION_HOVER_EXIT event was not cleared.");
                    return;
                }
            case 2:
                mn.n(mnVar.getRoot());
                return;
            default:
                mn.n(mnVar.getRoot());
                return;
        }
    }
}
