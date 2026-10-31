package com.bytedance.sdk.component.adexpress.dj;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.HardwareRenderer;
import android.graphics.Paint;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.hardware.HardwareBuffer;
import android.media.Image;
import android.media.ImageReader;
import android.os.Build;
import android.renderscript.Allocation;
import android.renderscript.Element;
import android.renderscript.RenderScript;
import android.renderscript.ScriptIntrinsicBlur;
import ez.a;
import java.lang.reflect.Array;

/* loaded from: classes2.dex */
public class ycx {
    public static Bitmap ycx(Context context, Bitmap bitmap, int i5) {
        try {
            Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap, Math.round(bitmap.getWidth() * 0.2f), Math.round(bitmap.getHeight() * 0.2f), false);
            return com.bytedance.sdk.component.adexpress.dj.dj() == 0 ? zb(context, bitmapCreateScaledBitmap, i5) : com.bytedance.sdk.component.adexpress.dj.dj() == 1 ? ycx(bitmapCreateScaledBitmap, i5) : zb(bitmapCreateScaledBitmap, i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJP", 41);
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:96:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1, types: [android.renderscript.BaseObj] */
    /* JADX WARN: Type inference failed for: r6v3, types: [android.renderscript.BaseObj, android.renderscript.ScriptIntrinsicBlur] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Bitmap zb(Context context, Bitmap bitmap, int i5) {
        RenderScript renderScriptCreate;
        Allocation allocationCreateFromBitmap;
        ?? Create;
        Allocation allocationCreateFromBitmap2;
        try {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(bitmap);
            renderScriptCreate = RenderScript.create(context);
            if (renderScriptCreate == null) {
                try {
                    if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() == null || renderScriptCreate == null) {
                        return null;
                    }
                    RenderScript.releaseAllContexts();
                    return null;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcwv3vOkF4=", 106);
                    th2.getMessage();
                    return null;
                }
            }
            try {
                Create = ScriptIntrinsicBlur.create(renderScriptCreate, Element.U8_4(renderScriptCreate));
                try {
                    allocationCreateFromBitmap = Allocation.createFromBitmap(renderScriptCreate, bitmap);
                    try {
                        allocationCreateFromBitmap2 = Allocation.createFromBitmap(renderScriptCreate, bitmapCreateBitmap);
                    } catch (Throwable th3) {
                        th = th3;
                        allocationCreateFromBitmap2 = null;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    allocationCreateFromBitmap = null;
                    allocationCreateFromBitmap2 = null;
                }
            } catch (Throwable th5) {
                th = th5;
                allocationCreateFromBitmap = null;
                Create = allocationCreateFromBitmap;
                allocationCreateFromBitmap2 = Create;
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcwv3vOkF4=", 81);
                    th.getMessage();
                    try {
                        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                            return null;
                        }
                        if (renderScriptCreate != null) {
                            RenderScript.releaseAllContexts();
                        }
                        if (allocationCreateFromBitmap != null) {
                            allocationCreateFromBitmap.destroy();
                        }
                        if (allocationCreateFromBitmap2 != null) {
                            allocationCreateFromBitmap2.destroy();
                        }
                        if (Create == 0) {
                            return null;
                        }
                        Create.destroy();
                        return null;
                    } catch (Throwable th6) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcwv3vOkF4=", 106);
                        th6.getMessage();
                        return null;
                    }
                } catch (Throwable th7) {
                    try {
                        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                            if (renderScriptCreate != null) {
                                RenderScript.releaseAllContexts();
                            }
                            if (allocationCreateFromBitmap != null) {
                                allocationCreateFromBitmap.destroy();
                            }
                            if (allocationCreateFromBitmap2 != null) {
                                allocationCreateFromBitmap2.destroy();
                            }
                            if (Create != 0) {
                                Create.destroy();
                            }
                        }
                    } catch (Throwable th8) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcwv3vOkF4=", 106);
                        th8.getMessage();
                    }
                    throw th7;
                }
            }
            try {
                Create.setRadius(i5);
                Create.setInput(allocationCreateFromBitmap);
                Create.forEach(allocationCreateFromBitmap2);
                allocationCreateFromBitmap2.copyTo(bitmapCreateBitmap);
                try {
                    if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                        RenderScript.releaseAllContexts();
                        if (allocationCreateFromBitmap != null) {
                            allocationCreateFromBitmap.destroy();
                        }
                        allocationCreateFromBitmap2.destroy();
                        Create.destroy();
                    }
                } catch (Throwable th9) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th9, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcwv3vOkF4=", 106);
                    th9.getMessage();
                }
                return bitmapCreateBitmap;
            } catch (Throwable th10) {
                th = th10;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcwv3vOkF4=", 81);
                th.getMessage();
                if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
                }
            }
        } catch (Throwable th11) {
            th = th11;
            renderScriptCreate = null;
            allocationCreateFromBitmap = null;
        }
    }

    public static Bitmap ycx(Bitmap bitmap, int i5) {
        int i11;
        int i12;
        int i13 = i5;
        try {
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            int i14 = width * height;
            int[] iArr = new int[i14];
            bitmap.getPixels(iArr, 0, width, 0, 0, width, height);
            int[] iArr2 = iArr;
            int i15 = width - 1;
            int i16 = height - 1;
            int i17 = i13 + i13;
            int i18 = i17 + 1;
            char c11 = 2;
            int i19 = (i17 + 2) >> 1;
            int i21 = i19 * i19;
            int[] iArr3 = new int[Math.max(width, height)];
            int i22 = i21 * 256;
            int[] iArr4 = new int[i22];
            int[] iArr5 = new int[i14];
            int[] iArr6 = new int[i14];
            int[] iArr7 = new int[i14];
            int i23 = 0;
            for (int i24 = 0; i24 < i22; i24++) {
                iArr4[i24] = i24 / i21;
            }
            int[][] iArr8 = (int[][]) Array.newInstance((Class<?>) Integer.TYPE, i18, 3);
            int i25 = i13 + 1;
            int i26 = 0;
            int i27 = 0;
            int i28 = 0;
            while (i26 < height) {
                char c12 = c11;
                int i29 = -i13;
                int i31 = i23;
                int i32 = i31;
                int i33 = i32;
                int i34 = i33;
                int i35 = i34;
                int i36 = i35;
                int i37 = i36;
                int i38 = i37;
                int i39 = i38;
                while (i29 <= i13) {
                    int[] iArr9 = iArr2;
                    int[][] iArr10 = iArr8;
                    int i40 = iArr9[i27 + Math.min(i15, Math.max(i29, i23))];
                    int[] iArr11 = iArr10[i29 + i13];
                    iArr11[0] = (i40 & 16711680) >> 16;
                    iArr11[1] = (i40 & 65280) >> 8;
                    iArr11[c12] = i40 & 255;
                    int iAbs = i25 - Math.abs(i29);
                    int i41 = iArr11[0];
                    i31 = (i41 * iAbs) + i31;
                    int i42 = iArr11[1];
                    i32 = (i42 * iAbs) + i32;
                    int i43 = iArr11[c12];
                    i33 = (iAbs * i43) + i33;
                    if (i29 <= 0) {
                        i35 += i41;
                        i37 += i42;
                        i39 += i43;
                    } else {
                        i34 += i41;
                        i36 += i42;
                        i38 += i43;
                    }
                    i29++;
                    iArr2 = iArr9;
                    iArr8 = iArr10;
                    i23 = 0;
                }
                int[] iArr12 = iArr2;
                int[][] iArr13 = iArr8;
                int i44 = i13;
                int i45 = 0;
                while (i45 < width) {
                    iArr5[i27] = iArr4[i31];
                    iArr6[i27] = iArr4[i32];
                    iArr7[i27] = iArr4[i33];
                    int[] iArr14 = iArr13[((i44 - i13) + i18) % i18];
                    int i46 = i31 - i35;
                    int i47 = i32 - i37;
                    int i48 = i33 - i39;
                    int i49 = i35 - iArr14[0];
                    int i51 = i37 - iArr14[1];
                    int i52 = i39 - iArr14[c12];
                    if (i26 == 0) {
                        i12 = i45;
                        iArr3[i12] = Math.min(i45 + i13 + 1, i15);
                    } else {
                        i12 = i45;
                    }
                    int i53 = iArr12[i28 + iArr3[i12]];
                    int i54 = (i53 & 16711680) >> 16;
                    iArr14[0] = i54;
                    int i55 = (i53 & 65280) >> 8;
                    iArr14[1] = i55;
                    int i56 = i53 & 255;
                    iArr14[c12] = i56;
                    int i57 = i34 + i54;
                    int i58 = i36 + i55;
                    int i59 = i38 + i56;
                    i44 = (i44 + 1) % i18;
                    int[] iArr15 = iArr13[i44 % i18];
                    i31 = i46 + i57;
                    i32 = i47 + i58;
                    i33 = i48 + i59;
                    int i61 = iArr15[0];
                    i34 = i57 - i61;
                    int i62 = iArr15[1];
                    i36 = i58 - i62;
                    int i63 = iArr15[c12];
                    i38 = i59 - i63;
                    i35 = i49 + i61;
                    i37 = i51 + i62;
                    i39 = i52 + i63;
                    i27++;
                    i45 = i12 + 1;
                }
                i28 += width;
                i26++;
                c11 = c12;
                iArr2 = iArr12;
                iArr8 = iArr13;
                i23 = 0;
            }
            int[] iArr16 = iArr2;
            int[][] iArr17 = iArr8;
            char c13 = c11;
            int i64 = 0;
            while (i64 < width) {
                int i65 = -i13;
                int i66 = i65 * width;
                int i67 = 0;
                int i68 = 0;
                int i69 = 0;
                int i71 = 0;
                int i72 = 0;
                int i73 = 0;
                int i74 = 0;
                int i75 = 0;
                int i76 = 0;
                while (i65 <= i13) {
                    int[] iArr18 = iArr17[i65 + i13];
                    int iMax = Math.max(0, i66) + i64;
                    int iAbs2 = i25 - Math.abs(i65);
                    int i77 = iArr5[iMax];
                    i67 = (i77 * iAbs2) + i67;
                    i68 = (iArr6[iMax] * iAbs2) + i68;
                    i69 = (iArr7[iMax] * iAbs2) + i69;
                    iArr18[0] = i77;
                    int i78 = iArr6[iMax];
                    iArr18[1] = i78;
                    int i79 = iArr7[iMax];
                    iArr18[c13] = i79;
                    if (i65 <= 0) {
                        i72 += i77;
                        i74 += i78;
                        i76 += i79;
                    } else {
                        i71 += i77;
                        i73 += i78;
                        i75 += i79;
                    }
                    if (i65 < i16) {
                        i66 += width;
                    }
                    i65++;
                    i13 = i5;
                }
                int i81 = i5;
                int i82 = i64;
                int i83 = 0;
                while (i83 < height) {
                    iArr16[i82] = (iArr16[i82] & (-16777216)) | (iArr4[i67] << 16) | (iArr4[i68] << 8) | iArr4[i69];
                    int[] iArr19 = iArr17[((i81 - i5) + i18) % i18];
                    int i84 = i67 - i72;
                    int i85 = i68 - i74;
                    int i86 = i69 - i76;
                    int i87 = i72 - iArr19[0];
                    int i88 = i74 - iArr19[1];
                    int i89 = i76 - iArr19[c13];
                    if (i64 == 0) {
                        i11 = i83;
                        iArr3[i11] = Math.min(i11 + i25, i16) * width;
                    } else {
                        i11 = i83;
                    }
                    int i91 = iArr3[i11] + i64;
                    int i92 = iArr5[i91];
                    iArr19[0] = i92;
                    int i93 = iArr6[i91];
                    iArr19[1] = i93;
                    int i94 = iArr7[i91];
                    iArr19[c13] = i94;
                    int i95 = i71 + i92;
                    int i96 = i73 + i93;
                    int i97 = i75 + i94;
                    i67 = i84 + i95;
                    i68 = i85 + i96;
                    i69 = i86 + i97;
                    i81 = (i81 + 1) % i18;
                    int[] iArr20 = iArr17[i81];
                    int i98 = iArr20[0];
                    i71 = i95 - i98;
                    int i99 = iArr20[1];
                    i73 = i96 - i99;
                    int i100 = iArr20[c13];
                    i75 = i97 - i100;
                    i72 = i87 + i98;
                    i74 = i88 + i99;
                    i76 = i89 + i100;
                    i82 += width;
                    i83 = i11 + 1;
                }
                i64++;
                i13 = i5;
            }
            bitmap.setPixels(iArr16, 0, width, 0, 0, width, height);
            return bitmap;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiTPFrtJrcPqXs=", 268);
            th2.getMessage();
            return null;
        }
    }

    public static Bitmap zb(Bitmap bitmap, int i5) {
        try {
            if (Build.VERSION.SDK_INT < 31) {
                return ycx(bitmap, i5);
            }
            ImageReader imageReaderNewInstance = ImageReader.newInstance(bitmap.getWidth(), bitmap.getHeight(), 1, 1, 768L);
            a.k();
            RenderNode renderNodeE = a4.a.e();
            a.B();
            HardwareRenderer hardwareRendererF = a.f();
            hardwareRendererF.setSurface(imageReaderNewInstance.getSurface());
            hardwareRendererF.setContentRoot(renderNodeE);
            renderNodeE.setPosition(0, 0, imageReaderNewInstance.getWidth(), imageReaderNewInstance.getHeight());
            float f11 = i5;
            Shader.TileMode tileMode = Shader.TileMode.MIRROR;
            renderNodeE.setRenderEffect(RenderEffect.createBlurEffect(f11, f11, Shader.TileMode.MIRROR));
            renderNodeE.beginRecording().drawBitmap(bitmap, 0.0f, 0.0f, (Paint) null);
            renderNodeE.endRecording();
            hardwareRendererF.createRenderRequest().setWaitForPresent(true).syncAndDraw();
            Image imageAcquireNextImage = imageReaderNewInstance.acquireNextImage();
            HardwareBuffer hardwareBuffer = imageAcquireNextImage.getHardwareBuffer();
            Bitmap bitmapWrapHardwareBuffer = Bitmap.wrapHardwareBuffer(hardwareBuffer, null);
            hardwareBuffer.close();
            imageAcquireNextImage.close();
            imageReaderNewInstance.close();
            renderNodeE.discardDisplayList();
            hardwareRendererF.destroy();
            return bitmapWrapHardwareBuffer;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "eeI4hzaoYMuT", "XO84hhC1aMmiRsJPrgiSLVXqKIcmum/Cg14=", 302);
            th2.getMessage();
            return ycx(bitmap, i5);
        }
    }
}
