package com.bytedance.sdk.component.utils;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.io.ByteArrayOutputStream;

/* loaded from: classes2.dex */
public class dj {
    public static byte[] ycx(Bitmap bitmap) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bitmap.getByteCount());
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public static Bitmap ycx(Bitmap bitmap, int i5, int i11) {
        if (bitmap == null) {
            return null;
        }
        if (i5 > 0 && i11 > 0) {
            try {
                int width = bitmap.getWidth();
                int height = bitmap.getHeight();
                if (i5 < width && i11 < height) {
                    Matrix matrix = new Matrix();
                    matrix.postScale(i5 / width, i11 / height);
                    return Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "eec5mAKsXNOJRsQ=", "XOs5pwavYN2FaN5JgRCw", TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173);
                th2.getMessage();
                return null;
            }
        }
        return bitmap;
    }
}
