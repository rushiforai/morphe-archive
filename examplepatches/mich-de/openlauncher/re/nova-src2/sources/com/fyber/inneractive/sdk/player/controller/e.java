package com.fyber.inneractive.sdk.player.controller;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ f f28895a;

    public e(f fVar) {
        this.f28895a = fVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = this.f28895a.f28900s;
        if (gVar != null) {
            gVar.a(gVar.a(), -9223372036854775807L);
            this.f28895a.f28900s.f29989d.f30035f.sendEmptyMessage(5);
            com.fyber.inneractive.sdk.player.exoplayer2.g gVar2 = this.f28895a.f28900s;
            gVar2.f29989d.d();
            gVar2.f29988c.removeCallbacksAndMessages(null);
            this.f28895a.f28900s = null;
        }
    }
}
