package defpackage;

import android.graphics.Bitmap;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ws0 extends ord {
    public final String a = ws0.class.getName().concat("-10");

    @Override // defpackage.ord
    public final String a() {
        return this.a;
    }

    @Override // defpackage.ord
    public final Bitmap b(Bitmap bitmap, cfc cfcVar) {
        Bitmap bitmap2;
        int i;
        Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap, nk7.w0(bitmap.getWidth() * 0.5f), nk7.w0(bitmap.getHeight() * 0.5f), false);
        Bitmap.Config config = bitmapCreateScaledBitmap.getConfig();
        if (config == null) {
            bitmapCreateScaledBitmap.recycle();
            bitmap2 = null;
        } else {
            Bitmap bitmapCopy = bitmapCreateScaledBitmap.copy(config, true);
            int width = bitmapCopy.getWidth();
            int height = bitmapCopy.getHeight();
            int i2 = width * height;
            int[] iArr = new int[i2];
            bitmapCopy.getPixels(iArr, 0, width, 0, 0, width, height);
            int i3 = width - 1;
            int i4 = height - 1;
            int[] iArr2 = new int[i2];
            int[] iArr3 = new int[i2];
            int[] iArr4 = new int[i2];
            int[] iArr5 = new int[width < height ? height : width];
            int[] iArr6 = new int[30976];
            for (int i5 = 0; i5 < 30976; i5++) {
                iArr6[i5] = i5 / PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE;
            }
            int[][] iArr7 = new int[21][];
            int i6 = 0;
            for (int i7 = 21; i6 < i7; i7 = i7) {
                iArr7[i6] = new int[3];
                i6++;
            }
            int i8 = 0;
            int i9 = 0;
            int i10 = 0;
            while (true) {
                if (i8 >= height) {
                    break;
                }
                int i11 = 0;
                int i12 = 0;
                int i13 = 0;
                int i14 = 0;
                int i15 = 0;
                int i16 = 0;
                int i17 = 0;
                int i18 = 0;
                Bitmap bitmap3 = bitmapCreateScaledBitmap;
                int i19 = -10;
                int i20 = 0;
                for (int i21 = 10; i19 <= i21; i21 = 10) {
                    int i22 = i19 < 0 ? 0 : i19;
                    if (i3 <= i22) {
                        i22 = i3;
                    }
                    int i23 = iArr[i22 + i9];
                    int[] iArr8 = iArr7[i19 + 10];
                    iArr8[0] = (i23 & 16711680) >> 16;
                    iArr8[1] = (i23 & 65280) >> 8;
                    iArr8[2] = i23 & 255;
                    int iAbs = 11 - Math.abs(i19);
                    int i24 = iArr8[0];
                    i20 = (i24 * iAbs) + i20;
                    int i25 = iArr8[1];
                    i11 = (i25 * iAbs) + i11;
                    int i26 = iArr8[2];
                    i12 = (iAbs * i26) + i12;
                    if (i19 > 0) {
                        i16 += i24;
                        i17 += i25;
                        i18 += i26;
                    } else {
                        i13 += i24;
                        i14 += i25;
                        i15 += i26;
                    }
                    i19++;
                }
                int i27 = 10;
                for (int i28 = 0; i28 < width; i28++) {
                    iArr2[i9] = iArr6[i20];
                    iArr3[i9] = iArr6[i11];
                    iArr4[i9] = iArr6[i12];
                    int i29 = i20 - i13;
                    int i30 = i11 - i14;
                    int i31 = i12 - i15;
                    int[] iArr9 = iArr7[(i27 + 11) % 21];
                    int i32 = i13 - iArr9[0];
                    int i33 = i14 - iArr9[1];
                    int i34 = i15 - iArr9[2];
                    if (i8 == 0) {
                        i = i27;
                        int i35 = i28 + 11;
                        if (i35 > i3) {
                            i35 = i3;
                        }
                        iArr5[i28] = i35;
                    } else {
                        i = i27;
                    }
                    int i36 = iArr[i10 + iArr5[i28]];
                    int i37 = (i36 & 16711680) >> 16;
                    iArr9[0] = i37;
                    int i38 = (i36 & 65280) >> 8;
                    iArr9[1] = i38;
                    int i39 = i36 & 255;
                    iArr9[2] = i39;
                    int i40 = i16 + i37;
                    int i41 = i17 + i38;
                    int i42 = i18 + i39;
                    i20 = i29 + i40;
                    i11 = i30 + i41;
                    i12 = i31 + i42;
                    i27 = (i + 1) % 21;
                    int[] iArr10 = iArr7[i27 % 21];
                    int i43 = iArr10[0];
                    i13 = i32 + i43;
                    int i44 = iArr10[1];
                    i14 = i33 + i44;
                    int i45 = iArr10[2];
                    i15 = i34 + i45;
                    i16 = i40 - i43;
                    i17 = i41 - i44;
                    i18 = i42 - i45;
                    i9++;
                }
                i10 += width;
                i8++;
                bitmapCreateScaledBitmap = bitmap3;
            }
            Bitmap bitmap4 = bitmapCreateScaledBitmap;
            int i46 = 0;
            while (i46 < width) {
                int i47 = (-10) * width;
                int i48 = 0;
                int i49 = 0;
                int i50 = 0;
                int i51 = 0;
                int i52 = 0;
                int i53 = 0;
                int i54 = 0;
                int i55 = 0;
                int i56 = 0;
                int i57 = i46;
                for (int i58 = -10; i58 <= 10; i58++) {
                    int i59 = (i47 > 0 ? i47 : 0) + i57;
                    int[] iArr11 = iArr7[i58 + 10];
                    iArr11[0] = iArr2[i59];
                    iArr11[1] = iArr3[i59];
                    iArr11[2] = iArr4[i59];
                    int iAbs2 = 11 - Math.abs(i58);
                    i48 = (iArr2[i59] * iAbs2) + i48;
                    i49 = (iArr3[i59] * iAbs2) + i49;
                    i50 = (iArr4[i59] * iAbs2) + i50;
                    if (i58 > 0) {
                        i54 += iArr11[0];
                        i55 += iArr11[1];
                        i56 += iArr11[2];
                    } else {
                        i51 += iArr11[0];
                        i52 += iArr11[1];
                        i53 += iArr11[2];
                    }
                    if (i58 < i4) {
                        i47 += width;
                    }
                }
                int i60 = 10;
                int i61 = i57;
                for (int i62 = 0; i62 < height; i62++) {
                    iArr[i61] = (iArr[i61] & (-16777216)) | (iArr6[i48] << 16) | (iArr6[i49] << 8) | iArr6[i50];
                    int i63 = i48 - i51;
                    int i64 = i49 - i52;
                    int i65 = i50 - i53;
                    int[] iArr12 = iArr7[(i60 + 11) % 21];
                    int i66 = i51 - iArr12[0];
                    int i67 = i52 - iArr12[1];
                    int i68 = i53 - iArr12[2];
                    if (i57 == 0) {
                        int i69 = i62 + 11;
                        if (i69 > i4) {
                            i69 = i4;
                        }
                        iArr5[i62] = i69 * width;
                    }
                    int i70 = i57 + iArr5[i62];
                    int i71 = iArr2[i70];
                    iArr12[0] = i71;
                    int i72 = iArr3[i70];
                    iArr12[1] = i72;
                    int i73 = iArr4[i70];
                    iArr12[2] = i73;
                    int i74 = i54 + i71;
                    int i75 = i55 + i72;
                    int i76 = i56 + i73;
                    i48 = i63 + i74;
                    i49 = i64 + i75;
                    i50 = i65 + i76;
                    i60 = (i60 + 1) % 21;
                    int[] iArr13 = iArr7[i60];
                    int i77 = iArr13[0];
                    i51 = i66 + i77;
                    int i78 = iArr13[1];
                    i52 = i67 + i78;
                    int i79 = iArr13[2];
                    i53 = i68 + i79;
                    i54 = i74 - i77;
                    i55 = i75 - i78;
                    i56 = i76 - i79;
                    i61 += width;
                }
                i46 = i57 + 1;
            }
            bitmapCopy.setPixels(iArr, 0, width, 0, 0, width, height);
            bitmap4.recycle();
            bitmap2 = bitmapCopy;
        }
        return bitmap2 == null ? bitmap : bitmap2;
    }

    @Override // defpackage.ord
    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof ws0);
    }

    @Override // defpackage.ord
    public final int hashCode() {
        return Float.floatToIntBits(0.5f) + 10;
    }
}
