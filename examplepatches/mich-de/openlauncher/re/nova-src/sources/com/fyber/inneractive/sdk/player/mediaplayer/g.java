package com.fyber.inneractive.sdk.player.mediaplayer;

import android.os.Handler;
import android.os.Looper;

/* loaded from: classes3.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f30611a;

    public g(p pVar) {
        this.f30611a = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p.b(this.f30611a);
        Handler handler = this.f30611a.o;
        if (handler != null) {
            handler.removeCallbacksAndMessages(null);
            this.f30611a.o = null;
        }
        this.f30611a.n = null;
        Looper.myLooper().quit();
    }
}
