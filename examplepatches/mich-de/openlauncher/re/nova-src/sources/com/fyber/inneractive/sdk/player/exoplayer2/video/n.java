package com.fyber.inneractive.sdk.player.exoplayer2.video;

import android.view.Surface;
import com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener;

/* loaded from: classes3.dex */
public final class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Surface f30567a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ VideoRendererEventListener.EventDispatcher f30568b;

    public n(VideoRendererEventListener.EventDispatcher eventDispatcher, Surface surface) {
        this.f30568b = eventDispatcher;
        this.f30567a = surface;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f30568b.listener.onRenderedFirstFrame(this.f30567a);
    }
}
