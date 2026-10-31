package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import com.fyber.inneractive.sdk.player.exoplayer2.audio.AudioRendererEventListener;

/* loaded from: classes3.dex */
public final class i implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f28997a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AudioRendererEventListener.EventDispatcher f28998b;

    public i(AudioRendererEventListener.EventDispatcher eventDispatcher, int i5) {
        this.f28998b = eventDispatcher;
        this.f28997a = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f28998b.listener.onAudioSessionId(this.f28997a);
    }
}
