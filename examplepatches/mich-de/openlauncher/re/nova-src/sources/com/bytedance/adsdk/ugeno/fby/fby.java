package com.bytedance.adsdk.ugeno.fby;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.renderscript.Allocation;
import android.renderscript.Element;
import android.renderscript.RenderScript;
import android.renderscript.ScriptIntrinsicBlur;
import android.util.TypedValue;

/* loaded from: classes2.dex */
public class fby {
    private static TypedValue sya;

    /* renamed from: zb, reason: collision with root package name */
    private static final Object f22284zb = new Object();
    public static Handler ycx = new Handler(Looper.getMainLooper());

    public static float ycx(Context context, String str) throws NumberFormatException {
        float f11;
        float f12 = context.getResources().getDisplayMetrics().density;
        try {
            f11 = Float.parseFloat(str);
        } catch (NumberFormatException unused) {
            f11 = 0.0f;
        }
        return (f11 * f12) + 0.5f;
    }

    public static int zb(Context context, float f11) {
        float f12 = context.getResources().getDisplayMetrics().density;
        if (f12 <= 0.0f) {
            f12 = 1.0f;
        }
        return (int) ((f11 / f12) + 0.5f);
    }

    public static float ycx(Context context, float f11) {
        return (f11 * context.getResources().getDisplayMetrics().density) + 0.5f;
    }

    public static Bitmap ycx(Context context, Bitmap bitmap, int i5) {
        try {
            com.bytedance.adsdk.ugeno.ycx ycxVarDj = com.bytedance.adsdk.ugeno.lt.ycx().dj();
            if (ycxVarDj != null) {
                return ycxVarDj.ycx(context, bitmap, i5);
            }
            Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap, Math.round(bitmap.getWidth() * 0.2f), Math.round(bitmap.getHeight() * 0.2f), false);
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(bitmapCreateScaledBitmap);
            RenderScript renderScriptCreate = RenderScript.create(context);
            if (renderScriptCreate == null) {
                return null;
            }
            ScriptIntrinsicBlur scriptIntrinsicBlurCreate = ScriptIntrinsicBlur.create(renderScriptCreate, Element.U8_4(renderScriptCreate));
            Allocation allocationCreateFromBitmap = Allocation.createFromBitmap(renderScriptCreate, bitmapCreateScaledBitmap);
            Allocation allocationCreateFromBitmap2 = Allocation.createFromBitmap(renderScriptCreate, bitmapCreateBitmap);
            scriptIntrinsicBlurCreate.setRadius(i5);
            scriptIntrinsicBlurCreate.setInput(allocationCreateFromBitmap);
            scriptIntrinsicBlurCreate.forEach(allocationCreateFromBitmap2);
            allocationCreateFromBitmap2.copyTo(bitmapCreateBitmap);
            return bitmapCreateBitmap;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static Drawable ycx(Context context, int i5) {
        return context.getDrawable(i5);
    }

    public static boolean ycx() {
        return Looper.getMainLooper() == Looper.myLooper();
    }

    public static void ycx(Runnable runnable) {
        if (ycx()) {
            runnable.run();
        } else {
            ycx.post(runnable);
        }
    }
}
