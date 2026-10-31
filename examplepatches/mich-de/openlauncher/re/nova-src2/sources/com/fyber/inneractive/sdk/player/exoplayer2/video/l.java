package com.fyber.inneractive.sdk.player.exoplayer2.video;

import com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener;

/* loaded from: classes3.dex */
public final class l implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f30559a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30560b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ VideoRendererEventListener.EventDispatcher f30561c;

    public l(VideoRendererEventListener.EventDispatcher eventDispatcher, int i5, long j11) {
        this.f30561c = eventDispatcher;
        this.f30559a = i5;
        this.f30560b = j11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f30561c.listener.onDroppedFrames(this.f30559a, this.f30560b);
    }
}
