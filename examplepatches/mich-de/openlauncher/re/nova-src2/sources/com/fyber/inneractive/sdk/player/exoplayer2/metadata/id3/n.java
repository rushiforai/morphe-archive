package com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3;

import android.util.Log;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: b, reason: collision with root package name */
    public static final int f30114b = z.a("ID3");

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.l f30115a;

    public n() {
        this.f30115a = null;
    }

    public static int a(int i5) {
        return (i5 == 0 || i5 == 3) ? 1 : 2;
    }

    public static h b(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, int i5, int i11, boolean z11, int i12, com.fyber.inneractive.sdk.player.exoplayer2.extractor.l lVar) throws Throwable {
        int i13 = nVar.f30462b;
        int iB = b(i13, nVar.f30461a);
        String str = new String(nVar.f30461a, i13, iB - i13, "ISO-8859-1");
        nVar.e(iB + 1);
        int iJ = nVar.j();
        boolean z12 = (iJ & 2) != 0;
        boolean z13 = (iJ & 1) != 0;
        int iJ2 = nVar.j();
        String[] strArr = new String[iJ2];
        for (int i14 = 0; i14 < iJ2; i14++) {
            int i15 = nVar.f30462b;
            int iB2 = b(i15, nVar.f30461a);
            strArr[i14] = new String(nVar.f30461a, i15, iB2 - i15, "ISO-8859-1");
            nVar.e(iB2 + 1);
        }
        ArrayList arrayList = new ArrayList();
        int i16 = i13 + i5;
        while (nVar.f30462b < i16) {
            o oVarA = a(i11, nVar, z11, i12, lVar);
            if (oVarA != null) {
                arrayList.add(oVarA);
            }
        }
        o[] oVarArr = new o[arrayList.size()];
        arrayList.toArray(oVarArr);
        return new h(str, z12, z13, strArr, oVarArr);
    }

    public static q c(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        byte[] bArr = new byte[i5];
        nVar.a(bArr, 0, i5);
        int iB = b(0, bArr);
        String str = new String(bArr, 0, iB, "ISO-8859-1");
        int i11 = iB + 1;
        return new q(str, i11 < i5 ? Arrays.copyOfRange(bArr, i11, i5) : new byte[0]);
    }

    public static s d(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        if (i5 < 1) {
            return null;
        }
        int iJ = nVar.j();
        String strB = b(iJ);
        int i11 = i5 - 1;
        byte[] bArr = new byte[i11];
        nVar.a(bArr, 0, i11);
        int iA = a(bArr, 0, iJ);
        String str = new String(bArr, 0, iA, strB);
        int iA2 = a(iJ) + iA;
        return new s("TXXX", str, iA2 < i11 ? new String(bArr, iA2, a(bArr, iA2, iJ) - iA2, strB) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public static u e(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        if (i5 < 1) {
            return null;
        }
        int iJ = nVar.j();
        String strB = b(iJ);
        int i11 = i5 - 1;
        byte[] bArr = new byte[i11];
        nVar.a(bArr, 0, i11);
        int iA = a(bArr, 0, iJ);
        String str = new String(bArr, 0, iA, strB);
        int iA2 = a(iJ) + iA;
        return new u("WXXX", str, iA2 < i11 ? new String(bArr, iA2, b(iA2, bArr) - iA2, "ISO-8859-1") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public static int f(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        byte[] bArr = nVar.f30461a;
        int i11 = nVar.f30462b;
        while (true) {
            int i12 = i11 + 1;
            if (i12 >= i5) {
                return i5;
            }
            if ((bArr[i11] & 255) == 255 && bArr[i12] == 0) {
                System.arraycopy(bArr, i11 + 2, bArr, i12, (i5 - i11) - 2);
                i5--;
            }
            i11 = i12;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a9 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00aa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final com.fyber.inneractive.sdk.player.exoplayer2.metadata.b a(int i5, byte[] bArr) throws Throwable {
        m mVar;
        ArrayList arrayList = new ArrayList();
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(i5, bArr);
        boolean z11 = false;
        if (i5 - nVar.f30462b < 10) {
            Log.w("Id3Decoder", "Data too short to be an ID3 tag");
        } else {
            int iL = nVar.l();
            if (iL == f30114b) {
                int iJ = nVar.j();
                nVar.e(nVar.f30462b + 1);
                int iJ2 = nVar.j();
                int i11 = nVar.i();
                if (iJ == 2) {
                    if ((iJ2 & 64) != 0) {
                        Log.w("Id3Decoder", "Skipped ID3 tag with majorVersion=2 and undefined compression scheme");
                    }
                    mVar = new m(iJ >= 4 && (iJ2 & 128) != 0, iJ, i11);
                } else {
                    if (iJ == 3) {
                        if ((iJ2 & 64) != 0) {
                            int iB = nVar.b();
                            nVar.e(nVar.f30462b + iB);
                            i11 -= iB + 4;
                        }
                    } else if (iJ == 4) {
                        if ((iJ2 & 64) != 0) {
                            int i12 = nVar.i();
                            nVar.e(nVar.f30462b + (i12 - 4));
                            i11 -= i12;
                        }
                        if ((iJ2 & 16) != 0) {
                            i11 -= 10;
                        }
                    } else {
                        Log.w("Id3Decoder", "Skipped ID3 tag with unsupported majorVersion=" + iJ);
                    }
                    if (iJ >= 4) {
                        mVar = new m(iJ >= 4 && (iJ2 & 128) != 0, iJ, i11);
                    }
                }
                if (mVar != null) {
                    return null;
                }
                int i13 = nVar.f30462b;
                int i14 = mVar.f30111a == 2 ? 6 : 10;
                int iF = mVar.f30113c;
                if (mVar.f30112b) {
                    iF = f(iF, nVar);
                }
                nVar.d(i13 + iF);
                if (!a(nVar, mVar.f30111a, i14, false)) {
                    if (mVar.f30111a != 4 || !a(nVar, 4, i14, true)) {
                        Log.w("Id3Decoder", "Failed to validate ID3 tag with majorVersion=" + mVar.f30111a);
                        return null;
                    }
                    z11 = true;
                }
                while (nVar.f30463c - nVar.f30462b >= i14) {
                    o oVarA = a(mVar.f30111a, nVar, z11, i14, this.f30115a);
                    if (oVarA != null) {
                        arrayList.add(oVarA);
                    }
                }
                return new com.fyber.inneractive.sdk.player.exoplayer2.metadata.b(arrayList);
            }
            Log.w("Id3Decoder", "Unexpected first three bytes of ID3 tag header: " + iL);
        }
        mVar = null;
        if (mVar != null) {
        }
    }

    public n(com.fyber.inneractive.sdk.player.exoplayer2.extractor.l lVar) {
        this.f30115a = lVar;
    }

    public static u b(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, String str) {
        byte[] bArr = new byte[i5];
        nVar.a(bArr, 0, i5);
        return new u(str, null, new String(bArr, 0, b(0, bArr), "ISO-8859-1"));
    }

    public static l b(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int iJ = nVar.j();
        String strB = b(iJ);
        int i11 = i5 - 1;
        byte[] bArr = new byte[i11];
        nVar.a(bArr, 0, i11);
        int iB = b(0, bArr);
        String str = new String(bArr, 0, iB, "ISO-8859-1");
        int i12 = iB + 1;
        int iA = a(bArr, i12, iJ);
        String str2 = new String(bArr, i12, iA - i12, strB);
        int iA2 = a(iJ) + iA;
        int iA3 = a(bArr, iA2, iJ);
        return new l(str, str2, new String(bArr, iA2, iA3 - iA2, strB), Arrays.copyOfRange(bArr, a(iJ) + iA3, i11));
    }

    public static f a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, int i5, int i11, boolean z11, int i12, com.fyber.inneractive.sdk.player.exoplayer2.extractor.l lVar) throws Throwable {
        int i13 = nVar.f30462b;
        int iB = b(i13, nVar.f30461a);
        String str = new String(nVar.f30461a, i13, iB - i13, "ISO-8859-1");
        nVar.e(iB + 1);
        int iB2 = nVar.b();
        int iB3 = nVar.b();
        long jK = nVar.k();
        if (jK == 4294967295L) {
            jK = -1;
        }
        long jK2 = nVar.k();
        long j11 = jK2 == 4294967295L ? -1L : jK2;
        ArrayList arrayList = new ArrayList();
        int i14 = i13 + i5;
        while (nVar.f30462b < i14) {
            o oVarA = a(i11, nVar, z11, i12, lVar);
            if (oVarA != null) {
                arrayList.add(oVarA);
            }
        }
        o[] oVarArr = new o[arrayList.size()];
        arrayList.toArray(oVarArr);
        return new f(str, iB2, iB3, jK, j11, oVarArr);
    }

    public static String b(int i5) {
        if (i5 == 1) {
            return "UTF-16";
        }
        if (i5 == 2) {
            return "UTF-16BE";
        }
        if (i5 != 3) {
            return "ISO-8859-1";
        }
        return "UTF-8";
    }

    public static int b(int i5, byte[] bArr) {
        while (i5 < bArr.length) {
            if (bArr[i5] == 0) {
                return i5;
            }
            i5++;
        }
        return bArr.length;
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0089 A[PHI: r3
      0x0089: PHI (r3v17 int) = (r3v6 int), (r3v20 int) binds: [B:41:0x0086, B:33:0x0078] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, int i5, int i11, boolean z11) {
        int iL;
        long jL;
        int iO;
        int i12;
        int i13 = nVar.f30462b;
        while (true) {
            try {
                boolean z12 = true;
                if (nVar.f30463c - nVar.f30462b < i11) {
                    nVar.e(i13);
                    return true;
                }
                if (i5 >= 3) {
                    iL = nVar.b();
                    jL = nVar.k();
                    iO = nVar.o();
                } else {
                    iL = nVar.l();
                    jL = nVar.l();
                    iO = 0;
                }
                if (iL == 0 && jL == 0 && iO == 0) {
                    nVar.e(i13);
                    return true;
                }
                if (i5 == 4 && !z11) {
                    if ((8421504 & jL) != 0) {
                        nVar.e(i13);
                        return false;
                    }
                    jL = (((jL >> 24) & 255) << 21) | (jL & 255) | (((jL >> 8) & 255) << 7) | (((jL >> 16) & 255) << 14);
                }
                if (i5 == 4) {
                    i12 = (iO & 64) != 0 ? 1 : 0;
                    if ((iO & 1) == 0) {
                        z12 = false;
                    }
                } else if (i5 == 3) {
                    i12 = (iO & 32) != 0 ? 1 : 0;
                    if ((iO & 128) == 0) {
                    }
                } else {
                    i12 = 0;
                    z12 = false;
                }
                if (z12) {
                    i12 += 4;
                }
                if (jL < i12) {
                    nVar.e(i13);
                    return false;
                }
                int i14 = nVar.f30463c;
                int i15 = nVar.f30462b;
                if (i14 - i15 < jL) {
                    nVar.e(i13);
                    return false;
                }
                nVar.e(i15 + ((int) jL));
            } catch (Throwable th2) {
                nVar.e(i13);
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:155:0x01cb  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x01e6 A[Catch: all -> 0x012a, UnsupportedEncodingException -> 0x021b, TryCatch #2 {UnsupportedEncodingException -> 0x021b, blocks: (B:93:0x0125, B:165:0x01fc, B:97:0x012f, B:105:0x0147, B:107:0x014e, B:115:0x0167, B:124:0x017c, B:135:0x0194, B:142:0x01a5, B:162:0x01e1, B:163:0x01e6), top: B:176:0x011b }] */
    /* JADX WARN: Removed duplicated region for block: B:165:0x01fc A[Catch: all -> 0x012a, UnsupportedEncodingException -> 0x021b, TRY_LEAVE, TryCatch #2 {UnsupportedEncodingException -> 0x021b, blocks: (B:93:0x0125, B:165:0x01fc, B:97:0x012f, B:105:0x0147, B:107:0x014e, B:115:0x0167, B:124:0x017c, B:135:0x0194, B:142:0x01a5, B:162:0x01e1, B:163:0x01e6), top: B:176:0x011b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static o a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, boolean z11, int i11, com.fyber.inneractive.sdk.player.exoplayer2.extractor.l lVar) throws Throwable {
        int iL;
        boolean z12;
        boolean z13;
        boolean z14;
        boolean z15;
        boolean z16;
        int i12;
        o dVar;
        o oVarA;
        int i13 = i5;
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = nVar;
        int iJ = nVar2.j();
        int iJ2 = nVar2.j();
        int iJ3 = nVar2.j();
        int iJ4 = i13 >= 3 ? nVar2.j() : 0;
        if (i13 == 4) {
            iL = nVar2.m();
            if (!z11) {
                iL = (((iL >> 24) & 255) << 21) | (iL & 255) | (((iL >> 8) & 255) << 7) | (((iL >> 16) & 255) << 14);
            }
        } else if (i13 == 3) {
            iL = nVar2.m();
        } else {
            iL = nVar2.l();
        }
        int iO = i13 >= 3 ? nVar2.o() : 0;
        if (iJ == 0 && iJ2 == 0 && iJ3 == 0 && iJ4 == 0 && iL == 0 && iO == 0) {
            nVar2.e(nVar2.f30463c);
            return null;
        }
        int i14 = nVar2.f30462b;
        int i15 = i14 + iL;
        if (i15 > nVar2.f30463c) {
            Log.w("Id3Decoder", "Frame size exceeds remaining tag data");
            nVar2.e(nVar2.f30463c);
            return null;
        }
        if (lVar != null && (iJ != 67 || iJ2 != 79 || iJ3 != 77 || (iJ4 != 77 && i13 != 2))) {
            nVar2.e(i15);
            return null;
        }
        if (i13 == 3) {
            z13 = (iO & 128) != 0;
            boolean z17 = (iO & 64) != 0;
            z12 = (iO & 32) != 0;
            z15 = z17;
            z16 = false;
            z14 = z13;
        } else if (i13 == 4) {
            boolean z18 = (iO & 64) != 0;
            boolean z19 = (iO & 8) != 0;
            z15 = (iO & 4) != 0;
            z16 = (iO & 2) != 0;
            if ((iO & 1) != 0) {
                z12 = z18;
                z13 = z19;
                z14 = true;
            } else {
                z12 = z18;
                z13 = z19;
                z14 = false;
            }
        } else {
            z12 = false;
            z13 = false;
            z14 = false;
            z15 = false;
            z16 = false;
        }
        if (!z13 && !z15) {
            if (z12) {
                iL--;
                nVar2.e(i14 + 1);
            }
            if (z14) {
                iL -= 4;
                nVar2.e(nVar2.f30462b + 4);
            }
            if (z16) {
                iL = f(iL, nVar2);
            }
            try {
                try {
                    if (iJ == 84 && iJ2 == 88 && iJ3 == 88 && (i13 == 2 || iJ4 == 88)) {
                        oVarA = d(iL, nVar2);
                    } else if (iJ == 84) {
                        oVarA = a(iL, nVar2, a(i13, iJ, iJ2, iJ3, iJ4));
                    } else if (iJ == 87 && iJ2 == 88 && iJ3 == 88 && (i13 == 2 || iJ4 == 88)) {
                        oVarA = e(iL, nVar2);
                    } else if (iJ == 87) {
                        oVarA = b(iL, nVar2, a(i13, iJ, iJ2, iJ3, iJ4));
                    } else if (iJ == 80 && iJ2 == 82 && iJ3 == 73 && iJ4 == 86) {
                        oVarA = c(iL, nVar2);
                    } else if (iJ == 71 && iJ2 == 69 && iJ3 == 79 && (iJ4 == 66 || i13 == 2)) {
                        oVarA = b(iL, nVar2);
                    } else {
                        if (i13 == 2) {
                            if (iJ == 80 && iJ2 == 73 && iJ3 == 67) {
                                oVarA = a(nVar2, iL, i13);
                            }
                            if (iJ != 67 && iJ2 == 79 && iJ3 == 77 && (iJ4 == 77 || i13 == 2)) {
                                oVarA = a(iL, nVar2);
                            } else if (iJ != 67 && iJ2 == 72 && iJ3 == 65 && iJ4 == 80) {
                                i12 = iL;
                                try {
                                    dVar = a(nVar2, i12, i13, z11, i11, lVar);
                                    i13 = i5;
                                    nVar2 = nVar;
                                } catch (UnsupportedEncodingException unused) {
                                    nVar2 = nVar;
                                    Log.w("Id3Decoder", "Unsupported character encoding");
                                    nVar2.e(i15);
                                    return null;
                                } catch (Throwable th2) {
                                    th = th2;
                                    nVar2 = nVar;
                                    nVar2.e(i15);
                                    throw th;
                                }
                            } else {
                                i12 = iL;
                                if (iJ != 67 && iJ2 == 84 && iJ3 == 79 && iJ4 == 67) {
                                    i13 = i5;
                                    nVar2 = nVar;
                                    dVar = b(nVar2, i12, i13, z11, i11, lVar);
                                } else {
                                    i13 = i5;
                                    nVar2 = nVar;
                                    String strA = a(i13, iJ, iJ2, iJ3, iJ4);
                                    byte[] bArr = new byte[i12];
                                    nVar2.a(bArr, 0, i12);
                                    dVar = new d(strA, bArr);
                                }
                            }
                        } else if (iJ == 65 && iJ2 == 80 && iJ3 == 73 && iJ4 == 67) {
                            oVarA = a(nVar2, iL, i13);
                        } else {
                            if (iJ != 67) {
                            }
                            if (iJ != 67) {
                                i12 = iL;
                                if (iJ != 67) {
                                    i13 = i5;
                                    nVar2 = nVar;
                                    String strA2 = a(i13, iJ, iJ2, iJ3, iJ4);
                                    byte[] bArr2 = new byte[i12];
                                    nVar2.a(bArr2, 0, i12);
                                    dVar = new d(strA2, bArr2);
                                }
                            }
                        }
                        if (dVar == null) {
                            Log.w("Id3Decoder", "Failed to decode frame: id=" + a(i13, iJ, iJ2, iJ3, iJ4) + ", frameSize=" + i12);
                        }
                        nVar2.e(i15);
                        return dVar;
                    }
                    dVar = oVarA;
                    i12 = iL;
                    if (dVar == null) {
                    }
                    nVar2.e(i15);
                    return dVar;
                } catch (UnsupportedEncodingException unused2) {
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } else {
            Log.w("Id3Decoder", "Skipping unsupported compressed or encrypted frame");
            nVar2.e(i15);
            return null;
        }
    }

    public static s a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, String str) {
        if (i5 < 1) {
            return null;
        }
        int iJ = nVar.j();
        String strB = b(iJ);
        int i11 = i5 - 1;
        byte[] bArr = new byte[i11];
        nVar.a(bArr, 0, i11);
        return new s(str, null, new String(bArr, 0, a(bArr, 0, iJ), strB));
    }

    public static b a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, int i5, int i11) {
        int iB;
        String lowerCase;
        int iJ = nVar.j();
        String strB = b(iJ);
        int i12 = i5 - 1;
        byte[] bArr = new byte[i12];
        nVar.a(bArr, 0, i12);
        if (i11 == 2) {
            lowerCase = "image/" + new String(bArr, 0, 3, "ISO-8859-1").toLowerCase(Locale.US);
            if (lowerCase.equals("image/jpg")) {
                lowerCase = "image/jpeg";
            }
            iB = 2;
        } else {
            iB = b(0, bArr);
            lowerCase = new String(bArr, 0, iB, "ISO-8859-1").toLowerCase(Locale.US);
            if (lowerCase.indexOf(47) == -1) {
                lowerCase = "image/".concat(lowerCase);
            }
        }
        int i13 = bArr[iB + 1] & 255;
        int i14 = iB + 2;
        int iA = a(bArr, i14, iJ);
        return new b(lowerCase, new String(bArr, i14, iA - i14, strB), i13, Arrays.copyOfRange(bArr, a(iJ) + iA, i12));
    }

    public static j a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        String str;
        if (i5 < 4) {
            return null;
        }
        int iJ = nVar.j();
        String strB = b(iJ);
        byte[] bArr = new byte[3];
        nVar.a(bArr, 0, 3);
        String str2 = new String(bArr, 0, 3);
        int i11 = i5 - 4;
        byte[] bArr2 = new byte[i11];
        nVar.a(bArr2, 0, i11);
        int iA = a(bArr2, 0, iJ);
        String str3 = new String(bArr2, 0, iA, strB);
        int iA2 = a(iJ) + iA;
        if (iA2 < i11) {
            str = new String(bArr2, iA2, a(bArr2, iA2, iJ) - iA2, strB);
        } else {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return new j(str2, str3, str);
    }

    public static String a(int i5, int i11, int i12, int i13, int i14) {
        if (i5 == 2) {
            return String.format(Locale.US, "%c%c%c", Integer.valueOf(i11), Integer.valueOf(i12), Integer.valueOf(i13));
        }
        return String.format(Locale.US, "%c%c%c%c", Integer.valueOf(i11), Integer.valueOf(i12), Integer.valueOf(i13), Integer.valueOf(i14));
    }

    public static int a(byte[] bArr, int i5, int i11) {
        int iB = b(i5, bArr);
        if (i11 == 0 || i11 == 3) {
            return iB;
        }
        while (iB < bArr.length - 1) {
            if (iB % 2 == 0 && bArr[iB + 1] == 0) {
                return iB;
            }
            iB = b(iB + 1, bArr);
        }
        return bArr.length;
    }
}
