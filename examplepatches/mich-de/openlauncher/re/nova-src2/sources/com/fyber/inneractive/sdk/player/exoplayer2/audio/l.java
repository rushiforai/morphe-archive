package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import android.media.AudioTimestamp;
import android.media.AudioTrack;

/* loaded from: classes3.dex */
public final class l extends k {

    /* renamed from: j, reason: collision with root package name */
    public final AudioTimestamp f29010j = new AudioTimestamp();

    /* renamed from: k, reason: collision with root package name */
    public long f29011k;

    /* renamed from: l, reason: collision with root package name */
    public long f29012l;

    /* renamed from: m, reason: collision with root package name */
    public long f29013m;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.k
    public final void a(AudioTrack audioTrack, boolean z11) {
        super.a(audioTrack, z11);
        this.f29011k = 0L;
        this.f29012l = 0L;
        this.f29013m = 0L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.k
    public final long b() {
        return this.f29013m;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.k
    public final long c() {
        return this.f29010j.nanoTime;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.audio.k
    public final boolean e() {
        boolean timestamp = this.f29001a.getTimestamp(this.f29010j);
        if (timestamp) {
            long j11 = this.f29010j.framePosition;
            if (this.f29012l > j11) {
                this.f29011k++;
            }
            this.f29012l = j11;
            this.f29013m = j11 + (this.f29011k << 32);
        }
        return timestamp;
    }
}
