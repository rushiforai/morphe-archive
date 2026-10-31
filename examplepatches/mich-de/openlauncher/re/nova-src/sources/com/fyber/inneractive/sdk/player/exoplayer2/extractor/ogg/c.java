package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class c implements h, com.fyber.inneractive.sdk.player.exoplayer2.extractor.q {

    /* renamed from: a, reason: collision with root package name */
    public long[] f29683a;

    /* renamed from: b, reason: collision with root package name */
    public long[] f29684b;

    /* renamed from: c, reason: collision with root package name */
    public long f29685c = -1;

    /* renamed from: d, reason: collision with root package name */
    public long f29686d = -1;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ d f29687e;

    public c(d dVar) {
        this.f29687e = dVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.h
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.q b() {
        return this;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.h
    public final long c(long j11) {
        long j12 = (this.f29687e.f29713i * j11) / 1000000;
        this.f29686d = this.f29683a[z.a(this.f29683a, j12, true)];
        return j12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.h
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        long j11 = this.f29686d;
        if (j11 < 0) {
            return -1L;
        }
        long j12 = -(j11 + 2);
        this.f29686d = -1L;
        return j12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        return this.f29685c + this.f29684b[z.a(this.f29683a, (this.f29687e.f29713i * j11) / 1000000, true)];
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return (this.f29687e.n.f30438d * 1000000) / r0.f30435a;
    }
}
