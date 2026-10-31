package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class d implements b {

    /* renamed from: a, reason: collision with root package name */
    public final long[] f29453a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f29454b;

    /* renamed from: c, reason: collision with root package name */
    public final long f29455c;

    public d(long[] jArr, long[] jArr2, long j11) {
        this.f29453a = jArr;
        this.f29454b = jArr2;
        this.f29455c = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3.b
    public final long b(long j11) {
        return this.f29453a[z.a(this.f29454b, j11, true)];
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return this.f29455c;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        return this.f29454b[z.a(this.f29453a, j11, true)];
    }
}
