package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

/* loaded from: classes3.dex */
public final class g implements e {

    /* renamed from: a, reason: collision with root package name */
    public final int f29525a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29526b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29527c;

    public g(b bVar) {
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = bVar.R0;
        this.f29527c = nVar;
        nVar.e(12);
        this.f29525a = nVar.m();
        this.f29526b = nVar.m();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.e
    public final int a() {
        return this.f29526b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.e
    public final int b() {
        int i5 = this.f29525a;
        return i5 == 0 ? this.f29527c.m() : i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.e
    public final boolean c() {
        return this.f29525a != 0;
    }
}
