package com.fyber.inneractive.sdk.player.mediaplayer;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f30614a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30615b;

    public j(p pVar, int i5) {
        this.f30615b = pVar;
        this.f30614a = i5;
    }

    @Override // java.lang.Runnable
    public final void run() throws IllegalStateException {
        p pVar = this.f30615b;
        int i5 = this.f30614a;
        String strB = pVar.b();
        long jCurrentTimeMillis = System.currentTimeMillis();
        pVar.seekTo(i5);
        IAlog.e(strB + "timelog: seekTo took " + (System.currentTimeMillis() - jCurrentTimeMillis) + " msec", new Object[0]);
    }
}
