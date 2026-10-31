package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.c4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1541c4 {
    public static byte[] A03;
    public static String[] A04 = {"z07RPsSBQpgO4nPA3kfdcobPyI7MDW94", "CvFjhsqL7D8D4TD1nrgOH6GcmqHJswgj", "oaXI9WK9", "DouG6F9yBn5zVMX5iF88GXTfaPyEPfLR", "E3z", "wrF", "TPH2H6eM", "WGrr6AeMtrEAjikbklbyiOkaYEeRIVLM"};
    public static final AbstractC07539k<String> A05;
    public static final AbstractC07539k<String> A06;
    public static final AbstractC07539k<String> A07;
    public static final AbstractC07539k<String> A08;
    public static final Pattern A09;
    public final int A00;
    public final int A01;
    public final int A02;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0147  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static C1541c4 A00(AbstractC07539k<String> abstractC07539k) {
        char c11;
        int i5;
        C9T c9tA02;
        char c12;
        int i11;
        int i12;
        int i13;
        C9T c9tA022 = VX.A02(A07, abstractC07539k);
        String strA02 = A02(41, 7, 10);
        String str = (String) AbstractC1306Vp.A00(c9tA022, strA02);
        char c13 = 2;
        char c14 = 1;
        switch (str.hashCode()) {
            case -1392885889:
                String[] strArr = A04;
                if (strArr[1].charAt(5) == strArr[0].charAt(5)) {
                    String[] strArr2 = A04;
                    strArr2[1] = "OcLcysBJRH9QYT2g4vWW3XYU9Bd1ujT5";
                    strArr2[0] = "GwI6UsK64lqgkqAzZJIipeflOH4aD1Pc";
                    c11 = str.equals(A02(12, 6, 96)) ? (char) 2 : (char) 65535;
                    switch (c11) {
                        case 0:
                            i5 = 2;
                            break;
                        case 1:
                            i5 = -2;
                            break;
                        default:
                            i5 = 1;
                            break;
                    }
                    c9tA02 = VX.A02(A08, abstractC07539k);
                    if (!c9tA02.isEmpty()) {
                        String str2 = (String) c9tA02.iterator().next();
                        switch (str2.hashCode()) {
                            case 3005871:
                                if (!str2.equals(A02(8, 4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE))) {
                                    c14 = 65535;
                                    break;
                                }
                                break;
                            case 3387192:
                                if (str2.equals(A02(33, 4, 5))) {
                                    c14 = 0;
                                    break;
                                }
                                break;
                        }
                        switch (c14) {
                            case 0:
                                i13 = 0;
                                break;
                            default:
                                i13 = -1;
                                break;
                        }
                        return new C1541c4(i13, 0, i5);
                    }
                    C9T c9tA023 = VX.A02(A05, abstractC07539k);
                    C9T c9tA024 = VX.A02(A06, abstractC07539k);
                    if (!c9tA023.isEmpty() || !c9tA024.isEmpty()) {
                        String strA022 = A02(27, 6, 97);
                        String str3 = (String) AbstractC1306Vp.A00(c9tA023, strA022);
                        switch (str3.hashCode()) {
                            case -1274499742:
                                if (!str3.equals(strA022)) {
                                    c12 = 65535;
                                    break;
                                } else {
                                    c12 = 1;
                                    break;
                                }
                            case 3417674:
                                if (str3.equals(A02(37, 4, 12))) {
                                    c12 = 0;
                                    break;
                                }
                                break;
                        }
                        switch (c12) {
                            case 0:
                                i11 = 2;
                                break;
                            default:
                                i11 = 1;
                                break;
                        }
                        String strA023 = A02(18, 6, 23);
                        String str4 = (String) AbstractC1306Vp.A00(c9tA024, strA023);
                        switch (str4.hashCode()) {
                            case -1360216880:
                                boolean zEquals = str4.equals(strA023);
                                String[] strArr3 = A04;
                                if (strArr3[2].length() != strArr3[6].length()) {
                                    String[] strArr4 = A04;
                                    strArr4[4] = "1NI";
                                    strArr4[5] = "6Dd";
                                    if (!zEquals) {
                                        c13 = 65535;
                                    }
                                } else {
                                    String[] strArr5 = A04;
                                    strArr5[4] = "orq";
                                    strArr5[5] = "bmT";
                                    if (!zEquals) {
                                    }
                                }
                                switch (c13) {
                                    case 0:
                                        i12 = 2;
                                        break;
                                    case 1:
                                        i12 = 3;
                                        break;
                                    default:
                                        i12 = 1;
                                        break;
                                }
                                return new C1541c4(i12, i11, i5);
                            case -905816648:
                                if (str4.equals(A02(48, 6, 75))) {
                                    c13 = 1;
                                }
                                switch (c13) {
                                }
                                return new C1541c4(i12, i11, i5);
                            case 99657:
                                boolean zEquals2 = str4.equals(A02(24, 3, 31));
                                String[] strArr6 = A04;
                                if (strArr6[4].length() == strArr6[5].length()) {
                                    A04[7] = "VLiZAShxH4447oVRIDUJnKoJOEqIIq3v";
                                    if (zEquals2) {
                                        c13 = 0;
                                    }
                                    switch (c13) {
                                    }
                                    return new C1541c4(i12, i11, i5);
                                }
                                break;
                        }
                    } else {
                        return new C1541c4(-1, 0, i5);
                    }
                }
                throw new RuntimeException();
            case -1106037339:
                if (str.equals(strA02)) {
                    c11 = 1;
                }
                switch (c11) {
                }
                c9tA02 = VX.A02(A08, abstractC07539k);
                if (!c9tA02.isEmpty()) {
                }
                break;
            case 92734940:
                if (str.equals(A02(3, 5, 120))) {
                    c11 = 0;
                }
                switch (c11) {
                }
                c9tA02 = VX.A02(A08, abstractC07539k);
                if (!c9tA02.isEmpty()) {
                }
                break;
        }
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 58);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{110, 65, 25, 35, 36, 54, 39, 48, 45, 57, 56, 35, 56, 63, 60, 53, 40, 63, 78, 68, 95, 78, 65, 72, 65, 74, 81, 61, 50, 55, 55, 62, 63, 81, 80, 81, 90, 89, 70, 83, 88, 95, 69, 68, 67, 89, 84, 85, 2, 20, 2, 16, 28, 20};
    }

    static {
        A03();
        A09 = Pattern.compile(A02(0, 3, 8));
        A08 = AbstractC07539k.A05(A02(8, 4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), A02(33, 4, 5));
        A06 = AbstractC07539k.A06(A02(24, 3, 31), A02(48, 6, 75), A02(18, 6, 23));
        A05 = AbstractC07539k.A05(A02(27, 6, 97), A02(37, 4, 12));
        A07 = AbstractC07539k.A06(A02(3, 5, 120), A02(12, 6, 96), A02(41, 7, 10));
    }

    public C1541c4(int i5, int i11, int i12) {
        this.A01 = i5;
        this.A00 = i11;
        this.A02 = i12;
    }

    public static C1541c4 A01(String str) {
        if (str == null) {
            return null;
        }
        String parsingValue = XC.A01(str.trim());
        if (parsingValue.isEmpty()) {
            return null;
        }
        return A00(AbstractC07539k.A08(TextUtils.split(parsingValue, A09)));
    }
}
