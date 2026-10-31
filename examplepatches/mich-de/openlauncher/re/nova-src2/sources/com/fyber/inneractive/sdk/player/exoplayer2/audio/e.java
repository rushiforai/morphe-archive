package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import com.fyber.inneractive.sdk.player.exoplayer2.audio.AudioRendererEventListener;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f28985a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f28986b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f28987c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AudioRendererEventListener.EventDispatcher f28988d;

    public e(AudioRendererEventListener.EventDispatcher eventDispatcher, String str, long j11, long j12) {
        this.f28988d = eventDispatcher;
        this.f28985a = str;
        this.f28986b = j11;
        this.f28987c = j12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f28988d.listener.onAudioDecoderInitialized(this.f28985a, this.f28986b, this.f28987c);
    }
}
