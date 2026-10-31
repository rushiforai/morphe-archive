package com.fyber.inneractive.sdk.player.exoplayer2.video;

import com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener;

/* loaded from: classes3.dex */
public final class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f30562a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f30563b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f30564c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f30565d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ VideoRendererEventListener.EventDispatcher f30566e;

    public m(VideoRendererEventListener.EventDispatcher eventDispatcher, int i5, int i11, int i12, float f11) {
        this.f30566e = eventDispatcher;
        this.f30562a = i5;
        this.f30563b = i11;
        this.f30564c = i12;
        this.f30565d = f11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f30566e.listener.onVideoSizeChanged(this.f30562a, this.f30563b, this.f30564c, this.f30565d);
    }
}
