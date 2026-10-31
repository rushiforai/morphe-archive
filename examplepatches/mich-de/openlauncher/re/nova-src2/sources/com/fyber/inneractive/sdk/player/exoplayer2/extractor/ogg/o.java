package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import android.util.Log;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class o extends l {
    public n n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f29726p;

    /* renamed from: q, reason: collision with root package name */
    public r f29727q;

    /* renamed from: r, reason: collision with root package name */
    public p f29728r;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final void a(boolean z11) {
        super.a(z11);
        if (z11) {
            this.n = null;
            this.f29727q = null;
            this.f29728r = null;
        }
        this.o = 0;
        this.f29726p = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int i5;
        byte b11 = nVar.f30461a[0];
        if ((b11 & 1) == 1) {
            return -1L;
        }
        n nVar2 = this.n;
        if (!nVar2.f29724c[(b11 >> 1) & (255 >>> (8 - nVar2.f29725d))].f29729a) {
            i5 = nVar2.f29722a.f29733d;
        } else {
            i5 = nVar2.f29722a.f29734e;
        }
        long j11 = this.f29726p ? (this.o + i5) / 4 : 0;
        nVar.d(nVar.f30463c + 4);
        byte[] bArr = nVar.f30461a;
        int i11 = nVar.f30463c;
        bArr[i11 - 4] = (byte) (j11 & 255);
        bArr[i11 - 3] = (byte) ((j11 >>> 8) & 255);
        bArr[i11 - 2] = (byte) ((j11 >>> 16) & 255);
        bArr[i11 - 1] = (byte) ((j11 >>> 24) & 255);
        this.f29726p = true;
        this.o = i5;
        return j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, long j11, j jVar) throws com.fyber.inneractive.sdk.player.exoplayer2.r {
        int i5;
        int i11;
        long jFloor;
        int i12;
        if (this.n != null) {
            return false;
        }
        n nVar2 = null;
        int i13 = 1;
        if (this.f29727q == null) {
            this.f29727q = s.a(nVar);
        } else if (this.f29728r == null) {
            s.a(3, nVar, false);
            nVar.b((int) nVar.e());
            long jE = nVar.e();
            String[] strArr = new String[(int) jE];
            for (int i14 = 0; i14 < jE; i14++) {
                strArr[i14] = nVar.b((int) nVar.e());
            }
            if ((nVar.j() & 1) != 0) {
                this.f29728r = new p();
            } else {
                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("framing bit expected to be set");
            }
        } else {
            int i15 = nVar.f30463c;
            byte[] bArr = new byte[i15];
            System.arraycopy(nVar.f30461a, 0, bArr, 0, i15);
            int i16 = this.f29727q.f29730a;
            int i17 = 5;
            s.a(5, nVar, false);
            int iJ = nVar.j() + 1;
            m mVar = new m(nVar.f30461a);
            int i18 = 8;
            mVar.b(nVar.f30462b * 8);
            int i19 = 0;
            while (true) {
                int i21 = 4;
                int i22 = 16;
                if (i19 < iJ) {
                    if (mVar.a(24) == 5653314) {
                        int iA = mVar.a(16);
                        int iA2 = mVar.a(24);
                        long[] jArr = new long[iA2];
                        long j12 = 0;
                        if (!mVar.a()) {
                            boolean zA = mVar.a();
                            i11 = i18;
                            int i23 = 0;
                            while (i23 < iA2) {
                                if (zA) {
                                    if (mVar.a()) {
                                        i12 = i13;
                                        jArr[i23] = mVar.a(i17) + 1;
                                    } else {
                                        i12 = i13;
                                        jArr[i23] = 0;
                                    }
                                } else {
                                    i12 = i13;
                                    jArr[i23] = mVar.a(i17) + 1;
                                }
                                i23++;
                                i13 = i12;
                            }
                            i5 = i13;
                        } else {
                            i5 = i13;
                            i11 = i18;
                            int iA3 = mVar.a(i17) + 1;
                            int i24 = 0;
                            while (i24 < iA2) {
                                int i25 = 0;
                                for (int i26 = iA2 - i24; i26 > 0; i26 >>>= 1) {
                                    i25++;
                                }
                                int iA4 = mVar.a(i25);
                                int i27 = 0;
                                while (i27 < iA4 && i24 < iA2) {
                                    jArr[i24] = iA3;
                                    i24++;
                                    i27++;
                                    iJ = iJ;
                                }
                                iA3++;
                                iJ = iJ;
                            }
                        }
                        int i28 = iJ;
                        int iA5 = mVar.a(4);
                        if (iA5 > 2) {
                            throw new com.fyber.inneractive.sdk.player.exoplayer2.r(com.fyber.inneractive.sdk.player.exoplayer2.m.a("lookup type greater than 2 not decodable: ", iA5));
                        }
                        int i29 = i5;
                        if (iA5 == i29 || iA5 == 2) {
                            mVar.b(32);
                            mVar.b(32);
                            int iA6 = mVar.a(4) + i29;
                            mVar.b(i29);
                            if (iA5 == i29) {
                                if (iA != 0) {
                                    jFloor = (long) Math.floor(Math.pow(iA2, 1.0d / iA));
                                }
                                mVar.b((int) (iA6 * j12));
                            } else {
                                jFloor = iA2 * iA;
                            }
                            j12 = jFloor;
                            mVar.b((int) (iA6 * j12));
                        }
                        i19++;
                        i18 = i11;
                        iJ = i28;
                        i13 = 1;
                        i17 = 5;
                    } else {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("expected code book to start with [0x56, 0x43, 0x42] at " + ((mVar.f29720c * 8) + mVar.f29721d));
                    }
                } else {
                    int i31 = i18;
                    int i32 = 6;
                    int iA7 = mVar.a(6) + 1;
                    for (int i33 = 0; i33 < iA7; i33++) {
                        if (mVar.a(16) != 0) {
                            throw new com.fyber.inneractive.sdk.player.exoplayer2.r("placeholder of time domain transforms not zeroed out");
                        }
                    }
                    int i34 = 1;
                    int iA8 = mVar.a(6) + 1;
                    int i35 = 0;
                    while (i35 < iA8) {
                        int iA9 = mVar.a(i22);
                        if (iA9 == 0) {
                            int i36 = i31;
                            mVar.b(i36);
                            mVar.b(16);
                            mVar.b(16);
                            mVar.b(6);
                            mVar.b(i36);
                            int iA10 = mVar.a(4) + 1;
                            int i37 = 0;
                            while (i37 < iA10) {
                                mVar.b(i36);
                                i37++;
                                i36 = 8;
                            }
                        } else if (iA9 == i34) {
                            int iA11 = mVar.a(5);
                            int[] iArr = new int[iA11];
                            int i38 = -1;
                            for (int i39 = 0; i39 < iA11; i39++) {
                                int iA12 = mVar.a(i21);
                                iArr[i39] = iA12;
                                if (iA12 > i38) {
                                    i38 = iA12;
                                }
                            }
                            int i40 = i38 + 1;
                            int[] iArr2 = new int[i40];
                            int i41 = 0;
                            while (i41 < i40) {
                                iArr2[i41] = mVar.a(3) + 1;
                                int iA13 = mVar.a(2);
                                int i42 = i31;
                                if (iA13 > 0) {
                                    mVar.b(i42);
                                }
                                int i43 = 0;
                                for (int i44 = 1; i43 < (i44 << iA13); i44 = 1) {
                                    mVar.b(i42);
                                    i43++;
                                    i42 = 8;
                                }
                                i41++;
                                i31 = 8;
                            }
                            mVar.b(2);
                            int iA14 = mVar.a(4);
                            int i45 = 0;
                            int i46 = 0;
                            for (int i47 = 0; i47 < iA11; i47++) {
                                i45 += iArr2[iArr[i47]];
                                while (i46 < i45) {
                                    mVar.b(iA14);
                                    i46++;
                                }
                            }
                        } else {
                            throw new com.fyber.inneractive.sdk.player.exoplayer2.r(com.fyber.inneractive.sdk.player.exoplayer2.m.a("floor type greater than 1 not decodable: ", iA9));
                        }
                        i35++;
                        i31 = 8;
                        i32 = 6;
                        i34 = 1;
                        i21 = 4;
                        i22 = 16;
                    }
                    int i48 = i32;
                    int iA15 = mVar.a(i48) + 1;
                    int i49 = 0;
                    while (i49 < iA15) {
                        if (mVar.a(16) <= 2) {
                            mVar.b(24);
                            mVar.b(24);
                            mVar.b(24);
                            int iA16 = mVar.a(i48) + 1;
                            int i51 = 8;
                            mVar.b(8);
                            int[] iArr3 = new int[iA16];
                            for (int i52 = 0; i52 < iA16; i52++) {
                                iArr3[i52] = ((mVar.a() ? mVar.a(5) : 0) * 8) + mVar.a(3);
                            }
                            int i53 = 0;
                            while (i53 < iA16) {
                                int i54 = 0;
                                while (i54 < i51) {
                                    if ((iArr3[i53] & (1 << i54)) != 0) {
                                        mVar.b(i51);
                                    }
                                    i54++;
                                    i51 = 8;
                                }
                                i53++;
                                i51 = 8;
                            }
                            i49++;
                            i48 = 6;
                        } else {
                            throw new com.fyber.inneractive.sdk.player.exoplayer2.r("residueType greater than 2 is not decodable");
                        }
                    }
                    int iA17 = mVar.a(i48) + 1;
                    for (int i55 = 0; i55 < iA17; i55++) {
                        int iA18 = mVar.a(16);
                        if (iA18 != 0) {
                            Log.e("VorbisUtil", "mapping type other than 0 not supported: " + iA18);
                        } else {
                            int iA19 = mVar.a() ? mVar.a(4) + 1 : 1;
                            if (mVar.a()) {
                                int iA20 = mVar.a(8) + 1;
                                for (int i56 = 0; i56 < iA20; i56++) {
                                    int i57 = i16 - 1;
                                    int i58 = 0;
                                    for (int i59 = i57; i59 > 0; i59 >>>= 1) {
                                        i58++;
                                    }
                                    mVar.b(i58);
                                    int i61 = 0;
                                    while (i57 > 0) {
                                        i61++;
                                        i57 >>>= 1;
                                    }
                                    mVar.b(i61);
                                }
                            }
                            if (mVar.a(2) != 0) {
                                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("to reserved bits must be zero after mapping coupling steps");
                            }
                            if (iA19 > 1) {
                                for (int i62 = 0; i62 < i16; i62++) {
                                    mVar.b(4);
                                }
                            }
                            for (int i63 = 0; i63 < iA19; i63++) {
                                mVar.b(8);
                                mVar.b(8);
                                mVar.b(8);
                            }
                        }
                    }
                    int iA21 = mVar.a(6);
                    int i64 = iA21 + 1;
                    q[] qVarArr = new q[i64];
                    for (int i65 = 0; i65 < i64; i65++) {
                        boolean zA2 = mVar.a();
                        mVar.a(16);
                        mVar.a(16);
                        mVar.a(8);
                        qVarArr[i65] = new q(zA2);
                    }
                    if (mVar.a()) {
                        int i66 = 0;
                        while (iA21 > 0) {
                            i66++;
                            iA21 >>>= 1;
                        }
                        nVar2 = new n(this.f29727q, bArr, qVarArr, i66);
                    } else {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("framing bit after modes not set as expected");
                    }
                }
            }
        }
        this.n = nVar2;
        if (nVar2 == null) {
            return true;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(this.n.f29722a.f29735f);
        arrayList.add(this.n.f29723b);
        r rVar = this.n.f29722a;
        jVar.f29703a = com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, "audio/vorbis", rVar.f29732c, -1, rVar.f29730a, (int) rVar.f29731b, arrayList, null, null);
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final void a(long j11) {
        this.f29711g = j11;
        this.f29726p = j11 != 0;
        r rVar = this.f29727q;
        this.o = rVar != null ? rVar.f29733d : 0;
    }
}
