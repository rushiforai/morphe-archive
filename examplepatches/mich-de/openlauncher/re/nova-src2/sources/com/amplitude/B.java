package com.amplitude;

import android.graphics.Bitmap;
import android.os.Build;
import android.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class B {
    public static final String a(Bitmap bitmap) throws IOException {
        Intrinsics.g(bitmap, "<this>");
        if (bitmap.isRecycled()) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bitmap.getAllocationByteCount());
        try {
            if (Build.VERSION.SDK_INT >= 30) {
                bitmap.compress(Bitmap.CompressFormat.WEBP_LOSSY, 50, byteArrayOutputStream);
            } else {
                bitmap.compress(Bitmap.CompressFormat.WEBP, 50, byteArrayOutputStream);
            }
            String strEncodeToString = Base64.encodeToString(byteArrayOutputStream.toByteArray(), 2);
            byteArrayOutputStream.close();
            return strEncodeToString;
        } finally {
        }
    }
}
