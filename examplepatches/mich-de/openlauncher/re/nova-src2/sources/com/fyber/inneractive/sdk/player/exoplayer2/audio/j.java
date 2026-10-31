package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import android.media.AudioTrack;

/* loaded from: classes3.dex */
public final class j extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AudioTrack f28999a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f29000b;

    public j(r rVar, AudioTrack audioTrack) {
        this.f29000b = rVar;
        this.f28999a = audioTrack;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        try {
            this.f28999a.flush();
            this.f28999a.release();
        } finally {
            this.f29000b.f29024e.open();
        }
    }
}
