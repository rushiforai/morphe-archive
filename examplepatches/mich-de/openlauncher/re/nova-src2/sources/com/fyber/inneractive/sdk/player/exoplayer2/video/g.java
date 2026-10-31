package com.fyber.inneractive.sdk.player.exoplayer2.video;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.view.Choreographer;

/* loaded from: classes3.dex */
public final class g implements Choreographer.FrameCallback, Handler.Callback {

    /* renamed from: e, reason: collision with root package name */
    public static final g f30535e = new g();

    /* renamed from: a, reason: collision with root package name */
    public volatile long f30536a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f30537b;

    /* renamed from: c, reason: collision with root package name */
    public Choreographer f30538c;

    /* renamed from: d, reason: collision with root package name */
    public int f30539d;

    public g() {
        HandlerThread handlerThread = new HandlerThread("ChoreographerOwner:Handler");
        handlerThread.start();
        Handler handler = new Handler(handlerThread.getLooper(), this);
        this.f30537b = handler;
        handler.sendEmptyMessage(0);
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j11) {
        this.f30536a = j11;
        this.f30538c.postFrameCallbackDelayed(this, 500L);
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        if (i5 == 0) {
            this.f30538c = Choreographer.getInstance();
            return true;
        }
        if (i5 == 1) {
            int i11 = this.f30539d + 1;
            this.f30539d = i11;
            if (i11 == 1) {
                this.f30538c.postFrameCallback(this);
            }
            return true;
        }
        if (i5 != 2) {
            return false;
        }
        int i12 = this.f30539d - 1;
        this.f30539d = i12;
        if (i12 == 0) {
            this.f30538c.removeFrameCallback(this);
            this.f30536a = 0L;
        }
        return true;
    }
}
