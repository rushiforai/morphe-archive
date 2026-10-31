package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.Log;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class o implements h {

    /* renamed from: a, reason: collision with root package name */
    public final x f29895a;

    /* renamed from: b, reason: collision with root package name */
    public String f29896b;

    /* renamed from: c, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29897c;

    /* renamed from: d, reason: collision with root package name */
    public n f29898d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29899e;

    /* renamed from: l, reason: collision with root package name */
    public long f29906l;

    /* renamed from: m, reason: collision with root package name */
    public long f29907m;

    /* renamed from: f, reason: collision with root package name */
    public final boolean[] f29900f = new boolean[3];

    /* renamed from: g, reason: collision with root package name */
    public final r f29901g = new r(32);

    /* renamed from: h, reason: collision with root package name */
    public final r f29902h = new r(33);

    /* renamed from: i, reason: collision with root package name */
    public final r f29903i = new r(34);

    /* renamed from: j, reason: collision with root package name */
    public final r f29904j = new r(39);

    /* renamed from: k, reason: collision with root package name */
    public final r f29905k = new r(40);
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n n = new com.fyber.inneractive.sdk.player.exoplayer2.util.n();

    public o(x xVar) {
        this.f29895a = xVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(this.f29900f);
        r rVar = this.f29901g;
        rVar.f29927b = false;
        rVar.f29928c = false;
        r rVar2 = this.f29902h;
        rVar2.f29927b = false;
        rVar2.f29928c = false;
        r rVar3 = this.f29903i;
        rVar3.f29927b = false;
        rVar3.f29928c = false;
        r rVar4 = this.f29904j;
        rVar4.f29927b = false;
        rVar4.f29928c = false;
        r rVar5 = this.f29905k;
        rVar5.f29927b = false;
        rVar5.f29928c = false;
        n nVar = this.f29898d;
        nVar.f29887f = false;
        nVar.f29888g = false;
        nVar.f29889h = false;
        nVar.f29890i = false;
        nVar.f29891j = false;
        this.f29906l = 0L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        this.f29896b = e0Var.f29804e;
        e0Var.b();
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 2);
        this.f29897c = gVarA;
        this.f29898d = new n(gVarA);
        this.f29895a.a(jVar, e0Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:173:0x03ba  */
    /* JADX WARN: Removed duplicated region for block: B:180:0x03c6  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00a8 A[PHI: r12 r15 r17 r18
      0x00a8: PHI (r12v1 int) = (r12v0 int), (r12v0 int), (r12v0 int), (r12v4 int) binds: [B:37:0x00cb, B:39:0x00d1, B:41:0x00d7, B:34:0x0099] A[DONT_GENERATE, DONT_INLINE]
      0x00a8: PHI (r15v2 int) = (r15v1 int), (r15v1 int), (r15v1 int), (r15v6 int) binds: [B:37:0x00cb, B:39:0x00d1, B:41:0x00d7, B:34:0x0099] A[DONT_GENERATE, DONT_INLINE]
      0x00a8: PHI (r17v1 int) = (r17v0 int), (r17v0 int), (r17v0 int), (r17v3 int) binds: [B:37:0x00cb, B:39:0x00d1, B:41:0x00d7, B:34:0x0099] A[DONT_GENERATE, DONT_INLINE]
      0x00a8: PHI (r18v1 long) = (r18v0 long), (r18v0 long), (r18v0 long), (r18v3 long) binds: [B:37:0x00cb, B:39:0x00d1, B:41:0x00d7, B:34:0x0099] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        long j11;
        int i5;
        int i11;
        int i12;
        int i13;
        byte[] bArr;
        int i14;
        int i15;
        float f11;
        byte[] bArr2;
        long j12;
        int i16;
        boolean z11;
        boolean z12;
        while (true) {
            int i17 = nVar.f30463c;
            int i18 = nVar.f30462b;
            int i19 = i17 - i18;
            if (i19 <= 0) {
                return;
            }
            byte[] bArr3 = nVar.f30461a;
            this.f29906l += i19;
            this.f29897c.a(i19, nVar);
            while (i18 < i17) {
                int iA = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(bArr3, i18, i17, this.f29900f);
                if (iA == i17) {
                    a(bArr3, i18, i17);
                    return;
                }
                int i21 = iA + 3;
                int i22 = (bArr3[i21] & 126) >> 1;
                int i23 = iA - i18;
                if (i23 > 0) {
                    a(bArr3, i18, iA);
                }
                int i24 = i17 - iA;
                long j13 = this.f29906l - i24;
                int i25 = i23 < 0 ? -i23 : 0;
                long j14 = this.f29907m;
                if (this.f29899e) {
                    n nVar2 = this.f29898d;
                    i11 = 5;
                    if (nVar2.f29891j && nVar2.f29888g) {
                        nVar2.f29894m = nVar2.f29884c;
                        nVar2.f29891j = false;
                    } else if (nVar2.f29889h || nVar2.f29888g) {
                        j11 = j14;
                        if (nVar2.f29890i) {
                            long j15 = nVar2.f29883b;
                            i5 = i24;
                            i12 = i25;
                            nVar2.f29882a.a(nVar2.f29893l, nVar2.f29894m ? 1 : 0, (int) (j15 - nVar2.f29892k), i5 + ((int) (j13 - j15)), null);
                        } else {
                            i5 = i24;
                            i12 = i25;
                        }
                        nVar2.f29892k = nVar2.f29883b;
                        nVar2.f29893l = nVar2.f29886e;
                        nVar2.f29890i = true;
                        nVar2.f29894m = nVar2.f29884c;
                        i13 = i17;
                        bArr = bArr3;
                        i14 = i21;
                        i15 = 16;
                    }
                    i13 = i17;
                    bArr = bArr3;
                    i14 = i21;
                    j11 = j14;
                    i5 = i24;
                    i15 = 16;
                    i12 = i25;
                } else {
                    j11 = j14;
                    i5 = i24;
                    i11 = 5;
                    i12 = i25;
                    this.f29901g.a(i12);
                    this.f29902h.a(i12);
                    this.f29903i.a(i12);
                    r rVar = this.f29901g;
                    if (rVar.f29928c) {
                        r rVar2 = this.f29902h;
                        if (rVar2.f29928c) {
                            r rVar3 = this.f29903i;
                            if (rVar3.f29928c) {
                                com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar4 = this.f29897c;
                                String str = this.f29896b;
                                int i26 = rVar.f29930e;
                                byte[] bArr4 = new byte[rVar2.f29930e + i26 + rVar3.f29930e];
                                i13 = i17;
                                bArr = bArr3;
                                System.arraycopy(rVar.f29929d, 0, bArr4, 0, i26);
                                i14 = i21;
                                System.arraycopy(rVar2.f29929d, 0, bArr4, rVar.f29930e, rVar2.f29930e);
                                System.arraycopy(rVar3.f29929d, 0, bArr4, rVar.f29930e + rVar2.f29930e, rVar3.f29930e);
                                com.fyber.inneractive.sdk.player.exoplayer2.util.o oVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.o(rVar2.f29929d, 0, rVar2.f29930e);
                                oVar.d(44);
                                int i27 = 3;
                                int iB = oVar.b(3);
                                oVar.f();
                                oVar.d(88);
                                oVar.d(8);
                                int i28 = 0;
                                for (int i29 = 0; i29 < iB; i29++) {
                                    if (oVar.c()) {
                                        i28 += 89;
                                    }
                                    if (oVar.c()) {
                                        i28 += 8;
                                    }
                                }
                                oVar.d(i28);
                                int i31 = 2;
                                if (iB > 0) {
                                    oVar.d((8 - iB) * 2);
                                }
                                oVar.d();
                                int iD = oVar.d();
                                if (iD == 3) {
                                    oVar.f();
                                }
                                int iD2 = oVar.d();
                                int iD3 = oVar.d();
                                if (oVar.c()) {
                                    int iD4 = oVar.d();
                                    int iD5 = oVar.d();
                                    int iD6 = oVar.d();
                                    int iD7 = oVar.d();
                                    iD2 -= (iD4 + iD5) * ((iD == 1 || iD == 2) ? 2 : 1);
                                    iD3 -= (iD6 + iD7) * (iD == 1 ? 2 : 1);
                                }
                                int i32 = iD2;
                                int i33 = iD3;
                                oVar.d();
                                oVar.d();
                                int iD8 = oVar.d();
                                for (int i34 = oVar.c() ? 0 : iB; i34 <= iB; i34++) {
                                    oVar.d();
                                    oVar.d();
                                    oVar.d();
                                }
                                oVar.d();
                                oVar.d();
                                oVar.d();
                                oVar.d();
                                oVar.d();
                                oVar.d();
                                if (oVar.c() && oVar.c()) {
                                    int i35 = 0;
                                    while (i35 < 4) {
                                        for (int i36 = 0; i36 < 6; i36 += i35 == i27 ? i27 : 1) {
                                            if (!oVar.c()) {
                                                oVar.d();
                                            } else {
                                                int iMin = Math.min(64, 1 << ((i35 << 1) + 4));
                                                if (i35 > 1) {
                                                    oVar.e();
                                                }
                                                for (int i37 = 0; i37 < iMin; i37++) {
                                                    oVar.e();
                                                }
                                                i27 = 3;
                                            }
                                        }
                                        i35++;
                                        i31 = 2;
                                    }
                                }
                                oVar.d(i31);
                                if (oVar.c()) {
                                    oVar.d(8);
                                    oVar.d();
                                    oVar.d();
                                    oVar.f();
                                }
                                int iD9 = oVar.d();
                                boolean zC = false;
                                int i38 = 0;
                                int i39 = 0;
                                while (i39 < iD9) {
                                    if (i39 != 0) {
                                        zC = oVar.c();
                                    }
                                    if (zC) {
                                        oVar.f();
                                        oVar.d();
                                        for (int i40 = 0; i40 <= i38; i40++) {
                                            if (oVar.c()) {
                                                oVar.f();
                                            }
                                        }
                                        bArr2 = bArr4;
                                    } else {
                                        int iD10 = oVar.d();
                                        int iD11 = oVar.d();
                                        int i41 = iD10 + iD11;
                                        bArr2 = bArr4;
                                        for (int i42 = 0; i42 < iD10; i42++) {
                                            oVar.d();
                                            oVar.f();
                                        }
                                        for (int i43 = 0; i43 < iD11; i43++) {
                                            oVar.d();
                                            oVar.f();
                                        }
                                        i38 = i41;
                                    }
                                    i39++;
                                    bArr4 = bArr2;
                                }
                                byte[] bArr5 = bArr4;
                                if (oVar.c()) {
                                    for (int i44 = 0; i44 < oVar.d(); i44++) {
                                        oVar.d(iD8 + 5);
                                    }
                                }
                                oVar.d(2);
                                if (oVar.c() && oVar.c()) {
                                    int iB2 = oVar.b(8);
                                    if (iB2 == 255) {
                                        i15 = 16;
                                        int iB3 = oVar.b(16);
                                        int iB4 = oVar.b(16);
                                        if (iB3 != 0 && iB4 != 0) {
                                            f11 = iB3 / iB4;
                                        }
                                        rVar4.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(str, "video/hevc", -1, i32, i33, Collections.singletonList(bArr5), -1, f11, null, -1, null, null));
                                        this.f29899e = true;
                                    } else {
                                        i15 = 16;
                                        float[] fArr = com.fyber.inneractive.sdk.player.exoplayer2.util.l.f30454b;
                                        if (iB2 < 17) {
                                            f11 = fArr[iB2];
                                            rVar4.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(str, "video/hevc", -1, i32, i33, Collections.singletonList(bArr5), -1, f11, null, -1, null, null));
                                            this.f29899e = true;
                                        } else {
                                            Log.w("H265Reader", "Unexpected aspect_ratio_idc value: " + iB2);
                                        }
                                    }
                                } else {
                                    i15 = 16;
                                }
                                f11 = 1.0f;
                                rVar4.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(str, "video/hevc", -1, i32, i33, Collections.singletonList(bArr5), -1, f11, null, -1, null, null));
                                this.f29899e = true;
                            } else {
                                i13 = i17;
                                bArr = bArr3;
                                i14 = i21;
                                i15 = 16;
                            }
                        }
                    }
                }
                if (this.f29904j.a(i12)) {
                    r rVar5 = this.f29904j;
                    int iA2 = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(rVar5.f29930e, rVar5.f29929d);
                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = this.n;
                    nVar3.f30461a = this.f29904j.f29929d;
                    nVar3.f30463c = iA2;
                    nVar3.f30462b = 0;
                    nVar3.e(i11);
                    j12 = j11;
                    com.fyber.inneractive.sdk.player.exoplayer2.text.cea.a.a(j12, this.n, this.f29895a.f29964b);
                } else {
                    j12 = j11;
                }
                if (this.f29905k.a(i12)) {
                    r rVar6 = this.f29905k;
                    int iA3 = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(rVar6.f29930e, rVar6.f29929d);
                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar4 = this.n;
                    nVar4.f30461a = this.f29905k.f29929d;
                    nVar4.f30463c = iA3;
                    nVar4.f30462b = 0;
                    nVar4.e(5);
                    com.fyber.inneractive.sdk.player.exoplayer2.text.cea.a.a(j12, this.n, this.f29895a.f29964b);
                }
                long j16 = this.f29907m;
                if (this.f29899e) {
                    n nVar5 = this.f29898d;
                    nVar5.f29888g = false;
                    nVar5.f29889h = false;
                    nVar5.f29886e = j16;
                    nVar5.f29885d = 0;
                    nVar5.f29883b = j13;
                    if (i22 >= 32) {
                        if (nVar5.f29891j || !nVar5.f29890i) {
                            i16 = i15;
                            z11 = false;
                        } else {
                            i16 = i15;
                            z11 = false;
                            nVar5.f29882a.a(nVar5.f29893l, nVar5.f29894m ? 1 : 0, (int) (j13 - nVar5.f29892k), i5, null);
                            nVar5.f29890i = false;
                        }
                        if (i22 <= 34) {
                            z12 = true;
                            nVar5.f29889h = !nVar5.f29891j;
                            nVar5.f29891j = true;
                        }
                        boolean z13 = (i22 >= i16 || i22 > 21) ? z11 : z12;
                        nVar5.f29884c = z13;
                        nVar5.f29887f = (!z13 || i22 <= 9) ? z12 : z11;
                    } else {
                        i16 = i15;
                        z11 = false;
                    }
                    z12 = true;
                    if (i22 >= i16) {
                        nVar5.f29884c = z13;
                        if (z13) {
                            nVar5.f29887f = (!z13 || i22 <= 9) ? z12 : z11;
                        }
                    }
                } else {
                    this.f29901g.b(i22);
                    this.f29902h.b(i22);
                    this.f29903i.b(i22);
                }
                this.f29904j.b(i22);
                this.f29905k.b(i22);
                i18 = i14;
                i17 = i13;
                bArr3 = bArr;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        this.f29907m = j11;
    }

    public final void a(byte[] bArr, int i5, int i11) {
        if (this.f29899e) {
            n nVar = this.f29898d;
            if (nVar.f29887f) {
                int i12 = nVar.f29885d;
                int i13 = (i5 + 2) - i12;
                if (i13 < i11) {
                    nVar.f29888g = (bArr[i13] & 128) != 0;
                    nVar.f29887f = false;
                } else {
                    nVar.f29885d = (i11 - i5) + i12;
                }
            }
        } else {
            this.f29901g.a(bArr, i5, i11);
            this.f29902h.a(bArr, i5, i11);
            this.f29903i.a(bArr, i5, i11);
        }
        this.f29904j.a(bArr, i5, i11);
        this.f29905k.a(bArr, i5, i11);
    }
}
