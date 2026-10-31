package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.Log;

/* loaded from: classes3.dex */
public final class s implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final h f29931a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.m f29932b = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(new byte[10]);

    /* renamed from: c, reason: collision with root package name */
    public int f29933c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f29934d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.util.v f29935e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f29936f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f29937g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f29938h;

    /* renamed from: i, reason: collision with root package name */
    public int f29939i;

    /* renamed from: j, reason: collision with root package name */
    public int f29940j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f29941k;

    /* renamed from: l, reason: collision with root package name */
    public long f29942l;

    public s(h hVar) {
        this.f29931a = hVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.f0
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        this.f29935e = vVar;
        this.f29931a.a(jVar, e0Var);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.f0
    public final void a() {
        this.f29933c = 0;
        this.f29934d = 0;
        this.f29938h = false;
        this.f29931a.a();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.f0
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, boolean z11) {
        int i5;
        if (z11) {
            int i11 = this.f29933c;
            if (i11 == 2) {
                Log.w("PesReader", "Unexpected start indicator reading extended header");
            } else if (i11 == 3) {
                if (this.f29940j != -1) {
                    Log.w("PesReader", "Unexpected start indicator: expected " + this.f29940j + " more bytes");
                }
                this.f29931a.b();
            }
            this.f29933c = 1;
            this.f29934d = 0;
        }
        while (true) {
            int i12 = nVar.f30463c;
            int i13 = nVar.f30462b;
            int i14 = i12 - i13;
            if (i14 <= 0) {
                return;
            }
            int i15 = this.f29933c;
            if (i15 == 0) {
                nVar.e(i14 + i13);
            } else if (i15 != 1) {
                if (i15 == 2) {
                    if (a(nVar, this.f29932b.f30457a, Math.min(10, this.f29939i)) && a(nVar, (byte[]) null, this.f29939i)) {
                        this.f29932b.b(0);
                        this.f29942l = -9223372036854775807L;
                        if (this.f29936f) {
                            this.f29932b.c(4);
                            this.f29932b.c(1);
                            this.f29932b.c(1);
                            long jA = (this.f29932b.a(3) << 30) | (this.f29932b.a(15) << 15) | this.f29932b.a(15);
                            this.f29932b.c(1);
                            if (!this.f29938h && this.f29937g) {
                                this.f29932b.c(4);
                                this.f29932b.c(1);
                                this.f29932b.c(1);
                                this.f29932b.c(1);
                                this.f29935e.b((this.f29932b.a(3) << 30) | (this.f29932b.a(15) << 15) | this.f29932b.a(15));
                                this.f29938h = true;
                            }
                            this.f29942l = this.f29935e.b(jA);
                        }
                        this.f29931a.a(this.f29941k, this.f29942l);
                        this.f29933c = 3;
                        this.f29934d = 0;
                    }
                } else if (i15 == 3) {
                    int i16 = this.f29940j;
                    int i17 = i16 == -1 ? 0 : i14 - i16;
                    if (i17 > 0) {
                        i14 -= i17;
                        nVar.d(i13 + i14);
                    }
                    this.f29931a.a(nVar);
                    int i18 = this.f29940j;
                    if (i18 != -1) {
                        int i19 = i18 - i14;
                        this.f29940j = i19;
                        if (i19 == 0) {
                            this.f29931a.b();
                            this.f29933c = 1;
                            this.f29934d = 0;
                        }
                    }
                }
            } else if (a(nVar, this.f29932b.f30457a, 9)) {
                this.f29932b.b(0);
                int iA = this.f29932b.a(24);
                if (iA != 1) {
                    Log.w("PesReader", "Unexpected start code prefix: " + iA);
                    this.f29940j = -1;
                    i5 = 0;
                } else {
                    this.f29932b.c(8);
                    int iA2 = this.f29932b.a(16);
                    this.f29932b.c(5);
                    this.f29941k = this.f29932b.b();
                    this.f29932b.c(2);
                    this.f29936f = this.f29932b.b();
                    this.f29937g = this.f29932b.b();
                    this.f29932b.c(6);
                    int iA3 = this.f29932b.a(8);
                    this.f29939i = iA3;
                    if (iA2 == 0) {
                        this.f29940j = -1;
                    } else {
                        this.f29940j = (iA2 - 3) - iA3;
                    }
                    i5 = 2;
                }
                this.f29933c = i5;
                this.f29934d = 0;
            }
        }
    }

    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, byte[] bArr, int i5) {
        int iMin = Math.min(nVar.f30463c - nVar.f30462b, i5 - this.f29934d);
        if (iMin <= 0) {
            return true;
        }
        if (bArr == null) {
            nVar.e(nVar.f30462b + iMin);
        } else {
            nVar.a(bArr, this.f29934d, iMin);
        }
        int i11 = this.f29934d + iMin;
        this.f29934d = i11;
        return i11 == i5;
    }
}
