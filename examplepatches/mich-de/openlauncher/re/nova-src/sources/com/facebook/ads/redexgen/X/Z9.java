package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class Z9 {
    public static String[] A07 = {"H36HcLaxF38XTsQOIZbXCMke929zqq", "NifLK6W5JAns6", "3HculwX5Pe3we4NQdSwPwSD5xWKuED", "ci8GVrFppkZzKJWrV3ieWOUC0NHCe", "Q4vB", "072U0bOB2ztteVk0idOAcweZv7G", "m40vzsscLn7M739", "yMBCfHltFaaiNDRy1RhjUba"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public String A06;

    public final boolean A00(int i5) {
        int i11;
        int padding;
        int i12;
        int version;
        int version2;
        if (!ZA.A06(i5) || (i11 = (i5 >>> 19) & 3) == 1 || (padding = (i5 >>> 17) & 3) == 0) {
            return false;
        }
        int i13 = i5 >>> 12;
        String[] strArr = A07;
        String str = strArr[3];
        String str2 = strArr[6];
        int length = str.length();
        int version3 = str2.length();
        if (length != version3) {
            A07[7] = "t9UspXq4NPvdnWYpGp7ClOoZH44Hb";
            int samplingRateIndex = i13 & 15;
            if (samplingRateIndex == 0 || samplingRateIndex == 15 || (i12 = (i5 >>> 10) & 3) == 3) {
                return false;
            }
            this.A05 = i11;
            int version4 = 3 - padding;
            this.A06 = ZA.A0E()[version4];
            int i14 = ZA.A07[i12];
            if (A07[5].length() != 31) {
                A07[5] = "hpswFXU9T0LHMCU";
                this.A03 = i14;
                if (i11 == 2) {
                    int version5 = this.A03;
                    this.A03 = version5 / 2;
                } else if (i11 == 0) {
                    int i15 = this.A03;
                    if (A07[5].length() != 31) {
                        A07[1] = "2DPwYcGCozIJ3e";
                        int version6 = i15 / 4;
                        this.A03 = version6;
                    } else {
                        A07[7] = "wOloMDesjBEul8Xbl5XToEJNuV0";
                        int version7 = i15 / 4;
                        this.A03 = version7;
                    }
                }
                int i16 = (i5 >>> 9) & 1;
                int version8 = ZA.A02(i11, padding);
                this.A04 = version8;
                if (padding == 3) {
                    if (i11 == 3) {
                        int version9 = samplingRateIndex - 1;
                        version2 = ZA.A02[version9];
                    } else {
                        int version10 = samplingRateIndex - 1;
                        version2 = ZA.A06[version10];
                    }
                    this.A00 = version2;
                    int version11 = this.A00;
                    int i17 = version11 * 12;
                    int version12 = this.A03;
                    this.A02 = ((i17 / version12) + i16) * 4;
                } else {
                    if (i11 == 3) {
                        if (padding == 2) {
                            int[] iArr = ZA.A03;
                            int samplingRateIndex2 = samplingRateIndex - 1;
                            String[] strArr2 = A07;
                            String str3 = strArr2[3];
                            String str4 = strArr2[6];
                            int length2 = str3.length();
                            int version13 = str4.length();
                            if (length2 == version13) {
                                throw new RuntimeException();
                            }
                            String[] strArr3 = A07;
                            strArr3[3] = "fMJa0M3gqz7Uu2uN0pBMSgobsWAon";
                            strArr3[6] = "D6wMUiwF6Fmm0Mg";
                            version = iArr[samplingRateIndex2];
                        } else {
                            int version14 = samplingRateIndex - 1;
                            version = ZA.A04[version14];
                        }
                        this.A00 = version;
                        int samplingRateIndex3 = this.A00;
                        if (A07[1].length() != 23) {
                            A07[1] = "KBaewzUuvOSlh04MRpNeSQB8JMVH";
                            int version15 = this.A03;
                            this.A02 = ((samplingRateIndex3 * 144) / version15) + i16;
                        } else {
                            int version16 = this.A03;
                            this.A02 = ((samplingRateIndex3 * 144) / version16) + i16;
                        }
                    } else {
                        int version17 = samplingRateIndex - 1;
                        this.A00 = ZA.A05[version17];
                        int i18 = padding == 1 ? 72 : 144;
                        int version18 = this.A00;
                        int i19 = i18 * version18;
                        String[] strArr4 = A07;
                        String str5 = strArr4[3];
                        String str6 = strArr4[6];
                        int length3 = str5.length();
                        int version19 = str6.length();
                        if (length3 != version19) {
                            A07[7] = "4Rryzjp9bZzoX9e6s47E0ik3l6Dl";
                            int version20 = this.A03;
                            this.A02 = (i19 / version20) + i16;
                        } else {
                            int version21 = this.A03;
                            this.A02 = (i19 / version21) + i16;
                        }
                    }
                }
                int version22 = i5 >> 6;
                this.A01 = (version22 & 3) == 3 ? 1 : 2;
                return true;
            }
        }
        throw new RuntimeException();
    }
}
