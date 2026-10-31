package com.fyber.inneractive.sdk.player.mediaplayer;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f30604a;

    public c(p pVar) {
        this.f30604a = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAlog.a("%sCannot wait for video size anymore", this.f30604a.b());
        p pVar = this.f30604a;
        if (pVar.f30634r == 0) {
            IAlog.a("%sCannot wait for video size anymore. duration is still 0 - aborting", pVar.b());
            p pVar2 = this.f30604a;
            pVar2.onError(pVar2, 0, 0);
        } else {
            IAlog.a("%sCannot wait for video size anymore. moving into ready", pVar.b());
            p pVar3 = this.f30604a;
            pVar3.f30624f = true;
            pVar3.c();
        }
    }
}
