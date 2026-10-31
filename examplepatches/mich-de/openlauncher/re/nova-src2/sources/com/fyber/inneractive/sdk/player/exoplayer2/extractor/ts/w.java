package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

/* loaded from: classes3.dex */
public final class w implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final v f29957a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29958b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(32);

    /* renamed from: c, reason: collision with root package name */
    public int f29959c;

    /* renamed from: d, reason: collision with root package name */
    public int f29960d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29961e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f29962f;

    public w(v vVar) {
        this.f29957a = vVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.f0
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        this.f29957a.a(vVar, jVar, e0Var);
        this.f29962f = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.f0
    public final void a() {
        this.f29962f = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.f0
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, boolean z11) {
        int iJ = z11 ? nVar.f30462b + nVar.j() : -1;
        if (this.f29962f) {
            if (!z11) {
                return;
            }
            this.f29962f = false;
            nVar.e(iJ);
            this.f29960d = 0;
        }
        while (true) {
            int i5 = nVar.f30463c - nVar.f30462b;
            if (i5 <= 0) {
                return;
            }
            int i11 = this.f29960d;
            if (i11 < 3) {
                if (i11 == 0) {
                    int iJ2 = nVar.j();
                    nVar.e(nVar.f30462b - 1);
                    if (iJ2 == 255) {
                        this.f29962f = true;
                        return;
                    }
                }
                int iMin = Math.min(nVar.f30463c - nVar.f30462b, 3 - this.f29960d);
                nVar.a(this.f29958b.f30461a, this.f29960d, iMin);
                int i12 = this.f29960d + iMin;
                this.f29960d = i12;
                if (i12 == 3) {
                    this.f29958b.c(3);
                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29958b;
                    nVar2.e(nVar2.f30462b + 1);
                    int iJ3 = this.f29958b.j();
                    int iJ4 = this.f29958b.j();
                    this.f29961e = (iJ3 & 128) != 0;
                    this.f29959c = (((iJ3 & 15) << 8) | iJ4) + 3;
                    int iA = this.f29958b.a();
                    int i13 = this.f29959c;
                    if (iA < i13) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = this.f29958b;
                        byte[] bArr = nVar3.f30461a;
                        nVar3.c(Math.min(4098, Math.max(i13, bArr.length * 2)));
                        System.arraycopy(bArr, 0, this.f29958b.f30461a, 0, 3);
                    }
                }
            } else {
                int iMin2 = Math.min(i5, this.f29959c - i11);
                nVar.a(this.f29958b.f30461a, this.f29960d, iMin2);
                int i14 = this.f29960d + iMin2;
                this.f29960d = i14;
                int i15 = this.f29959c;
                if (i14 != i15) {
                    continue;
                } else {
                    if (this.f29961e) {
                        byte[] bArr2 = this.f29958b.f30461a;
                        int i16 = -1;
                        for (int i17 = 0; i17 < i15; i17++) {
                            i16 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30496h[((i16 >>> 24) ^ (bArr2[i17] & 255)) & 255] ^ (i16 << 8);
                        }
                        int i18 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
                        if (i16 != 0) {
                            this.f29962f = true;
                            return;
                        }
                        this.f29958b.c(this.f29959c - 4);
                    } else {
                        this.f29958b.c(i15);
                    }
                    this.f29957a.a(this.f29958b);
                    this.f29960d = 0;
                }
            }
        }
    }
}
