package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final int f29512a;

    /* renamed from: b, reason: collision with root package name */
    public int f29513b;

    /* renamed from: c, reason: collision with root package name */
    public int f29514c;

    /* renamed from: d, reason: collision with root package name */
    public long f29515d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f29516e;

    /* renamed from: f, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29517f;

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29518g;

    /* renamed from: h, reason: collision with root package name */
    public int f29519h;

    /* renamed from: i, reason: collision with root package name */
    public int f29520i;

    public d(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2, boolean z11) {
        this.f29518g = nVar;
        this.f29517f = nVar2;
        this.f29516e = z11;
        nVar2.e(12);
        this.f29512a = nVar2.m();
        nVar.e(12);
        this.f29520i = nVar.m();
        if (!(nVar.b() == 1)) {
            throw new IllegalStateException("first_chunk must be 1");
        }
        this.f29513b = -1;
    }

    public final boolean a() {
        int i5 = this.f29513b + 1;
        this.f29513b = i5;
        if (i5 == this.f29512a) {
            return false;
        }
        this.f29515d = this.f29516e ? this.f29517f.n() : this.f29517f.k();
        if (this.f29513b == this.f29519h) {
            this.f29514c = this.f29518g.m();
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29518g;
            nVar.e(nVar.f30462b + 4);
            int i11 = this.f29520i - 1;
            this.f29520i = i11;
            this.f29519h = i11 > 0 ? this.f29518g.m() - 1 : -1;
        }
        return true;
    }
}
