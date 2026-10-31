package com.fyber.inneractive.sdk.player.mediaplayer;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class l implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f30617a;

    public l(p pVar) {
        this.f30617a = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p pVar = this.f30617a;
        String strB = pVar.b();
        long jCurrentTimeMillis = System.currentTimeMillis();
        pVar.setVolume(0.0f, 0.0f);
        IAlog.e(strB + "timelog: mute took " + (System.currentTimeMillis() - jCurrentTimeMillis) + " msec", new Object[0]);
    }
}
