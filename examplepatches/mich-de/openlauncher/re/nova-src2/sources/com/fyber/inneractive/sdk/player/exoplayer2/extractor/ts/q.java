package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import androidx.recyclerview.widget.u1;

/* loaded from: classes3.dex */
public final class q implements h {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29914a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.n f29915b;

    /* renamed from: c, reason: collision with root package name */
    public final String f29916c;

    /* renamed from: d, reason: collision with root package name */
    public String f29917d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29918e;

    /* renamed from: f, reason: collision with root package name */
    public int f29919f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f29920g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f29921h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f29922i;

    /* renamed from: j, reason: collision with root package name */
    public long f29923j;

    /* renamed from: k, reason: collision with root package name */
    public int f29924k;

    /* renamed from: l, reason: collision with root package name */
    public long f29925l;

    public q(String str) {
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(4);
        this.f29914a = nVar;
        nVar.f30461a[0] = -1;
        this.f29915b = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.n();
        this.f29916c = str;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        this.f29919f = 0;
        this.f29920g = 0;
        this.f29922i = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29917d = e0Var.f29804e;
        e0Var.b();
        this.f29918e = jVar.a(e0Var.f29803d, 1);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        this.f29925l = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        while (true) {
            int i5 = nVar.f30463c;
            int i11 = nVar.f30462b;
            int i12 = i5 - i11;
            if (i12 <= 0) {
                return;
            }
            int i13 = this.f29919f;
            if (i13 == 0) {
                byte[] bArr = nVar.f30461a;
                while (true) {
                    if (i11 < i5) {
                        byte b11 = bArr[i11];
                        boolean z11 = (b11 & 255) == 255;
                        boolean z12 = this.f29922i && (b11 & 224) == 224;
                        this.f29922i = z11;
                        if (z12) {
                            nVar.e(i11 + 1);
                            this.f29922i = false;
                            this.f29914a.f30461a[1] = bArr[i11];
                            this.f29920g = 2;
                            this.f29919f = 1;
                            break;
                        }
                        i11++;
                    } else {
                        nVar.e(i5);
                        break;
                    }
                }
            } else if (i13 == 1) {
                int iMin = Math.min(i12, 4 - this.f29920g);
                nVar.a(this.f29914a.f30461a, this.f29920g, iMin);
                int i14 = this.f29920g + iMin;
                this.f29920g = i14;
                if (i14 >= 4) {
                    this.f29914a.e(0);
                    if (!com.fyber.inneractive.sdk.player.exoplayer2.extractor.n.a(this.f29914a.b(), this.f29915b)) {
                        this.f29920g = 0;
                        this.f29919f = 1;
                    } else {
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.n nVar2 = this.f29915b;
                        this.f29924k = nVar2.f29664c;
                        if (!this.f29921h) {
                            int i15 = nVar2.f29665d;
                            this.f29923j = (nVar2.f29668g * 1000000) / i15;
                            this.f29918e.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(this.f29917d, nVar2.f29663b, -1, u1.FLAG_APPEARED_IN_PRE_LAYOUT, nVar2.f29666e, i15, null, null, this.f29916c));
                            this.f29921h = true;
                        }
                        this.f29914a.e(0);
                        this.f29918e.a(4, this.f29914a);
                        this.f29919f = 2;
                    }
                }
            } else if (i13 == 2) {
                int iMin2 = Math.min(i12, this.f29924k - this.f29920g);
                this.f29918e.a(iMin2, nVar);
                int i16 = this.f29920g + iMin2;
                this.f29920g = i16;
                int i17 = this.f29924k;
                if (i16 >= i17) {
                    this.f29918e.a(this.f29925l, 1, i17, 0, null);
                    this.f29925l += this.f29923j;
                    this.f29920g = 0;
                    this.f29919f = 0;
                }
            }
        }
    }
}
