package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.4B, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4B extends C8j {
    public static byte[] A0H;
    public static String[] A0I = {"ytgtQf0A3GxvRwRaFRi9yCxHj8", "EpeU1U9Laobaxc7aJ25Fd92PabAJtcL", "msyjK3DKiUJ5ISHOy1TiuFE", "AvFd6pVSC", "bPSjgDzbqbbGLdyPvR", "aG34NznxVE", "9eAEyh167wCJ5dZD2wzfFvpqSAeGnNwX", "1xnDDanEqsTw5quyQRBAb3xT4Pg5jsn7"};
    public C8l A00;
    public float A01;
    public int A02;
    public int A03;
    public long A04;
    public final float A05;
    public final int A06;
    public final int A07;
    public final long A08;
    public final long A09;
    public final long A0A;
    public final AbstractC07549l<WG> A0B;
    public final float A0C;
    public final int A0D;
    public final long A0E;
    public final InterfaceC1069Lu A0F;
    public final InterfaceC1333Ws A0G;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public C4B(@MetaExoPlayerCustomization("Used for OculusAdaptiveTrackSelection") U8 u82, @MetaExoPlayerCustomization("Used to retain old value for Oculus") int[] iArr, int i5, InterfaceC1333Ws interfaceC1333Ws, int i11, long j11, long j12, long j13, int i12, int i13, float f11, float f12, long j14, List<WG> list, InterfaceC1069Lu interfaceC1069Lu) {
        super(u82, iArr, i5);
        if (j13 < j11) {
            MV.A07(A03(0, 22, 24), A03(22, 90, 67));
            j13 = j11;
        }
        this.A0G = interfaceC1333Ws;
        this.A0D = i11;
        this.A08 = j11 * 1000;
        this.A0E = j12 * 1000;
        this.A09 = 1000 * j13;
        this.A07 = i12;
        this.A06 = i13;
        this.A0C = f11;
        this.A05 = f12;
        this.A0B = AbstractC07549l.A05(list);
        this.A0A = j14;
        this.A0F = interfaceC1069Lu;
        this.A01 = 1.0f;
        this.A02 = 0;
        this.A04 = -9223372036854775807L;
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0H, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 10);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0H = new byte[]{99, -122, -125, -110, -106, -117, -104, -121, 118, -108, -125, -123, -115, 117, -121, -114, -121, -123, -106, -117, -111, -112, -114, -79, -73, -62, -64, -63, -74, -69, -76, 109, -70, -74, -69, -111, -62, -65, -82, -63, -74, -68, -69, -95, -68, -97, -78, -63, -82, -74, -69, -114, -77, -63, -78, -65, -111, -74, -64, -80, -82, -65, -79, -102, -64, 109, -63, -68, 109, -81, -78, 109, -82, -63, 109, -71, -78, -82, -64, -63, 109, -70, -74, -69, -111, -62, -65, -82, -63, -74, -68, -69, -109, -68, -65, -98, -62, -82, -71, -74, -63, -58, -106, -69, -80, -65, -78, -82, -64, -78, -102, -64};
    }

    static {
        A04();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<com.facebook.ads.androidx.media3.exoplayer.trackselection.AdaptiveTrackSelection$AdaptationCheckpoint> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.exoplayer.trackselection.AdaptiveTrackSelection$AdaptationCheckpoint>> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<java.lang.Integer> */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0027  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static AbstractC07549l<AbstractC07549l<WG>> A00(WX[] wxArr) {
        long j11;
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < wxArr.length; i5++) {
            if (wxArr[i5] != null) {
                int[] iArr = wxArr[i5].A02;
                int i11 = A0I[4].length();
                if (i11 != 18) {
                    throw new RuntimeException();
                }
                A0I[0] = "4huwIUJP4lrxKzZJ5TGktFgrGb";
                if (iArr.length <= 1) {
                    arrayList.add(null);
                } else {
                    C06344e c06344eA01 = AbstractC07549l.A01();
                    c06344eA01.A04(new WG(0L, 0L));
                    arrayList.add(c06344eA01);
                }
            }
        }
        long[][] jArrA06 = A06(wxArr);
        int[] iArr2 = new int[jArrA06.length];
        long[] currentTrackBitrates = new long[jArrA06.length];
        for (int i12 = 0; i12 < jArrA06.length; i12++) {
            if (jArrA06[i12].length == 0) {
                j11 = 0;
            } else {
                long[] jArr = jArrA06[i12];
                if (A0I[2].length() != 23) {
                    A0I[4] = "rUmOvSr2aPQBU8EFJW";
                    j11 = jArr[0];
                } else {
                    A0I[4] = "1vbEShVqHTQPkCj4fW";
                    j11 = jArr[0];
                }
            }
            currentTrackBitrates[i12] = j11;
        }
        A05(arrayList, currentTrackBitrates);
        AbstractC07549l<Integer> abstractC07549lA02 = A02(jArrA06);
        for (int i13 = 0; i13 < abstractC07549lA02.size(); i13++) {
            int iIntValue = abstractC07549lA02.get(i13).intValue();
            int i14 = iArr2[iIntValue] + 1;
            iArr2[iIntValue] = i14;
            currentTrackBitrates[iIntValue] = jArrA06[iIntValue][i14];
            A05(arrayList, currentTrackBitrates);
        }
        int i15 = 0;
        while (true) {
            int length = wxArr.length;
            if (A0I[6].charAt(10) != 'C') {
                throw new RuntimeException();
            }
            A0I[1] = "oixM1R0C3";
            if (i15 < length) {
                if (arrayList.get(i15) != null) {
                    currentTrackBitrates[i15] = currentTrackBitrates[i15] * 2;
                }
                i15++;
            } else {
                A05(arrayList, currentTrackBitrates);
                C06344e c06344eA012 = AbstractC07549l.A01();
                for (int i16 = 0; i16 < arrayList.size(); i16++) {
                    C06344e c06344e = (C06344e) arrayList.get(i16);
                    c06344eA012.A04(c06344e == null ? AbstractC07549l.A03() : c06344e.A05());
                }
                return c06344eA012.A05();
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0096, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vi != com.google.common.collect.Multimap<java.lang.Double, java.lang.Integer> */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static AbstractC07549l<Integer> A02(long[][] jArr) {
        char c11;
        double d5;
        int i5;
        double d11;
        InterfaceC1299Vi interfaceC1299ViA00 = AbstractC1297Vg.A02().A03().A00();
        loop0: for (int i11 = 0; i11 < jArr.length; i11++) {
            if (jArr[i11].length > 1) {
                double[] logBitrates = new double[jArr[i11].length];
                int i12 = 0;
                while (true) {
                    int length = jArr[i11].length;
                    double dLog = 0.0d;
                    if (A0I[5].length() == 3) {
                        break loop0;
                    }
                    A0I[1] = "LzU0YrooF";
                    if (i12 < length) {
                        if (jArr[i11][i12] != -1) {
                            dLog = Math.log(jArr[i11][i12]);
                        }
                        logBitrates[i12] = dLog;
                        i12++;
                    } else {
                        double d12 = logBitrates[logBitrates.length - 1];
                        if (A0I[7].charAt(25) != 'P') {
                            A0I[0] = "2oimUMuqCSkCv1HAu5giUoyTbh";
                            c11 = 0;
                            d5 = d12 - logBitrates[0];
                            i5 = 0;
                        } else {
                            A0I[1] = "MxfcU8";
                            c11 = 0;
                            d5 = d12 - logBitrates[0];
                            i5 = 0;
                        }
                        for (int i13 = 1; i5 < logBitrates.length - i13; i13 = 1) {
                            double d13 = (logBitrates[i5] + logBitrates[i5 + 1]) * 0.5d;
                            if (d5 == 0.0d) {
                                d11 = 1.0d;
                            } else {
                                double d14 = d13 - logBitrates[c11];
                                if (A0I[6].charAt(10) == 'C') {
                                    A0I[0] = "Orly8lcw1wyPG2oOgZ6VA5o5Gb";
                                    d11 = d14 / d5;
                                }
                            }
                            interfaceC1299ViA00.AIR(Double.valueOf(d11), Integer.valueOf(i11));
                            i5++;
                        }
                    }
                }
            }
        }
        return AbstractC07549l.A05(interfaceC1299ViA00.values());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<com.facebook.ads.androidx.media3.exoplayer.trackselection.AdaptiveTrackSelection$AdaptationCheckpoint> */
    public static void A05(List<C06344e<WG>> list, long[] jArr) {
        long j11 = 0;
        int i5 = 0;
        while (true) {
            int length = jArr.length;
            if (A0I[1].length() == 8) {
                throw new RuntimeException();
            }
            A0I[2] = "RgHk1yngzUfgMkKEBMQXOUl";
            if (i5 < length) {
                long totalBitrate = jArr[i5];
                j11 += totalBitrate;
                i5++;
            } else {
                for (int i11 = 0; i11 < list.size(); i11++) {
                    C06344e<WG> c06344e = list.get(i11);
                    if (A0I[1].length() == 8) {
                        throw new RuntimeException();
                    }
                    A0I[5] = "YJeCE6NHECK9IKWROc6C9mzK";
                    if (c06344e != null) {
                        c06344e.A04(new WG(j11, jArr[i11]));
                    }
                }
                return;
            }
        }
    }

    public static long[][] A06(WX[] wxArr) {
        long[][] jArr = new long[wxArr.length][];
        for (int i5 = 0; i5 < wxArr.length; i5++) {
            WX wx2 = wxArr[i5];
            if (wx2 == null) {
                jArr[i5] = new long[0];
            } else {
                jArr[i5] = new long[wx2.A02.length];
                for (int i11 = 0; i11 < wx2.A02.length; i11++) {
                    U8 u82 = wx2.A01;
                    int j11 = wx2.A02[i11];
                    int i12 = A0I[7].charAt(25);
                    if (i12 != 80) {
                        throw new RuntimeException();
                    }
                    A0I[7] = "VbEp8zA6NMgTAUJUczvF6PnIEPWnCVjU";
                    long bitrate = u82.A08(j11).A05;
                    long[] jArr2 = jArr[i5];
                    if (bitrate == -1) {
                        bitrate = 0;
                    }
                    jArr2[i11] = bitrate;
                }
                Arrays.sort(jArr[i5]);
            }
        }
        return jArr;
    }

    @Override // com.facebook.ads.redexgen.X.C8j, com.facebook.ads.redexgen.X.RA
    public final void A6W() {
        this.A00 = null;
    }

    @Override // com.facebook.ads.redexgen.X.C8j, com.facebook.ads.redexgen.X.RA
    public final void A6t() {
        this.A04 = -9223372036854775807L;
        this.A00 = null;
    }

    @Override // com.facebook.ads.redexgen.X.RA
    public final int A9g() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.C8j, com.facebook.ads.redexgen.X.RA
    public final void AGO(float f11) {
        this.A01 = f11;
    }
}
