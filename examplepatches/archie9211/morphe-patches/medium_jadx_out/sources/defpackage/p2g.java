package defpackage;

import java.util.TimerTask;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p2g extends TimerTask {
    public final /* synthetic */ x2g a;
    public final /* synthetic */ fdg b;

    public p2g(x2g x2gVar, fdg fdgVar) {
        this.a = x2gVar;
        this.b = fdgVar;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public final void run() {
        x2g x2gVar = this.a;
        vx0.c0((k92) x2gVar.g.d, null, null, new o2g(x2gVar, this.b, (n92) null), 3);
    }
}
