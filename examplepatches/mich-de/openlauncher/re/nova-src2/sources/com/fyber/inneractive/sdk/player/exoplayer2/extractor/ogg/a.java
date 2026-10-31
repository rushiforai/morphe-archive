package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

/* loaded from: classes3.dex */
public final class a implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.q {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b f29670a;

    public a(b bVar) {
        this.f29670a = bVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return (this.f29670a.f29676f * 1000000) / r0.f29674d.f29713i;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        if (j11 == 0) {
            return this.f29670a.f29672b;
        }
        b bVar = this.f29670a;
        long j12 = (bVar.f29674d.f29713i * j11) / 1000000;
        long j13 = bVar.f29672b;
        long j14 = bVar.f29673c;
        long j15 = ((((j14 - j13) * j12) / bVar.f29676f) - 30000) + j13;
        if (j15 >= j13) {
            j13 = j15;
        }
        return j13 >= j14 ? j14 - 1 : j13;
    }
}
