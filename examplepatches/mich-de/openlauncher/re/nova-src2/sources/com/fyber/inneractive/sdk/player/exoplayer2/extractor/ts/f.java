package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class f implements h {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29805a;

    /* renamed from: b, reason: collision with root package name */
    public final String f29806b;

    /* renamed from: c, reason: collision with root package name */
    public String f29807c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29808d;

    /* renamed from: e, reason: collision with root package name */
    public int f29809e;

    /* renamed from: f, reason: collision with root package name */
    public int f29810f;

    /* renamed from: g, reason: collision with root package name */
    public int f29811g;

    /* renamed from: h, reason: collision with root package name */
    public long f29812h;

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.o f29813i;

    /* renamed from: j, reason: collision with root package name */
    public int f29814j;

    /* renamed from: k, reason: collision with root package name */
    public long f29815k;

    public f(String str) {
        byte[] bArr = new byte[15];
        this.f29805a = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(bArr);
        bArr[0] = AbstractJsonLexerKt.TC_INVALID;
        bArr[1] = -2;
        bArr[2] = -128;
        bArr[3] = 1;
        this.f29809e = 0;
        this.f29806b = str;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        this.f29809e = 0;
        this.f29810f = 0;
        this.f29811g = 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29807c = e0Var.f29804e;
        e0Var.b();
        this.f29808d = jVar.a(e0Var.f29803d, 1);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        this.f29815k = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        char c11;
        while (true) {
            int i5 = nVar.f30463c - nVar.f30462b;
            if (i5 <= 0) {
                return;
            }
            int i11 = this.f29809e;
            if (i11 == 0) {
                while (true) {
                    if (nVar.f30463c - nVar.f30462b > 0) {
                        int i12 = this.f29811g << 8;
                        this.f29811g = i12;
                        int iJ = i12 | nVar.j();
                        this.f29811g = iJ;
                        if (iJ == 2147385345) {
                            this.f29811g = 0;
                            this.f29810f = 4;
                            this.f29809e = 1;
                            break;
                        }
                    }
                }
            } else if (i11 == 1) {
                byte[] bArr = this.f29805a.f30461a;
                int iMin = Math.min(i5, 15 - this.f29810f);
                nVar.a(bArr, this.f29810f, iMin);
                int i13 = this.f29810f + iMin;
                this.f29810f = i13;
                if (i13 == 15) {
                    byte[] bArr2 = this.f29805a.f30461a;
                    if (this.f29813i == null) {
                        String str = this.f29807c;
                        String str2 = this.f29806b;
                        com.fyber.inneractive.sdk.player.exoplayer2.util.m mVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(bArr2);
                        mVar.c(60);
                        int i14 = com.fyber.inneractive.sdk.player.exoplayer2.audio.t.f29052a[mVar.a(6)];
                        int i15 = com.fyber.inneractive.sdk.player.exoplayer2.audio.t.f29053b[mVar.a(4)];
                        int iA = mVar.a(5);
                        c11 = 5;
                        int i16 = iA >= 29 ? -1 : (com.fyber.inneractive.sdk.player.exoplayer2.audio.t.f29054c[iA] * 1000) / 2;
                        mVar.c(10);
                        com.fyber.inneractive.sdk.player.exoplayer2.o oVarA = com.fyber.inneractive.sdk.player.exoplayer2.o.a(str, "audio/vnd.dts", i16, -1, i14 + (mVar.a(2) > 0 ? 1 : 0), i15, null, null, str2);
                        this.f29813i = oVarA;
                        this.f29808d.a(oVarA);
                    } else {
                        c11 = 5;
                    }
                    this.f29814j = (((bArr2[c11] & 2) << 12) | ((bArr2[6] & 255) << 4) | ((bArr2[7] & 240) >> 4)) + 1;
                    this.f29812h = (int) (((((((bArr2[4] & 1) << 6) | ((r3 & 252) >> 2)) + 1) * 32) * 1000000) / this.f29813i.f30139s);
                    this.f29805a.e(0);
                    this.f29808d.a(15, this.f29805a);
                    this.f29809e = 2;
                }
            } else if (i11 == 2) {
                int iMin2 = Math.min(i5, this.f29814j - this.f29810f);
                this.f29808d.a(iMin2, nVar);
                int i17 = this.f29810f + iMin2;
                this.f29810f = i17;
                int i18 = this.f29814j;
                if (i17 == i18) {
                    this.f29808d.a(this.f29815k, 1, i18, 0, null);
                    this.f29815k += this.f29812h;
                    this.f29809e = 0;
                }
            }
        }
    }
}
