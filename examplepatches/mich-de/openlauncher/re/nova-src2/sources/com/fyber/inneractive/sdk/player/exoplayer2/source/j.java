package com.fyber.inneractive.sdk.player.exoplayer2.source;

/* loaded from: classes3.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f30185a;

    public j(p pVar) {
        this.f30185a = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p pVar = this.f30185a;
        if (pVar.G) {
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.l lVar = (com.fyber.inneractive.sdk.player.exoplayer2.l) pVar.f30218p;
        lVar.getClass();
        lVar.f30035f.obtainMessage(9, pVar).sendToTarget();
    }
}
