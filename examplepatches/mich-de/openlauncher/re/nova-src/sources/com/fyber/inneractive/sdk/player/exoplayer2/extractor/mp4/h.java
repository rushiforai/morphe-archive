package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

/* loaded from: classes3.dex */
public final class h implements e {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29528a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29529b;

    /* renamed from: c, reason: collision with root package name */
    public final int f29530c;

    /* renamed from: d, reason: collision with root package name */
    public int f29531d;

    /* renamed from: e, reason: collision with root package name */
    public int f29532e;

    public h(b bVar) {
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = bVar.R0;
        this.f29528a = nVar;
        nVar.e(12);
        this.f29530c = nVar.m() & 255;
        this.f29529b = nVar.m();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.e
    public final int a() {
        return this.f29529b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.e
    public final int b() {
        int i5 = this.f29530c;
        if (i5 == 8) {
            return this.f29528a.j();
        }
        if (i5 == 16) {
            return this.f29528a.o();
        }
        int i11 = this.f29531d;
        this.f29531d = i11 + 1;
        if (i11 % 2 != 0) {
            return this.f29532e & 15;
        }
        int iJ = this.f29528a.j();
        this.f29532e = iJ;
        return (iJ & 240) >> 4;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.e
    public final boolean c() {
        return false;
    }
}
