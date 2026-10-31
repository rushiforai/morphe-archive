package com.fyber.inneractive.sdk.player.exoplayer2.video;

import com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener;

/* loaded from: classes3.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f30553a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30554b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f30555c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ VideoRendererEventListener.EventDispatcher f30556d;

    public j(VideoRendererEventListener.EventDispatcher eventDispatcher, String str, long j11, long j12) {
        this.f30556d = eventDispatcher;
        this.f30553a = str;
        this.f30554b = j11;
        this.f30555c = j12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f30556d.listener.onVideoDecoderInitialized(this.f30553a, this.f30554b, this.f30555c);
    }
}
