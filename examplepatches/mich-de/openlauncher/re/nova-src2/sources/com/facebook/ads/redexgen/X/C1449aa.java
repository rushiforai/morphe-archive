package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.ads.androidx.media3.extractor.mkv.MatroskaExtractor;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* renamed from: com.facebook.ads.redexgen.X.aa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1449aa {
    public static byte[] A0p;
    public static String[] A0q = {"6Stc8iZPoFcOxky4AKyIOhqEtLhd2Ru3", "E2hq", "54BgyBUXc9BLpe67xq6fYk1XYUe", "dbjASj3WlxThJbxu", "7pgfs5pfKZhF9UIqj", "czwWgTX9C6g1dqDSsOc", "mW9T", "zTmILFnpMPSdbXoG"};
    public int A0I;
    public int A0N;
    public int A0Q;
    public int A0R;
    public int A0V;
    public DrmInitData A0Z;
    public ZN A0a;
    public ZP A0b;
    public ZQ A0c;
    public String A0d;
    public String A0e;
    public boolean A0g;
    public boolean A0i;
    public byte[] A0j;
    public byte[] A0k;
    public byte[] A0m;
    public int A0n;
    public int A0W = -1;
    public int A0M = -1;
    public int A0L = -1;
    public int A0J = -1;
    public int A0K = 0;
    public int A0S = -1;
    public float A0A = 0.0f;
    public float A08 = 0.0f;
    public float A09 = 0.0f;
    public byte[] A0l = null;
    public int A0U = -1;
    public boolean A0h = false;
    public int A0G = -1;
    public int A0H = -1;
    public int A0F = -1;
    public int A0O = 1000;
    public int A0P = 200;
    public float A06 = -1.0f;
    public float A07 = -1.0f;
    public float A04 = -1.0f;
    public float A05 = -1.0f;
    public float A02 = -1.0f;
    public float A03 = -1.0f;
    public float A0B = -1.0f;
    public float A0C = -1.0f;
    public float A00 = -1.0f;
    public float A01 = -1.0f;
    public int A0E = 1;
    public int A0D = -1;
    public int A0T = 8000;
    public long A0X = 0;
    public long A0Y = 0;
    public boolean A0f = true;
    public String A0o = A03(1067, 3, 80);

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static Pair<String, List<byte[]>> A02(C1084Mk c1084Mk) throws L9 {
        try {
            c1084Mk.A0g(16);
            long jA0O = c1084Mk.A0O();
            if (jA0O == 1482049860) {
                return new Pair<>(A03(1117, 10, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE), null);
            }
            if (jA0O == 859189832) {
                return new Pair<>(A03(1088, 10, 104), null);
            }
            if (jA0O != 826496599) {
                MV.A07(A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15), A03(492, 51, 90));
                return new Pair<>(A03(1189, 15, 20), null);
            }
            byte[] bArrA0l = c1084Mk.A0l();
            for (int iA09 = c1084Mk.A09() + 20; iA09 < bArrA0l.length - 4; iA09++) {
                if (bArrA0l[iA09] == 0 && bArrA0l[iA09 + 1] == 0 && bArrA0l[iA09 + 2] == 1 && bArrA0l[iA09 + 3] == 15) {
                    return new Pair<>(A03(1179, 10, 68), Collections.singletonList(Arrays.copyOfRange(bArrA0l, iA09, bArrA0l.length)));
                }
            }
            throw L9.A01(A03(267, 45, 67), null);
        } catch (ArrayIndexOutOfBoundsException unused) {
            throw L9.A01(A03(166, 33, 88), null);
        }
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0p, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 71);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A0p = new byte[]{86, 88, 43, 29, 12, 12, 17, 22, 31, 88, 21, 17, 21, 29, 44, 1, 8, 29, 88, 12, 23, 88, 126, 96, 126, 126, 124, 24, 6, 24, 26, 106, 52, 42, 49, 33, 38, 49, 47, 52, 36, 35, 95, 53, 40, 32, 34, 53, 35, 35, 75, 85, 78, 94, 89, 37, 70, 69, 89, 89, 70, 79, 89, 89, 102, 120, 98, 102, 100, 20, 30, 0, 25, 19, 30, 28, 57, 39, 53, 40, 61, 63, 87, 52, 74, 114, 108, 126, 99, 118, 116, 28, AbstractJsonLexerKt.TC_INVALID, 0, 38, 56, 42, 52, 72, 38, 36, 42, 75, 85, 69, 90, 95, 89, 106, 116, 123, 104, 102, 4, 109, 103, 100, 106, AbstractJsonLexerKt.TC_INVALID, 4, 98, 110, 110, 110, 76, 82, 93, 78, 64, 34, 68, 67, 89, 34, 79, 68, 74, 16, 14, 1, 18, 28, 126, 24, 31, 5, 126, 29, 24, 5, 22, 8, 3, 5, 2, 18, 31, 19, 17, 15, 6, 31, 2, 18, 25, 3, 90, 109, 109, 112, 109, 63, 111, 126, 109, 108, 118, 113, 120, 63, 89, 112, 106, 109, 92, 92, 63, 111, 109, 118, 105, 126, 107, 122, 63, 123, 126, 107, 126, 126, 73, 73, 84, 73, 27, 75, 90, 73, 72, 82, 85, 92, 27, 118, 104, 20, 122, 120, 118, 27, 88, 84, 95, 94, 88, 27, 75, 73, 82, 77, 90, 79, 94, 10, 61, 61, 32, 61, 111, 63, 46, 61, 60, 38, 33, 40, 111, 57, 32, 61, 45, 38, 60, 111, 44, 32, 43, 42, 44, 111, 63, 61, 38, 57, 46, 59, 42, 66, 101, 109, 104, 97, 96, 36, 112, 107, 36, 98, 109, 106, 96, 36, 66, 107, 113, 118, 71, 71, 36, 82, 71, 53, 36, 109, 106, 109, 112, 109, 101, 104, 109, 126, 101, 112, 109, 107, 106, 36, 96, 101, 112, 101, 5, 41, 60, 58, 39, 59, 35, 41, 13, 48, 60, 58, 41, 43, 60, 39, 58, 96, 68, 94, 94, 68, 67, 74, 13, 110, 66, 73, 72, 78, 125, 95, 68, 91, 76, 89, 72, 13, 75, 66, 95, 13, 78, 66, 73, 72, 78, 13, 94, AbstractJsonLexerKt.TC_INVALID, 126, 61, 64, 83, 93, 48, 93, 67, 63, 81, 83, 93, 48, 121, 99, 48, 101, 126, 99, 101, 96, 96, AbstractJsonLexerKt.TC_INVALID, 98, 100, 117, 116, 62, 48, 67, 117, 100, 100, 121, 126, 119, 48, 125, 121, 125, 117, 68, 105, 96, 117, 48, 100, AbstractJsonLexerKt.TC_INVALID, 48, 66, 78, 85, 71, 83, 66, 68, 83, 123, 119, 96, 108, 101, 126, 7, 120, 111, 123, 30, 18, 25, 8, 21, 25, 98, 12, 30, 30, 125, 113, 122, 107, 118, 122, 1, 123, 122, 104, 22, 64, 76, 71, 86, 75, 71, 60, 68, 86, 81, 69, 71, 71, 61, 49, 56, 33, 44, 61, 59, 44, 88, 99, 104, 117, 125, 104, 110, 121, 104, 105, 45, 64, 68, 64, 72, 45, 121, 116, 125, 104, 35, 72, 115, 118, 115, 114, 106, 115, 61, 91, 114, 104, 111, 94, 94, 51, 61, 78, 120, 105, 105, 116, 115, 122, 61, 112, 116, 112, 120, 73, 100, 109, 120, 61, 105, 114, 61, 107, 116, 121, 120, 114, 50, 101, 48, 104, 115, 118, 115, 114, 106, 115, 50, 9, 21, 2, 4, 8, 0, 9, 14, 29, 2, 3, 71, 4, 8, 3, 2, 4, 71, 14, 3, 2, 9, 19, 14, 1, 14, 2, 21, 73, 0, 59, 38, 32, 37, 37, 58, 39, 33, 48, 49, 117, 5, 22, 24, 117, 55, 60, 33, 117, 49, 48, 37, 33, 61, 111, 117, 45, 22, 11, 13, 8, 8, 23, 10, 12, 29, 28, 88, 26, 17, 31, 88, 29, 22, 28, 17, 25, 22, 88, 40, 59, 53, 88, 26, 17, 12, 88, 28, 29, 8, 12, 16, 66, 88, 55, 12, 17, 23, 18, 18, 13, 16, 22, 7, 6, 66, 4, 14, 13, 3, 22, 11, 12, 5, 66, 18, 13, 11, 12, 22, 66, 50, 33, 47, 66, 0, 11, 22, 66, 6, 7, 18, 22, 10, 88, 66, 126, 69, 88, 94, 91, 91, 68, 89, 95, 78, 79, 11, 71, 66, 95, 95, 71, 78, 11, 78, 69, 79, 66, 74, 69, 11, 123, 104, 102, 11, 73, 66, 95, 11, 79, 78, 91, 95, 67, 17, 11, 79, 70, 88, 79, 40, 64, 73, 91, 70, 83, 81, 36, 93, 84, 70, 91, 78, 76, 63, 36, 66, 88, 68, 36, 74, 91, 79, 70, 84, 73, 92, 94, 45, 54, 80, 74, 86, 54, 88, 74, 73, 7, 14, 28, 1, 20, 22, 101, 126, 24, 2, 30, 126, 16, 7, 18, 43, 34, 48, 45, 56, 58, 73, 82, 52, 46, 50, 82, 46, 45, 79, 70, 84, 73, 92, 94, 81, 54, 80, 74, 86, 54, 81, 92, 79, 90, 23, 30, 12, 18, 110, 23, 7, 22, 110, 7, 14, 20, 19, 2, 2, 83, 90, 81, 77, 64, 74, 87, 68, 115, 122, 115, 117, 29, 107, 98, 107, 109, 4, 26, 11, 11, 23, 18, 24, 26, 15, 18, 20, 21, 84, 31, 13, 25, 8, 14, 25, 8, 126, 111, 111, 115, 118, 124, 126, 107, 118, 112, 113, 48, 111, 120, 108, 14, 31, 31, 3, 6, 12, 14, 27, 6, 0, 1, 64, 25, 0, 13, 28, 26, 13, 107, 122, 122, 102, 99, 105, 107, 126, 99, 101, 100, 37, 114, 39, 121, AbstractJsonLexerKt.TC_INVALID, 104, 120, 99, 122, 93, 73, 88, 85, 83, 19, 93, 95, 15, 83, 71, 86, 91, 93, 29, 87, 83, 81, 1, 89, 77, 92, 81, 87, 23, 94, 84, 89, 91, 27, 15, 30, 19, 21, 85, 23, 10, 78, 27, 87, 22, 27, 14, 23, 66, 86, 71, 74, 76, 12, 78, 83, 70, 68, 1, 21, 4, 9, 15, 79, 13, 16, 5, 7, 77, 44, 82, 13, 25, 8, 5, 3, 67, 3, 28, 25, 31, 6, 18, 3, 14, 8, 72, 21, 6, 16, 64, 84, 
        69, 72, 78, 14, 85, 83, 84, 68, 12, 73, 69, 77, 89, 72, 69, 67, 3, 90, 66, 72, 2, 72, 88, 95, 8, 28, 13, 0, 6, 70, 31, 7, 13, 71, 13, 29, 26, 71, 1, 13, 19, 7, 22, 27, 29, 93, 4, 29, 0, 16, 27, 1, 28, 8, 25, 20, 18, 82, 5, 80, 8, 19, 22, 19, 18, 10, 19, 114, 121, 112, 126, 111, 114, 126, 37, 124, 126, 126, 119, 102, 123, 119, 44, 123, 46, 112, 112, 98, 89, 70, 75, 74, 64, 0, 28, 72, 95, 95, 19, 12, 1, 0, 10, 74, 4, 19, 85, 84, AbstractJsonLexerKt.TC_INVALID, 96, 109, 108, 102, 38, 104, AbstractJsonLexerKt.TC_INVALID, 106, 78, 81, 92, 93, 87, 23, 92, 81, 78, 64, 72, 87, 90, 91, 81, 17, 90, 81, 82, 92, 71, 19, 72, 87, 77, 87, 81, 80, 115, 108, 97, 96, 106, 42, 109, 96, 115, 102, 105, 118, 123, 122, 112, 48, 114, 111, 43, 105, 50, 122, 108, 13, 18, 31, 30, 20, 84, 22, 11, 30, 28, 73, 117, 106, 103, 102, 108, 44, 116, 117, 96, 50, 37, 58, 55, 54, 60, 124, 43, 126, 38, 61, 56, 61, 60, 36, 61, 43, 52, 57, 56, 50, 114, 37, 112, 43, 51, 57, 115, 50, 51, 111, 115, 43, 45, 101, 60, 35, 46, 47, 37, 101, 50, 103, 60, 36, 46, 100, 37, 36, 120, 100, 60, 58, 115};
    }

    static {
        A07();
    }

    public static List<byte[]> A05(byte[] bArr) throws L9 {
        String strA03 = A03(233, 34, 8);
        try {
            if (bArr[0] == 2) {
                int vorbisInfoLength = 1;
                int i5 = 0;
                while ((bArr[vorbisInfoLength] & 255) == 255) {
                    i5 += 255;
                    vorbisInfoLength++;
                }
                int i11 = vorbisInfoLength + 1;
                int i12 = i5 + (bArr[vorbisInfoLength] & 255);
                int offset = 0;
                while ((bArr[i11] & 255) == 255) {
                    offset += 255;
                    i11++;
                }
                int vorbisInfoLength2 = i11 + 1;
                int offset2 = offset + (bArr[i11] & 255);
                if (bArr[vorbisInfoLength2] == 1) {
                    byte[] bArr2 = new byte[i12];
                    System.arraycopy(bArr, vorbisInfoLength2, bArr2, 0, i12);
                    int vorbisInfoLength3 = vorbisInfoLength2 + i12;
                    if (bArr[vorbisInfoLength3] == 3) {
                        int vorbisInfoLength4 = vorbisInfoLength3 + offset2;
                        if (bArr[vorbisInfoLength4] == 5) {
                            byte[] bArr3 = new byte[bArr.length - vorbisInfoLength4];
                            System.arraycopy(bArr, vorbisInfoLength4, bArr3, 0, bArr.length - vorbisInfoLength4);
                            ArrayList arrayList = new ArrayList(2);
                            arrayList.add(bArr2);
                            arrayList.add(bArr3);
                            return arrayList;
                        }
                        throw L9.A01(strA03, null);
                    }
                    throw L9.A01(strA03, null);
                }
                throw L9.A01(strA03, null);
            }
            throw L9.A01(strA03, null);
        } catch (ArrayIndexOutOfBoundsException unused) {
            throw L9.A01(strA03, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @EnsuresNonNull
    public void A06() {
        AbstractC1062Ln.A01(this.A0b);
    }

    public static boolean A09(C1084Mk c1084Mk) throws L9 {
        try {
            int iA0G = c1084Mk.A0G();
            if (iA0G == 1) {
                return true;
            }
            if (iA0G != 65534) {
                return false;
            }
            c1084Mk.A0f(24);
            if (c1084Mk.A0P() == MatroskaExtractor.A0x.getMostSignificantBits()) {
                if (c1084Mk.A0P() == MatroskaExtractor.A0x.getLeastSignificantBits()) {
                    return true;
                }
            }
            return false;
        } catch (ArrayIndexOutOfBoundsException unused) {
            throw L9.A01(A03(199, 34, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @MetaExoPlayerCustomization
    public boolean A0B(boolean z11) {
        return this.A0N > 0;
    }

    private byte[] A0C() {
        if (this.A06 == -1.0f || this.A07 == -1.0f || this.A04 == -1.0f || this.A05 == -1.0f) {
            return null;
        }
        float f11 = this.A02;
        String[] strArr = A0q;
        if (strArr[5].length() == strArr[2].length()) {
            throw new RuntimeException();
        }
        A0q[4] = "67Ke";
        if (f11 == -1.0f || this.A03 == -1.0f || this.A0B == -1.0f || this.A0C == -1.0f || this.A00 == -1.0f || this.A01 == -1.0f) {
            return null;
        }
        byte[] bArr = new byte[25];
        ByteBuffer hdrStaticInfo = ByteBuffer.wrap(bArr).order(ByteOrder.LITTLE_ENDIAN);
        hdrStaticInfo.put((byte) 0);
        hdrStaticInfo.putShort((short) ((this.A06 * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A07 * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A04 * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A05 * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A02 * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A03 * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A0B * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) ((this.A0C * 50000.0f) + 0.5f));
        hdrStaticInfo.putShort((short) (this.A00 + 0.5f));
        hdrStaticInfo.putShort((short) (this.A01 + 0.5f));
        hdrStaticInfo.putShort((short) this.A0O);
        hdrStaticInfo.putShort((short) this.A0P);
        return bArr;
    }

    @EnsuresNonNull
    private byte[] A0D(String str) throws L9 {
        if (this.A0j != null) {
            byte[] bArr = this.A0j;
            String[] strArr = A0q;
            if (strArr[5].length() == strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0q;
            strArr2[5] = "0tKXjk682b57A6MpA0L";
            strArr2[2] = "HE9uwlA4vP88rLl3nLt1cg1AHfL";
            return bArr;
        }
        throw L9.A01(A03(329, 31, 106) + str, null);
    }

    @RequiresNonNull
    public final void A0E() {
        if (this.A0c != null) {
            this.A0c.A05(this.A0b, this.A0a);
        }
    }

    public final void A0F() {
        if (this.A0c != null) {
            this.A0c.A02();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:114:0x02ff  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x031e  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x032a  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0344  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0350  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0370  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x03ab  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x03f1  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0464  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x04ab  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x052d  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0543  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x054f  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0583  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0596  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x05a2  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x05d9  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x05e7  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x05f5  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x061b  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0665  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x067d  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x0689  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x06a2  */
    /* JADX WARN: Removed duplicated region for block: B:167:0x06c4  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x06e6  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x06fd  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x0708  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x0713  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x071e  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x072c  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x0759  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x077f  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x07bb  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x0821  */
    /* JADX WARN: Removed duplicated region for block: B:225:0x0841  */
    /* JADX WARN: Removed duplicated region for block: B:229:0x085c  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x095f  */
    /* JADX WARN: Removed duplicated region for block: B:270:0x0962  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0031  */
    @EnsuresNonNull
    @MetaExoPlayerCustomization
    @RequiresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0G(InterfaceC1384Yw interfaceC1384Yw, int i5) throws L9 {
        char c11;
        String strA03;
        int i11;
        int i12;
        int i13;
        String[] strArr;
        C1380Ys c1380YsA00;
        int i14 = -1;
        int iA03 = -1;
        List<byte[]> listSingletonList = null;
        String str = null;
        String str2 = this.A0d;
        switch (str2.hashCode()) {
            case -2095576542:
                String[] strArr2 = A0q;
                if (strArr2[3].length() != strArr2[7].length()) {
                    throw new RuntimeException();
                }
                String[] strArr3 = A0q;
                strArr3[5] = "097o2f7JiQrHpKtAtnv";
                strArr3[2] = "cscoIBanIGAYXvJUVqd7HTe9h1H";
                c11 = str2.equals(A03(733, 14, 76)) ? (char) 6 : (char) 65535;
                String strA032 = A03(0, 22, 63);
                String strA033 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                    case 0:
                        strA03 = A03(1204, 19, 26);
                        break;
                    case 1:
                        strA03 = A03(1223, 19, 13);
                        break;
                    case 2:
                        strA03 = A03(1098, 10, 34);
                        break;
                    case 3:
                        strA03 = A03(1168, 11, 60);
                        break;
                    case 4:
                    case 5:
                    case 6:
                        strA03 = A03(1155, 13, 88);
                        if (this.A0j != null) {
                            listSingletonList = Collections.singletonList(this.A0j);
                            break;
                        } else {
                            listSingletonList = null;
                            break;
                        }
                    case 7:
                        strA03 = A03(1108, 9, 78);
                        C1370Yh c1370YhA00 = C1370Yh.A00(new C1084Mk(A0D(this.A0d)));
                        listSingletonList = c1370YhA00.A05;
                        this.A0Q = c1370YhA00.A02;
                        str = c1370YhA00.A04;
                        break;
                    case '\b':
                        strA03 = A03(1145, 10, 66);
                        Z7 z7A00 = Z7.A00(new C1084Mk(A0D(this.A0d)));
                        listSingletonList = z7A00.A08;
                        this.A0Q = z7A00.A05;
                        str = z7A00.A07;
                        break;
                    case '\t':
                        Pair<String, List<byte[]>> pairA02 = A02(new C1084Mk(A0D(this.A0d)));
                        strA03 = (String) pairA02.first;
                        listSingletonList = (List) pairA02.second;
                        break;
                    case '\n':
                        strA03 = A03(1189, 15, 20);
                        break;
                    case 11:
                        strA03 = A03(1040, 12, 53);
                        i14 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        listSingletonList = A05(A0D(this.A0d));
                        break;
                    case '\f':
                        strA03 = A03(979, 10, 43);
                        i14 = 5760;
                        listSingletonList = new ArrayList<>(3);
                        listSingletonList.add(A0D(this.A0d));
                        listSingletonList.add(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putLong(this.A0X).array());
                        listSingletonList.add(ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN).putLong(this.A0Y).array());
                        break;
                    case '\r':
                        strA03 = A03(941, 15, 61);
                        listSingletonList = Collections.singletonList(A0D(this.A0d));
                        YY yyA03 = YZ.A03(this.A0j);
                        this.A0T = yyA03.A01;
                        this.A0E = yyA03.A00;
                        str = yyA03.A02;
                        break;
                    case 14:
                        strA03 = A03(966, 13, 39);
                        i14 = androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        break;
                    case 15:
                        strA03 = A03(956, 10, 100);
                        i14 = androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        break;
                    case 16:
                        String[] strArr4 = A0q;
                        if (strArr4[1].length() != strArr4[6].length()) {
                            A0q[4] = "EKok";
                            strA03 = A03(912, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
                            break;
                        } else {
                            String[] strArr5 = A0q;
                            strArr5[5] = "6QUONKhA6O8Ed3xalfR";
                            strArr5[2] = "NOhuNOvejIHrAqnQk0hIkKstV1x";
                            strA03 = A03(912, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
                            break;
                        }
                    case 17:
                        strA03 = A03(921, 10, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
                        break;
                    case 18:
                        strA03 = A03(998, 13, 102);
                        this.A0c = new ZQ();
                        break;
                    case 19:
                    case 20:
                        String[] strArr6 = A0q;
                        if (strArr6[5].length() != strArr6[2].length()) {
                            String[] strArr7 = A0q;
                            strArr7[1] = "hW4H";
                            strArr7[6] = "Xk0R";
                            strA03 = A03(TTAdConstant.IMAGE_MODE_1011, 13, 107);
                            break;
                        } else {
                            strA03 = A03(TTAdConstant.IMAGE_MODE_1011, 13, 107);
                            break;
                        }
                    case 21:
                        strA03 = A03(1024, 16, 46);
                        break;
                    case 22:
                        strA03 = A03(931, 10, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                        listSingletonList = Collections.singletonList(A0D(this.A0d));
                        break;
                    case 23:
                        strA03 = A03(989, 9, 32);
                        if (A09(new C1084Mk(A0D(this.A0d)))) {
                            iA03 = N1.A03(this.A0D);
                            if (iA03 == 0) {
                                iA03 = -1;
                                strA03 = A03(1052, 15, 58);
                                MV.A07(strA033, A03(573, 27, 18) + this.A0D + strA032 + strA03);
                                break;
                            }
                        } else {
                            strA03 = A03(1052, 15, 58);
                            MV.A07(strA033, A03(360, 51, 87) + strA03);
                            break;
                        }
                        break;
                    case 24:
                        strA03 = A03(989, 9, 32);
                        iA03 = N1.A03(this.A0D);
                        if (iA03 == 0) {
                            iA03 = -1;
                            strA03 = A03(1052, 15, 58);
                            MV.A07(strA033, A03(680, 41, 108) + this.A0D + strA032 + strA03);
                            break;
                        }
                        break;
                    case 25:
                        strA03 = A03(989, 9, 32);
                        if (this.A0D == 8) {
                            iA03 = 3;
                            break;
                        } else {
                            int i15 = this.A0D;
                            if (A0q[0].charAt(31) == '3') {
                                String[] strArr8 = A0q;
                                strArr8[5] = "VzBIh1RO7Cltss8V3pR";
                                strArr8[2] = "dQGUSISo11Iibn7HU7JzvLc2G35";
                                if (i15 == 16) {
                                    iA03 = 268435456;
                                    break;
                                } else {
                                    iA03 = -1;
                                    strA03 = A03(1052, 15, 58);
                                    MV.A07(strA033, A03(600, 38, 63) + this.A0D + strA032 + strA03);
                                    break;
                                }
                            } else {
                                throw new RuntimeException();
                            }
                        }
                    case 26:
                        strA03 = A03(989, 9, 32);
                        if (this.A0D == 32) {
                            iA03 = 4;
                            break;
                        } else {
                            iA03 = -1;
                            strA03 = A03(1052, 15, 58);
                            MV.A07(strA033, A03(638, 42, 37) + this.A0D + strA032 + strA03);
                            break;
                        }
                    case 27:
                        String[] strArr9 = A0q;
                        if (strArr9[3].length() != strArr9[7].length()) {
                            A0q[0] = "NijPkStBVwwMhuKrxoWoAUENiQXkBng3";
                            strA03 = A03(892, 17, 69);
                            break;
                        } else {
                            String[] strArr10 = A0q;
                            strArr10[5] = "MMbSQGvDXRPiQfFBd1V";
                            strArr10[2] = "W7H7FZnwTvozyyvBSyvNRi8FXXk";
                            strA03 = A03(892, 20, 77);
                            break;
                        }
                    case 28:
                        strA03 = A03(1078, 10, 68);
                        listSingletonList = XR.A03(MatroskaExtractor.A0y, A0D(this.A0d));
                        break;
                    case 29:
                        strA03 = A03(1070, 8, 77);
                        break;
                    case 30:
                        strA03 = A03(874, 18, 40);
                        listSingletonList = XR.A03(A0D(this.A0d));
                        break;
                    case 31:
                        strA03 = A03(859, 15, 88);
                        break;
                    case ' ':
                        strA03 = A03(840, 19, 60);
                        byte[] bArr = new byte[4];
                        System.arraycopy(A0D(this.A0d), 0, bArr, 0, 4);
                        listSingletonList = XR.A03(bArr);
                        break;
                    default:
                        throw L9.A01(A03(543, 30, 32), null);
                }
                if (this.A0k != null && (c1380YsA00 = C1380Ys.A00(new C1084Mk(this.A0k))) != null) {
                    str = c1380YsA00.A02;
                    strA03 = A03(1127, 18, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
                }
                int i16 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke = new C1029Ke();
                if (L8.A0C(strA03)) {
                    i11 = 1;
                    C1029Ke c1029KeA0b = c1029Ke.A0b(this.A0E);
                    String[] strArr11 = A0q;
                    if (strArr11[3].length() != strArr11[7].length()) {
                        c1029KeA0b.A0m(this.A0T).A0i(iA03);
                    } else {
                        String[] strArr12 = A0q;
                        strArr12[1] = "vl3p";
                        strArr12[6] = "0062";
                        c1029KeA0b.A0m(this.A0T).A0i(iA03);
                    }
                } else {
                    if (L8.A0F(strA03)) {
                        i11 = 2;
                        if (this.A0K == 0) {
                            if (this.A0L == -1) {
                                i12 = this.A0W;
                            } else {
                                i12 = this.A0L;
                            }
                            this.A0L = i12;
                            if (this.A0J == -1) {
                                i13 = this.A0M;
                            } else {
                                i13 = this.A0J;
                            }
                            this.A0J = i13;
                        }
                        float f11 = -1.0f;
                        if (this.A0L != -1 && this.A0J != -1) {
                            f11 = (this.A0M * this.A0L) / (this.A0W * this.A0J);
                        }
                        ColorInfo colorInfo = null;
                        if (this.A0h) {
                            colorInfo = new ColorInfo(this.A0G, this.A0F, this.A0H, A0C());
                        }
                        int iIntValue = -1;
                        String str3 = this.A0e;
                        String[] strArr13 = A0q;
                        if (strArr13[5].length() != strArr13[2].length()) {
                            A0q[0] = "8xIL423HLWl21wbkkH1JrpJPMotRimp3";
                            if (str3 != null) {
                                if (MatroskaExtractor.A0w.containsKey(this.A0e)) {
                                    iIntValue = ((Integer) MatroskaExtractor.A0w.get(this.A0e)).intValue();
                                }
                            }
                            if (this.A0S == 0) {
                                float f12 = this.A0A;
                                String[] strArr14 = A0q;
                                if (strArr14[1].length() != strArr14[6].length()) {
                                    if (Float.compare(f12, 0.0f) == 0) {
                                        int iCompare = Float.compare(this.A08, 0.0f);
                                        String[] strArr15 = A0q;
                                        if (strArr15[1].length() == strArr15[6].length()) {
                                            A0q[4] = b.f42142b;
                                            if (iCompare == 0) {
                                                if (Float.compare(this.A09, 0.0f) == 0) {
                                                    iIntValue = 0;
                                                } else if (Float.compare(this.A08, 90.0f) == 0) {
                                                    iIntValue = 90;
                                                } else if (Float.compare(this.A08, -180.0f) == 0 || Float.compare(this.A08, 180.0f) == 0) {
                                                    iIntValue = 180;
                                                } else if (Float.compare(this.A08, -90.0f) == 0) {
                                                    iIntValue = 270;
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    String[] strArr16 = A0q;
                                    strArr16[5] = "br7RWQjvSw1sD4yuyx2";
                                    strArr16[2] = "vwylnRIQYSwdHCsvR3YEuL8YMXK";
                                    if (Float.compare(f12, 0.0f) == 0) {
                                    }
                                }
                            }
                            c1029Ke.A0r(this.A0W).A0f(this.A0M).A0Y(f11).A0l(iIntValue).A13(this.A0l).A0o(this.A0U).A0t(colorInfo);
                        } else {
                            if (str3 != null) {
                            }
                            if (this.A0S == 0) {
                            }
                            c1029Ke.A0r(this.A0W).A0f(this.A0M).A0Y(f11).A0l(iIntValue).A13(this.A0l).A0o(this.A0U).A0t(colorInfo);
                        }
                        throw new RuntimeException();
                    }
                    if (A03(892, 20, 77).equals(strA03) || A03(1078, 10, 68).equals(strA03) || A03(1070, 8, 77).equals(strA03) || A03(874, 18, 40).equals(strA03) || A03(859, 15, 88).equals(strA03) || A03(840, 19, 60).equals(strA03)) {
                        i11 = 3;
                    } else {
                        throw L9.A01(A03(471, 21, 74), null);
                    }
                }
                if (this.A0e != null && !MatroskaExtractor.A0w.containsKey(this.A0e)) {
                    String str4 = this.A0e;
                    strArr = A0q;
                    if (strArr[1].length() == strArr[6].length()) {
                        String[] strArr17 = A0q;
                        strArr17[1] = "kgha";
                        strArr17[6] = "VVit";
                        c1029Ke.A0z(str4);
                    }
                    throw new RuntimeException();
                }
                VC vcA14 = c1029Ke.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14);
                return;
            case -2095575984:
                if (str2.equals(A03(777, 14, 58))) {
                    c11 = 4;
                }
                String strA0322 = A03(0, 22, 63);
                String strA0332 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                    str = c1380YsA00.A02;
                    strA03 = A03(1127, 18, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
                    break;
                }
                int i162 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                    String str42 = this.A0e;
                    strArr = A0q;
                    if (strArr[1].length() == strArr[6].length()) {
                    }
                    throw new RuntimeException();
                }
                VC vcA142 = c1029Ke2.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142);
                return;
            case -1985379776:
                if (str2.equals(A03(94, 8, 32))) {
                    c11 = 23;
                }
                String strA03222 = A03(0, 22, 63);
                String strA03322 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422 = c1029Ke22.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422);
                return;
            case -1784763192:
                if (str2.equals(A03(PerAppFeatureCatalog.MAX_TOOLS, 8, 16))) {
                    c11 = 18;
                }
                String strA032222 = A03(0, 22, 63);
                String strA033222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222 = c1029Ke222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222);
                return;
            case -1730367663:
                if (str2.equals(A03(158, 8, 23))) {
                    c11 = 11;
                }
                String strA0322222 = A03(0, 22, 63);
                String strA0332222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222 = c1029Ke2222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222);
                return;
            case -1482641358:
                if (str2.equals(A03(76, 9, 63))) {
                    c11 = 14;
                }
                String strA03222222 = A03(0, 22, 63);
                String strA03322222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222 = c1029Ke22222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222);
                return;
            case -1482641357:
                if (str2.equals(A03(85, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE))) {
                    c11 = 15;
                }
                String strA032222222 = A03(0, 22, 63);
                String strA033222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222 = c1029Ke222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222);
                return;
            case -1373388978:
                if (str2.equals(A03(807, 15, 6))) {
                    c11 = '\t';
                }
                String strA0322222222 = A03(0, 22, 63);
                String strA0332222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222 = c1029Ke2222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222);
                return;
            case -933872740:
                if (str2.equals(A03(TTAdConstant.IMAGE_CODE, 8, 86))) {
                    c11 = ' ';
                }
                String strA03222222222 = A03(0, 22, 63);
                String strA03322222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222 = c1029Ke22222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222);
                return;
            case -538363189:
                if (str2.equals(A03(747, 15, 94))) {
                    c11 = 5;
                }
                String strA032222222222 = A03(0, 22, 63);
                String strA033222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222 = c1029Ke222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222);
                return;
            case -538363109:
                if (str2.equals(A03(762, 15, 22))) {
                    c11 = 7;
                }
                String strA0322222222222 = A03(0, 22, 63);
                String strA0332222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222 = c1029Ke2222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222);
                return;
            case -425012669:
                if (str2.equals(A03(463, 8, 41))) {
                    c11 = 30;
                }
                String strA03222222222222 = A03(0, 22, 63);
                String strA03322222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222 = c1029Ke22222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222);
                return;
            case -356037306:
                if (str2.equals(A03(50, 14, 77))) {
                    c11 = 21;
                }
                String strA032222222222222 = A03(0, 22, 63);
                String strA033222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222222 = c1029Ke222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222222);
                return;
            case 62923557:
                if (str2.equals(A03(22, 5, 120))) {
                    c11 = '\r';
                }
                String strA0322222222222222 = A03(0, 22, 63);
                String strA0332222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222 = c1029Ke2222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222);
                return;
            case 62923603:
                if (str2.equals(A03(27, 5, 30))) {
                    c11 = 16;
                }
                String strA03222222222222222 = A03(0, 22, 63);
                String strA03322222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222 = c1029Ke22222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222);
                return;
            case 62927045:
                if (str2.equals(A03(32, 5, 50))) {
                    c11 = 19;
                }
                String strA032222222222222222 = A03(0, 22, 63);
                String strA033222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222222222 = c1029Ke222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222222222);
                return;
            case 82318131:
                if (str2.equals(A03(721, 5, 94))) {
                    c11 = 2;
                }
                String strA0322222222222222222 = A03(0, 22, 63);
                String strA0332222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222222 = c1029Ke2222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222222);
                return;
            case 82338133:
                if (str2.equals(A03(830, 5, 98))) {
                    c11 = 0;
                }
                String strA03222222222222222222 = A03(0, 22, 63);
                String strA03322222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222222 = c1029Ke22222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222222);
                return;
            case 82338134:
                if (str2.equals(A03(835, 5, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE))) {
                    c11 = 1;
                }
                String strA032222222222222222222 = A03(0, 22, 63);
                String strA033222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222222222222 = c1029Ke222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222222222222);
                return;
            case 99146302:
                if (str2.equals(A03(419, 10, 111))) {
                    c11 = 31;
                }
                String strA0322222222222222222222 = A03(0, 22, 63);
                String strA0332222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222222222 = c1029Ke2222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222222222);
                return;
            case 444813526:
                if (str2.equals(A03(822, 8, 66))) {
                    c11 = '\n';
                }
                String strA03222222222222222222222 = A03(0, 22, 63);
                String strA03322222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222222222 = c1029Ke22222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222222222);
                return;
            case 542569478:
                if (str2.equals(A03(37, 13, 55))) {
                    c11 = 20;
                }
                String strA032222222222222222222222 = A03(0, 22, 63);
                String strA033222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222222222222222 = c1029Ke222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222222222222222);
                return;
            case 635596514:
                if (str2.equals(A03(108, 16, 108))) {
                    c11 = 26;
                }
                String strA0322222222222222222222222 = A03(0, 22, 63);
                String strA0332222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222222222222 = c1029Ke2222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222222222222);
                return;
            case 725948237:
                if (str2.equals(A03(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 13, 74))) {
                    c11 = 25;
                }
                String strA03222222222222222222222222 = A03(0, 22, 63);
                String strA03322222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222222222222 = c1029Ke22222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222222222222);
                return;
            case 725957860:
                String[] strArr18 = A0q;
                if (strArr18[5].length() != strArr18[2].length()) {
                    String[] strArr19 = A0q;
                    strArr19[3] = "pVtGpTbAzfnElxJc";
                    strArr19[7] = "SejoyLYBcStMJmMw";
                    if (str2.equals(A03(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 13, 22))) {
                        c11 = 24;
                    }
                    String strA032222222222222222222222222 = A03(0, 22, 63);
                    String strA033222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                    switch (c11) {
                    }
                    if (this.A0k != null) {
                    }
                    int i16222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                    C1029Ke c1029Ke222222222222222222222222 = new C1029Ke();
                    if (L8.A0C(strA03)) {
                    }
                    if (this.A0e != null) {
                    }
                    VC vcA14222222222222222222222222 = c1029Ke222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                    this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                    this.A0b.A7E(vcA14222222222222222222222222);
                    return;
                }
                throw new RuntimeException();
            case 738597099:
                if (str2.equals(A03(429, 10, 10))) {
                    c11 = 28;
                }
                String strA0322222222222222222222222222 = A03(0, 22, 63);
                String strA0332222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222222222222222 = c1029Ke2222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222222222222222);
                return;
            case 855502857:
                if (str2.equals(A03(791, 16, 94))) {
                    c11 = '\b';
                }
                String strA03222222222222222222222222222 = A03(0, 22, 63);
                String strA03322222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222222222222222 = c1029Ke22222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222222222222222);
                return;
            case 1045209816:
                if (str2.equals(A03(450, 13, 84))) {
                    c11 = 29;
                }
                String strA032222222222222222222222222222 = A03(0, 22, 63);
                String strA033222222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222222222222222222222 = c1029Ke222222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222222222222222222222);
                return;
            case 1422270023:
                if (str2.equals(A03(439, 11, 105))) {
                    c11 = 27;
                }
                String strA0322222222222222222222222222222 = A03(0, 22, 63);
                String strA0332222222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222222222222222222 = c1029Ke2222222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222222222222222222);
                return;
            case 1809237540:
                if (str2.equals(A03(726, 7, 81))) {
                    c11 = 3;
                }
                String strA03222222222222222222222222222222 = A03(0, 22, 63);
                String strA03322222222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222222222222222222 = c1029Ke22222222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222222222222222222);
                return;
            case 1950749482:
                if (str2.equals(A03(64, 6, 96))) {
                    c11 = 17;
                }
                String strA032222222222222222222222222222222 = A03(0, 22, 63);
                String strA033222222222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i16222222222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke222222222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA14222222222222222222222222222222 = c1029Ke222222222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i16222222222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA14222222222222222222222222222222);
                return;
            case 1950789798:
                if (str2.equals(A03(70, 6, 24))) {
                    c11 = 22;
                }
                String strA0322222222222222222222222222222222 = A03(0, 22, 63);
                String strA0332222222222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i162222222222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke2222222222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA142222222222222222222222222222222 = c1029Ke2222222222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i162222222222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA142222222222222222222222222222222);
                return;
            case 1951062397:
                if (str2.equals(A03(102, 6, 77))) {
                    c11 = '\f';
                }
                String strA03222222222222222222222222222222222 = A03(0, 22, 63);
                String strA03322222222222222222222222222222222 = A03(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 17, 15);
                switch (c11) {
                }
                if (this.A0k != null) {
                }
                int i1622222222222222222222222222222222 = 0 | (this.A0f ? 1 : 0) | (this.A0g ? 2 : 0);
                C1029Ke c1029Ke22222222222222222222222222222222 = new C1029Ke();
                if (L8.A0C(strA03)) {
                }
                if (this.A0e != null) {
                }
                VC vcA1422222222222222222222222222222222 = c1029Ke22222222222222222222222222222222.A0g(i5).A11(strA03).A0h(i14).A10(this.A0o).A0n(i1622222222222222222222222222222222).A12(listSingletonList).A0w(str).A0u(this.A0Z).A14();
                this.A0b = interfaceC1384Yw.ALm(this.A0R, i11);
                this.A0b.A7E(vcA1422222222222222222222222222222222);
                return;
        }
    }
}
