package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import com.fyber.inneractive.sdk.player.exoplayer2.audio.AudioRendererEventListener;

/* loaded from: classes3.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f28991a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f28992b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f28993c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AudioRendererEventListener.EventDispatcher f28994d;

    public g(AudioRendererEventListener.EventDispatcher eventDispatcher, int i5, long j11, long j12) {
        this.f28994d = eventDispatcher;
        this.f28991a = i5;
        this.f28992b = j11;
        this.f28993c = j12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f28994d.listener.onAudioTrackUnderrun(this.f28991a, this.f28992b, this.f28993c);
    }
}
