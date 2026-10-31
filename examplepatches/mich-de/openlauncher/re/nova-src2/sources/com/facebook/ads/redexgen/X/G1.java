package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import com.facebook.ads.internal.util.image.thirdparty.JavaBlurProcess;
import java.util.ArrayList;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public final class G1 {
    public static String[] A00 = {"hdmHMjdsCvnnIiAm68nbzST5FT4P5mLb", "EH3LUmZxwOvThvXMHcswnn58jDASieiK", "ljU4lnctUqCxo644HWpRzVkau739AG18", "cf0wMMVzQ5eDMzw1G9WbfLTL5VaSUv", "l50byEuqIAJWTFcEqiPP3cq5SFvrKOhf", "BkuhnFfUhQO532vAuKLRONmm63PuLWNO", "lueSUxwI7577CW", "p49ZYnIXKwO4jtZLxoBrhqW2OVcn4ZYc"};
    public static final short[] A02 = {512, 512, 456, 512, 328, 456, 335, 512, 405, 328, 271, 456, 388, 335, 292, 512, 454, 405, 364, 328, 298, 271, 496, 456, 420, 388, 360, 335, 312, 292, 273, 512, 482, 454, 428, 405, 383, 364, 345, 328, 312, 298, 284, 271, 259, 496, 475, 456, 437, 420, 404, 388, 374, 360, 347, 335, 323, 312, 302, 292, 282, 273, 265, 512, 497, 482, 468, 454, 441, 428, 417, 405, 394, 383, 373, 364, 354, 345, 337, 328, 320, 312, 305, 298, 291, 284, 278, 271, 265, 259, 507, 496, 485, 475, 465, 456, 446, 437, 428, 420, 412, 404, 396, 388, 381, 374, 367, 360, 354, 347, 341, 335, 329, 323, 318, 312, 307, 302, 297, 292, 287, 282, 278, 273, 269, 265, 261, 512, 505, 497, 489, 482, 475, 468, 461, 454, 447, 441, 435, 428, 422, 417, 411, 405, 399, 394, 389, 383, 378, 373, 368, 364, 359, 354, 350, 345, 341, 337, 332, 328, 324, 320, 316, 312, 309, 305, 301, 298, 294, 291, 287, 284, 281, 278, 274, 271, 268, 265, 262, 259, 257, 507, 501, 496, 491, 485, 480, 475, 470, 465, 460, 456, 451, 446, 442, 437, 433, 428, 424, 420, 416, 412, 408, 404, 400, 396, 392, 388, 385, 381, 377, 374, 370, 367, 363, 360, 357, 354, 350, 347, 344, 341, 338, 335, 332, 329, 326, 323, 320, 318, 315, 312, 310, 307, 304, 302, 299, 297, 294, 292, 289, 287, 285, 282, 280, 278, 275, 273, 271, 269, 267, 265, 263, 261, 259};
    public static final byte[] A01 = {9, 11, 12, 13, 13, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24};

    /* JADX WARN: Incorrect condition in loop: B:39:0x01bb */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A00(int[] iArr, int src_i, int y11, int minX, int i5, int i11, int i12) {
        int maxY = src_i - 1;
        int i13 = y11 - 1;
        int stack_start = (minX * 2) + 1;
        short s11 = A02[minX];
        byte b11 = A01[minX];
        int[] iArr2 = new int[stack_start];
        long j11 = 0;
        if (i12 == 1) {
            int i14 = (i11 * y11) / i5;
            int i15 = ((i11 + 1) * y11) / i5;
            while (i14 < i15) {
                long sum_out_b = j11;
                long j12 = j11;
                long j13 = j11;
                long j14 = j11;
                long j15 = j11;
                long j16 = j11;
                long j17 = j11;
                long j18 = j11;
                int wm2 = src_i * i14;
                for (int i16 = 0; i16 <= minX; i16++) {
                    iArr2[i16] = iArr[wm2];
                    j18 += ((iArr[wm2] >>> 16) & 255) * (i16 + 1);
                    j17 += ((iArr[wm2] >>> 8) & 255) * (i16 + 1);
                    j16 += (iArr[wm2] & 255) * (i16 + 1);
                    j12 += (iArr[wm2] >>> 16) & 255;
                    sum_out_b += (iArr[wm2] >>> 8) & 255;
                    j11 += iArr[wm2] & 255;
                }
                for (int i17 = 1; i17 <= minX; i17++) {
                    if (i17 <= maxY) {
                        wm2++;
                    }
                    iArr2[i17 + minX] = iArr[wm2];
                    j18 += ((iArr[wm2] >>> 16) & 255) * ((minX + 1) - i17);
                    j17 += ((iArr[wm2] >>> 8) & 255) * ((minX + 1) - i17);
                    j16 += (iArr[wm2] & 255) * ((minX + 1) - i17);
                    j15 += (iArr[wm2] >>> 16) & 255;
                    j14 += (iArr[wm2] >>> 8) & 255;
                    j13 += iArr[wm2] & 255;
                }
                int i18 = minX;
                int i19 = minX;
                if (i19 > maxY) {
                    i19 = maxY;
                }
                int i21 = (i14 * src_i) + i19;
                int i22 = i14 * src_i;
                for (int i23 = 0; i23 < src_i; i23++) {
                    iArr[i22] = (int) ((iArr[i22] & (-16777216)) | ((((s11 * j18) >>> b11) & 255) << 16) | ((((s11 * j17) >>> b11) & 255) << 8) | (((s11 * j16) >>> b11) & 255));
                    i22++;
                    long j19 = j18 - j12;
                    long j21 = j17 - sum_out_b;
                    long j22 = j16 - j11;
                    int i24 = (i18 + stack_start) - minX;
                    if (i24 >= stack_start) {
                        i24 -= stack_start;
                    }
                    long j23 = j12 - ((iArr2[i24] >>> 16) & 255);
                    long sum_out_b2 = sum_out_b - ((iArr2[i24] >>> 8) & 255);
                    long j24 = j11 - (iArr2[i24] & 255);
                    int stack_i = i19;
                    if (stack_i < maxY) {
                        i21++;
                        i19++;
                    }
                    iArr2[i24] = iArr[i21];
                    long j25 = j15 + ((iArr[i21] >>> 16) & 255);
                    long j26 = j14 + ((iArr[i21] >>> 8) & 255);
                    long j27 = j13 + (iArr[i21] & 255);
                    j18 = j19 + j25;
                    j17 = j21 + j26;
                    j16 = j22 + j27;
                    int i25 = i18 + 1;
                    if (i25 >= stack_start) {
                        i25 = 0;
                    }
                    int stack_i2 = iArr2[i25];
                    i18 = i25;
                    j12 = j23 + ((stack_i2 >>> 16) & 255);
                    int stack_i3 = iArr2[i25];
                    sum_out_b = sum_out_b2 + ((stack_i3 >>> 8) & 255);
                    int stack_i4 = iArr2[i25];
                    j11 = j24 + (stack_i4 & 255);
                    int stack_i5 = iArr2[i25];
                    j15 = j25 - ((stack_i5 >>> 16) & 255);
                    int stack_i6 = iArr2[i25];
                    j14 = j26 - ((stack_i6 >>> 8) & 255);
                    int stack_i7 = iArr2[i25];
                    j13 = j27 - (stack_i7 & 255);
                }
                i14++;
                j11 = 0;
            }
            return;
        }
        if (i12 == 2) {
            int i26 = (i11 * src_i) / i5;
            int i27 = ((i11 + 1) * src_i) / i5;
            while (maxX < i27) {
                long j28 = 0;
                long j29 = 0;
                long j31 = 0;
                long j32 = 0;
                long j33 = 0;
                long j34 = 0;
                long j35 = 0;
                long j36 = 0;
                long j37 = 0;
                int wm3 = i26;
                for (int i28 = 0; i28 <= minX; i28++) {
                    iArr2[i28] = iArr[wm3];
                    int maxX = i28 + 1;
                    j37 += ((iArr[wm3] >>> 16) & 255) * maxX;
                    j36 += ((iArr[wm3] >>> 8) & 255) * (i28 + 1);
                    j35 += (iArr[wm3] & 255) * (i28 + 1);
                    j31 += (iArr[wm3] >>> 16) & 255;
                    j29 += (iArr[wm3] >>> 8) & 255;
                    j28 += iArr[wm3] & 255;
                }
                for (int i29 = 1; i29 <= minX; i29++) {
                    if (i29 <= i13) {
                        wm3 += src_i;
                    }
                    int stack_i8 = i29 + minX;
                    iArr2[stack_i8] = iArr[wm3];
                    int stack_i9 = minX + 1;
                    j37 += ((iArr[wm3] >>> 16) & 255) * (stack_i9 - i29);
                    int stack_i10 = minX + 1;
                    j36 += ((iArr[wm3] >>> 8) & 255) * (stack_i10 - i29);
                    int stack_i11 = minX + 1;
                    j35 += (iArr[wm3] & 255) * (stack_i11 - i29);
                    j34 += (iArr[wm3] >>> 16) & 255;
                    j33 += (iArr[wm3] >>> 8) & 255;
                    j32 += iArr[wm3] & 255;
                }
                int hm2 = minX;
                int sp2 = minX;
                if (sp2 > i13) {
                    sp2 = i13;
                }
                int i31 = (sp2 * src_i) + i26;
                int i32 = i26;
                for (int sp3 = 0; sp3 < y11; sp3++) {
                    iArr[i32] = (int) ((iArr[i32] & (-16777216)) | ((((s11 * j37) >>> b11) & 255) << 16) | ((((s11 * j36) >>> b11) & 255) << 8) | (((s11 * j35) >>> b11) & 255));
                    i32 += src_i;
                    long j38 = j37 - j31;
                    long j39 = j36 - j29;
                    long j40 = j35 - j28;
                    int stack_start2 = (hm2 + stack_start) - minX;
                    if (stack_start2 >= stack_start) {
                        stack_start2 -= stack_start;
                    }
                    long j41 = j31 - ((iArr2[stack_start2] >>> 16) & 255);
                    long j42 = j29 - ((iArr2[stack_start2] >>> 8) & 255);
                    long j43 = j28 - (iArr2[stack_start2] & 255);
                    if (sp2 < i13) {
                        i31 += src_i;
                        sp2++;
                    }
                    iArr2[stack_start2] = iArr[i31];
                    long j44 = j34 + ((iArr[i31] >>> 16) & 255);
                    long j45 = j33 + ((iArr[i31] >>> 8) & 255);
                    long j46 = j32 + (iArr[i31] & 255);
                    j37 = j38 + j44;
                    j36 = j39 + j45;
                    j35 = j40 + j46;
                    hm2++;
                    if (hm2 >= stack_start) {
                        hm2 = 0;
                    }
                    j31 = j41 + ((iArr2[hm2] >>> 16) & 255);
                    j29 = j42 + ((iArr2[hm2] >>> 8) & 255);
                    j28 = j43 + (iArr2[hm2] & 255);
                    j34 = j44 - ((iArr2[hm2] >>> 16) & 255);
                    j33 = j45 - ((iArr2[hm2] >>> 8) & 255);
                    j32 = j46 - (iArr2[hm2] & 255);
                }
                i26++;
                String[] strArr = A00;
                if (strArr[4].charAt(24) == strArr[0].charAt(24)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A00;
                strArr2[4] = "dRrOf81uK3m7JlCVGnAp7HBN8Ud450kD";
                strArr2[0] = "ERfsWS88AUosonNdTmqfcWCTdCaDCKBU";
            }
        }
    }

    @Nullable
    public final Bitmap A02(Bitmap bitmap, float f11) throws InterruptedException {
        int w10 = bitmap.getWidth();
        int h5 = bitmap.getHeight();
        try {
            int[] iArr = new int[w10 * h5];
            bitmap.getPixels(iArr, 0, w10, 0, 0, w10, h5);
            int i5 = AbstractC2440qq.A00;
            ArrayList arrayList = new ArrayList(i5);
            ArrayList<JavaBlurProcess.BlurTask> vertical = new ArrayList<>(i5);
            for (int i11 = 0; i11 < i5; i11++) {
                int h8 = h5;
                int cores = i11;
                arrayList.add(new CallableC2439qp(iArr, w10, h8, (int) f11, i5, cores, 1));
                h5 = h8;
                int cores2 = i11;
                vertical.add(new CallableC2439qp(iArr, w10, h5, (int) f11, i5, cores2, 2));
            }
            try {
                AbstractC2440qq.A01.invokeAll(arrayList);
                try {
                    AbstractC2440qq.A01.invokeAll(vertical);
                    try {
                        return Bitmap.createBitmap(iArr, w10, h5, Bitmap.Config.ARGB_8888);
                    } catch (OutOfMemoryError unused) {
                        return null;
                    }
                } catch (InterruptedException unused2) {
                    return null;
                }
            } catch (InterruptedException unused3) {
                return null;
            }
        } catch (OutOfMemoryError unused4) {
            return null;
        }
    }
}
