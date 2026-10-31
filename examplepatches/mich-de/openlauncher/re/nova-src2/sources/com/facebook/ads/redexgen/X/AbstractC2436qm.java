package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.renderscript.Allocation;
import android.renderscript.Element;
import android.renderscript.RSRuntimeException;
import android.renderscript.RenderScript;
import android.renderscript.ScriptIntrinsicBlur;

/* renamed from: com.facebook.ads.redexgen.X.qm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2436qm {
    public static Bitmap A00(C0958Hi c0958Hi, Bitmap bitmap, int i5) throws RSRuntimeException {
        RenderScript renderScriptCreate = null;
        Allocation allocationCreateFromBitmap = null;
        Allocation output = null;
        ScriptIntrinsicBlur scriptIntrinsicBlurCreate = null;
        try {
            renderScriptCreate = RenderScript.create(c0958Hi);
            renderScriptCreate.setMessageHandler(new RenderScript.RSMessageHandler());
            allocationCreateFromBitmap = Allocation.createFromBitmap(renderScriptCreate, bitmap, Allocation.MipmapControl.MIPMAP_NONE, 1);
            output = Allocation.createTyped(renderScriptCreate, allocationCreateFromBitmap.getType());
            scriptIntrinsicBlurCreate = ScriptIntrinsicBlur.create(renderScriptCreate, Element.U8_4(renderScriptCreate));
            scriptIntrinsicBlurCreate.setInput(allocationCreateFromBitmap);
            scriptIntrinsicBlurCreate.setRadius(i5);
            scriptIntrinsicBlurCreate.forEach(output);
            output.copyTo(bitmap);
            return bitmap;
        } finally {
            if (renderScriptCreate != null) {
                renderScriptCreate.destroy();
            }
            if (allocationCreateFromBitmap != null) {
                allocationCreateFromBitmap.destroy();
            }
            if (output != null) {
                output.destroy();
            }
            if (scriptIntrinsicBlurCreate != null) {
                scriptIntrinsicBlurCreate.destroy();
            }
        }
    }

    public static Bitmap A01(C0958Hi c0958Hi, Bitmap bitmap, int i5, int i11) {
        int width = bitmap.getWidth() / i11;
        int height = bitmap.getHeight() / i11;
        if (width != 0 && height != 0) {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            canvas.scale(1.0f / i11, 1.0f / i11);
            Paint paint = new Paint();
            paint.setFlags(3);
            paint.setColorFilter(new PorterDuffColorFilter(0, PorterDuff.Mode.SRC_ATOP));
            canvas.drawBitmap(bitmap, 0.0f, 0.0f, paint);
            try {
                Bitmap bitmapA00 = A00(c0958Hi, bitmapCreateBitmap, i5);
                if (i11 != 1) {
                    int height2 = bitmap.getWidth();
                    int width2 = bitmap.getHeight();
                    Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmapA00, height2, width2, true);
                    bitmapA00.recycle();
                    return bitmapCreateScaledBitmap;
                }
                return bitmapA00;
            } catch (RSRuntimeException unused) {
                return new G1().A02(bitmapCreateBitmap, i5);
            }
        }
        return null;
    }
}
