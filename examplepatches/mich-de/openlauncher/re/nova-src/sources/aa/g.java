package aa;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.util.SparseArray;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: c, reason: collision with root package name */
    public final int[] f585c;

    /* renamed from: e, reason: collision with root package name */
    public final int f587e;

    /* renamed from: a, reason: collision with root package name */
    public final float[] f583a = new float[3];

    /* renamed from: b, reason: collision with root package name */
    public final float[] f584b = new float[360];

    /* renamed from: d, reason: collision with root package name */
    public final SparseArray f586d = new SparseArray();

    /* renamed from: f, reason: collision with root package name */
    public boolean f588f = false;

    public g(int i5) {
        this.f587e = i5;
        this.f585c = new int[i5];
    }

    public final int a(Bitmap bitmap, int i5) {
        int[] iArr;
        int i11;
        int i12 = i5;
        int height = bitmap.getHeight();
        int width = bitmap.getWidth();
        int iSqrt = (int) Math.sqrt((height * width) / i12);
        boolean z11 = true;
        if (iSqrt < 1) {
            iSqrt = 1;
        }
        float[] fArr = this.f583a;
        Arrays.fill(fArr, 0.0f);
        float[] fArr2 = this.f584b;
        Arrays.fill(fArr2, 0.0f);
        int i13 = 0;
        if (i12 == this.f587e) {
            iArr = this.f585c;
            Arrays.fill(iArr, 0);
        } else {
            iArr = new int[i12];
        }
        boolean z12 = this.f588f;
        int i14 = z12 ? iSqrt : 0;
        int i15 = z12 ? iSqrt : 0;
        if (z12) {
            height -= iSqrt;
        }
        if (z12) {
            width -= iSqrt;
        }
        int i16 = -1;
        int i17 = 0;
        float f11 = -1.0f;
        while (true) {
            i11 = -16777216;
            if (i14 >= height) {
                break;
            }
            boolean z13 = z11;
            int i18 = i15;
            while (i18 < width) {
                int i19 = i13;
                int pixel = bitmap.getPixel(i18, i14);
                int i21 = height;
                if (((pixel >> 24) & 255) >= 128) {
                    int i22 = pixel | (-16777216);
                    Color.colorToHSV(i22, fArr);
                    int i23 = (int) fArr[i19];
                    if (i23 >= 0 && i23 < fArr2.length) {
                        if (i17 < i12) {
                            iArr[i17] = i22;
                            i17++;
                        }
                        float f12 = fArr[z13 ? 1 : 0];
                        float f13 = fArr[2];
                        float f14 = f12 * f13;
                        float f15 = i23;
                        if (35.0f <= f15 && f15 <= 50.0f && 0.1f <= f12 && f12 <= 1.0f && 0.9f <= f13 && f13 <= 1.0f) {
                            f14 *= 0.3f;
                        }
                        float f16 = fArr2[i23] + f14;
                        fArr2[i23] = f16;
                        if (f16 > f11) {
                            f11 = f16;
                            i16 = i23;
                        }
                    }
                }
                i18 += iSqrt;
                i12 = i5;
                i13 = i19;
                height = i21;
            }
            i14 += iSqrt;
            i12 = i5;
            z11 = z13 ? 1 : 0;
            i13 = i13;
        }
        boolean z14 = z11;
        int i24 = i13;
        SparseArray sparseArray = this.f586d;
        sparseArray.clear();
        float f17 = -1.0f;
        for (int i25 = i24; i25 < i17; i25++) {
            int i26 = iArr[i25];
            Color.colorToHSV(i26, fArr);
            if (((int) fArr[i24]) == i16) {
                float f18 = fArr[z14 ? 1 : 0];
                float f19 = fArr[2];
                int i27 = ((int) (100.0f * f18)) + ((int) (10000.0f * f19));
                float fFloatValue = f18 * f19;
                Float f21 = (Float) sparseArray.get(i27);
                if (f21 != null) {
                    fFloatValue += f21.floatValue();
                }
                sparseArray.put(i27, Float.valueOf(fFloatValue));
                if (fFloatValue > f17) {
                    i11 = i26;
                    f17 = fFloatValue;
                }
            }
        }
        return i11;
    }
}
