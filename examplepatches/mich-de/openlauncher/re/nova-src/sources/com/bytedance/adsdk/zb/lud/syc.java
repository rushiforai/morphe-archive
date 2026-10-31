package com.bytedance.adsdk.zb.lud;

import android.graphics.Color;
import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes2.dex */
public class syc implements dc<com.bytedance.adsdk.zb.sya.zb.dj> {
    private int ycx;

    public syc(int i5) {
        this.ycx = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00c9  */
    @Override // com.bytedance.adsdk.zb.lud.dc
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.adsdk.zb.sya.zb.dj zb(JsonReader jsonReader, float f11) throws IOException {
        ArrayList arrayList = new ArrayList();
        boolean z11 = jsonReader.peek() == JsonToken.BEGIN_ARRAY;
        if (z11) {
            jsonReader.beginArray();
        }
        while (jsonReader.hasNext()) {
            arrayList.add(Float.valueOf((float) jsonReader.nextDouble()));
        }
        if (arrayList.size() == 4 && ((Float) arrayList.get(0)).floatValue() == 1.0f) {
            arrayList.set(0, Float.valueOf(0.0f));
            arrayList.add(Float.valueOf(1.0f));
            arrayList.add(arrayList.get(1));
            arrayList.add(arrayList.get(2));
            arrayList.add(arrayList.get(3));
            this.ycx = 2;
        }
        if (z11) {
            jsonReader.endArray();
        }
        if (this.ycx == -1) {
            this.ycx = arrayList.size() / 4;
        }
        int i5 = this.ycx;
        float[] fArr = new float[i5];
        int[] iArr = new int[i5];
        int i11 = 0;
        int i12 = 0;
        for (int i13 = 0; i13 < this.ycx * 4; i13++) {
            int i14 = i13 / 4;
            double dFloatValue = ((Float) arrayList.get(i13)).floatValue();
            int i15 = i13 % 4;
            if (i15 != 0) {
                if (i15 == 1) {
                    i11 = (int) (dFloatValue * 255.0d);
                } else if (i15 == 2) {
                    i12 = (int) (dFloatValue * 255.0d);
                } else if (i15 == 3) {
                    iArr[i14] = Color.argb(255, i11, i12, (int) (dFloatValue * 255.0d));
                }
            } else if (i14 > 0) {
                float f12 = (float) dFloatValue;
                if (fArr[i14 - 1] >= f12) {
                    fArr[i14] = f12 + 0.01f;
                } else {
                    fArr[i14] = (float) dFloatValue;
                }
            }
        }
        return ycx(new com.bytedance.adsdk.zb.sya.zb.dj(fArr, iArr), arrayList);
    }

    private com.bytedance.adsdk.zb.sya.zb.dj ycx(com.bytedance.adsdk.zb.sya.zb.dj djVar, List<Float> list) {
        int i5 = this.ycx * 4;
        if (list.size() <= i5) {
            return djVar;
        }
        float[] fArrYcx = djVar.ycx();
        int[] iArrZb = djVar.zb();
        int size = (list.size() - i5) / 2;
        float[] fArr = new float[size];
        float[] fArr2 = new float[size];
        int i11 = 0;
        while (i5 < list.size()) {
            if (i5 % 2 == 0) {
                fArr[i11] = list.get(i5).floatValue();
            } else {
                fArr2[i11] = list.get(i5).floatValue();
                i11++;
            }
            i5++;
        }
        float[] fArrYcx2 = ycx(djVar.ycx(), fArr);
        int length = fArrYcx2.length;
        int[] iArr = new int[length];
        for (int i12 = 0; i12 < length; i12++) {
            float f11 = fArrYcx2[i12];
            int iBinarySearch = Arrays.binarySearch(fArrYcx, f11);
            int iBinarySearch2 = Arrays.binarySearch(fArr, f11);
            if (iBinarySearch >= 0 && iBinarySearch2 <= 0) {
                iArr[i12] = ycx(f11, iArrZb[iBinarySearch], fArr, fArr2);
            } else {
                if (iBinarySearch2 < 0) {
                    iBinarySearch2 = -(iBinarySearch2 + 1);
                }
                iArr[i12] = ycx(f11, fArr2[iBinarySearch2], fArrYcx, iArrZb);
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.dj(fArrYcx2, iArr);
    }

    public int ycx(float f11, float f12, float[] fArr, int[] iArr) {
        if (iArr.length >= 2 && f11 != fArr[0]) {
            for (int i5 = 1; i5 < fArr.length; i5++) {
                float f13 = fArr[i5];
                if (f13 >= f11 || i5 == fArr.length - 1) {
                    int i11 = i5 - 1;
                    float f14 = fArr[i11];
                    float f15 = (f11 - f14) / (f13 - f14);
                    int i12 = iArr[i5];
                    int i13 = iArr[i11];
                    return Color.argb((int) (f12 * 255.0f), com.bytedance.adsdk.zb.lt.zb.ycx(f15, Color.red(i13), Color.red(i12)), com.bytedance.adsdk.zb.lt.zb.ycx(f15, Color.green(i13), Color.green(i12)), com.bytedance.adsdk.zb.lt.zb.ycx(f15, Color.blue(i13), Color.blue(i12)));
                }
            }
            throw new IllegalArgumentException("Unreachable code.");
        }
        return iArr[0];
    }

    private int ycx(float f11, int i5, float[] fArr, float[] fArr2) {
        float fYcx;
        if (fArr2.length >= 2 && f11 > fArr[0]) {
            for (int i11 = 1; i11 < fArr.length; i11++) {
                float f12 = fArr[i11];
                if (f12 >= f11 || i11 == fArr.length - 1) {
                    if (f12 <= f11) {
                        fYcx = fArr2[i11];
                    } else {
                        int i12 = i11 - 1;
                        float f13 = fArr[i12];
                        fYcx = com.bytedance.adsdk.zb.lt.lud.ycx(fArr2[i12], fArr2[i11], (f11 - f13) / (f12 - f13));
                    }
                    return Color.argb((int) (fYcx * 255.0f), Color.red(i5), Color.green(i5), Color.blue(i5));
                }
            }
            throw new IllegalArgumentException("Unreachable code.");
        }
        return Color.argb((int) (fArr2[0] * 255.0f), Color.red(i5), Color.green(i5), Color.blue(i5));
    }

    public static float[] ycx(float[] fArr, float[] fArr2) {
        if (fArr.length == 0) {
            return fArr2;
        }
        if (fArr2.length == 0) {
            return fArr;
        }
        int length = fArr.length + fArr2.length;
        float[] fArr3 = new float[length];
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        for (int i13 = 0; i13 < length; i13++) {
            float f11 = i11 < fArr.length ? fArr[i11] : Float.NaN;
            float f12 = i12 < fArr2.length ? fArr2[i12] : Float.NaN;
            if (!Float.isNaN(f12) && f11 >= f12) {
                if (!Float.isNaN(f11) && f12 >= f11) {
                    fArr3[i13] = f11;
                    i11++;
                    i12++;
                    i5++;
                } else {
                    fArr3[i13] = f12;
                    i12++;
                }
            } else {
                fArr3[i13] = f11;
                i11++;
            }
        }
        return i5 == 0 ? fArr3 : Arrays.copyOf(fArr3, length - i5);
    }
}
