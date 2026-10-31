package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.EOFException;

/* loaded from: classes3.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f29620a = {z.a("isom"), z.a("iso2"), z.a("iso3"), z.a("iso4"), z.a("iso5"), z.a("iso6"), z.a("avc1"), z.a("hvc1"), z.a("hev1"), z.a("mp41"), z.a("mp42"), z.a("3g2a"), z.a("3g2b"), z.a("3gr6"), z.a("3gs6"), z.a("3ge6"), z.a("3gg6"), z.a("M4V "), z.a("M4A "), z.a("f4v "), z.a("kddi"), z.a("M4VP"), z.a("qt  "), z.a("MSNV")};

    public static boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, boolean z11) throws InterruptedException, EOFException {
        boolean z12;
        int i5;
        long j11 = bVar.f29132b;
        if (j11 == -1 || j11 > 4096) {
            j11 = 4096;
        }
        int i11 = (int) j11;
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(64);
        boolean z13 = false;
        int i12 = 0;
        boolean z14 = false;
        while (i12 < i11) {
            nVar.c(8);
            bVar.a(nVar.f30461a, z13 ? 1 : 0, 8, z13);
            long jK = nVar.k();
            int iB = nVar.b();
            if (jK == 1) {
                bVar.a(nVar.f30461a, 8, 8, z13);
                nVar.d(16);
                i5 = 16;
                jK = nVar.n();
            } else {
                i5 = 8;
            }
            long j12 = i5;
            if (jK < j12) {
                return z13;
            }
            i12 += i5;
            if (iB != c.C) {
                if (iB == c.L || iB == c.N) {
                    z12 = true;
                    break;
                }
                long j13 = (i12 + jK) - j12;
                boolean z15 = z13 ? 1 : 0;
                if (j13 >= i11) {
                    break;
                }
                int i13 = (int) (jK - j12);
                i12 += i13;
                z14 = z14;
                if (iB == c.f29463b) {
                    if (i13 < 8) {
                        return z15;
                    }
                    nVar.c(i13);
                    bVar.a(nVar.f30461a, z15 ? 1 : 0, i13, z15);
                    int i14 = i13 / 4;
                    for (int i15 = 0; i15 < i14; i15++) {
                        if (i15 != 1) {
                            int iB2 = nVar.b();
                            if ((iB2 >>> 8) != z.a("3gp")) {
                                for (int i16 : f29620a) {
                                    if (i16 != iB2) {
                                    }
                                }
                            }
                            z14 = true;
                            break;
                        }
                        nVar.e(nVar.f30462b + 4);
                    }
                    z14 = z14;
                    if (!z14) {
                        return false;
                    }
                } else if (i13 != 0) {
                    bVar.a(i13, z15);
                    z14 = z14;
                }
                z13 = false;
            }
        }
        z12 = false;
        return z14 && z11 == z12;
    }
}
