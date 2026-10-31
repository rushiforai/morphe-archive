package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.flac.PictureFrame;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class Z5 {
    public static byte[] A0C;
    public static String[] A0D = {"l3F1jvmu1E6Abjs95vKWdPOgrIVyCHZF", "Aw0MydQON9WCkwJIXXnZk9FehzIatNTv", "XgcSYQFAy", "XL", "RY9tE", "li6blo2Iheg0MJgrpi05cufhQ6lbjqj0", "YVDaNSs8qtMqpo5g8uTPZ6UBLpvwqNrn", "cRv9K0xuAPjHO7NpNcUHWucgK9HWaRfF"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final long A09;
    public final Z4 A0A;
    public final Metadata A0B;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            String[] strArr = A0D;
            if (strArr[1].charAt(20) == strArr[6].charAt(20)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0D;
            strArr2[1] = "uONHpfKwzoEVKSqDMMiXU8s3KSQETgs7";
            strArr2[6] = "gMGp9aisw42FPtkv1Vd8htjOfa6YfSyk";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 85);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0C = new byte[]{107, AbstractJsonLexerKt.TC_INVALID, 110, 99, 101, 37, 108, 102, 107, 105};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final Z5 A0A(List<PictureFrame> list) {
        return new Z5(this.A05, this.A03, this.A06, this.A04, this.A07, this.A02, this.A00, this.A09, this.A0A, A02(new Metadata(list)));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final Z5 A0B(List<String> list) {
        return new Z5(this.A05, this.A03, this.A06, this.A04, this.A07, this.A02, this.A00, this.A09, this.A0A, A02(ZW.A02(list)));
    }

    static {
        A04();
    }

    public Z5(int i5, int i11, int i12, int i13, int i14, int i15, int i16, long j11, Z4 z42, Metadata metadata) {
        this.A05 = i5;
        this.A03 = i11;
        this.A06 = i12;
        this.A04 = i13;
        this.A07 = i14;
        this.A08 = A01(i14);
        this.A02 = i15;
        this.A00 = i16;
        this.A01 = A00(i16);
        this.A09 = j11;
        this.A0A = z42;
        this.A0B = metadata;
    }

    public Z5(byte[] bArr, int i5) {
        C1083Mj c1083Mj = new C1083Mj(bArr);
        c1083Mj.A08(i5 * 8);
        this.A05 = c1083Mj.A04(16);
        this.A03 = c1083Mj.A04(16);
        this.A06 = c1083Mj.A04(24);
        this.A04 = c1083Mj.A04(24);
        this.A07 = c1083Mj.A04(20);
        this.A08 = A01(this.A07);
        this.A02 = c1083Mj.A04(3) + 1;
        this.A00 = c1083Mj.A04(5) + 1;
        this.A01 = A00(this.A00);
        this.A09 = c1083Mj.A05(36);
        this.A0A = null;
        this.A0B = null;
    }

    public static int A00(int i5) {
        switch (i5) {
            case 8:
                return 1;
            case 12:
                return 2;
            case 16:
                return 4;
            case 20:
                return 5;
            case 24:
                String[] strArr = A0D;
                if (strArr[4].length() == strArr[3].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0D;
                strArr2[5] = "lcMhzVzuxDvQuAiHCiZQrWi81xojeGQ4";
                strArr2[0] = "lfzEs8BRcEtB5Ahq6hd9sjoS4iEOv5vj";
                return 6;
            default:
                return -1;
        }
    }

    public static int A01(int i5) {
        switch (i5) {
            case 8000:
                return 4;
            case 16000:
                String[] strArr = A0D;
                if (strArr[1].charAt(20) != strArr[6].charAt(20)) {
                    String[] strArr2 = A0D;
                    strArr2[5] = "lSHFm8H8FIgV2vFKz0xxy9hp8Q14wqzN";
                    strArr2[0] = "lWa5SzZxSs0AFKJ9FtOk0x1pkkEzbvHr";
                    return 5;
                }
                return 5;
            case 22050:
                return 6;
            case 24000:
                return 7;
            case 32000:
                return 8;
            case 44100:
                return 9;
            case 48000:
                return 10;
            case 88200:
                return 1;
            case 96000:
                return 11;
            case 176400:
                return 2;
            case 192000:
                return 3;
            default:
                String[] strArr3 = A0D;
                if (strArr3[1].charAt(20) == strArr3[6].charAt(20)) {
                    throw new RuntimeException();
                }
                A0D[7] = "cDo9x4cjHBr8vkdx8pgHLaUNfvWvN6AY";
                return -1;
        }
    }

    private final Metadata A02(Metadata metadata) {
        return this.A0B == null ? metadata : this.A0B.A04(metadata);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long A05() {
        long j11;
        if (this.A04 > 0) {
            return ((this.A04 + this.A06) / 2) + 1;
        }
        if (this.A05 == this.A03) {
            int i5 = this.A05;
            String[] strArr = A0D;
            if (strArr[5].charAt(0) != strArr[0].charAt(0)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0D;
            strArr2[5] = "lOKJ5eUqfL8WF3zIaknb90FklYPJY6L4";
            strArr2[0] = "lq5Jr09jayShp2rldgx5drpyiT5BTS93";
            if (i5 <= 0) {
                j11 = 4096;
            } else {
                j11 = this.A05;
            }
        }
        long j12 = this.A02 * j11;
        long blockSizeSamples = this.A00;
        return ((j12 * blockSizeSamples) / 8) + 64;
    }

    public final long A06() {
        if (this.A09 == 0) {
            return -9223372036854775807L;
        }
        return (this.A09 * 1000000) / this.A07;
    }

    public final long A07(long j11) {
        long sampleNumber = N1.A0T((this.A07 * j11) / 1000000, 0L, this.A09 - 1);
        return sampleNumber;
    }

    public final VC A08(byte[] bArr, Metadata metadata) {
        bArr[4] = -128;
        int i5 = this.A04 > 0 ? this.A04 : -1;
        Metadata metadataA02 = A02(metadata);
        C1029Ke c1029KeA0h = new C1029Ke().A11(A03(0, 10, 95)).A0h(i5);
        int maxInputSize = this.A02;
        C1029Ke c1029KeA0b = c1029KeA0h.A0b(maxInputSize);
        int maxInputSize2 = this.A07;
        return c1029KeA0b.A0m(maxInputSize2).A12(Collections.singletonList(bArr)).A0v(metadataA02).A14();
    }

    public final Z5 A09(Z4 z42) {
        return new Z5(this.A05, this.A03, this.A06, this.A04, this.A07, this.A02, this.A00, this.A09, z42, this.A0B);
    }
}
