package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.Log;
import android.util.Pair;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class d implements h {

    /* renamed from: r, reason: collision with root package name */
    public static final byte[] f29779r = {73, 68, 51};

    /* renamed from: a, reason: collision with root package name */
    public final boolean f29780a;

    /* renamed from: d, reason: collision with root package name */
    public final String f29783d;

    /* renamed from: e, reason: collision with root package name */
    public String f29784e;

    /* renamed from: f, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29785f;

    /* renamed from: g, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29786g;

    /* renamed from: k, reason: collision with root package name */
    public boolean f29790k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f29791l;

    /* renamed from: m, reason: collision with root package name */
    public long f29792m;
    public int n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29793p;

    /* renamed from: q, reason: collision with root package name */
    public long f29794q;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.m f29781b = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(new byte[7]);

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29782c = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(Arrays.copyOf(f29779r, 10));

    /* renamed from: h, reason: collision with root package name */
    public int f29787h = 0;

    /* renamed from: i, reason: collision with root package name */
    public int f29788i = 0;

    /* renamed from: j, reason: collision with root package name */
    public int f29789j = 256;

    public d(boolean z11, String str) {
        this.f29780a = z11;
        this.f29783d = str;
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
            int i13 = this.f29787h;
            if (i13 == 0) {
                byte[] bArr = nVar.f30461a;
                while (true) {
                    if (i11 >= i5) {
                        nVar.e(i11);
                        break;
                    }
                    int i14 = i11 + 1;
                    byte b11 = bArr[i11];
                    int i15 = b11 & 255;
                    int i16 = this.f29789j;
                    if (i16 != 512 || i15 < 240 || i15 == 255) {
                        int i17 = i16 | i15;
                        if (i17 == 329) {
                            this.f29789j = 768;
                        } else if (i17 == 511) {
                            this.f29789j = EventBridgeChannel.QUEUE_CAPACITY;
                        } else if (i17 == 836) {
                            this.f29789j = 1024;
                        } else {
                            if (i17 == 1075) {
                                this.f29787h = 1;
                                this.f29788i = 3;
                                this.n = 0;
                                this.f29782c.e(0);
                                nVar.e(i14);
                                break;
                            }
                            if (i16 != 256) {
                                this.f29789j = 256;
                            }
                        }
                        i11 = i14;
                    } else {
                        this.f29790k = (b11 & 1) == 0;
                        this.f29787h = 2;
                        this.f29788i = 0;
                        nVar.e(i14);
                    }
                }
            } else if (i13 == 1) {
                byte[] bArr2 = this.f29782c.f30461a;
                int iMin = Math.min(i12, 10 - this.f29788i);
                nVar.a(bArr2, this.f29788i, iMin);
                int i18 = this.f29788i + iMin;
                this.f29788i = i18;
                if (i18 == 10) {
                    this.f29786g.a(10, this.f29782c);
                    this.f29782c.e(6);
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar = this.f29786g;
                    int i19 = this.f29782c.i() + 10;
                    this.f29787h = 3;
                    this.f29788i = 10;
                    this.f29793p = rVar;
                    this.f29794q = 0L;
                    this.n = i19;
                }
            } else if (i13 == 2) {
                int i21 = this.f29790k ? 7 : 5;
                byte[] bArr3 = this.f29781b.f30457a;
                int iMin2 = Math.min(i12, i21 - this.f29788i);
                nVar.a(bArr3, this.f29788i, iMin2);
                int i22 = this.f29788i + iMin2;
                this.f29788i = i22;
                if (i22 == i21) {
                    this.f29781b.b(0);
                    if (this.f29791l) {
                        this.f29781b.c(10);
                    } else {
                        int iA = this.f29781b.a(2) + 1;
                        if (iA != 2) {
                            Log.w("AdtsReader", "Detected audio object type: " + iA + ", but assuming AAC LC.");
                            iA = 2;
                        }
                        int iA2 = this.f29781b.a(4);
                        this.f29781b.c(1);
                        byte[] bArr4 = {(byte) (((iA << 3) & 248) | ((iA2 >> 1) & 7)), (byte) (((iA2 << 7) & 128) | ((this.f29781b.a(3) << 3) & 120))};
                        Pair pairA = com.fyber.inneractive.sdk.player.exoplayer2.util.d.a(bArr4);
                        com.fyber.inneractive.sdk.player.exoplayer2.o oVarA = com.fyber.inneractive.sdk.player.exoplayer2.o.a(this.f29784e, "audio/mp4a-latm", -1, -1, ((Integer) pairA.second).intValue(), ((Integer) pairA.first).intValue(), Collections.singletonList(bArr4), null, this.f29783d);
                        this.f29792m = 1024000000 / oVarA.f30139s;
                        this.f29785f.a(oVarA);
                        this.f29791l = true;
                    }
                    this.f29781b.c(4);
                    int iA3 = this.f29781b.a(13);
                    int i23 = iA3 - 7;
                    if (this.f29790k) {
                        i23 = iA3 - 9;
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar2 = this.f29785f;
                    long j11 = this.f29792m;
                    this.f29787h = 3;
                    this.f29788i = 0;
                    this.f29793p = rVar2;
                    this.f29794q = j11;
                    this.n = i23;
                }
            } else if (i13 == 3) {
                int iMin3 = Math.min(i12, this.n - this.f29788i);
                this.f29793p.a(iMin3, nVar);
                int i24 = this.f29788i + iMin3;
                this.f29788i = i24;
                int i25 = this.n;
                if (i24 == i25) {
                    this.f29793p.a(this.o, 1, i25, 0, null);
                    this.o += this.f29794q;
                    this.f29787h = 0;
                    this.f29788i = 0;
                    this.f29789j = 256;
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29784e = e0Var.f29804e;
        e0Var.b();
        this.f29785f = jVar.a(e0Var.f29803d, 1);
        if (this.f29780a) {
            e0Var.a();
            e0Var.b();
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 4);
            this.f29786g = gVarA;
            e0Var.b();
            gVarA.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(e0Var.f29804e, "application/id3", (com.fyber.inneractive.sdk.player.exoplayer2.drm.d) null));
            return;
        }
        this.f29786g = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.h();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        this.o = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        this.f29787h = 0;
        this.f29788i = 0;
        this.f29789j = 256;
    }
}
