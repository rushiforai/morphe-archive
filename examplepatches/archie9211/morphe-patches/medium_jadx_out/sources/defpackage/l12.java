package defpackage;

import android.graphics.Rect;
import android.os.CancellationSignal;
import android.view.ScrollCaptureCallback;
import android.view.ScrollCaptureSession;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l12 implements ScrollCaptureCallback {
    public final zxb a;
    public final o46 b;
    public final l82 c;
    public final mn d;
    public final k92 e;
    public final jr5 f;

    public l12(zxb zxbVar, o46 o46Var, k92 k92Var, l82 l82Var, mn mnVar) {
        this.a = zxbVar;
        this.b = o46Var;
        this.c = l82Var;
        this.d = mnVar;
        this.e = new k92(k92Var.a.j0(ff3.b));
        this.f = new jr5(o46Var.b(), new jk(this, null));
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(android.view.ScrollCaptureSession r12, defpackage.o46 r13, defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 303
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l12.a(android.view.ScrollCaptureSession, o46, p92):java.lang.Object");
    }

    public final void onScrollCaptureEnd(Runnable runnable) {
        vx0.c0(this.e, kh8.b, null, new r91(this, runnable, null, 11), 2);
    }

    public final void onScrollCaptureImageRequest(ScrollCaptureSession scrollCaptureSession, CancellationSignal cancellationSignal, Rect rect, Consumer consumer) {
        enc encVarC0 = vx0.c0(this.e, null, null, new ra(this, scrollCaptureSession, rect, consumer, null, 25), 3);
        encVarC0.R(new ce(10, cancellationSignal));
        cancellationSignal.setOnCancelListener(new m12(0, encVarC0));
    }

    public final void onScrollCaptureSearch(CancellationSignal cancellationSignal, Consumer consumer) {
        consumer.n(kk7.E(this.b));
    }

    public final void onScrollCaptureStart(ScrollCaptureSession scrollCaptureSession, CancellationSignal cancellationSignal, Runnable runnable) {
        this.f.b = 0.0f;
        ((k49) this.c.b).setValue(Boolean.TRUE);
        runnable.run();
    }
}
