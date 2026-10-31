package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class RU implements WB {
    public static byte[] A00;
    public static String[] A01 = {"1r6wgHYOB", "AVULDbYlNs0l2QHiZuOlUBlakjwR6sHi", "oPQAvjQgy", "hKS1W", "hqQdqbAYV", "98xG3lf1T92yQg", "F87JiG4ISjvld7dkZ7fuUjveYPqPk4To", "rkUIu0IJuzOr2WAiZbkW"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 85);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-100, -49, -49, -64, -56, -53, -49, -64, -65, 123, -49, -54, 123, -66, -51, -64, -68, -49, -64, 123, -65, -64, -66, -54, -65, -64, -51, 123, -63, -54, -51, 123, -48, -55, -50, -48, -53, -53, -54, -51, -49, -64, -65, 123, -88, -92, -88, -96, 123, -49, -44, -53, -64, -107, 123, -41, -26, -26, -30, -33, -39, -41, -22, -33, -27, -28, -91, -39, -37, -41, -93, -84, -90, -82, 21, 36, 36, 32, 29, 23, 21, 40, 29, 35, 34, -29, 23, 25, 21, -31, -21, -28, -20, -57, -42, -42, -46, -49, -55, -57, -38, -49, -43, -44, -107, -54, -36, -56, -39, -37, -56, -39, -17, -2, -2, -6, -9, -15, -17, 2, -9, -3, -4, -67, -2, -11, 1, 6, 21, 21, 17, 14, 8, 6, 25, 14, 20, 19, -44, 25, 25, 18, 17, -48, 29, 18, 17, -31, -16, -16, -20, -23, -29, -31, -12, -23, -17, -18, -81, -8, -83, -19, -16, -76, -83, -29, -27, -31, -83, -74, -80, -72, -23, -8, -8, -12, -15, -21, -23, -4, -15, -9, -10, -73, 0, -75, -11, -8, -68, -75, -2, -4, -4, -60, -45, -45, -49, -52, -58, -60, -41, -52, -46, -47, -110, -37, -112, -44, -40, -52, -58, -50, -41, -52, -48, -56, -112, -41, -37, -106, -54, 0, 15, 15, 11, 8, 2, 0, 19, 8, 14, 13, -50, 23, -52, 18, 20, 1, 17, 8, 15, 59, 44, 63, 59, -10, 61, 59, 59, -39, -54, -35, -39, -108, -35, -110, -54, -35, -44, -43, -47, -58, -34, -54, -41, -110, -56, -38, -54, -40, 40, 25, 44, 40, -29, 44, -31, 39, 39, 21};
        if (A01[4].length() == 3) {
            throw new RuntimeException();
        }
        A01[5] = "LxaIdH5cBJxmS6v2";
    }

    static {
        A01();
    }

    @Override // com.facebook.ads.redexgen.X.WB
    public final InterfaceC1136Ok A5t(VC vc) {
        char c11;
        String str = vc.A0W;
        if (str != null) {
            switch (str.hashCode()) {
                case 1201784583:
                    String mimeType = A00(249, 21, 16);
                    if (str.equals(mimeType)) {
                        c11 = 0;
                        break;
                    }
                default:
                    c11 = 65535;
                    break;
            }
            switch (c11) {
                case 0:
                    return new C8k();
            }
        }
        StringBuilder sb2 = new StringBuilder();
        String mimeType2 = A00(0, 55, 6);
        throw new IllegalArgumentException(sb2.append(mimeType2).append(str).toString());
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00e5  */
    @Override // com.facebook.ads.redexgen.X.WB
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean ALg(VC vc) {
        String str = vc.A0W;
        String mimeType = A00(241, 8, 114);
        if (!mimeType.equals(str)) {
            String mimeType2 = A01[7];
            if (mimeType2.length() == 27) {
                throw new RuntimeException();
            }
            A01[5] = "OkO6euc8ynjv";
            String mimeType3 = A00(270, 10, 95);
            if (!mimeType3.equals(str)) {
                String mimeType4 = A00(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 20, 80);
                if (!mimeType4.equals(str)) {
                    String mimeType5 = A00(172, 21, 51);
                    if (!mimeType5.equals(str)) {
                        String mimeType6 = A00(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 20, 74);
                        if (!mimeType6.equals(str)) {
                            String mimeType7 = A00(193, 28, 14);
                            if (!mimeType7.equals(str)) {
                                String mimeType8 = A00(55, 19, 33);
                                if (!mimeType8.equals(str)) {
                                    String mimeType9 = A00(147, 25, 43);
                                    if (!mimeType9.equals(str)) {
                                        String mimeType10 = A00(74, 19, 95);
                                        if (!mimeType10.equals(str)) {
                                            String mimeType11 = A00(93, 19, 17);
                                            if (!mimeType11.equals(str)) {
                                                String[] strArr = A01;
                                                if (strArr[6].charAt(4) != strArr[1].charAt(4)) {
                                                    String[] strArr2 = A01;
                                                    strArr2[6] = "l9GYIa3PxvQIRN8afan6ZDH1kHfjUleR";
                                                    strArr2[1] = "nG9OxD1qDrpF1v82myFhSfzbjwOpUtm8";
                                                    String mimeType12 = A00(112, 15, 57);
                                                    if (!mimeType12.equals(str)) {
                                                        String mimeType13 = A00(249, 21, 16);
                                                        if (!mimeType13.equals(str)) {
                                                            return false;
                                                        }
                                                    }
                                                } else {
                                                    String mimeType14 = A00(112, 15, 57);
                                                    if (!mimeType14.equals(str)) {
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return true;
    }
}
