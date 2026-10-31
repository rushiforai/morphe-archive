package com.facebook.ads.androidx.media3.extractor.mkv;

import android.net.Uri;
import android.util.SparseArray;
import androidx.recyclerview.widget.n0;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.ads.androidx.media3.extractor.mkv.MatroskaExtractor;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.C1084Mk;
import com.facebook.ads.redexgen.X.C1449aa;
import com.facebook.ads.redexgen.X.C1450ab;
import com.facebook.ads.redexgen.X.C1451ac;
import com.facebook.ads.redexgen.X.InterfaceC1383Yv;
import com.facebook.ads.redexgen.X.InterfaceC1384Yw;
import com.facebook.ads.redexgen.X.InterfaceC1387Yz;
import com.facebook.ads.redexgen.X.InterfaceC1446aX;
import com.facebook.ads.redexgen.X.KN;
import com.facebook.ads.redexgen.X.L9;
import com.facebook.ads.redexgen.X.MV;
import com.facebook.ads.redexgen.X.MW;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.ads.redexgen.X.PN;
import com.facebook.ads.redexgen.X.PT;
import com.facebook.ads.redexgen.X.Q4;
import com.facebook.ads.redexgen.X.Q9;
import com.facebook.ads.redexgen.X.QJ;
import com.facebook.ads.redexgen.X.ZE;
import com.facebook.ads.redexgen.X.ZH;
import com.facebook.ads.redexgen.X.ZK;
import com.facebook.ads.redexgen.X.ZN;
import com.facebook.ads.redexgen.X.ZP;
import com.facebook.ads.redexgen.X.ZQ;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class MatroskaExtractor implements InterfaceC1383Yv {
    public static byte[] A0t;
    public static String[] A0u = {"n35jlXKYxSLPKei", "oyBUc05xsKSY0xx573VvoQYblK33aBWA", "RuE8YUOCzFB4NWBvGl8SjTsvK65B9fo9", "f1onTyczxw2VkpzWPBb6LgtZuATzfb1L", "cKc0NjS1OsMDdgfudGbTQKLf4ZclKflP", "fkOAvMHAcgxE84ft7z", "7fYF0qaATcv5oeud3szBnpxgbYKS353G", "FWXPtRSYshxgTl8OaXh6o9l9SG9OkQHb"};
    public static final InterfaceC1387Yz A0v;
    public static final Map<String, Integer> A0w;
    public static final UUID A0x;
    public static final byte[] A0y;
    public static final byte[] A0z;
    public static final byte[] A10;
    public static final byte[] A11;
    public byte A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;
    public int A0C;
    public long A0D;
    public long A0E;
    public long A0F;
    public long A0G;
    public long A0H;
    public long A0I;
    public long A0J;
    public long A0K;
    public long A0L;
    public long A0M;
    public long A0N;
    public long A0O;

    @MetaExoPlayerCustomization
    public SparseArray<C1449aa> A0P;
    public MW A0Q;
    public MW A0R;
    public InterfaceC1384Yw A0S;
    public C1449aa A0T;

    @MetaExoPlayerCustomization
    public String A0U;
    public ByteBuffer A0V;
    public boolean A0W;
    public boolean A0X;
    public boolean A0Y;
    public boolean A0Z;
    public boolean A0a;
    public boolean A0b;
    public boolean A0c;
    public boolean A0d;
    public boolean A0e;
    public int[] A0f;
    public final C1084Mk A0g;
    public final C1084Mk A0h;
    public final C1084Mk A0i;
    public final C1084Mk A0j;
    public final C1084Mk A0k;
    public final C1084Mk A0l;
    public final C1084Mk A0m;
    public final C1084Mk A0n;
    public final C1084Mk A0o;
    public final C1084Mk A0p;
    public final InterfaceC1446aX A0q;
    public final C1451ac A0r;
    public final boolean A0s;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:107:0x039e  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x03b2  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x03db  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x03e3  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x02c2  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x036f  */
    @RequiresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A02(Q9 q92, C1449aa c1449aa, int i5, boolean z11) throws IOException {
        int iA0A;
        String[] strArr;
        boolean z12;
        if (A06(TTAdConstant.IMAGE_MODE_1012, 11, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE).equals(c1449aa.A0d)) {
            A0F(q92, A10, i5);
            return A00();
        }
        if (A06(1002, 10, 60).equals(c1449aa.A0d)) {
            A0F(q92, A0z, i5);
            return A00();
        }
        if (A06(1023, 13, 84).equals(c1449aa.A0d)) {
            A0F(q92, A11, i5);
            return A00();
        }
        ZP zp2 = c1449aa.A0b;
        if (this.A0Y) {
            iA0A = i5 + this.A0k.A0A();
            if (A06(1207, 15, 59).equals(c1449aa.A0d)) {
            }
            byte[] bArrA0l = this.A0i.A0l();
            bArrA0l[0] = 0;
            bArrA0l[1] = 0;
            bArrA0l[2] = 0;
            int i11 = c1449aa.A0Q;
            int i12 = 4 - c1449aa.A0Q;
            while (this.A08 < iA0A) {
            }
            if (A06(271, 8, 104).equals(c1449aa.A0d)) {
            }
            int iA00 = A00();
            strArr = A0u;
            if (strArr[1].charAt(8) == strArr[7].charAt(8)) {
            }
        } else {
            boolean z13 = c1449aa.A0i;
            if (A0u[5].length() != 10) {
                String[] strArr2 = A0u;
                strArr2[3] = "Md233xnds9SsjLRSnzb8dYoz2XFvkD7x";
                strArr2[4] = "l0u7I37pD9jMSYMWZ7bYnetfXLnKncbB";
                if (z13) {
                    this.A02 &= -1073741825;
                    if (!this.A0b) {
                        q92.readFully(this.A0l.A0l(), 0, 1);
                        this.A08++;
                        if ((this.A0l.A0l()[0] & 128) == 128) {
                            throw L9.A01(A06(694, 35, 24), null);
                        }
                        this.A00 = this.A0l.A0l()[0];
                        this.A0b = true;
                    }
                    if ((this.A00 & 1) == 1) {
                        boolean z14 = (this.A00 & 2) == 2;
                        this.A02 |= 1073741824;
                        if (!this.A0Z) {
                            q92.readFully(this.A0g.A0l(), 0, 8);
                            this.A08 += 8;
                            this.A0Z = true;
                            this.A0l.A0l()[0] = (byte) ((z14 ? 128 : 0) | 8);
                            this.A0l.A0f(0);
                            zp2.AKA(this.A0l, 1, 1);
                            this.A09++;
                            this.A0g.A0f(0);
                            zp2.AKA(this.A0g, 8, 1);
                            this.A09 += 8;
                        }
                        if (z14) {
                            if (!this.A0a) {
                                q92.readFully(this.A0l.A0l(), 0, 1);
                                int i13 = this.A08 + 1;
                                String[] strArr3 = A0u;
                                if (strArr3[1].charAt(8) != strArr3[7].charAt(8)) {
                                    A0u[0] = "pctvtwuXbDVkkLBO0B6alMxo3etxl934";
                                    this.A08 = i13;
                                    this.A0l.A0f(0);
                                    this.A0B = this.A0l.A0I();
                                    this.A0a = true;
                                } else {
                                    String[] strArr4 = A0u;
                                    strArr4[1] = "HOXTaCvKsyrRiVB9OfTZ7iSFqGIdWtr9";
                                    strArr4[7] = "WgYAX1cBszbPmmTXCVwVDtx67Y6xBuES";
                                    this.A08 = i13;
                                    this.A0l.A0f(0);
                                    this.A0B = this.A0l.A0I();
                                    this.A0a = true;
                                }
                            }
                            int i14 = this.A0B * 4;
                            this.A0l.A0d(i14);
                            q92.readFully(this.A0l.A0l(), 0, i14);
                            this.A08 += i14;
                            short s11 = (short) ((this.A0B / 2) + 1);
                            int i15 = (s11 * 6) + 2;
                            if (this.A0V == null || this.A0V.capacity() < i15) {
                                this.A0V = ByteBuffer.allocate(i15);
                            }
                            this.A0V.position(0);
                            this.A0V.putShort(s11);
                            int iA0L = 0;
                            for (int i16 = 0; i16 < this.A0B; i16++) {
                                int i17 = iA0L;
                                iA0L = this.A0l.A0L();
                                if (i16 % 2 == 0) {
                                    this.A0V.putShort((short) (iA0L - i17));
                                } else {
                                    this.A0V.putInt(iA0L - i17);
                                }
                            }
                            int i18 = (i5 - this.A08) - iA0L;
                            if (this.A0B % 2 == 1) {
                                this.A0V.putInt(i18);
                            } else {
                                this.A0V.putShort((short) i18);
                                this.A0V.putInt(0);
                            }
                            this.A0h.A0j(this.A0V.array(), i15);
                            zp2.AKA(this.A0h, i15, 1);
                            this.A09 += i15;
                        }
                    }
                } else if (c1449aa.A0m != null) {
                    this.A0k.A0j(c1449aa.A0m, c1449aa.A0m.length);
                }
                if (c1449aa.A0B(z11)) {
                    this.A02 |= 268435456;
                    this.A0o.A0d(0);
                    int iA0A2 = (this.A0k.A0A() + i5) - this.A08;
                    this.A0l.A0d(4);
                    this.A0l.A0l()[0] = (byte) ((iA0A2 >> 24) & 255);
                    this.A0l.A0l()[1] = (byte) ((iA0A2 >> 16) & 255);
                    this.A0l.A0l()[2] = (byte) ((iA0A2 >> 8) & 255);
                    this.A0l.A0l()[3] = (byte) (iA0A2 & 255);
                    zp2.AKA(this.A0l, 4, 2);
                    this.A09 += 4;
                }
                this.A0Y = true;
                iA0A = i5 + this.A0k.A0A();
                if (!A06(1207, 15, 59).equals(c1449aa.A0d) || A06(1236, 16, 50).equals(c1449aa.A0d)) {
                    byte[] bArrA0l2 = this.A0i.A0l();
                    bArrA0l2[0] = 0;
                    bArrA0l2[1] = 0;
                    bArrA0l2[2] = 0;
                    int i112 = c1449aa.A0Q;
                    int i122 = 4 - c1449aa.A0Q;
                    while (this.A08 < iA0A) {
                        int i19 = this.A0A;
                        if (A0u[5].length() != 10) {
                            A0u[0] = "n3kv0q3aNrIG2";
                            if (i19 == 0) {
                                A0G(q92, bArrA0l2, i122, i112);
                                this.A08 += i112;
                                this.A0i.A0f(0);
                                this.A0A = this.A0i.A0L();
                                this.A0j.A0f(0);
                                zp2.AK9(this.A0j, 4);
                                this.A09 += 4;
                            } else {
                                int iA01 = A01(q92, zp2, this.A0A);
                                this.A08 += iA01;
                                this.A09 += iA01;
                                this.A0A -= iA01;
                            }
                        }
                    }
                } else {
                    ZQ zq = c1449aa.A0c;
                    String[] strArr5 = A0u;
                    if (strArr5[3].charAt(18) != strArr5[4].charAt(18)) {
                        throw new RuntimeException();
                    }
                    String[] strArr6 = A0u;
                    strArr6[3] = "Vaj3MhcRxQEkNZ99FQbPUTnAoO0cT0lV";
                    strArr6[4] = "xfdbBnAiFkUvLA3UQdbN1yo1xUjXmcit";
                    if (zq != null) {
                        int iA0A3 = this.A0k.A0A();
                        String[] strArr7 = A0u;
                        if (strArr7[1].charAt(8) != strArr7[7].charAt(8)) {
                            String[] strArr8 = A0u;
                            strArr8[3] = "ahkDnwwZ1M5c2xwXP4bviI74tZTM5NNc";
                            strArr8[4] = "KZBDFRuhpA7FmtcmEPb3VplP1Qry6uqF";
                            z12 = iA0A3 == 0;
                        } else {
                            String[] strArr9 = A0u;
                            strArr9[3] = "At5Ab7oopsVFJExndObCobqDXIOgvui3";
                            strArr9[4] = "hhJ8pEinY1fgJlgDnmbH7UlSnfSEyZDK";
                            if (iA0A3 == 0) {
                            }
                        }
                        AbstractC1062Ln.A08(z12);
                        c1449aa.A0c.A03(q92);
                    }
                    while (this.A08 < iA0A) {
                        int iA012 = A01(q92, zp2, iA0A - this.A08);
                        this.A08 += iA012;
                        this.A09 += iA012;
                    }
                }
                if (A06(271, 8, 104).equals(c1449aa.A0d)) {
                    this.A0p.A0f(0);
                    zp2.AK9(this.A0p, 4);
                    this.A09 += 4;
                }
                int iA002 = A00();
                strArr = A0u;
                if (strArr[1].charAt(8) == strArr[7].charAt(8)) {
                    A0u[5] = "Ggno";
                    return iA002;
                }
                A0u[5] = "K9n2HKsnWYgpdTCXnDpZrS1TZBiHj";
                return iA002;
            }
        }
        throw new RuntimeException();
    }

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0t, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 111);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        byte[] bArr = {15, 66, 90, 92, 91, 15, 77, 74, 15, 70, 65, 15, 78, 15, 108, 90, 74, 92, 82, 31, 7, 1, 6, 82, 16, 23, 82, 27, 28, 82, 19, 82, 38, 0, 19, 17, 25, 55, 28, 6, 0, 11, 46, 96, 97, 122, 46, 125, 123, 126, 126, 97, 124, 122, 107, 106, 27, 14, 15, 90, 4, 27, 14, 12, 90, 4, 27, 14, 12, 90, 4, 27, 14, 12, 90, 0, 21, 23, 65, 31, 0, 21, 23, 65, 31, 0, 21, 23, 65, 9, 0, 21, 22, 65, 0, 21, 23, 65, 31, 0, 21, 23, 65, 31, 0, 21, 23, 65, 11, 0, 21, 22, 65, 99, 103, 113, 113, 71, 86, 86, 75, 76, 69, 81, 97, 75, 82, 74, 71, 80, 111, 77, 70, 71, 2, 102, 120, 102, 102, 100, 70, 88, 70, 68, 52, 11, 21, 14, 30, 25, 70, 88, 67, 83, 84, 40, 66, 95, 87, 85, 66, 84, 84, 111, 113, 106, 122, 125, 1, 98, 97, 125, 125, 98, 107, 125, 125, 13, 19, 9, 13, 15, AbstractJsonLexerKt.TC_INVALID, 65, 95, 70, 76, 65, 67, 57, 39, 53, 40, 61, 63, 87, 52, 74, 2, 28, 14, 19, 6, 4, 108, 15, 112, 7, 25, 11, 21, 105, 7, 5, 11, 86, 72, 88, 71, 66, 68, 31, 1, 14, 29, 19, 113, 24, 18, 17, 31, 10, 113, 23, 27, 27, 27, 87, 73, 70, 85, 91, 57, 95, 88, 66, 57, 84, 95, 81, 123, 101, 106, 121, 119, 21, 115, 116, 110, 21, 118, 115, 110, 45, 51, 56, 62, 57, 41, 36, 40, 70, 88, 81, 72, 85, 69, 78, 84, 73, 107, 100, 45, 126, 42, 121, 105, 107, 102, 111, 42, 126, 99, 103, 111, 105, 101, 110, 111, 42, 122, 120, 99, 101, 120, 42, 126, 101, 42, 126, 99, 103, 111, 105, 101, 110, 111, 89, 105, 107, 102, 111, 42, 104, 111, 99, 100, 109, 42, 121, 111, 126, 36, 16, 60, 55, 54, 48, 26, 55, 115, 58, 32, 115, 62, 58, 32, 32, 58, 61, 52, 115, 58, 61, 115, 7, 33, 50, 48, 56, 22, 61, 39, 33, 42, 115, 54, 63, 54, 62, 54, 61, 39, 81, 125, AbstractJsonLexerKt.TC_INVALID, 112, 123, 124, 123, 124, 117, 50, 119, 124, 113, 96, 107, 98, 102, 123, 125, 124, 50, 115, 124, 118, 50, 113, 125, AbstractJsonLexerKt.TC_INVALID, 98, 96, 119, 97, 97, 123, 125, 124, 50, 123, 97, 50, 124, 125, 102, 50, 97, 103, 98, 98, 125, 96, 102, 119, 118, 99, 79, 78, 84, 69, 78, 84, 99, 79, 77, 80, 97, 76, 71, 79, 0, 82, 126, AbstractJsonLexerKt.TC_INVALID, 101, 116, AbstractJsonLexerKt.TC_INVALID, 101, 84, AbstractJsonLexerKt.TC_INVALID, 114, 80, 125, 118, 126, 49, 86, 122, 123, 97, 112, 123, 97, 80, 123, 118, 122, 113, 124, 123, 114, 90, 103, 113, 112, 103, 53, 84, 120, 121, 99, 114, 121, 99, 82, 121, 116, 120, 115, 126, 121, 112, 68, 116, 120, 103, 114, 55, 46, 3, 25, 9, 11, 24, 14, 3, 4, 13, 74, 6, 11, 25, 30, 74, 9, 31, 15, 74, 26, 5, 3, 4, 30, 74, 29, 3, 30, 2, 74, 31, 4, 15, 18, 26, 15, 9, 30, 15, 14, 74, 14, 31, 24, 11, 30, 3, 5, 4, 80, 74, 107, 64, 76, 123, 86, 95, 74, 15, 116, 95, 83, 100, 73, 64, 85, 98, 85, 81, 84, 102, 85, 66, 67, 89, 95, 94, 16, 64, 71, 72, 73, 37, 105, 100, 102, 108, 107, 98, 37, 118, 100, 104, 117, 105, 96, 37, 118, 108, AbstractJsonLexerKt.TC_INVALID, 96, 37, 106, 112, 113, 37, 106, 99, 37, 119, 100, 107, 98, 96, 43, 84, 83, 92, 93, 67, 116, 112, 117, 71, 116, 99, 98, 120, 126, AbstractJsonLexerKt.TC_INVALID, 49, 104, 65, 72, 64, 72, 67, 89, 13, 31, 52, 57, 40, 35, 42, 46, 63, 62, 122, 14, 40, 59, 57, 49, 122, 60, 53, 47, 52, 62, 122, 56, 47, 46, 122, 25, 53, 52, 46, 63, 52, 46, 31, 52, 57, 17, 63, 35, 19, 30, 122, 45, 59, 41, 122, 52, 53, 46, 122, 60, 53, 47, 52, 62, 50, 15, 3, 18, 25, 4, 30, 24, 25, 87, 21, 30, 3, 87, 30, 4, 87, 4, 18, 3, 87, 30, 25, 87, 4, 30, 16, 25, 22, 27, 87, 21, 14, 3, 18, 28, 53, 40, 55, 59, 46, 96, 122, 9, 46, 59, 40, 46, 118, 122, 31, 52, 62, 118, 122, 8, 63, 59, 62, 21, 40, 62, 63, 40, 118, 122, 22, 59, 35, 63, 40, 118, 122, 9, 46, 35, 54, 63, 118, 122, 20, 59, 55, 63, 118, 122, 23, 59, 40, 61, 51, 52, 22, 118, 122, 23, 59, 40, 61, 51, 52, 8, 118, 122, 23, 59, 40, 61, 51, 52, 12, 118, 122, 31, 60, 60, 63, 57, 46, 118, 122, 14, 63, 34, 46, 47, 3, 12, 6, 3, 22, 13, 16, 27, 66, 7, 14, 7, 15, 7, 12, 22, 66, 49, 7, 7, 9, 43, 38, 66, 13, 16, 66, 49, 7, 7, 9, 50, 13, 17, 11, 22, 11, 13, 12, 66, 12, 13, 22, 66, 4, 13, 23, 12, 6, 14, 34, 55, 49, 44, 48, 40, 34, 6, 59, 55, 49, 34, 32, 55, 44, 49, 122, 66, 91, 67, 94, 71, 91, 82, 23, 100, 82, 80, 90, 82, 89, 67, 23, 82, 91, 82, 90, 82, 89, 67, 68, 23, 89, 88, 67, 23, 68, 66, 71, 71, 88, 69, 67, 82, 83, 82, 115, 60, 106, 125, 112, 117, 120, 60, 104, 110, 125, AbstractJsonLexerKt.TC_INVALID, 119, 111, 60, 107, 121, 110, 121, 60, 122, 115, 105, 114, 120, 104, 73, 6, 80, 71, 74, 79, 66, 6, 80, 71, 84, 79, 72, 82, 6, 74, 67, 72, 65, 82, 78, 6, 75, 71, 85, 77, 6, 64, 73, 83, 72, 66, 79, 67, 88, 74, 94, 79, 73, 94, 40, 36, 51, 63, 54, 45, 84, 43, 
        60, 40, 0, 12, 7, 22, 11, 7, 124, 18, 0, 0, 66, 78, 69, 84, 73, 69, 62, 68, 69, 87, 41, 104, 100, 111, 126, 99, 111, 20, 108, 126, 121, 109, 111, 111, 113, 125, 116, 109, 96, 113, 119, 96, 63, 7, 5, 28, 28, 5, 2, 11, 76, 31, 25, 14, 24, 5, 24, 0, 9, 76, 31, 13, 1, 28, 0, 9, 76, 5, 2, 76, 0, 13, 15, 9, 8, 76, 14, 0, 3, 15, 7, 66, 16, 40, 42, 51, 51, 42, 45, 36, 99, 48, 54, 33, 55, 42, 55, 47, 38, 99, 48, 34, 46, 51, 47, 38, 99, 52, 42, 55, 43, 99, 45, 44, 99, 39, 54, 49, 34, 55, 42, 44, 45, 109, 106, 81, 90, 71, 79, 90, 92, 75, 90, 91, 31, 86, 91, 5, 31, 16, 43, 32, 61, 53, 32, 38, 49, 32, 33, 101, 41, 36, 38, 44, 43, 34, 101, 51, 36, 41, 48, 32, AbstractJsonLexerKt.TC_INVALID, 101, 105, 96, 126, 105, 14, 56, 49, 35, 62, 43, 41, 92, 9, 0, 18, 15, 26, 24, 107, 112, 22, 12, 16, 112, 30, 15, 100, 109, AbstractJsonLexerKt.TC_INVALID, 98, 119, 117, 6, 29, 123, 97, 125, 29, 115, 97, 98, 2, 11, 25, 4, 17, 19, 96, 123, 29, 7, 27, 123, 21, 2, 23, 59, 50, 32, 61, 40, 42, 89, 66, 36, 62, 34, 66, 62, 61, 11, 2, 16, 13, 24, 26, 21, 114, 20, 14, 18, 114, 21, 24, 11, 30, 73, 64, 82, 76, 48, 73, 89, 72, 48, 89, 80, 74, 77, 92, 92, 23, 30, 21, 9, 4, 14, 19, 0, 37, 44, 37, 35, 75, 104, 97, 104, 110, 7, 80, 76, 91, 103, 78, 81, 92, 93, 87, 103, 74, 87, 76, 121, 21, 8, 8, 8, 82, 78, 89, 101, 76, 83, 94, 95, 85, 101, 72, 85, 78, 123, 23, 10, 3, 10, 116, 104, AbstractJsonLexerKt.TC_INVALID, 67, 106, 117, 120, 121, 115, 67, 110, 115, 104, 93, 49, 45, 36, 44, 85, 73, 94, 98, 75, 84, 89, 88, 82, 98, 79, 82, 73, 124, 16, 15, 10, 13, 32, 44, 57, 63, 34, 62, 38, 44, 83, 76, 65, 64, 74, 10, 82, 64, 71, 72, 36, 54, 49, 62};
        String[] strArr = A0u;
        if (strArr[6].charAt(9) == strArr[2].charAt(9)) {
            throw new RuntimeException();
        }
        A0u[0] = "z";
        A0t = bArr;
    }

    static {
        A0B();
        A0v = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.PP
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return MatroskaExtractor.A0Q();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
        A10 = new byte[]{49, 10, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 48, 48, 32, 45, 45, 62, 32, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 48, 48, 10};
        A0y = N1.A1G(A06(729, 90, 53));
        A0z = new byte[]{68, 105, 97, 108, 111, 103, 117, 101, 58, 32, 48, 58, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 58, 48, 48, 58, 48, 48, 58, 48, 48, 44};
        A11 = new byte[]{87, 69, 66, 86, 84, 84, 10, 10, 48, 48, 58, 48, 48, 58, 48, 48, 46, 48, 48, 48, 32, 45, 45, 62, 32, 48, 48, 58, 48, 48, 58, 48, 48, 46, 48, 48, 48, 10};
        A0x = new UUID(72057594037932032L, -9223371306706625679L);
        HashMap map = new HashMap();
        map.put(A06(1285, 18, 87), 0);
        map.put(A06(1303, 18, 85), 90);
        map.put(A06(1321, 18, 115), 180);
        map.put(A06(1339, 18, 82), 270);
        Map<String, Integer> trackNameToRotationDegrees = Collections.unmodifiableMap(map);
        A0w = trackNameToRotationDegrees;
    }

    public MatroskaExtractor() {
        this(0);
    }

    public MatroskaExtractor(int i5) {
        this(new PT(), i5);
    }

    public MatroskaExtractor(InterfaceC1446aX interfaceC1446aX, int i5) {
        this.A0M = -1L;
        this.A0O = -9223372036854775807L;
        this.A0I = -9223372036854775807L;
        this.A0J = -9223372036854775807L;
        this.A0H = -1L;
        this.A0L = -1L;
        this.A0G = -9223372036854775807L;
        this.A0q = interfaceC1446aX;
        this.A0q.AAr(new PN(this));
        this.A0s = (i5 & 1) == 0;
        this.A0r = new C1451ac();
        this.A0P = new SparseArray<>();
        this.A0l = new C1084Mk(4);
        this.A0p = new C1084Mk(ByteBuffer.allocate(4).putInt(-1).array());
        this.A0m = new C1084Mk(4);
        this.A0j = new C1084Mk(ZE.A03);
        this.A0i = new C1084Mk(4);
        this.A0k = new C1084Mk();
        this.A0n = new C1084Mk();
        this.A0g = new C1084Mk(8);
        this.A0h = new C1084Mk();
        this.A0o = new C1084Mk();
        this.A0f = new int[1];
    }

    private int A00() {
        int sampleSize = this.A09;
        A0A();
        return sampleSize;
    }

    private int A01(Q9 q92, ZP zp2, int i5) throws IOException {
        int strippedBytesLeft = this.A0k.A07();
        if (strippedBytesLeft > 0) {
            int bytesWritten = Math.min(i5, strippedBytesLeft);
            zp2.AK9(this.A0k, bytesWritten);
            return bytesWritten;
        }
        return zp2.AK7(q92, i5, false);
    }

    private long A03(long j11) throws L9 {
        if (this.A0O != -9223372036854775807L) {
            return N1.A0U(j11, this.A0O, 1000L);
        }
        throw L9.A01(A06(279, 54, 101), null);
    }

    /* JADX WARN: Incorrect condition in loop: B:19:0x0053 */
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private ZK A04(MW mw2, MW mw3) {
        if (this.A0M == -1 || this.A0J == -9223372036854775807L || mw2 == null || mw2.A02() == 0 || mw3 == null || mw3.A02() != mw2.A02()) {
            return new Q4(this.A0J);
        }
        int iA02 = mw2.A02();
        int[] iArrCopyOf = new int[iA02];
        long[] timesUs = new long[iA02];
        long[] durationsUs = new long[iA02];
        long[] offsets = new long[iA02];
        for (int i5 = 0; i5 < iA02; i5++) {
            offsets[i5] = mw2.A03(i5);
            timesUs[i5] = this.A0M + mw3.A03(i5);
        }
        for (int i11 = 0; i11 < cuePointsSize; i11++) {
            int cuePointsSize = i11 + 1;
            iArrCopyOf[i11] = (int) (timesUs[cuePointsSize] - timesUs[i11]);
            int cuePointsSize2 = i11 + 1;
            durationsUs[i11] = offsets[cuePointsSize2] - offsets[i11];
        }
        iArrCopyOf[iA02 - 1] = (int) ((this.A0M + this.A0N) - timesUs[iA02 - 1]);
        durationsUs[iA02 - 1] = this.A0J - offsets[iA02 - 1];
        int cuePointsSize3 = iA02 - 1;
        long j11 = durationsUs[cuePointsSize3];
        if (j11 <= 0) {
            MV.A07(A06(869, 17, 44), A06(499, 52, 5) + j11);
            int cuePointsSize4 = iArrCopyOf.length;
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, cuePointsSize4 - 1);
            int cuePointsSize5 = timesUs.length;
            timesUs = Arrays.copyOf(timesUs, cuePointsSize5 - 1);
            int cuePointsSize6 = durationsUs.length;
            durationsUs = Arrays.copyOf(durationsUs, cuePointsSize6 - 1);
            int cuePointsSize7 = offsets.length;
            offsets = Arrays.copyOf(offsets, cuePointsSize7 - 1);
        }
        return new QJ(iArrCopyOf, timesUs, durationsUs, offsets);
    }

    private final C1449aa A05(int i5) throws L9 {
        A0D(i5);
        return this.A0T;
    }

    @EnsuresNonNull
    private void A09() {
        AbstractC1062Ln.A02(this.A0S);
    }

    private void A0A() {
        this.A08 = 0;
        this.A09 = 0;
        this.A0A = 0;
        this.A0Y = false;
        this.A0b = false;
        this.A0a = false;
        this.A0B = 0;
        this.A00 = (byte) 0;
        this.A0Z = false;
        this.A0k.A0d(0);
    }

    @EnsuresNonNull
    private void A0C(int i5) throws L9 {
        if (this.A0R != null && this.A0Q != null) {
        } else {
            throw L9.A01(A06(631, 8, 66) + i5 + A06(0, 18, 64), null);
        }
    }

    @EnsuresNonNull
    private void A0D(int i5) throws L9 {
        if (this.A0T != null) {
        } else {
            throw L9.A01(A06(631, 8, 66) + i5 + A06(18, 24, 29), null);
        }
    }

    private void A0E(Q9 q92, int i5) throws IOException {
        if (this.A0l.A0A() >= i5) {
            return;
        }
        if (this.A0l.A08() < i5) {
            this.A0l.A0c(Math.max(this.A0l.A08() * 2, i5));
        }
        q92.readFully(this.A0l.A0l(), this.A0l.A0A(), i5 - this.A0l.A0A());
        this.A0l.A0e(i5);
    }

    private void A0F(Q9 q92, byte[] bArr, int i5) throws IOException {
        int length = bArr.length + i5;
        int sizeWithPrefix = this.A0n.A08();
        if (sizeWithPrefix < length) {
            int sizeWithPrefix2 = length + i5;
            this.A0n.A0i(Arrays.copyOf(bArr, sizeWithPrefix2));
        } else {
            byte[] bArrA0l = this.A0n.A0l();
            int sizeWithPrefix3 = bArr.length;
            System.arraycopy(bArr, 0, bArrA0l, 0, sizeWithPrefix3);
        }
        byte[] bArrA0l2 = this.A0n.A0l();
        int sizeWithPrefix4 = bArr.length;
        q92.readFully(bArrA0l2, sizeWithPrefix4, i5);
        this.A0n.A0f(0);
        this.A0n.A0e(length);
    }

    private void A0G(Q9 q92, byte[] bArr, int i5, int i11) throws IOException {
        int iMin = Math.min(i11, this.A0k.A07());
        int pendingStrippedBytes = i5 + iMin;
        q92.readFully(bArr, pendingStrippedBytes, i11 - iMin);
        if (iMin > 0) {
            this.A0k.A0k(bArr, i5, iMin);
        }
    }

    private final void A0H(C1449aa c1449aa, int i5, Q9 q92, int i11) throws IOException {
        if (i5 == 4) {
            if (A06(1280, 5, 81).equals(c1449aa.A0d)) {
                this.A0o.A0d(i11);
                String[] strArr = A0u;
                if (strArr[3].charAt(18) != strArr[4].charAt(18)) {
                    throw new RuntimeException();
                }
                A0u[5] = "ycRCH0OYlxA9fSn";
                q92.readFully(this.A0o.A0l(), 0, i11);
                return;
            }
        }
        q92.ALL(i11);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x004e, code lost:
    
        if (A06(1023, 13, 84).equals(r15.A0d) != false) goto L13;
     */
    @RequiresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0I(C1449aa c1449aa, long j11, int i5, int i11, int i12) {
        int iA0A = i11;
        if (c1449aa.A0c != null) {
            c1449aa.A0c.A04(c1449aa.A0b, j11, i5, iA0A, i12, c1449aa.A0a);
        } else {
            if (!A06(TTAdConstant.IMAGE_MODE_1012, 11, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE).equals(c1449aa.A0d)) {
                if (!A06(1002, 10, 60).equals(c1449aa.A0d)) {
                }
            }
            int i13 = this.A03;
            String strA06 = A06(869, 17, 44);
            if (i13 > 1) {
                MV.A07(strA06, A06(1044, 40, 3));
            } else if (this.A0D == -9223372036854775807L) {
                MV.A07(strA06, A06(1084, 42, 44));
            } else {
                A0K(c1449aa.A0d, this.A0D, this.A0n.A0l());
                int iA09 = this.A0n.A09();
                while (true) {
                    if (iA09 >= this.A0n.A0A()) {
                        break;
                    }
                    byte b11 = this.A0n.A0l()[iA09];
                    if (A0u[0].length() == 31) {
                        break;
                    }
                    A0u[5] = "G7dQ1IOr3v5f";
                    if (b11 == 0) {
                        this.A0n.A0e(iA09);
                        break;
                    }
                    iA09++;
                }
                c1449aa.A0b.AK9(this.A0n, this.A0n.A0A());
                iA0A += this.A0n.A0A();
            }
            if ((268435456 & i5) != 0) {
                if (this.A03 > 1) {
                    C1084Mk c1084Mk = this.A0o;
                    if (A0u[5].length() != 10) {
                        String[] strArr = A0u;
                        strArr[1] = "WB8QuC9ZsNSEjHZGyNl39w3VUVvWnBHt";
                        strArr[7] = "M43fA4NZssOBJdwWQhyVW8434onDMqYj";
                        c1084Mk.A0d(0);
                    }
                    throw new RuntimeException();
                }
                int iA0A2 = this.A0o.A0A();
                if (A0u[0].length() != 31) {
                    String[] strArr2 = A0u;
                    strArr2[3] = "m5Qn9D46TMpgo6JFBsbN4dIgXashOA10";
                    strArr2[4] = "8OW2IfyCBRf7k2uZrAbVX1yXTl7N6yzd";
                    c1449aa.A0b.AKA(this.A0o, iA0A2, 2);
                    iA0A += iA0A2;
                }
                throw new RuntimeException();
            }
            c1449aa.A0b.AKC(j11, i5, iA0A, i12, c1449aa.A0a);
        }
        this.A0X = true;
    }

    private final void A0J(C1449aa c1449aa, Q9 q92, int i5) throws IOException {
        if (c1449aa.A0n == 1685485123 || c1449aa.A0n == 1685480259) {
            c1449aa.A0k = new byte[i5];
            q92.readFully(c1449aa.A0k, 0, i5);
        } else {
            q92.ALL(i5);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0008  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0K(String str, long j11, byte[] bArr) {
        char c11;
        byte[] bArrA0O;
        int i5;
        switch (str.hashCode()) {
            case 738597099:
                if (!str.equals(A06(1002, 10, 60))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 1;
                    break;
                }
            case 1045209816:
                if (str.equals(A06(1023, 13, 84))) {
                    c11 = 2;
                    break;
                }
                break;
            case 1422270023:
                if (str.equals(A06(TTAdConstant.IMAGE_MODE_1012, 11, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE))) {
                    c11 = 0;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                bArrA0O = A0O(j11, A06(75, 19, 74), 1000L);
                i5 = 19;
                break;
            case 1:
                bArrA0O = A0O(j11, A06(56, 19, 81), h.f42227c);
                i5 = 21;
                break;
            case 2:
                bArrA0O = A0O(j11, A06(94, 19, 74), 1000L);
                i5 = 25;
                break;
            default:
                throw new IllegalArgumentException();
        }
        int length = bArrA0O.length;
        String[] strArr = A0u;
        if (strArr[3].charAt(18) != strArr[4].charAt(18)) {
            throw new RuntimeException();
        }
        A0u[0] = "JA1wjLV1mIfg36WFMLiz";
        System.arraycopy(bArrA0O, 0, bArr, i5, length);
    }

    private boolean A0L(ZH zh2, long j11) {
        if (this.A0c) {
            this.A0L = j11;
            zh2.A00 = this.A0H;
            this.A0c = false;
            return true;
        }
        if (!this.A0e || this.A0L == -1) {
            return false;
        }
        zh2.A00 = this.A0L;
        this.A0L = -1L;
        return true;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02f0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0009  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0M(String str) {
        char c11;
        switch (str.hashCode()) {
            case -2095576542:
                String strA06 = A06(1178, 14, 48);
                if (A0u[5].length() != 10) {
                    A0u[0] = "qy30WEYRYjDpgKNyKary2rcwrY";
                    c11 = str.equals(strA06) ? (char) 6 : (char) 65535;
                    switch (c11) {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case '\b':
                        case '\t':
                        case '\n':
                        case 11:
                        case '\f':
                        case '\r':
                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                        case 26:
                        case 27:
                        case 28:
                        case 29:
                        case 30:
                        case 31:
                        case ' ':
                            return true;
                        default:
                            return false;
                    }
                }
                throw new RuntimeException();
            case -2095575984:
                if (str.equals(A06(1222, 14, 2))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case -1985379776:
                if (str.equals(A06(Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 8, 41))) {
                    c11 = 23;
                }
                switch (c11) {
                }
            case -1784763192:
                if (str.equals(A06(263, 8, 3))) {
                    c11 = 18;
                }
                switch (c11) {
                }
            case -1730367663:
                if (str.equals(A06(271, 8, 104))) {
                    c11 = '\f';
                }
                switch (c11) {
                }
            case -1482641358:
                if (str.equals(A06(189, 9, 23))) {
                    c11 = 14;
                }
                switch (c11) {
                }
            case -1482641357:
                if (str.equals(A06(198, 9, 44))) {
                    c11 = 15;
                }
                switch (c11) {
                }
            case -1373388978:
                if (str.equals(A06(1252, 15, 112))) {
                    c11 = '\t';
                }
                switch (c11) {
                }
            case -933872740:
                if (str.equals(A06(984, 8, 115))) {
                    c11 = ' ';
                }
                switch (c11) {
                }
            case -538363189:
                if (str.equals(A06(1192, 15, 93))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case -538363109:
                if (str.equals(A06(1207, 15, 59))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case -425012669:
                if (str.equals(A06(1036, 8, 77))) {
                    c11 = 30;
                }
                switch (c11) {
                }
            case -356037306:
                if (str.equals(A06(163, 14, 65))) {
                    c11 = 21;
                }
                switch (c11) {
                }
            case 62923557:
                if (str.equals(A06(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 5, 72))) {
                    c11 = '\r';
                }
                switch (c11) {
                }
            case 62923603:
                if (str.equals(A06(140, 5, 104))) {
                    c11 = 16;
                }
                switch (c11) {
                }
            case 62927045:
                if (str.equals(A06(145, 5, 37))) {
                    c11 = 19;
                }
                switch (c11) {
                }
            case 82318131:
                if (str.equals(A06(1166, 5, 80))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case 82338133:
                if (str.equals(A06(1275, 5, 28))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 82338134:
                if (str.equals(A06(1280, 5, 81))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 99146302:
                String[] strArr = A0u;
                if (strArr[6].charAt(9) != strArr[2].charAt(9)) {
                    String[] strArr2 = A0u;
                    strArr2[6] = "4ocJ3QE7e2niA2lqgCPE8rjRynKRqK9e";
                    strArr2[2] = "waEp0KqnPD09qVRwoJT36NX33zQLhfou";
                    if (str.equals(A06(992, 10, 20))) {
                        c11 = 31;
                    }
                } else if (str.equals(A06(992, 10, 20))) {
                }
                switch (c11) {
                }
            case 444813526:
                if (str.equals(A06(1267, 8, 46))) {
                    c11 = '\n';
                }
                switch (c11) {
                }
            case 542569478:
                if (str.equals(A06(PerAppFeatureCatalog.MAX_TOOLS, 13, 104))) {
                    c11 = 20;
                }
                switch (c11) {
                }
            case 635596514:
                if (str.equals(A06(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 16, 49))) {
                    c11 = 26;
                }
                switch (c11) {
                }
            case 725948237:
                if (str.equals(A06(237, 13, Sdk.SDKError.Reason.TPAT_ERROR_VALUE))) {
                    c11 = 25;
                }
                switch (c11) {
                }
            case 725957860:
                if (str.equals(A06(n0.DEFAULT_SWIPE_ANIMATION_DURATION, 13, 85))) {
                    c11 = 24;
                }
                switch (c11) {
                }
            case 738597099:
                if (str.equals(A06(1002, 10, 60))) {
                    c11 = 28;
                }
                switch (c11) {
                }
            case 855502857:
                if (str.equals(A06(1236, 16, 50))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
            case 1045209816:
                String[] strArr3 = A0u;
                if (strArr3[1].charAt(8) == strArr3[7].charAt(8)) {
                    String[] strArr4 = A0u;
                    strArr4[3] = "rWbOtqcfKfxvIFfkW0blYy67BjoLqLkT";
                    strArr4[4] = "Tv6gfUCuWEfjR9295DbqIIedC2Hsp2lK";
                    if (str.equals(A06(1023, 13, 84))) {
                        c11 = 29;
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 1422270023:
                if (str.equals(A06(TTAdConstant.IMAGE_MODE_1012, 11, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE))) {
                    c11 = 27;
                }
                switch (c11) {
                }
            case 1809237540:
                if (str.equals(A06(1171, 7, 1))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 1950749482:
                if (str.equals(A06(177, 6, 35))) {
                    c11 = 17;
                }
                switch (c11) {
                }
            case 1950789798:
                if (str.equals(A06(183, 6, 111))) {
                    c11 = 22;
                }
                switch (c11) {
                }
            case 1951062397:
                if (str.equals(A06(Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 6, 120))) {
                    c11 = 11;
                }
                switch (c11) {
                }
        }
    }

    public static byte[] A0O(long j11, String str, long j12) {
        AbstractC1062Ln.A07(j11 != -9223372036854775807L);
        int i5 = (int) (j11 / 3600000000L);
        long j13 = j11 - ((i5 * k.f40328b) * 1000000);
        int i11 = (int) (j13 / 60000000);
        long j14 = j13 - ((i11 * 60) * 1000000);
        int i12 = (int) (j14 / 1000000);
        int minutes = (int) ((j14 - (i12 * 1000000)) / j12);
        return N1.A1G(String.format(Locale.US, str, Integer.valueOf(i5), Integer.valueOf(i11), Integer.valueOf(i12), Integer.valueOf(minutes)));
    }

    public static int[] A0P(int[] iArr, int i5) {
        if (iArr == null) {
            int[] iArr2 = new int[i5];
            String[] strArr = A0u;
            if (strArr[3].charAt(18) != strArr[4].charAt(18)) {
                throw new RuntimeException();
            }
            A0u[5] = b.f42142b;
            return iArr2;
        }
        if (iArr.length >= i5) {
            return iArr;
        }
        return new int[Math.max(iArr.length * 2, i5)];
    }

    public static /* synthetic */ InterfaceC1383Yv[] A0Q() {
        return new InterfaceC1383Yv[]{new MatroskaExtractor()};
    }

    @MetaExoPlayerCustomization
    public final int A0R(int i5) {
        switch (i5) {
            case MRAID_JS_WRITE_FAILED_VALUE:
            case PRIVACY_URL_ERROR_VALUE:
            case 155:
            case 159:
            case 176:
            case 179:
            case 186:
            case AD_RESPONSE_EMPTY_VALUE:
            case 231:
            case 238:
            case 241:
            case 251:
            case 16871:
            case 16980:
            case 17029:
            case 17143:
            case 18401:
            case 18408:
            case 20529:
            case 20530:
            case 21420:
            case 21432:
            case 21680:
            case 21682:
            case 21690:
            case 21930:
            case 21945:
            case 21946:
            case 21947:
            case 21948:
            case 21949:
            case 21998:
            case 22186:
            case 22203:
            case 25188:
            case 30114:
            case 30321:
            case 2352003:
            case 2807729:
                return 2;
            case STORE_REGION_CODE_ERROR_VALUE:
            case 17026:
            case 21358:
            case 2274716:
                return 3;
            case 160:
            case 166:
            case 174:
            case 183:
            case 187:
            case AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE:
            case AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE:
            case 16868:
            case 18407:
            case 19899:
            case 20532:
            case 20533:
            case 21936:
            case 21968:
            case 25152:
            case 26568:
            case 28032:
            case 29555:
            case 30113:
            case 30320:
            case 290298740:
            case 307544935:
            case 357149030:
            case 374648427:
            case 408125543:
            case 440786851:
            case 475249515:
            case 524531317:
                return 1;
            case 161:
            case 163:
            case 165:
            case 16877:
            case 16981:
            case 18402:
            case 21419:
            case 25506:
            case 30322:
                return 4;
            case 181:
            case 17545:
            case 21969:
            case 21970:
            case 21971:
            case 21972:
            case 21973:
            case 21974:
            case 21975:
            case 21976:
            case 21977:
            case 21978:
            case 30323:
            case 30324:
            case 30325:
                return 5;
            case 17543:
            case 17827:
                return 6;
            default:
                return 0;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:61:0x018b */
    /* JADX WARN: Removed duplicated region for block: B:55:0x016a A[LOOP:0: B:49:0x013b->B:55:0x016a, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01d8 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0S(int i5) throws L9 {
        int i11;
        A09();
        switch (i5) {
            case 160:
                int i12 = this.A05;
                if (A0u[0].length() != 31) {
                    String[] strArr = A0u;
                    strArr[3] = "W37Oe0UvQn0ZDoro2Mbo0pF98Xi8uqyS";
                    strArr[4] = "tR9TTUuUYx5oYQxH1Zb7krHeKmbl2wlj";
                    if (i12 == 2) {
                        C1449aa c1449aa = this.A0P.get(this.A06);
                        c1449aa.A06();
                        if (this.A0E > 0 && A06(Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 6, 120).equals(c1449aa.A0d)) {
                            this.A0o.A0i(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putLong(this.A0E).array());
                        }
                        int sampleFlags = 0;
                        int i13 = 0;
                        while (true) {
                            int i14 = this.A03;
                            int i15 = A0u[0].length();
                            if (i15 != 31) {
                                String[] strArr2 = A0u;
                                strArr2[3] = "Yx9601ekBh70hlQnRzbAopAAvIZtidXs";
                                strArr2[4] = "iIK5jxXhpOmSUenFN1b6tYVUrTB2nhhr";
                                if (i13 >= i14) {
                                }
                                int sampleOffset = this.A0f[i13];
                                sampleFlags += sampleOffset;
                                i11 = A0u[0].length();
                                if (i11 != 31) {
                                    break;
                                } else {
                                    String[] strArr3 = A0u;
                                    strArr3[1] = "sct5S66hsFYadYgOv1FFDPW62MmWrwBB";
                                    strArr3[7] = "1RuC9tbOshwEgAejUgbuwMvBU57chua7";
                                    i13++;
                                }
                            } else {
                                String[] strArr4 = A0u;
                                strArr4[3] = "Y0UB6E1y0ypnqBlpQHbO01hhQK2au0jS";
                                strArr4[4] = "LS7xRbahqeJrr9b4IFbtCGWau1TXmDen";
                                if (i13 >= i14) {
                                }
                                int sampleOffset2 = this.A0f[i13];
                                sampleFlags += sampleOffset2;
                                i11 = A0u[0].length();
                                if (i11 != 31) {
                                }
                            }
                        }
                        for (int i16 = 0; i16 < sampleOffset; i16++) {
                            long j11 = this.A0F;
                            int sampleOffset3 = c1449aa.A0I;
                            long j12 = j11 + ((sampleOffset3 * i16) / 1000);
                            int i17 = this.A02;
                            if (i16 == 0 && !this.A0W) {
                                i17 |= 1;
                            }
                            int i18 = this.A0f[i16];
                            sampleFlags -= i18;
                            A0I(c1449aa, j12, i17, i18, sampleFlags);
                        }
                        this.A05 = 0;
                        return;
                    }
                    return;
                }
                break;
            case 174:
                C1449aa c1449aa2 = (C1449aa) AbstractC1062Ln.A02(this.A0T);
                if (c1449aa2.A0d != null) {
                    if (A0M(c1449aa2.A0d)) {
                        c1449aa2.A0G(this.A0S, c1449aa2.A0R);
                        this.A0P.put(c1449aa2.A0R, c1449aa2);
                    }
                    this.A0T = null;
                    return;
                }
                throw L9.A01(A06(333, 40, 60), null);
            case 19899:
                if (this.A0C != -1 && this.A0K != -1) {
                    if (this.A0C != 475249515) {
                        return;
                    }
                    long j13 = this.A0K;
                    if (A0u[5].length() != 10) {
                        String[] strArr5 = A0u;
                        strArr5[6] = "OWYx6LY00o3F1xrUgFtjBWOKe9PR4cvj";
                        strArr5[2] = "zSmNBCWIin3oi1Kr8EtbWzg6IhcGkQ3M";
                        this.A0H = j13;
                        return;
                    }
                    A0u[5] = "oLY";
                    this.A0H = j13;
                    return;
                }
                throw L9.A01(A06(819, 50, 13), null);
            case 25152:
                A0D(i5);
                if (!this.A0T.A0i) {
                    return;
                }
                if (this.A0T.A0a != null) {
                    this.A0T.A0Z = new DrmInitData(new DrmInitData.SchemeData(KN.A03, A06(1365, 10, 74), this.A0T.A0a.A03));
                    return;
                }
                throw L9.A01(A06(639, 55, 53), null);
            case 28032:
                A0D(i5);
                if (!this.A0T.A0i || this.A0T.A0m == null) {
                    return;
                } else {
                    throw L9.A01(A06(373, 53, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), null);
                }
            case 357149030:
                if (this.A0O == -9223372036854775807L) {
                    this.A0O = 1000000L;
                }
                long j14 = this.A0I;
                String[] strArr6 = A0u;
                String str = strArr6[1];
                String str2 = strArr6[7];
                int iCharAt = str.charAt(8);
                int sampleOffset4 = str2.charAt(8);
                if (iCharAt == sampleOffset4) {
                    A0u[0] = "aiYKfdM0H";
                    if (j14 != -9223372036854775807L) {
                        this.A0J = A03(this.A0I);
                        return;
                    }
                    return;
                }
                break;
            case 374648427:
                if (this.A0P.size() != 0) {
                    this.A0S.A6x();
                    return;
                }
                throw L9.A01(A06(925, 26, 115), null);
            case 475249515:
                if (!this.A0e) {
                    this.A0S.AKP(A04(this.A0R, this.A0Q));
                    this.A0e = true;
                }
                this.A0R = null;
                this.A0Q = null;
                return;
            default:
                return;
        }
        throw new RuntimeException();
    }

    public final void A0T(int i5, double d5) throws L9 {
        switch (i5) {
            case 181:
                A05(i5).A0T = (int) d5;
                break;
            case 17545:
                this.A0I = (long) d5;
                break;
            case 21969:
                A05(i5).A06 = (float) d5;
                break;
            case 21970:
                A05(i5).A07 = (float) d5;
                break;
            case 21971:
                A05(i5).A04 = (float) d5;
                break;
            case 21972:
                A05(i5).A05 = (float) d5;
                break;
            case 21973:
                A05(i5).A02 = (float) d5;
                break;
            case 21974:
                A05(i5).A03 = (float) d5;
                break;
            case 21975:
                A05(i5).A0B = (float) d5;
                break;
            case 21976:
                A05(i5).A0C = (float) d5;
                break;
            case 21977:
                A05(i5).A00 = (float) d5;
                break;
            case 21978:
                A05(i5).A01 = (float) d5;
                break;
            case 30323:
                A05(i5).A0A = (float) d5;
                break;
            case 30324:
                A05(i5).A08 = (float) d5;
                break;
            case 30325:
                A05(i5).A09 = (float) d5;
                break;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:45:0x0186 */
    /* JADX WARN: Incorrect condition in loop: B:58:0x0215 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0U(int i5, int i11, Q9 q92) throws IOException {
        int i12;
        int totalSamplesSize = 0;
        int i13 = 1;
        switch (i5) {
            case 161:
            case 163:
                if (this.A05 == 0) {
                    this.A06 = (int) this.A0r.A05(q92, false, true, 8);
                    this.A07 = this.A0r.A04();
                    this.A0D = -9223372036854775807L;
                    this.A05 = 1;
                    this.A0l.A0d(0);
                }
                C1449aa c1449aa = this.A0P.get(this.A06);
                if (c1449aa == null) {
                    q92.ALL(i11 - this.A07);
                    this.A05 = 0;
                    return;
                }
                c1449aa.A06();
                if (this.A05 == 1) {
                    A0E(q92, 3);
                    int i14 = (this.A0l.A0l()[2] & 6) >> 1;
                    int i15 = 255;
                    if (i14 != 0) {
                        A0E(q92, 4);
                        int timecode = this.A0l.A0l()[3];
                        this.A03 = (timecode & 255) + 1;
                        int[] iArr = this.A0f;
                        int timecode2 = this.A03;
                        this.A0f = A0P(iArr, timecode2);
                        if (i14 != 2) {
                            if (i14 != 1) {
                                if (i14 == 3) {
                                    int i16 = 0;
                                    int i17 = 4;
                                    int readPosition = 0;
                                    while (readPosition < this.A03 - i13) {
                                        this.A0f[readPosition] = totalSamplesSize;
                                        i17++;
                                        A0E(q92, i17);
                                        if (this.A0l.A0l()[i17 - 1] != 0) {
                                            long j11 = 0;
                                            int totalSamplesSize2 = 0;
                                            while (true) {
                                                if (totalSamplesSize2 < 8) {
                                                    int sampleIndex = 7 - totalSamplesSize2;
                                                    int i18 = i13 << sampleIndex;
                                                    int sampleIndex2 = i17 - 1;
                                                    if ((this.A0l.A0l()[sampleIndex2] & i18) != 0) {
                                                        int lengthMask = i17 - 1;
                                                        i17 += totalSamplesSize2;
                                                        A0E(q92, i17);
                                                        j11 = this.A0l.A0l()[lengthMask] & i15 & (~i18);
                                                        for (int sampleIndex3 = lengthMask + 1; sampleIndex3 < i17; sampleIndex3++) {
                                                            j11 = (j11 << 8) | (this.A0l.A0l()[sampleIndex3] & i15);
                                                        }
                                                        if (readPosition > 0) {
                                                            j11 -= (1 << ((totalSamplesSize2 * 7) + 6)) - 1;
                                                        }
                                                    } else {
                                                        totalSamplesSize2++;
                                                        String[] strArr = A0u;
                                                        String str = strArr[3];
                                                        String str2 = strArr[4];
                                                        int iCharAt = str.charAt(18);
                                                        int sampleIndex4 = str2.charAt(18);
                                                        if (iCharAt != sampleIndex4) {
                                                            i13 = 1;
                                                        } else {
                                                            A0u[0] = "YTsj846VQcHOB2STcOYH7t8v";
                                                            i13 = 1;
                                                        }
                                                    }
                                                }
                                            }
                                            if (j11 >= -2147483648L && j11 <= 2147483647L) {
                                                int totalSamplesSize3 = (int) j11;
                                                int[] iArr2 = this.A0f;
                                                if (readPosition != 0) {
                                                    totalSamplesSize3 += this.A0f[readPosition - 1];
                                                }
                                                iArr2[readPosition] = totalSamplesSize3;
                                                i16 += this.A0f[readPosition];
                                                readPosition++;
                                                i15 = 255;
                                                totalSamplesSize = 0;
                                                i13 = 1;
                                            } else {
                                                throw L9.A01(A06(578, 37, 106), null);
                                            }
                                        } else {
                                            throw L9.A01(A06(951, 33, 73), null);
                                        }
                                    }
                                    this.A0f[this.A03 - 1] = ((i11 - this.A07) - i17) - i16;
                                } else {
                                    throw L9.A01(A06(1141, 25, 42) + i14, null);
                                }
                            } else {
                                int byteValue = 0;
                                int i19 = 4;
                                for (int i21 = 0; i21 < totalSamplesSize - 1; i21++) {
                                    this.A0f[i21] = 0;
                                    do {
                                        i19++;
                                        A0E(q92, i19);
                                        int totalSamplesSize4 = i19 - 1;
                                        i12 = this.A0l.A0l()[totalSamplesSize4] & 255;
                                        int[] iArr3 = this.A0f;
                                        int totalSamplesSize5 = iArr3[i21];
                                        iArr3[i21] = totalSamplesSize5 + i12;
                                    } while (i12 == 255);
                                    int totalSamplesSize6 = this.A0f[i21];
                                    byteValue += totalSamplesSize6;
                                }
                                int[] iArr4 = this.A0f;
                                int i22 = this.A03 - 1;
                                int totalSamplesSize7 = this.A07;
                                iArr4[i22] = ((i11 - totalSamplesSize7) - i19) - byteValue;
                                break;
                            }
                        } else {
                            int i23 = this.A07;
                            if (A0u[5].length() != 10) {
                                A0u[5] = "hy4";
                                int timecode3 = this.A03;
                                int i24 = ((i11 - i23) - 4) / timecode3;
                                int[] iArr5 = this.A0f;
                                int blockLacingSampleSize = this.A03;
                                Arrays.fill(iArr5, 0, blockLacingSampleSize, i24);
                            } else {
                                String[] strArr2 = A0u;
                                strArr2[1] = "hXaaLyAAs1rbtHuE3nGzIkSJNLU6k100";
                                strArr2[7] = "oJuakIPGsIaLx04h8jFWtPxREsKAEmnI";
                                int i25 = ((i11 - i23) - 4) / this.A03;
                                int[] iArr6 = this.A0f;
                                int blockLacingSampleSize2 = this.A03;
                                Arrays.fill(iArr6, 0, blockLacingSampleSize2, i25);
                            }
                        }
                    } else {
                        this.A03 = 1;
                        this.A0f = A0P(this.A0f, 1);
                        this.A0f[0] = (i11 - this.A07) - 3;
                    }
                    this.A0F = this.A0G + A03((this.A0l.A0l()[0] << 8) | (this.A0l.A0l()[1] & 255));
                    int timecode4 = c1449aa.A0V;
                    int timecode5 = (timecode4 == 2 || (i5 == 163 && (this.A0l.A0l()[2] & 128) == 128)) ? 1 : 0;
                    int timecode6 = timecode5 != 0 ? 1 : 0;
                    this.A02 = timecode6;
                    this.A05 = 2;
                    this.A04 = 0;
                }
                if (i5 == 163) {
                    while (i < timecode) {
                        int[] iArr7 = this.A0f;
                        int timecode7 = this.A04;
                        int iA02 = A02(q92, c1449aa, iArr7[timecode7], false);
                        long j12 = this.A0F;
                        int i26 = this.A04;
                        int timecode8 = c1449aa.A0I;
                        long j13 = j12 + ((i26 * timecode8) / 1000);
                        int timecode9 = this.A02;
                        A0I(c1449aa, j13, timecode9, iA02, 0);
                        this.A04++;
                    }
                    this.A05 = 0;
                    return;
                }
                while (this.A04 < this.A03) {
                    this.A0f[this.A04] = A02(q92, c1449aa, this.A0f[this.A04], true);
                    this.A04++;
                }
                return;
            case 165:
                if (this.A05 != 2) {
                    return;
                }
                A0H(this.A0P.get(this.A06), this.A01, q92, i11);
                return;
            case 16877:
                C1449aa c1449aaA05 = A05(i5);
                if (A0u[0].length() == 31) {
                    throw new RuntimeException();
                }
                A0u[5] = "Bd5sTjjGGlMqylLSfrerdCbcZQ";
                A0J(c1449aaA05, q92, i11);
                return;
            case 16981:
                A0D(i5);
                this.A0T.A0m = new byte[i11];
                q92.readFully(this.A0T.A0m, 0, i11);
                return;
            case 18402:
                byte[] bArr = new byte[i11];
                q92.readFully(bArr, 0, i11);
                A05(i5).A0a = new ZN(1, bArr, 0, 0);
                return;
            case 21419:
                Arrays.fill(this.A0m.A0l(), (byte) 0);
                q92.readFully(this.A0m.A0l(), 4 - i11, i11);
                this.A0m.A0f(0);
                this.A0C = (int) this.A0m.A0Q();
                return;
            case 25506:
                A0D(i5);
                this.A0T.A0j = new byte[i11];
                q92.readFully(this.A0T.A0j, 0, i11);
                return;
            case 30322:
                A0D(i5);
                this.A0T.A0l = new byte[i11];
                q92.readFully(this.A0T.A0l, 0, i11);
                return;
            default:
                throw L9.A01(A06(1126, 15, 80) + i5, null);
        }
    }

    public final void A0V(int i5, long j11) throws L9 {
        String strA06 = A06(42, 14, 97);
        switch (i5) {
            case MRAID_JS_WRITE_FAILED_VALUE:
                A05(i5).A0V = (int) j11;
                return;
            case PRIVACY_URL_ERROR_VALUE:
                A05(i5).A0f = j11 == 1;
                return;
            case 155:
                this.A0D = A03(j11);
                return;
            case 159:
                A05(i5).A0E = (int) j11;
                return;
            case 176:
                A05(i5).A0W = (int) j11;
                return;
            case 179:
                A0C(i5);
                this.A0R.A04(A03(j11));
                return;
            case 186:
                A05(i5).A0M = (int) j11;
                return;
            case AD_RESPONSE_EMPTY_VALUE:
                A05(i5).A0R = (int) j11;
                return;
            case 231:
                long jA03 = A03(j11);
                if (A0u[5].length() != 10) {
                    String[] strArr = A0u;
                    strArr[1] = "52iGOnF8sAKd7TeIDUT00zGei62YfQlH";
                    strArr[7] = "zdNaWTbJsyw02SdaQGKjaq2UXcrBxXHV";
                    this.A0G = jA03;
                    return;
                }
                throw new RuntimeException();
            case 238:
                this.A01 = (int) j11;
                return;
            case 241:
                if (this.A0d) {
                    return;
                }
                A0C(i5);
                String[] strArr2 = A0u;
                if (strArr2[6].charAt(9) != strArr2[2].charAt(9)) {
                    A0u[0] = "gUMGsllvtbNkA1aKoD6tLY2x9WdBpx";
                    this.A0Q.A04(j11);
                    this.A0d = true;
                    return;
                } else {
                    this.A0Q.A04(j11);
                    this.A0d = true;
                    return;
                }
            case 251:
                this.A0W = true;
                return;
            case 16871:
                A05(i5).A0n = (int) j11;
                return;
            case 16980:
                if (j11 == 3) {
                    return;
                } else {
                    throw L9.A01(A06(426, 16, 79) + j11 + strA06, null);
                }
            case 17029:
                if (j11 >= 1 && j11 <= 2) {
                    return;
                } else {
                    throw L9.A01(A06(559, 19, 95) + j11 + strA06, null);
                }
            case 17143:
                if (j11 == 1) {
                    return;
                } else {
                    throw L9.A01(A06(615, 16, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) + j11 + strA06, null);
                }
            case 18401:
                if (j11 == 5) {
                    return;
                } else {
                    throw L9.A01(A06(442, 15, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) + j11 + strA06, null);
                }
            case 18408:
                if (j11 == 1) {
                    return;
                } else {
                    throw L9.A01(A06(113, 22, 77) + j11 + strA06, null);
                }
            case 20529:
                if (j11 == 0) {
                    return;
                } else {
                    throw L9.A01(A06(457, 21, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) + j11 + strA06, null);
                }
            case 20530:
                String[] strArr3 = A0u;
                if (strArr3[6].charAt(9) != strArr3[2].charAt(9)) {
                    String[] strArr4 = A0u;
                    strArr4[3] = "Cv59KJKrR0tps5FmkhbxFTfn9ouit0UD";
                    strArr4[4] = "liGwdJA13SHAHMQsUXbT1GXi52Onn9ha";
                    if (j11 == 1) {
                        return;
                    }
                } else {
                    A0u[5] = "lGc0m1TKlQFBt";
                    if (j11 == 1) {
                        return;
                    }
                }
                throw L9.A01(A06(478, 21, 120) + j11 + strA06, null);
            case 21420:
                this.A0K = this.A0M + j11;
                return;
            case 21432:
                int i11 = (int) j11;
                A0D(i5);
                switch (i11) {
                    case 0:
                        this.A0T.A0U = 0;
                        return;
                    case 1:
                        this.A0T.A0U = 2;
                        return;
                    case 3:
                        this.A0T.A0U = 1;
                        return;
                    case 15:
                        this.A0T.A0U = 3;
                        return;
                    default:
                        return;
                }
            case 21680:
                A05(i5).A0L = (int) j11;
                return;
            case 21682:
                A05(i5).A0K = (int) j11;
                return;
            case 21690:
                A05(i5).A0J = (int) j11;
                return;
            case 21930:
                A05(i5).A0g = j11 == 1;
                return;
            case 21945:
                A0D(i5);
                String[] strArr5 = A0u;
                if (strArr5[1].charAt(8) != strArr5[7].charAt(8)) {
                    throw new RuntimeException();
                }
                String[] strArr6 = A0u;
                strArr6[1] = "t6EoqIWLssHLilzBaC3mt7aSx1Rglp3B";
                strArr6[7] = "hFHiNpaFswlzcwPeAp3PEP954UAGzW8f";
                switch ((int) j11) {
                    case 1:
                        this.A0T.A0F = 2;
                        return;
                    case 2:
                        this.A0T.A0F = 1;
                        return;
                    default:
                        return;
                }
            case 21946:
                A0D(i5);
                int i12 = (int) j11;
                String[] strArr7 = A0u;
                if (strArr7[6].charAt(9) == strArr7[2].charAt(9)) {
                    throw new RuntimeException();
                }
                String[] strArr8 = A0u;
                strArr8[3] = "icGEWmiHnnjih8kbTQb6JCfYXldqmIbJ";
                strArr8[4] = "1A3ABsg8w5Q0gexuCnbrDxHaxk8pwv73";
                int colorTransfer = ColorInfo.A01(i12);
                if (colorTransfer == -1) {
                    return;
                }
                this.A0T.A0H = colorTransfer;
                return;
            case 21947:
                A0D(i5);
                this.A0T.A0h = true;
                int iA00 = ColorInfo.A00((int) j11);
                if (iA00 == -1) {
                    return;
                }
                this.A0T.A0G = iA00;
                return;
            case 21948:
                A05(i5).A0O = (int) j11;
                return;
            case 21949:
                A05(i5).A0P = (int) j11;
                return;
            case 21998:
                A05(i5).A0N = (int) j11;
                return;
            case 22186:
                A05(i5).A0X = j11;
                return;
            case 22203:
                A05(i5).A0Y = j11;
                return;
            case 25188:
                A05(i5).A0D = (int) j11;
                return;
            case 30114:
                this.A0E = j11;
                return;
            case 30321:
                A0D(i5);
                switch ((int) j11) {
                    case 0:
                        C1449aa c1449aa = this.A0T;
                        if (A0u[5].length() != 10) {
                            A0u[5] = "aN9h0R0mjPFVivU";
                            c1449aa.A0S = 0;
                            return;
                        } else {
                            c1449aa.A0S = 0;
                            return;
                        }
                    case 1:
                        this.A0T.A0S = 1;
                        return;
                    case 2:
                        this.A0T.A0S = 2;
                        return;
                    case 3:
                        C1449aa c1449aa2 = this.A0T;
                        if (A0u[5].length() != 10) {
                            A0u[0] = "prndpuhqxsYFNoMyrRl";
                            c1449aa2.A0S = 3;
                            return;
                        }
                        throw new RuntimeException();
                    default:
                        return;
                }
            case 2352003:
                A05(i5).A0I = (int) j11;
                return;
            case 2807729:
                this.A0O = j11;
                return;
            default:
                return;
        }
    }

    public final void A0W(int i5, long j11, long j12) throws L9 {
        A09();
        switch (i5) {
            case 160:
                this.A0W = false;
                this.A0E = 0L;
                return;
            case 174:
                this.A0T = new C1449aa();
                return;
            case 187:
                this.A0d = false;
                return;
            case 19899:
                this.A0C = -1;
                this.A0K = -1L;
                return;
            case 20533:
                C1449aa c1449aaA05 = A05(i5);
                String[] strArr = A0u;
                if (strArr[6].charAt(9) != strArr[2].charAt(9)) {
                    String[] strArr2 = A0u;
                    strArr2[1] = "mFW7Td0qsfohCgUmhayUlqXtb6rLWQIv";
                    strArr2[7] = "tUA2AFYnsh1YTSKRpVKlRxtretRcDhD9";
                    c1449aaA05.A0i = true;
                    return;
                }
                throw new RuntimeException();
            case 21968:
                A05(i5).A0h = true;
                return;
            case 25152:
            default:
                return;
            case 408125543:
                if (this.A0M == -1 || this.A0M == j11) {
                    this.A0M = j11;
                    this.A0N = j12;
                    return;
                }
                throw L9.A01(A06(886, 39, 88), null);
            case 475249515:
                this.A0R = new MW();
                this.A0Q = new MW();
                return;
            case 524531317:
                if (this.A0e) {
                    return;
                }
                if (this.A0s && this.A0H != -1) {
                    this.A0c = true;
                    return;
                } else {
                    this.A0S.AKP(new Q4(this.A0J));
                    this.A0e = true;
                    return;
                }
        }
    }

    @MetaExoPlayerCustomization
    public final void A0X(int i5, String str) throws L9 {
        switch (i5) {
            case STORE_REGION_CODE_ERROR_VALUE:
                A05(i5).A0d = str;
                return;
            case 17026:
                if (A06(1375, 4, 60).equals(str) || A06(1357, 8, 34).equals(str)) {
                    return;
                } else {
                    throw L9.A01(A06(551, 8, 64) + str + A06(42, 14, 97), null);
                }
            case 17827:
                this.A0U = str;
                return;
            case 21358:
                A05(i5).A0e = str;
                return;
            case 2274716:
                A05(i5).A0o = str;
                return;
            default:
                return;
        }
    }

    public final boolean A0Y(int i5) {
        return i5 == 357149030 || i5 == 524531317 || i5 == 475249515 || i5 == 374648427;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A0S = interfaceC1384Yw;
    }

    /* JADX WARN: Incorrect condition in loop: B:19:0x0046 */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        this.A0X = false;
        boolean zAIb = true;
        while (zAIb) {
            boolean z11 = this.A0X;
            if (A0u[5].length() == 10) {
                throw new RuntimeException();
            }
            String[] strArr = A0u;
            strArr[3] = "4tqi7bFn1JEEfWMdp0bGnvqntlSkZWhx";
            strArr[4] = "CbmYgkIMdx7S7TZ0HGbtU5a0tFNS6npw";
            if (z11) {
                break;
            }
            zAIb = this.A0q.AIb(q92);
            if (zAIb && A0L(zh2, q92.A9Q())) {
                return 1;
            }
        }
        if (zAIb) {
            return 0;
        }
        for (int i5 = 0; i5 < i; i5++) {
            C1449aa c1449aaValueAt = this.A0P.valueAt(i5);
            c1449aaValueAt.A06();
            c1449aaValueAt.A0E();
        }
        return -1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x001e */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void AKO(long j11, long j12) {
        this.A0G = -9223372036854775807L;
        this.A05 = 0;
        this.A0q.reset();
        this.A0r.A06();
        A0A();
        for (int i5 = 0; i5 < i; i5++) {
            this.A0P.valueAt(i5).A0F();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        return new C1450ab().A01(q92);
    }
}
