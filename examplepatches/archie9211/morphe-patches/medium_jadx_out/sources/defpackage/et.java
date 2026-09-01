package defpackage;

import android.view.Choreographer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class et implements Choreographer.FrameCallback {
    public final /* synthetic */ x51 a;
    public final /* synthetic */ x45 b;

    public et(x51 x51Var, ft ftVar, x45 x45Var) {
        this.a = x51Var;
        this.b = x45Var;
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j) {
        Object ajbVar;
        try {
            ajbVar = this.b.invoke(Long.valueOf(j));
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        this.a.resumeWith(ajbVar);
    }
}
