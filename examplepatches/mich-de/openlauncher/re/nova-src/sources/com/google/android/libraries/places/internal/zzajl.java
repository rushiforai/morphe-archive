package com.google.android.libraries.places.internal;

import java.math.RoundingMode;

/* loaded from: classes3.dex */
public final class zzajl {
    public static int zza(int i5, int i11, RoundingMode roundingMode) {
        roundingMode.getClass();
        if (i11 == 0) {
            throw new ArithmeticException("/ by zero");
        }
        int i12 = i5 / i11;
        int i13 = i5 - (i11 * i12);
        if (i13 == 0) {
            return i12;
        }
        int i14 = ((i5 ^ i11) >> 31) | 1;
        switch (zzajk.zza[roundingMode.ordinal()]) {
            case 1:
                zzajn.zza(false);
                return i12;
            case 2:
                return i12;
            case 3:
                if (i14 >= 0) {
                    return i12;
                }
                break;
            case 4:
                break;
            case 5:
                if (i14 <= 0) {
                    return i12;
                }
                break;
            case 6:
            case 7:
            case 8:
                int iAbs = Math.abs(i13);
                int iAbs2 = iAbs - (Math.abs(i11) - iAbs);
                if (iAbs2 == 0) {
                    if (roundingMode != RoundingMode.HALF_UP) {
                        if ((i12 & 1 & (roundingMode != RoundingMode.HALF_EVEN ? 0 : 1)) == 0) {
                            return i12;
                        }
                    }
                } else if (iAbs2 <= 0) {
                    return i12;
                }
                break;
            default:
                throw new AssertionError();
        }
        return i12 + i14;
    }

    public static int zzb(int i5, RoundingMode roundingMode) {
        if (i5 <= 0) {
            throw new IllegalArgumentException("x (0) must be > 0");
        }
        switch (zzajk.zza[roundingMode.ordinal()]) {
            case 1:
                zzajn.zza(((i5 + (-1)) & i5) == 0);
                break;
            case 2:
            case 3:
                break;
            case 4:
            case 5:
                return 32 - Integer.numberOfLeadingZeros(i5 - 1);
            case 6:
            case 7:
            case 8:
                int iNumberOfLeadingZeros = Integer.numberOfLeadingZeros(i5);
                return (31 - iNumberOfLeadingZeros) + ((((-1257966797) >>> iNumberOfLeadingZeros) - i5) >>> 31);
            default:
                throw new AssertionError();
        }
        return 31 - Integer.numberOfLeadingZeros(i5);
    }
}
