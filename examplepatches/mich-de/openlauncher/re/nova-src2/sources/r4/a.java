package r4;

import android.graphics.Color;
import h6.c1;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadLocal f85477a = new ThreadLocal();

    public static int a(float[] fArr) {
        int iG;
        int iRound;
        int iG2 = 0;
        float f11 = fArr[0];
        float f12 = fArr[1];
        float f13 = fArr[2];
        float fAbs = (1.0f - Math.abs((f13 * 2.0f) - 1.0f)) * f12;
        float f14 = f13 - (0.5f * fAbs);
        float fAbs2 = (1.0f - Math.abs(((f11 / 60.0f) % 2.0f) - 1.0f)) * fAbs;
        switch (((int) f11) / 60) {
            case 0:
                iG2 = c1.g(fAbs, f14, 255.0f);
                iG = c1.g(fAbs2, f14, 255.0f);
                iRound = Math.round(f14 * 255.0f);
                break;
            case 1:
                iG2 = c1.g(fAbs2, f14, 255.0f);
                iG = c1.g(fAbs, f14, 255.0f);
                iRound = Math.round(f14 * 255.0f);
                break;
            case 2:
                iG2 = Math.round(f14 * 255.0f);
                iG = c1.g(fAbs, f14, 255.0f);
                iRound = c1.g(fAbs2, f14, 255.0f);
                break;
            case 3:
                iG2 = Math.round(f14 * 255.0f);
                iG = c1.g(fAbs2, f14, 255.0f);
                iRound = c1.g(fAbs, f14, 255.0f);
                break;
            case 4:
                iG2 = c1.g(fAbs2, f14, 255.0f);
                iG = Math.round(f14 * 255.0f);
                iRound = c1.g(fAbs, f14, 255.0f);
                break;
            case 5:
            case 6:
                iG2 = c1.g(fAbs, f14, 255.0f);
                iG = Math.round(f14 * 255.0f);
                iRound = c1.g(fAbs2, f14, 255.0f);
                break;
            default:
                iRound = 0;
                iG = 0;
                break;
        }
        return Color.rgb(l(iG2), l(iG), l(iRound));
    }

    public static int b(double d5, double d11, double d12) {
        ThreadLocal threadLocal = f85477a;
        double[] dArr = (double[]) threadLocal.get();
        if (dArr == null) {
            dArr = new double[3];
            threadLocal.set(dArr);
        }
        double d13 = (d5 + 16.0d) / 116.0d;
        double d14 = (d11 / 500.0d) + d13;
        double d15 = d13 - (d12 / 200.0d);
        double dPow = Math.pow(d14, 3.0d);
        if (dPow <= 0.008856d) {
            dPow = ((d14 * 116.0d) - 16.0d) / 903.3d;
        }
        double dPow2 = d5 > 7.9996247999999985d ? Math.pow(d13, 3.0d) : d5 / 903.3d;
        double dPow3 = Math.pow(d15, 3.0d);
        if (dPow3 <= 0.008856d) {
            dPow3 = ((d15 * 116.0d) - 16.0d) / 903.3d;
        }
        double d16 = dPow * 95.047d;
        dArr[0] = d16;
        double d17 = dPow2 * 100.0d;
        dArr[1] = d17;
        double d18 = dPow3 * 108.883d;
        dArr[2] = d18;
        return e(d16, d17, d18);
    }

    public static void c(int i5, int i11, int i12, float[] fArr) {
        float fZ;
        float fAbs;
        float f11 = i5 / 255.0f;
        float f12 = i11 / 255.0f;
        float f13 = i12 / 255.0f;
        float fMax = Math.max(f11, Math.max(f12, f13));
        float fMin = Math.min(f11, Math.min(f12, f13));
        float f14 = fMax - fMin;
        float f15 = (fMax + fMin) / 2.0f;
        if (fMax == fMin) {
            fZ = 0.0f;
            fAbs = 0.0f;
        } else {
            fZ = fMax == f11 ? ((f12 - f13) / f14) % 6.0f : fMax == f12 ? a2.c.z(f13, f11, f14, 2.0f) : a2.c.z(f11, f12, f14, 4.0f);
            fAbs = f14 / (1.0f - Math.abs((2.0f * f15) - 1.0f));
        }
        float f16 = (fZ * 60.0f) % 360.0f;
        if (f16 < 0.0f) {
            f16 += 360.0f;
        }
        fArr[0] = f16 < 0.0f ? 0.0f : Math.min(f16, 360.0f);
        fArr[1] = fAbs < 0.0f ? 0.0f : Math.min(fAbs, 1.0f);
        fArr[2] = f15 >= 0.0f ? Math.min(f15, 1.0f) : 0.0f;
    }

    public static void d(int i5, int i11, int i12, double[] dArr) {
        if (dArr.length != 3) {
            throw new IllegalArgumentException("outXyz must have a length of 3.");
        }
        double d5 = i5 / 255.0d;
        double dPow = d5 < 0.04045d ? d5 / 12.92d : Math.pow((d5 + 0.055d) / 1.055d, 2.4d);
        double d11 = i11 / 255.0d;
        double dPow2 = d11 < 0.04045d ? d11 / 12.92d : Math.pow((d11 + 0.055d) / 1.055d, 2.4d);
        double d12 = i12 / 255.0d;
        double dPow3 = d12 < 0.04045d ? d12 / 12.92d : Math.pow((d12 + 0.055d) / 1.055d, 2.4d);
        dArr[0] = ((0.1805d * dPow3) + (0.3576d * dPow2) + (0.4124d * dPow)) * 100.0d;
        dArr[1] = ((0.0722d * dPow3) + (0.7152d * dPow2) + (0.2126d * dPow)) * 100.0d;
        dArr[2] = ((dPow3 * 0.9505d) + (dPow2 * 0.1192d) + (dPow * 0.0193d)) * 100.0d;
    }

    public static int e(double d5, double d11, double d12) {
        double d13 = (((-0.4986d) * d12) + (((-1.5372d) * d11) + (3.2406d * d5))) / 100.0d;
        double d14 = ((0.0415d * d12) + ((1.8758d * d11) + ((-0.9689d) * d5))) / 100.0d;
        double d15 = ((1.057d * d12) + (((-0.204d) * d11) + (0.0557d * d5))) / 100.0d;
        return Color.rgb(l((int) Math.round((d13 > 0.0031308d ? (Math.pow(d13, 0.4166666666666667d) * 1.055d) - 0.055d : d13 * 12.92d) * 255.0d)), l((int) Math.round((d14 > 0.0031308d ? (Math.pow(d14, 0.4166666666666667d) * 1.055d) - 0.055d : d14 * 12.92d) * 255.0d)), l((int) Math.round((d15 > 0.0031308d ? (Math.pow(d15, 0.4166666666666667d) * 1.055d) - 0.055d : d15 * 12.92d) * 255.0d)));
    }

    public static int f(float f11, int i5, int i11) {
        float f12 = 1.0f - f11;
        return Color.argb((int) ((Color.alpha(i11) * f11) + (Color.alpha(i5) * f12)), (int) ((Color.red(i11) * f11) + (Color.red(i5) * f12)), (int) ((Color.green(i11) * f11) + (Color.green(i5) * f12)), (int) ((Color.blue(i11) * f11) + (Color.blue(i5) * f12)));
    }

    public static double g(int i5, int i11) {
        if (Color.alpha(i11) != 255) {
            throw new IllegalArgumentException("background can not be translucent: #" + Integer.toHexString(i11));
        }
        if (Color.alpha(i5) < 255) {
            i5 = j(i5, i11);
        }
        double dH = h(i5) + 0.05d;
        double dH2 = h(i11) + 0.05d;
        return Math.max(dH, dH2) / Math.min(dH, dH2);
    }

    public static double h(int i5) {
        ThreadLocal threadLocal = f85477a;
        double[] dArr = (double[]) threadLocal.get();
        if (dArr == null) {
            dArr = new double[3];
            threadLocal.set(dArr);
        }
        d(Color.red(i5), Color.green(i5), Color.blue(i5), dArr);
        return dArr[1] / 100.0d;
    }

    public static void i(double[] dArr, int i5) {
        d(Color.red(i5), Color.green(i5), Color.blue(i5), dArr);
        double d5 = dArr[0];
        double d11 = dArr[1];
        double d12 = dArr[2];
        if (dArr.length != 3) {
            throw new IllegalArgumentException("outLab must have a length of 3.");
        }
        double dM = m(d5 / 95.047d);
        double dM2 = m(d11 / 100.0d);
        double dM3 = m(d12 / 108.883d);
        dArr[0] = Math.max(0.0d, (116.0d * dM2) - 16.0d);
        dArr[1] = (dM - dM2) * 500.0d;
        dArr[2] = (dM2 - dM3) * 200.0d;
    }

    public static int j(int i5, int i11) {
        int iAlpha = Color.alpha(i11);
        int iAlpha2 = Color.alpha(i5);
        int i12 = 255 - (((255 - iAlpha2) * (255 - iAlpha)) / 255);
        return Color.argb(i12, k(Color.red(i5), iAlpha2, Color.red(i11), iAlpha, i12), k(Color.green(i5), iAlpha2, Color.green(i11), iAlpha, i12), k(Color.blue(i5), iAlpha2, Color.blue(i11), iAlpha, i12));
    }

    public static int k(int i5, int i11, int i12, int i13, int i14) {
        if (i14 == 0) {
            return 0;
        }
        return (((255 - i11) * (i12 * i13)) + ((i5 * 255) * i11)) / (i14 * 255);
    }

    public static int l(int i5) {
        if (i5 < 0) {
            return 0;
        }
        return Math.min(i5, 255);
    }

    public static double m(double d5) {
        return d5 > 0.008856d ? Math.pow(d5, 0.3333333333333333d) : ((d5 * 903.3d) + 16.0d) / 116.0d;
    }

    public static int n(int i5, int i11) {
        if (i11 < 0 || i11 > 255) {
            throw new IllegalArgumentException("alpha must be between 0 and 255.");
        }
        return (i5 & 16777215) | (i11 << 24);
    }
}
