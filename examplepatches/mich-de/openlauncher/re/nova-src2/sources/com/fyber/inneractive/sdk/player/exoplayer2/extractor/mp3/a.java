package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class a implements b {

    /* renamed from: a, reason: collision with root package name */
    public final long f29437a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29438b;

    /* renamed from: c, reason: collision with root package name */
    public final long f29439c;

    public a(int i5, long j11, long j12) {
        this.f29437a = j11;
        this.f29438b = i5;
        this.f29439c = j12 == -1 ? -9223372036854775807L : b(j12);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return this.f29439c != -9223372036854775807L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3.b
    public final long b(long j11) {
        return (Math.max(0L, j11 - this.f29437a) * 8000000) / this.f29438b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return this.f29439c;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        long j12 = this.f29439c;
        if (j12 == -9223372036854775807L) {
            return 0L;
        }
        int i5 = z.f30489a;
        return ((Math.max(0L, Math.min(j11, j12)) * this.f29438b) / 8000000) + this.f29437a;
    }
}
