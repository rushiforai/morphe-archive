package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.nio.ShortBuffer;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class RM {
    public static String[] A0M = {"AsOQHQyPwaOkGB0tHV3DxhddAi8JF3fa", "wn1RdRCWX0uZAFqoX4WMx1dmxjtrW8UK", "UhlBbcyqt8s2tw9sZFeDx3", "CtSzZ5BSuSB4t8c0maUBfXqe0fi1fVnW", "QiMQju9A8GOt9Rvph2vF5Qjs7K4rDFDM", "q8Ff7XK0VCuOlmafXMBGs1qyJ0FPUycz", "w1T3jQ1hC68tYJwirQ3qGfFMsKaa8LMd", "3dmI4Q1C3axFDdKpJJPSnIqtcddzXWU2"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public short[] A0A;
    public short[] A0B;
    public short[] A0C;
    public final float A0D;
    public final float A0E;
    public final float A0F;
    public final int A0G;
    public final int A0H;
    public final int A0I;
    public final int A0J;
    public final int A0K;
    public final short[] A0L;

    public RM(int i5, int i11, float f11, float f12, int i12) {
        this.A0H = i5;
        this.A0G = i11;
        this.A0F = f11;
        this.A0D = f12;
        this.A0E = i5 / i12;
        this.A0K = i5 / Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;
        this.A0I = i5 / 65;
        this.A0J = this.A0I * 2;
        this.A0L = new short[this.A0J];
        this.A0A = new short[this.A0J * i11];
        this.A0B = new short[this.A0J * i11];
        this.A0C = new short[this.A0J * i11];
    }

    private int A00(int i5) {
        int iMin = Math.min(this.A0J, this.A09);
        A0D(this.A0A, i5, iMin);
        int frameCount = this.A09;
        this.A09 = frameCount - iMin;
        return iMin;
    }

    private int A01(short[] sArr, int i5) {
        int skip;
        int retPeriod;
        int maxP = this.A0H > 4000 ? this.A0H / 4000 : 1;
        if (this.A0G == 1 && maxP == 1) {
            skip = A04(sArr, i5, this.A0K, this.A0I);
        } else {
            A0E(sArr, i5, maxP);
            short[] sArr2 = this.A0L;
            int i11 = this.A0K / maxP;
            int i12 = this.A0I / maxP;
            if (A0M[2].length() != 22) {
                throw new RuntimeException();
            }
            String[] strArr = A0M;
            strArr[5] = "INXLClnPP4M6OK2Itq8yZMkYfP8R6IzN";
            strArr[6] = "o5zDPpHh7SEUdXaB8CYCtTJxAd9UWR3b";
            skip = A04(sArr2, 0, i11, i12);
            if (maxP != 1) {
                int skip2 = skip * maxP;
                int i13 = skip2 - (maxP * 4);
                int maxP2 = (maxP * 4) + skip2;
                if (i13 < this.A0K) {
                    i13 = this.A0K;
                }
                if (maxP2 > this.A0I) {
                    maxP2 = this.A0I;
                }
                if (this.A0G == 1) {
                    skip = A04(sArr, i5, i13, maxP2);
                } else {
                    A0E(sArr, i5, 1);
                    short[] sArr3 = this.A0L;
                    String[] strArr2 = A0M;
                    if (strArr2[5].charAt(13) != strArr2[6].charAt(13)) {
                        String[] strArr3 = A0M;
                        strArr3[1] = "2PPfl4gsW6s2boZuku44zkWlkI9rtCDb";
                        strArr3[4] = "S3up9flYQJeBpTuEywLxcThkdn4ruowA";
                        skip = A04(sArr3, 0, i13, maxP2);
                    } else {
                        skip = A04(sArr3, 0, i13, maxP2);
                    }
                }
            }
        }
        int i14 = this.A02;
        String[] strArr4 = A0M;
        String str = strArr4[5];
        String str2 = strArr4[6];
        int iCharAt = str.charAt(13);
        int period = str2.charAt(13);
        if (iCharAt == period) {
            throw new RuntimeException();
        }
        String[] strArr5 = A0M;
        strArr5[1] = "pRdF0XFoVgt2LLbrGWyHpjCDNAIrrS7K";
        strArr5[4] = "bSZbGRGyCJLrEEPsQKDVeFxYy82r1Kvw";
        int period2 = this.A01;
        if (A0F(i14, period2)) {
            retPeriod = this.A08;
        } else {
            retPeriod = skip;
        }
        int period3 = this.A02;
        this.A07 = period3;
        this.A08 = skip;
        return retPeriod;
    }

    private int A02(short[] sArr, int i5, float f11, int i11) {
        int i12;
        if (f11 < 0.5f) {
            i12 = (int) ((i11 * f11) / (1.0f - f11));
        } else {
            i12 = i11;
            int newFrameCount = (int) ((i11 * ((2.0f * f11) - 1.0f)) / (1.0f - f11));
            this.A09 = newFrameCount;
        }
        int newFrameCount2 = i11 + i12;
        this.A0B = A0G(this.A0B, this.A05, newFrameCount2);
        int i13 = this.A0G * i5;
        short[] sArr2 = this.A0B;
        int i14 = this.A05;
        int newFrameCount3 = this.A0G;
        int i15 = i14 * newFrameCount3;
        int newFrameCount4 = this.A0G;
        System.arraycopy(sArr, i13, sArr2, i15, newFrameCount4 * i11);
        A0C(i12, this.A0G, this.A0B, this.A05 + i11, sArr, i5 + i11, sArr, i5);
        int newFrameCount5 = this.A05;
        this.A05 = newFrameCount5 + i11 + i12;
        return i12;
    }

    private int A03(short[] sArr, int i5, float f11, int i11) {
        int newFrameCount;
        if (f11 >= 2.0f) {
            newFrameCount = (int) (i11 / (f11 - 1.0f));
        } else {
            this.A09 = (int) ((i11 * (2.0f - f11)) / (f11 - 1.0f));
            newFrameCount = i11;
        }
        short[] sArr2 = this.A0B;
        int newFrameCount2 = this.A05;
        this.A0B = A0G(sArr2, newFrameCount2, newFrameCount);
        A0C(newFrameCount, this.A0G, this.A0B, this.A05, sArr, i5, sArr, i5 + i11);
        int newFrameCount3 = this.A05;
        this.A05 = newFrameCount3 + newFrameCount;
        return newFrameCount;
    }

    private int A04(short[] sArr, int i5, int i11, int i12) {
        int i13 = 0;
        int i14 = 255;
        int period = 1;
        int maxDiff = 0;
        int bestPeriod = this.A0G;
        int i15 = i5 * bestPeriod;
        while (i11 <= i12) {
            int i16 = 0;
            for (int minDiff = 0; minDiff < i11; minDiff++) {
                int bestPeriod2 = i15 + minDiff;
                short s11 = sArr[bestPeriod2];
                int bestPeriod3 = i15 + i11;
                int worstPeriod = s11 - sArr[bestPeriod3 + minDiff];
                int bestPeriod4 = Math.abs(worstPeriod);
                i16 += bestPeriod4;
            }
            int diff = i16 * i13;
            String[] strArr = A0M;
            String str = strArr[1];
            String str2 = strArr[4];
            int worstPeriod2 = str.charAt(27);
            int bestPeriod5 = str2.charAt(27);
            if (worstPeriod2 != bestPeriod5) {
                throw new RuntimeException();
            }
            A0M[3] = "4JfhlNduFCIpqdCXeyGleX4OcuqVOx5J";
            int bestPeriod6 = period * i11;
            if (diff < bestPeriod6) {
                period = i16;
                i13 = i11;
            }
            int worstPeriod3 = i16 * i14;
            int bestPeriod7 = maxDiff * i11;
            if (worstPeriod3 > bestPeriod7) {
                maxDiff = i16;
                i14 = i11;
            }
            i11++;
        }
        this.A02 = period / i13;
        this.A01 = maxDiff / i14;
        return i13;
    }

    private short A05(short[] sArr, int i5, int i11, int i12) {
        short s11 = sArr[i5];
        short s12 = sArr[this.A0G + i5];
        int leftPosition = this.A03 * i11;
        int i13 = this.A04 * i12;
        int position = (this.A04 + 1) * i12;
        int i14 = position - leftPosition;
        int position2 = position - i13;
        short left = (short) (((i14 * s11) + ((position2 - i14) * s12)) / position2);
        return left;
    }

    private void A06() {
        int i5 = this.A05;
        float f11 = this.A0F / this.A0D;
        float f12 = this.A0E * this.A0D;
        if (f11 > 1.00001d || f11 < 0.99999d) {
            A07(f11);
        } else {
            A0D(this.A0A, 0, this.A00);
            this.A00 = 0;
        }
        if (f12 != 1.0f) {
            A08(f12, i5);
        }
    }

    private void A07(float f11) {
        int frameCount;
        if (this.A00 < this.A0J) {
            return;
        }
        int i5 = this.A00;
        int i11 = 0;
        do {
            int frameCount2 = this.A09;
            if (frameCount2 > 0) {
                int frameCount3 = A00(i11);
                i11 += frameCount3;
            } else {
                int iA01 = A01(this.A0A, i11);
                if (f11 > 1.0d) {
                    int frameCount4 = A03(this.A0A, i11, f11, iA01);
                    i11 += frameCount4 + iA01;
                } else {
                    int frameCount5 = A02(this.A0A, i11, f11, iA01);
                    i11 += frameCount5;
                }
            }
            frameCount = this.A0J;
        } while (frameCount + i11 <= i5);
        A0B(i11);
    }

    /* JADX WARN: Incorrect condition in loop: B:21:0x0051 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A08(float f11, int i5) {
        if (this.A05 == i5) {
            return;
        }
        float f12 = this.A0H / f11;
        if (A0M[2].length() != 22) {
            throw new RuntimeException();
        }
        A0M[2] = "UqqkNkLs9COBsOho0ObELq";
        int i11 = (int) f12;
        int i12 = this.A0H;
        while (true) {
            if (i11 <= 16384 && i12 <= 16384) {
                break;
            }
            i11 /= 2;
            i12 /= 2;
        }
        A09(i5);
        int i13 = 0;
        while (true) {
            int newSampleRate = this.A06;
            if (i13 < newSampleRate - 1) {
                while (true) {
                    int oldSampleRate = this.A04;
                    int oldSampleRate2 = (oldSampleRate + 1) * i11;
                    int newSampleRate2 = this.A03;
                    if (oldSampleRate2 <= newSampleRate2 * i12) {
                        break;
                    }
                    short[] sArr = this.A0B;
                    int newSampleRate3 = this.A05;
                    this.A0B = A0G(sArr, newSampleRate3, 1);
                    for (int i14 = 0; i14 < newSampleRate; i14++) {
                        short[] sArr2 = this.A0B;
                        int i15 = this.A05;
                        int newSampleRate4 = this.A0G;
                        int i16 = (i15 * newSampleRate4) + i14;
                        short[] sArr3 = this.A0C;
                        int newSampleRate5 = this.A0G;
                        sArr2[i16] = A05(sArr3, (newSampleRate5 * i13) + i14, i12, i11);
                    }
                    int newSampleRate6 = this.A03;
                    this.A03 = newSampleRate6 + 1;
                    int newSampleRate7 = this.A05;
                    this.A05 = newSampleRate7 + 1;
                }
                int newSampleRate8 = this.A04;
                this.A04 = newSampleRate8 + 1;
                int newSampleRate9 = this.A04;
                if (newSampleRate9 == i12) {
                    this.A04 = 0;
                    int newSampleRate10 = this.A03;
                    AbstractC1062Ln.A08(newSampleRate10 == i11);
                    String[] strArr = A0M;
                    String str = strArr[1];
                    String str2 = strArr[4];
                    int oldSampleRate3 = str.charAt(27);
                    int newSampleRate11 = str2.charAt(27);
                    if (oldSampleRate3 != newSampleRate11) {
                        A0M[3] = "gB7A014mzjBv1poy77XOkeUK2nyMBQu5";
                        this.A03 = 0;
                    } else {
                        String[] strArr2 = A0M;
                        strArr2[5] = "JeVgu8rjAd0OF8OVXMf3KJykNXdfJjPG";
                        strArr2[6] = "thT5nYm22sNq73C1o8CLYl4UHSvFZBs6";
                        this.A03 = 0;
                    }
                }
                i13++;
            } else {
                int newSampleRate12 = this.A06;
                A0A(newSampleRate12 - 1);
                return;
            }
        }
    }

    private void A09(int i5) {
        int i11 = this.A05 - i5;
        short[] sArr = this.A0C;
        int frameCount = this.A06;
        this.A0C = A0G(sArr, frameCount, i11);
        short[] sArr2 = this.A0B;
        int i12 = this.A0G * i5;
        short[] sArr3 = this.A0C;
        int i13 = this.A06;
        int frameCount2 = this.A0G;
        int i14 = i13 * frameCount2;
        int frameCount3 = this.A0G;
        System.arraycopy(sArr2, i12, sArr3, i14, frameCount3 * i11);
        this.A05 = i5;
        int frameCount4 = this.A06;
        this.A06 = frameCount4 + i11;
    }

    private void A0A(int i5) {
        if (i5 == 0) {
            return;
        }
        System.arraycopy(this.A0C, this.A0G * i5, this.A0C, 0, (this.A06 - i5) * this.A0G);
        this.A06 -= i5;
    }

    private void A0B(int i5) {
        int i11 = this.A00 - i5;
        System.arraycopy(this.A0A, this.A0G * i5, this.A0A, 0, this.A0G * i11);
        this.A00 = i11;
    }

    public static void A0C(int i5, int i11, short[] sArr, int i12, short[] sArr2, int i13, short[] sArr3, int i14) {
        for (int d5 = 0; d5 < i11; d5++) {
            int i15 = (i12 * i11) + d5;
            int i16 = (i14 * i11) + d5;
            int i17 = (i13 * i11) + d5;
            for (int u5 = 0; u5 < i5; u5++) {
                short s11 = sArr2[i17];
                int i18 = i5 - u5;
                String[] strArr = A0M;
                String str = strArr[5];
                String str2 = strArr[6];
                int o = str.charAt(13);
                int i19 = str2.charAt(13);
                if (o == i19) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0M;
                strArr2[1] = "mlyh9fclpAA3xQGQNQNugm7A1eorXIoU";
                strArr2[4] = "UIasnW6PCxNtbKnkiDP3Xk5iIAJr60Sz";
                int t6 = s11 * i18;
                int i21 = sArr3[i16] * u5;
                sArr[i15] = (short) ((t6 + i21) / i5);
                i15 += i11;
                i17 += i11;
                i16 += i11;
            }
        }
    }

    private void A0D(short[] sArr, int i5, int i11) {
        this.A0B = A0G(this.A0B, this.A05, i11);
        System.arraycopy(sArr, this.A0G * i5, this.A0B, this.A05 * this.A0G, this.A0G * i11);
        this.A05 += i11;
    }

    private void A0E(short[] sArr, int i5, int i11) {
        int i12 = this.A0J / i11;
        int j11 = this.A0G * i11;
        int frameCount = this.A0G;
        int i13 = i5 * frameCount;
        for (int value = 0; value < i12; value++) {
            int i14 = 0;
            for (int samplesPerValue = 0; samplesPerValue < j11; samplesPerValue++) {
                int frameCount2 = value * j11;
                i14 += sArr[frameCount2 + i13 + samplesPerValue];
            }
            this.A0L[value] = (short) (i14 / j11);
        }
    }

    private boolean A0F(int i5, int i11) {
        if (i5 == 0 || this.A08 == 0) {
            return false;
        }
        int i12 = i5 * 3;
        if (A0M[2].length() != 22) {
            throw new RuntimeException();
        }
        String[] strArr = A0M;
        strArr[1] = "3IzBgwzZAspesLCV3jjb7Dosm9irr8sO";
        strArr[4] = "b2WAxAr1tqExmwQ89kWoo3VIQSYrQQMT";
        if (i11 > i12 || i5 * 2 <= this.A07 * 3) {
            return false;
        }
        return true;
    }

    private short[] A0G(short[] sArr, int i5, int i11) {
        int length = sArr.length / this.A0G;
        if (i5 + i11 <= length) {
            return sArr;
        }
        int i12 = length * 3;
        String[] strArr = A0M;
        String str = strArr[1];
        String str2 = strArr[4];
        int iCharAt = str.charAt(27);
        int currentCapacityFrames = str2.charAt(27);
        if (iCharAt != currentCapacityFrames) {
            throw new RuntimeException();
        }
        A0M[2] = "8QrvwtFNh8hPD4XoRidnoD";
        int newCapacityFrames = (i12 / 2) + i11;
        int currentCapacityFrames2 = this.A0G;
        return Arrays.copyOf(sArr, currentCapacityFrames2 * newCapacityFrames);
    }

    public final int A0H() {
        return this.A05 * this.A0G * 2;
    }

    public final int A0I() {
        return this.A00 * this.A0G * 2;
    }

    public final void A0J() {
        this.A00 = 0;
        this.A05 = 0;
        this.A06 = 0;
        this.A04 = 0;
        this.A03 = 0;
        this.A09 = 0;
        this.A08 = 0;
        this.A07 = 0;
        this.A02 = 0;
        this.A01 = 0;
    }

    public final void A0K() {
        int i5 = this.A00;
        float f11 = this.A0F / this.A0D;
        float r11 = this.A0E * this.A0D;
        int i11 = this.A05;
        float s11 = i5;
        int remainingFrameCount = this.A06;
        int i12 = i11 + ((int) ((((s11 / f11) + remainingFrameCount) / r11) + 0.5f));
        short[] sArr = this.A0A;
        int i13 = this.A00;
        int remainingFrameCount2 = this.A0J;
        this.A0A = A0G(sArr, i13, (remainingFrameCount2 * 2) + i5);
        int expectedOutputFrames = 0;
        while (true) {
            int remainingFrameCount3 = this.A0J;
            int i14 = remainingFrameCount3 * 2;
            int remainingFrameCount4 = this.A0G;
            if (expectedOutputFrames >= i14 * remainingFrameCount4) {
                break;
            }
            short[] sArr2 = this.A0A;
            int remainingFrameCount5 = this.A0G;
            sArr2[(remainingFrameCount5 * i5) + expectedOutputFrames] = 0;
            expectedOutputFrames++;
        }
        int i15 = this.A00;
        int remainingFrameCount6 = this.A0J;
        this.A00 = i15 + (remainingFrameCount6 * 2);
        A06();
        int remainingFrameCount7 = this.A05;
        if (remainingFrameCount7 > i12) {
            this.A05 = i12;
        }
        this.A00 = 0;
        this.A09 = 0;
        this.A06 = 0;
    }

    public final void A0L(ShortBuffer shortBuffer) {
        int iMin = Math.min(shortBuffer.remaining() / this.A0G, this.A05);
        short[] sArr = this.A0B;
        int framesToRead = this.A0G;
        shortBuffer.put(sArr, 0, framesToRead * iMin);
        int framesToRead2 = this.A05;
        this.A05 = framesToRead2 - iMin;
        short[] sArr2 = this.A0B;
        int i5 = this.A0G * iMin;
        short[] sArr3 = this.A0B;
        int i11 = this.A05;
        int framesToRead3 = this.A0G;
        System.arraycopy(sArr2, i5, sArr3, 0, i11 * framesToRead3);
    }

    public final void A0M(ShortBuffer shortBuffer) {
        int iRemaining = shortBuffer.remaining() / this.A0G;
        int framesToWrite = this.A0G;
        int i5 = framesToWrite * iRemaining * 2;
        short[] sArr = this.A0A;
        int framesToWrite2 = this.A00;
        this.A0A = A0G(sArr, framesToWrite2, iRemaining);
        short[] sArr2 = this.A0A;
        int bytesToWrite = this.A00;
        int framesToWrite3 = this.A0G;
        int bytesToWrite2 = bytesToWrite * framesToWrite3;
        int framesToWrite4 = i5 / 2;
        shortBuffer.get(sArr2, bytesToWrite2, framesToWrite4);
        int framesToWrite5 = this.A00;
        this.A00 = framesToWrite5 + iRemaining;
        A06();
    }
}
