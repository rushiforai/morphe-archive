package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import android.util.Pair;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final int f29533a = z.a("vide");

    /* renamed from: b, reason: collision with root package name */
    public static final int f29534b = z.a("soun");

    /* renamed from: c, reason: collision with root package name */
    public static final int f29535c = z.a("text");

    /* renamed from: d, reason: collision with root package name */
    public static final int f29536d = z.a("sbtl");

    /* renamed from: e, reason: collision with root package name */
    public static final int f29537e = z.a("subt");

    /* renamed from: f, reason: collision with root package name */
    public static final int f29538f = z.a("clcp");

    /* renamed from: g, reason: collision with root package name */
    public static final int f29539g = z.a("cenc");

    /* renamed from: h, reason: collision with root package name */
    public static final int f29540h = z.a("meta");

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:272:0x04c9  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x04ce  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x04fe  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x052d A[PHI: r10 r25 r36 r37 r54
      0x052d: PHI (r10v21 java.lang.String) = (r10v14 java.lang.String), (r10v15 java.lang.String), (r10v27 java.lang.String) binds: [B:286:0x04fc, B:290:0x052c, B:257:0x043a] A[DONT_GENERATE, DONT_INLINE]
      0x052d: PHI (r25v10 byte[]) = (r25v6 byte[]), (r25v8 byte[]), (r25v6 byte[]) binds: [B:286:0x04fc, B:290:0x052c, B:257:0x043a] A[DONT_GENERATE, DONT_INLINE]
      0x052d: PHI (r36v3 int) = (r36v2 int), (r36v2 int), (r36v8 int) binds: [B:286:0x04fc, B:290:0x052c, B:257:0x043a] A[DONT_GENERATE, DONT_INLINE]
      0x052d: PHI (r37v4 int) = (r37v1 int), (r37v1 int), (r37v9 int) binds: [B:286:0x04fc, B:290:0x052c, B:257:0x043a] A[DONT_GENERATE, DONT_INLINE]
      0x052d: PHI (r54v12 int) = (r54v7 int), (r54v7 int), (r54v15 int) binds: [B:286:0x04fc, B:290:0x052c, B:257:0x043a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:329:0x05fc A[PHI: r26 r27 r30 r32 r33
      0x05fc: PHI (r26v10 java.lang.String) = (r26v1 java.lang.String), (r26v1 java.lang.String), (r26v1 java.lang.String), (r26v11 java.lang.String) binds: [B:379:0x06cd, B:381:0x06da, B:375:0x06b2, B:328:0x05fa] A[DONT_GENERATE, DONT_INLINE]
      0x05fc: PHI (r27v7 int) = (r27v2 int), (r27v2 int), (r27v4 int), (r27v8 int) binds: [B:379:0x06cd, B:381:0x06da, B:375:0x06b2, B:328:0x05fa] A[DONT_GENERATE, DONT_INLINE]
      0x05fc: PHI (r30v4 java.util.List) = (r30v1 java.util.List), (r30v1 java.util.List), (r30v1 java.util.List), (r30v5 java.util.List) binds: [B:379:0x06cd, B:381:0x06da, B:375:0x06b2, B:328:0x05fa] A[DONT_GENERATE, DONT_INLINE]
      0x05fc: PHI (r32v4 float) = (r32v1 float), (r32v1 float), (r32v1 float), (r32v5 float) binds: [B:379:0x06cd, B:381:0x06da, B:375:0x06b2, B:328:0x05fa] A[DONT_GENERATE, DONT_INLINE]
      0x05fc: PHI (r33v5 byte[]) = (r33v1 byte[]), (r33v1 byte[]), (r33v3 byte[]), (r33v1 byte[]) binds: [B:379:0x06cd, B:381:0x06da, B:375:0x06b2, B:328:0x05fa] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:403:0x0742  */
    /* JADX WARN: Removed duplicated region for block: B:423:0x07b7 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:424:0x07b8  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0151  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01bb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static s a(a aVar, b bVar, long j11, com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVar, boolean z11) throws com.fyber.inneractive.sdk.player.exoplayer2.r {
        long jK;
        int i5;
        int i11;
        int iB;
        int i12;
        a aVarB;
        s sVar;
        Pair pairCreate;
        b bVarC;
        int i13;
        long j12;
        int i14;
        int i15;
        int i16;
        int i17;
        List list;
        int iO;
        int iO2;
        int iRound;
        int i18;
        int i19;
        int i21;
        int i22;
        int i23;
        String str;
        long j13;
        List listSingletonList;
        a aVarB2 = aVar.b(c.F);
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = aVarB2.c(c.T).R0;
        nVar.e(16);
        int iB2 = nVar.b();
        int i24 = iB2 == f29534b ? 1 : iB2 == f29533a ? 2 : (iB2 == f29535c || iB2 == f29536d || iB2 == f29537e || iB2 == f29538f) ? 3 : iB2 == f29540h ? 4 : -1;
        if (i24 == -1) {
            return null;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = aVar.c(c.P).R0;
        int i25 = 8;
        nVar2.e(8);
        int iB3 = (nVar2.b() >> 24) & 255;
        nVar2.e(nVar2.f30462b + (iB3 == 0 ? 8 : 16));
        int iB4 = nVar2.b();
        nVar2.e(nVar2.f30462b + 4);
        int i26 = nVar2.f30462b;
        int i27 = iB3 == 0 ? 4 : 8;
        int i28 = 0;
        int i29 = 0;
        while (true) {
            if (i29 >= i27) {
                nVar2.e(nVar2.f30462b + i27);
                break;
            }
            if (nVar2.f30461a[i26 + i29] != -1) {
                jK = iB3 == 0 ? nVar2.k() : nVar2.n();
                if (jK == 0) {
                    break;
                }
            } else {
                i29++;
            }
        }
        jK = -9223372036854775807L;
        nVar2.e(nVar2.f30462b + 16);
        int iB5 = nVar2.b();
        int iB6 = nVar2.b();
        nVar2.e(nVar2.f30462b + 4);
        int iB7 = nVar2.b();
        int iB8 = nVar2.b();
        int i31 = 3;
        if (iB5 == 0 && iB6 == 65536 && iB7 == -65536 && iB8 == 0) {
            i11 = 90;
        } else if (iB5 == 0 && iB6 == -65536 && iB7 == 65536 && iB8 == 0) {
            i11 = 270;
        } else {
            if (iB5 != -65536 || iB6 != 0 || iB7 != 0 || iB8 != -65536) {
                i5 = 0;
                long j14 = j11 != -9223372036854775807L ? jK : j11;
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = bVar.R0;
                nVar3.e(8);
                int iB9 = nVar3.b();
                int i32 = c.f29463b;
                nVar3.e(nVar3.f30462b + (((iB9 >> 24) & 255) != 0 ? 8 : 16));
                long jK2 = nVar3.k();
                long jA = j14 != -9223372036854775807L ? z.a(j14, 1000000L, jK2) : -9223372036854775807L;
                long j15 = jK2;
                a aVarB3 = aVarB2.b(c.G).b(c.H);
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar4 = aVarB2.c(c.S).R0;
                nVar4.e(8);
                int iB10 = (nVar4.b() >> 24) & 255;
                nVar4.e(nVar4.f30462b + (iB10 != 0 ? 8 : 16));
                long jK3 = nVar4.k();
                nVar4.e(nVar4.f30462b + (iB10 != 0 ? 4 : 8));
                int iO3 = nVar4.o();
                Pair pairCreate2 = Pair.create(Long.valueOf(jK3), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + ((char) (((iO3 >> 10) & 31) + 96)) + ((char) (((iO3 >> 5) & 31) + 96)) + ((char) ((iO3 & 31) + 96)));
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar5 = aVarB3.c(c.U).R0;
                String str2 = (String) pairCreate2.second;
                nVar5.e(12);
                iB = nVar5.b();
                f fVar = new f(iB);
                i12 = 0;
                while (i12 < iB) {
                    int i33 = nVar5.f30462b;
                    int iB11 = nVar5.b();
                    int i34 = i25;
                    com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(iB11 > 0 ? 1 : i28, "childAtomSize should be positive");
                    int iB12 = nVar5.b();
                    if (iB12 == c.f29465c || iB12 == c.f29467d || iB12 == c.f29462a0 || iB12 == c.f29484l0 || iB12 == c.f29469e || iB12 == c.f29471f || iB12 == c.f29473g || iB12 == c.K0 || iB12 == c.L0 || iB12 == c.N0) {
                        i13 = i28;
                        j12 = j15;
                        i14 = iB;
                        nVar5.e(i33 + 16);
                        nVar5.e(nVar5.f30462b + 16);
                        int iO4 = nVar5.o();
                        int iO5 = nVar5.o();
                        nVar5.e(nVar5.f30462b + 50);
                        int i35 = nVar5.f30462b;
                        if (iB12 == c.f29462a0) {
                            iB12 = a(nVar5, i33, iB11, fVar, i12);
                            nVar5.e(i35);
                        }
                        int i36 = -1;
                        float fM = 1.0f;
                        int i37 = i13;
                        String str3 = null;
                        List listSingletonList2 = null;
                        byte[] bArrCopyOfRange = null;
                        while (i35 - i33 < iB11) {
                            nVar5.e(i35);
                            int i38 = nVar5.f30462b;
                            int iB13 = nVar5.b();
                            if (iB13 == 0 && nVar5.f30462b - i33 == iB11) {
                                break;
                            }
                            com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(iB13 > 0 ? 1 : i13, "childAtomSize should be positive");
                            int iB14 = nVar5.b();
                            int i39 = i35;
                            if (iB14 == c.I) {
                                if (str3 != null) {
                                    throw new IllegalStateException();
                                }
                                nVar5.e(i38 + 8);
                                com.fyber.inneractive.sdk.player.exoplayer2.video.a aVarA = com.fyber.inneractive.sdk.player.exoplayer2.video.a.a(nVar5);
                                list = aVarA.f30519a;
                                fVar.f29523c = aVarA.f30520b;
                                if (i37 == 0) {
                                    fM = aVarA.f30523e;
                                }
                                str3 = "video/avc";
                            } else if (iB14 != c.J) {
                                if (iB14 == c.M0) {
                                    if (str3 != null) {
                                        throw new IllegalStateException();
                                    }
                                    str3 = iB12 == c.K0 ? "video/x-vnd.on2.vp8" : "video/x-vnd.on2.vp9";
                                } else if (iB14 == c.O0) {
                                    if (str3 != null) {
                                        throw new IllegalStateException();
                                    }
                                    str3 = "video/av01";
                                } else if (iB14 == c.f29475h) {
                                    if (str3 != null) {
                                        throw new IllegalStateException();
                                    }
                                    str3 = "video/3gpp";
                                } else if (iB14 != c.K) {
                                    if (iB14 == c.f29480j0) {
                                        nVar5.e(i38 + 8);
                                        fM = nVar5.m() / nVar5.m();
                                        i17 = i31;
                                        i16 = 1;
                                    } else if (iB14 == c.I0) {
                                        int i40 = i38 + 8;
                                        while (i40 - i38 < iB13) {
                                            nVar5.e(i40);
                                            int iB15 = nVar5.b();
                                            i16 = i37;
                                            if (nVar5.b() == c.J0) {
                                                bArrCopyOfRange = Arrays.copyOfRange(nVar5.f30461a, i40, i40 + iB15);
                                                i17 = i31;
                                                break;
                                            }
                                            i40 += iB15;
                                            i37 = i16;
                                        }
                                        i16 = i37;
                                        i17 = i31;
                                        bArrCopyOfRange = null;
                                    } else {
                                        i16 = i37;
                                        if (iB14 == c.H0) {
                                            int iJ = nVar5.j();
                                            nVar5.e(nVar5.f30462b + 3);
                                            if (iJ != 0) {
                                                i17 = i31;
                                                break;
                                                break;
                                            }
                                            int iJ2 = nVar5.j();
                                            if (iJ2 == 0) {
                                                i17 = i31;
                                                i36 = i13;
                                            } else if (iJ2 != 1) {
                                                i17 = i31;
                                                if (iJ2 == 2) {
                                                    i36 = 2;
                                                } else if (iJ2 == i17) {
                                                    i36 = i17;
                                                }
                                            } else {
                                                i17 = i31;
                                                i36 = 1;
                                            }
                                        }
                                    }
                                    i35 = i39 + iB13;
                                    i31 = i17;
                                    i37 = i16;
                                } else {
                                    if (str3 != null) {
                                        throw new IllegalStateException();
                                    }
                                    Pair pairA = a(i38, nVar5);
                                    str3 = (String) pairA.first;
                                    listSingletonList2 = Collections.singletonList((byte[]) pairA.second);
                                }
                                i16 = i37;
                                i17 = i31;
                                break;
                                i35 = i39 + iB13;
                                i31 = i17;
                                i37 = i16;
                            } else {
                                if (str3 != null) {
                                    throw new IllegalStateException();
                                }
                                nVar5.e(i38 + 8);
                                com.fyber.inneractive.sdk.player.exoplayer2.video.d dVarA = com.fyber.inneractive.sdk.player.exoplayer2.video.d.a(nVar5);
                                list = dVarA.f30529a;
                                fVar.f29523c = dVarA.f30530b;
                                str3 = "video/hevc";
                            }
                            listSingletonList2 = list;
                            i16 = i37;
                            i17 = i31;
                            break;
                            i35 = i39 + iB13;
                            i31 = i17;
                            i37 = i16;
                        }
                        i15 = i31;
                        if (str3 != null) {
                            fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str3, -1, iO4, iO5, listSingletonList2, i5, fM, bArrCopyOfRange, i36, null, dVar);
                        }
                    } else {
                        if (iB12 == c.f29479j || iB12 == c.f29464b0 || iB12 == c.o || iB12 == c.f29491q || iB12 == c.f29495s || iB12 == c.f29501v || iB12 == c.f29497t || iB12 == c.f29499u || iB12 == c.f29508y0 || iB12 == c.f29510z0 || iB12 == c.f29485m || iB12 == c.n || iB12 == c.f29481k || iB12 == c.Q0) {
                            nVar5.e(i33 + 16);
                            if (z11) {
                                iO = nVar5.o();
                                nVar5.e(nVar5.f30462b + 6);
                            } else {
                                nVar5.e(nVar5.f30462b + 8);
                                iO = 0;
                            }
                            if (iO == 0 || iO == 1) {
                                j12 = j15;
                                iO2 = nVar5.o();
                                nVar5.e(nVar5.f30462b + 6);
                                byte[] bArr = nVar5.f30461a;
                                int i41 = nVar5.f30462b;
                                int i42 = i41 + 1;
                                nVar5.f30462b = i42;
                                int i43 = (bArr[i41] & 255) << 8;
                                nVar5.f30462b = i41 + 2;
                                int i44 = i43 | (bArr[i42] & 255);
                                nVar5.f30462b = i41 + 4;
                                if (iO == 1) {
                                    nVar5.e(i41 + 20);
                                }
                                iRound = i44;
                            } else if (iO == 2) {
                                nVar5.e(nVar5.f30462b + 16);
                                j12 = j15;
                                iRound = (int) Math.round(Double.longBitsToDouble(nVar5.g()));
                                iO2 = nVar5.m();
                                nVar5.e(nVar5.f30462b + 20);
                            } else {
                                j12 = j15;
                                i14 = iB;
                                i15 = i31;
                                i13 = 0;
                            }
                            int i45 = nVar5.f30462b;
                            if (iB12 == c.f29464b0) {
                                iB12 = a(nVar5, i33, iB11, fVar, i12);
                                nVar5.e(i45);
                            }
                            int i46 = iRound;
                            String str4 = iB12 == c.o ? "audio/ac3" : iB12 == c.f29491q ? "audio/eac3" : iB12 == c.f29495s ? "audio/vnd.dts" : (iB12 == c.f29497t || iB12 == c.f29499u) ? "audio/vnd.dts.hd" : iB12 == c.f29501v ? "audio/vnd.dts.hd;profile=lbr" : iB12 == c.f29508y0 ? "audio/3gpp" : iB12 == c.f29510z0 ? "audio/amr-wb" : (iB12 == c.f29485m || iB12 == c.n) ? "audio/raw" : iB12 == c.f29481k ? "audio/mpeg" : iB12 == c.Q0 ? "audio/alac" : null;
                            byte[] bArr2 = null;
                            int i47 = i45;
                            int iIntValue = iO2;
                            while (i47 - i33 < iB11) {
                                nVar5.e(i47);
                                int iB16 = nVar5.b();
                                int i48 = iIntValue;
                                com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(iB16 > 0, "childAtomSize should be positive");
                                int iB17 = nVar5.b();
                                int i49 = iB;
                                int i51 = c.K;
                                if (iB17 != i51) {
                                    String str5 = str4;
                                    if (z11 && iB17 == c.f29483l) {
                                        str4 = str5;
                                        i18 = i46;
                                        i19 = i48;
                                        if (iB17 != i51) {
                                            i21 = iB16;
                                            i23 = i47;
                                        } else {
                                            int i52 = nVar5.f30462b;
                                            while (i52 - i47 < iB16) {
                                                nVar5.e(i52);
                                                int iB18 = nVar5.b();
                                                i21 = iB16;
                                                com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(iB18 > 0, "childAtomSize should be positive");
                                                int i53 = i52;
                                                if (nVar5.b() == c.K) {
                                                    i23 = i53;
                                                } else {
                                                    i52 = i53 + iB18;
                                                    iB16 = i21;
                                                }
                                            }
                                            i21 = iB16;
                                            i22 = -1;
                                            i23 = -1;
                                            if (i23 != i22) {
                                                Pair pairA2 = a(i23, nVar5);
                                                String str6 = (String) pairA2.first;
                                                bArr2 = (byte[]) pairA2.second;
                                                if ("audio/mp4a-latm".equals(str6)) {
                                                    Pair pairA3 = com.fyber.inneractive.sdk.player.exoplayer2.util.d.a(bArr2);
                                                    int iIntValue2 = ((Integer) pairA3.first).intValue();
                                                    iIntValue = ((Integer) pairA3.second).intValue();
                                                    i18 = iIntValue2;
                                                    str4 = str6;
                                                } else {
                                                    str4 = str6;
                                                    iIntValue = i19;
                                                }
                                            } else {
                                                iIntValue = i19;
                                            }
                                        }
                                        i22 = -1;
                                        if (i23 != i22) {
                                        }
                                    } else {
                                        if (iB17 == c.f29489p) {
                                            nVar5.e(i47 + 8);
                                            String string = Integer.toString(iB4);
                                            int i54 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28977b[(nVar5.j() & 192) >> 6];
                                            int iJ3 = nVar5.j();
                                            int i55 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28979d[(iJ3 & 56) >> 3];
                                            if ((iJ3 & 4) != 0) {
                                                i55++;
                                            }
                                            fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(string, "audio/ac3", -1, -1, i55, i54, null, dVar, str2);
                                        } else if (iB17 == c.f29493r) {
                                            nVar5.e(i47 + 8);
                                            String string2 = Integer.toString(iB4);
                                            nVar5.e(nVar5.f30462b + 2);
                                            int i56 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28977b[(nVar5.j() & 192) >> 6];
                                            int iJ4 = nVar5.j();
                                            int i57 = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.f28979d[(iJ4 & 14) >> 1];
                                            if ((iJ4 & 1) != 0) {
                                                i57++;
                                            }
                                            fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(string2, "audio/eac3", -1, -1, i57, i56, null, dVar, str2);
                                        } else {
                                            if (iB17 == c.f29503w) {
                                                i18 = i46;
                                                i19 = i48;
                                                str4 = str5;
                                                fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str5, -1, -1, i19, i18, null, dVar, str2);
                                            } else {
                                                i18 = i46;
                                                i19 = i48;
                                                str4 = str5;
                                                if (iB17 == c.Q0) {
                                                    byte[] bArr3 = new byte[iB16];
                                                    nVar5.e(i47);
                                                    nVar5.a(bArr3, 0, iB16);
                                                    i21 = iB16;
                                                    bArr2 = bArr3;
                                                    iIntValue = i19;
                                                }
                                            }
                                            i21 = iB16;
                                            iIntValue = i19;
                                        }
                                        i18 = i46;
                                        i21 = iB16;
                                        i19 = i48;
                                        str4 = str5;
                                        iIntValue = i19;
                                    }
                                } else {
                                    i18 = i46;
                                    i19 = i48;
                                    if (iB17 != i51) {
                                    }
                                    i22 = -1;
                                    if (i23 != i22) {
                                    }
                                }
                                i47 += i21;
                                i46 = i18;
                                iB = i49;
                            }
                            int i58 = i46;
                            int i59 = iIntValue;
                            i14 = iB;
                            i13 = 0;
                            if (fVar.f29522b == null && str4 != null) {
                                String str7 = str2;
                                str2 = str7;
                                fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str4, -1, -1, i59, i58, "audio/raw".equals(str4) ? 2 : -1, -1, -1, bArr2 == null ? null : Collections.singletonList(bArr2), dVar, 0, str7, null);
                            }
                        } else {
                            int i61 = c.f29482k0;
                            if (iB12 == i61 || iB12 == c.f29500u0 || iB12 == c.f29502v0 || iB12 == c.f29504w0 || iB12 == c.f29506x0) {
                                nVar5.e(i33 + 16);
                                String str8 = "application/ttml+xml";
                                if (iB12 == i61) {
                                    str = str8;
                                    j13 = Long.MAX_VALUE;
                                    listSingletonList = null;
                                    String str9 = str2;
                                    str2 = str9;
                                    fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str, 0, str9, -1, dVar, j13, listSingletonList);
                                } else if (iB12 == c.f29500u0) {
                                    int i62 = iB11 - 16;
                                    byte[] bArr4 = new byte[i62];
                                    nVar5.a(bArr4, i28, i62);
                                    listSingletonList = Collections.singletonList(bArr4);
                                    str = "application/x-quicktime-tx3g";
                                    j13 = Long.MAX_VALUE;
                                    String str92 = str2;
                                    str2 = str92;
                                    fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str, 0, str92, -1, dVar, j13, listSingletonList);
                                } else {
                                    if (iB12 == c.f29502v0) {
                                        str8 = "application/x-mp4-vtt";
                                    } else if (iB12 == c.f29504w0) {
                                        str = "application/ttml+xml";
                                        j13 = 0;
                                        listSingletonList = null;
                                        String str922 = str2;
                                        str2 = str922;
                                        fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str, 0, str922, -1, dVar, j13, listSingletonList);
                                    } else {
                                        if (iB12 != c.f29506x0) {
                                            throw new IllegalStateException();
                                        }
                                        fVar.f29524d = 1;
                                        str8 = "application/x-mp4-cea-608";
                                    }
                                    str = str8;
                                    j13 = Long.MAX_VALUE;
                                    listSingletonList = null;
                                    String str9222 = str2;
                                    str2 = str9222;
                                    fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), str, 0, str9222, -1, dVar, j13, listSingletonList);
                                }
                            } else if (iB12 == c.P0) {
                                fVar.f29522b = com.fyber.inneractive.sdk.player.exoplayer2.o.a(Integer.toString(iB4), "application/x-camera-motion", dVar);
                            }
                            i13 = i28;
                            j12 = j15;
                            i14 = iB;
                        }
                        i15 = i31;
                    }
                    nVar5.e(i33 + iB11);
                    i12++;
                    i31 = i15;
                    i25 = i34;
                    i28 = i13;
                    iB = i14;
                    j15 = j12;
                }
                int i63 = i28;
                long j16 = j15;
                int i64 = i25;
                aVarB = aVar.b(c.Q);
                if (aVarB != null || (bVarC = aVarB.c(c.R)) == null) {
                    sVar = null;
                    pairCreate = Pair.create(null, null);
                } else {
                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar6 = bVarC.R0;
                    nVar6.e(i64);
                    int iB19 = (nVar6.b() >> 24) & 255;
                    int iM = nVar6.m();
                    long[] jArr = new long[iM];
                    long[] jArr2 = new long[iM];
                    for (int i65 = i63; i65 < iM; i65++) {
                        jArr[i65] = iB19 == 1 ? nVar6.n() : nVar6.k();
                        jArr2[i65] = iB19 == 1 ? nVar6.g() : nVar6.b();
                        byte[] bArr5 = nVar6.f30461a;
                        int i66 = nVar6.f30462b;
                        int i67 = i66 + 1;
                        nVar6.f30462b = i67;
                        int i68 = (bArr5[i66] & 255) << 8;
                        nVar6.f30462b = i66 + 2;
                        if (((short) ((bArr5[i67] & 255) | i68)) != 1) {
                            throw new IllegalArgumentException("Unsupported media rate.");
                        }
                        nVar6.e(i66 + 4);
                    }
                    pairCreate = Pair.create(jArr, jArr2);
                    sVar = null;
                }
                return fVar.f29522b != null ? sVar : new s(iB4, i24, ((Long) pairCreate2.first).longValue(), j16, jA, fVar.f29522b, fVar.f29524d, fVar.f29521a, fVar.f29523c, (long[]) pairCreate.first, (long[]) pairCreate.second);
            }
            i11 = 180;
        }
        i5 = i11;
        if (j11 != -9223372036854775807L) {
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar32 = bVar.R0;
        nVar32.e(8);
        int iB92 = nVar32.b();
        int i322 = c.f29463b;
        nVar32.e(nVar32.f30462b + (((iB92 >> 24) & 255) != 0 ? 8 : 16));
        long jK22 = nVar32.k();
        if (j14 != -9223372036854775807L) {
        }
        long j152 = jK22;
        a aVarB32 = aVarB2.b(c.G).b(c.H);
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar42 = aVarB2.c(c.S).R0;
        nVar42.e(8);
        int iB102 = (nVar42.b() >> 24) & 255;
        nVar42.e(nVar42.f30462b + (iB102 != 0 ? 8 : 16));
        long jK32 = nVar42.k();
        nVar42.e(nVar42.f30462b + (iB102 != 0 ? 4 : 8));
        int iO32 = nVar42.o();
        Pair pairCreate22 = Pair.create(Long.valueOf(jK32), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + ((char) (((iO32 >> 10) & 31) + 96)) + ((char) (((iO32 >> 5) & 31) + 96)) + ((char) ((iO32 & 31) + 96)));
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar52 = aVarB32.c(c.U).R0;
        String str22 = (String) pairCreate22.second;
        nVar52.e(12);
        iB = nVar52.b();
        f fVar2 = new f(iB);
        i12 = 0;
        while (i12 < iB) {
        }
        int i632 = i28;
        long j162 = j152;
        int i642 = i25;
        aVarB = aVar.b(c.Q);
        if (aVarB != null) {
            sVar = null;
            pairCreate = Pair.create(null, null);
        }
        if (fVar2.f29522b != null) {
        }
    }

    public static int a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, int i5, int i11, f fVar, int i12) {
        int i13 = nVar.f30462b;
        while (true) {
            if (i13 - i5 >= i11) {
                return 0;
            }
            nVar.e(i13);
            int iB = nVar.b();
            com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(iB > 0, "childAtomSize should be positive");
            if (nVar.b() == c.W) {
                int i14 = i13 + 8;
                Pair pairCreate = null;
                boolean z11 = false;
                Integer numValueOf = null;
                t tVar = null;
                while (i14 - i13 < iB) {
                    nVar.e(i14);
                    int iB2 = nVar.b();
                    int iB3 = nVar.b();
                    if (iB3 == c.f29466c0) {
                        numValueOf = Integer.valueOf(nVar.b());
                    } else if (iB3 == c.X) {
                        nVar.e(nVar.f30462b + 4);
                        z11 = nVar.b() == f29539g;
                    } else if (iB3 == c.Y) {
                        int i15 = i14 + 8;
                        while (true) {
                            if (i15 - i14 >= iB2) {
                                tVar = null;
                                break;
                            }
                            nVar.e(i15);
                            int iB4 = nVar.b();
                            if (nVar.b() == c.Z) {
                                nVar.e(nVar.f30462b + 6);
                                nVar.j();
                                int iJ = nVar.j();
                                byte[] bArr = new byte[16];
                                nVar.a(bArr, 0, 16);
                                tVar = new t(iJ, bArr);
                                break;
                            }
                            i15 += iB4;
                        }
                    }
                    i14 += iB2;
                }
                if (z11) {
                    com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(numValueOf != null, "frma atom is mandatory");
                    com.fyber.inneractive.sdk.player.exoplayer2.util.a.a(tVar != null, "schi->tenc atom is mandatory");
                    pairCreate = Pair.create(numValueOf, tVar);
                }
                if (pairCreate != null) {
                    fVar.f29521a[i12] = (t) pairCreate.second;
                    return ((Integer) pairCreate.first).intValue();
                }
            }
            i13 += iB;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x008a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Pair a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        String str;
        nVar.e(i5 + 12);
        nVar.e(nVar.f30462b + 1);
        a(nVar);
        nVar.e(nVar.f30462b + 2);
        int iJ = nVar.j();
        if ((iJ & 128) != 0) {
            nVar.e(nVar.f30462b + 2);
        }
        if ((iJ & 64) != 0) {
            nVar.e(nVar.f30462b + nVar.o());
        }
        if ((iJ & 32) != 0) {
            nVar.e(nVar.f30462b + 2);
        }
        nVar.e(nVar.f30462b + 1);
        a(nVar);
        int iJ2 = nVar.j();
        if (iJ2 == 32) {
            str = "video/mp4v-es";
        } else if (iJ2 == 33) {
            str = "video/avc";
        } else if (iJ2 == 35) {
            str = "video/hevc";
        } else if (iJ2 != 64) {
            str = null;
            if (iJ2 == 107) {
                return Pair.create("audio/mpeg", null);
            }
            if (iJ2 == 165) {
                str = "audio/ac3";
            } else if (iJ2 == 166) {
                str = "audio/eac3";
            } else {
                switch (iJ2) {
                    case 102:
                    case 103:
                    case 104:
                        str = "audio/mp4a-latm";
                        break;
                    default:
                        switch (iJ2) {
                            case 169:
                            case 172:
                                return Pair.create("audio/vnd.dts", null);
                            case 170:
                            case 171:
                                return Pair.create("audio/vnd.dts.hd", null);
                        }
                }
            }
        }
        nVar.e(nVar.f30462b + 12);
        nVar.e(nVar.f30462b + 1);
        int iA = a(nVar);
        byte[] bArr = new byte[iA];
        nVar.a(bArr, 0, iA);
        return Pair.create(str, bArr);
    }

    public static int a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int iJ = nVar.j();
        int i5 = iJ & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        while ((iJ & 128) == 128) {
            iJ = nVar.j();
            i5 = (i5 << 7) | (iJ & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        return i5;
    }
}
