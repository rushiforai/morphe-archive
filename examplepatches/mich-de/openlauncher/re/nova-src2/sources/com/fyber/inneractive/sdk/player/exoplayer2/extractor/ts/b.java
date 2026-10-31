package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

/* loaded from: classes3.dex */
public final class b implements h {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.m f29747a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29748b;

    /* renamed from: c, reason: collision with root package name */
    public final String f29749c;

    /* renamed from: d, reason: collision with root package name */
    public String f29750d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29751e;

    /* renamed from: f, reason: collision with root package name */
    public int f29752f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f29753g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f29754h;

    /* renamed from: i, reason: collision with root package name */
    public long f29755i;

    /* renamed from: j, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.o f29756j;

    /* renamed from: k, reason: collision with root package name */
    public int f29757k;

    /* renamed from: l, reason: collision with root package name */
    public long f29758l;

    public b(String str) {
        byte[] bArr = new byte[8];
        this.f29747a = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(bArr);
        this.f29748b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(bArr);
        this.f29749c = str;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        this.f29752f = 0;
        this.f29753g = 0;
        this.f29754h = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29750d = e0Var.f29804e;
        e0Var.b();
        this.f29751e = jVar.a(e0Var.f29803d, 1);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        this.f29758l = j11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int iA;
        int i5;
        String str;
        int iA2;
        int i11;
        while (true) {
            int i12 = nVar.f30463c - nVar.f30462b;
            if (i12 <= 0) {
                return;
            }
            int i13 = this.f29752f;
            if (i13 == 0) {
                while (true) {
                    if (nVar.f30463c - nVar.f30462b <= 0) {
                        break;
                    }
                    if (!this.f29754h) {
                        this.f29754h = nVar.j() == 11;
                    } else {
                        int iJ = nVar.j();
                        if (iJ == 119) {
                            this.f29754h = false;
                            this.f29752f = 1;
                            byte[] bArr = this.f29748b.f30461a;
                            bArr[0] = 11;
                            bArr[1] = 119;
                            this.f29753g = 2;
                            break;
                        }
                        this.f29754h = iJ == 11;
                    }
                }
            } else if (i13 == 1) {
                byte[] bArr2 = this.f29748b.f30461a;
                int iMin = Math.min(i12, 8 - this.f29753g);
                nVar.a(bArr2, this.f29753g, iMin);
                int i14 = this.f29753g + iMin;
                this.f29753g = i14;
                if (i14 == 8) {
                    this.f29747a.b(0);
                    com.fyber.inneractive.sdk.player.exoplayer2.util.m mVar = this.f29747a;
                    int i15 = (mVar.f30458b * 8) + mVar.f30459c;
                    mVar.c(40);
                    Object[] objArr = mVar.a(5) == 16;
                    mVar.b(i15);
                    int i16 = 6;
                    if (objArr != false) {
                        mVar.c(21);
                        iA2 = (mVar.a(11) + 1) * 2;
                        int iA3 = mVar.a(2);
                        if (iA3 == 3) {
                            i5 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28978c[mVar.a(2)];
                        } else {
                            i16 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28976a[mVar.a(2)];
                            i5 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28977b[iA3];
                        }
                        i11 = i16 * 256;
                        iA = mVar.a(3);
                        str = "audio/eac3";
                    } else {
                        mVar.c(32);
                        int iA4 = mVar.a(2);
                        int iA5 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.a(iA4, mVar.a(6));
                        mVar.c(8);
                        iA = mVar.a(3);
                        if ((iA & 1) != 0 && iA != 1) {
                            mVar.c(2);
                        }
                        if ((iA & 4) != 0) {
                            mVar.c(2);
                        }
                        if (iA == 2) {
                            mVar.c(2);
                        }
                        i5 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28977b[iA4];
                        str = "audio/ac3";
                        iA2 = iA5;
                        i11 = 1536;
                    }
                    int i17 = i5;
                    String str2 = str;
                    int i18 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28979d[iA] + (mVar.b() ? 1 : 0);
                    com.fyber.inneractive.sdk.player.exoplayer2.o oVar = this.f29756j;
                    if (oVar == null || i18 != oVar.f30138r || i17 != oVar.f30139s || str2 != oVar.f30128f) {
                        com.fyber.inneractive.sdk.player.exoplayer2.o oVarA = com.fyber.inneractive.sdk.player.exoplayer2.o.a(this.f29750d, str2, -1, -1, i18, i17, null, null, this.f29749c);
                        this.f29756j = oVarA;
                        this.f29751e.a(oVarA);
                    }
                    this.f29757k = iA2;
                    this.f29755i = (i11 * 1000000) / this.f29756j.f30139s;
                    this.f29748b.e(0);
                    this.f29751e.a(8, this.f29748b);
                    this.f29752f = 2;
                }
            } else if (i13 == 2) {
                int iMin2 = Math.min(i12, this.f29757k - this.f29753g);
                this.f29751e.a(iMin2, nVar);
                int i19 = this.f29753g + iMin2;
                this.f29753g = i19;
                int i21 = this.f29757k;
                if (i19 == i21) {
                    this.f29751e.a(this.f29758l, 1, i21, 0, null);
                    this.f29758l += this.f29755i;
                    this.f29752f = 0;
                }
            }
        }
    }
}
