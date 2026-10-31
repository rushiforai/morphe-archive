package com.bytedance.sdk.openadsdk.wwx;

import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.util.Base64;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dj, reason: collision with root package name */
    protected static int f27361dj = 30;

    /* renamed from: ea, reason: collision with root package name */
    public static int f27362ea = 16;
    public static int fby = 2;

    /* renamed from: jc, reason: collision with root package name */
    public static int f27363jc = 8;

    /* renamed from: jw, reason: collision with root package name */
    public static int f27364jw = 4;

    /* renamed from: lt, reason: collision with root package name */
    public static int f27365lt = 0;
    protected static long lud = 15360;

    /* renamed from: ok, reason: collision with root package name */
    public static int f27366ok = 32;
    protected static int sya = 1;

    /* renamed from: ul, reason: collision with root package name */
    public static int f27367ul = 1;
    protected static String ycx = "images";

    /* renamed from: zb, reason: collision with root package name */
    protected static String f27368zb;

    public static boolean ycx(Context context, String str) {
        return false;
    }

    public static boolean zb(Context context, String str) {
        return context.checkSelfPermission(str) == 0;
    }

    public static Bitmap ycx(String str) {
        byte[] bArrDecode = Base64.decode(str, 2);
        return BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length);
    }

    public static float zb(Context context) {
        if (context == null) {
            return 0.0f;
        }
        return context.getResources().getDisplayMetrics().density;
    }

    public static boolean ycx(Context context, int i5) {
        boolean zYcx;
        boolean zYcx2;
        if (f27365lt == 0) {
            if (Build.VERSION.SDK_INT >= 33) {
                zYcx = ycx(context, "android.permission.READ_MEDIA_IMAGES");
                zYcx2 = true;
            } else {
                zYcx = ycx(context, "android.permission.READ_EXTERNAL_STORAGE");
                zYcx2 = ycx(context, "android.permission.WRITE_EXTERNAL_STORAGE");
            }
            boolean zYcx3 = ycx(context, "android.permission.CAMERA");
            boolean zYcx4 = ycx(context, "android.permission.RECORD_AUDIO");
            PackageManager packageManager = context.getPackageManager();
            if (zYcx && zYcx2) {
                f27365lt |= f27367ul;
            }
            if (zYcx3 && packageManager.hasSystemFeature("android.hardware.camera")) {
                f27365lt |= fby;
            }
            if (packageManager.hasSystemFeature("android.hardware.sensor.gyroscope")) {
                f27365lt |= f27364jw;
            }
            if (packageManager.hasSystemFeature("android.hardware.sensor.accelerometer")) {
                f27365lt |= f27363jc;
            }
            if (packageManager.hasSystemFeature("android.hardware.sensor.compass")) {
                f27365lt |= f27362ea;
            }
            if (zYcx4 && packageManager.hasSystemFeature("android.hardware.microphone")) {
                f27365lt |= f27366ok;
            }
        }
        return (f27365lt & i5) != 0;
    }

    public static boolean ycx(Context context) {
        boolean z11;
        boolean z12;
        if (Build.VERSION.SDK_INT >= 33) {
            z11 = context.checkSelfPermission("android.permission.READ_MEDIA_IMAGES") == 0;
        } else {
            z11 = context.checkSelfPermission("android.permission.READ_EXTERNAL_STORAGE") == 0;
            if (context.checkSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
                z12 = false;
            }
            return !z12 && z11;
        }
        z12 = true;
        if (z12) {
        }
    }
}
