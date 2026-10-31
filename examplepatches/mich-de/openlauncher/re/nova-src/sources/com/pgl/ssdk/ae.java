package com.pgl.ssdk;

import android.content.Context;
import android.content.res.Configuration;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import b.c0;

/* loaded from: classes.dex */
public class ae {

    /* renamed from: a, reason: collision with root package name */
    public static int f42261a;

    /* renamed from: b, reason: collision with root package name */
    public static int f42262b;

    /* renamed from: c, reason: collision with root package name */
    public static int f42263c;

    /* renamed from: d, reason: collision with root package name */
    public static int f42264d;

    /* renamed from: e, reason: collision with root package name */
    public static int f42265e;

    /* renamed from: f, reason: collision with root package name */
    private static int f42266f;

    /* renamed from: g, reason: collision with root package name */
    private static int f42267g;

    /* renamed from: h, reason: collision with root package name */
    private static int f42268h;

    public static int a(Context context) {
        try {
            Configuration configuration = context.getResources().getConfiguration();
            if (configuration != null) {
                return configuration.touchscreen;
            }
            return 666666;
        } catch (Throwable unused) {
            return 666666;
        }
    }

    private static void b(Context context) {
        if (context == null) {
            return;
        }
        try {
            new DisplayMetrics();
            DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
            f42266f = (int) displayMetrics.density;
            f42265e = displayMetrics.densityDpi;
        } catch (Throwable unused) {
        }
    }

    private static void c(Context context) {
        try {
            new DisplayMetrics();
            DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
            f42267g = (int) displayMetrics.xdpi;
            f42268h = (int) displayMetrics.ydpi;
        } catch (Throwable unused) {
        }
    }

    private static void d(Context context) {
        try {
            Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
            DisplayMetrics displayMetrics = new DisplayMetrics();
            defaultDisplay.getRealMetrics(displayMetrics);
            f42261a = displayMetrics.widthPixels;
            f42262b = displayMetrics.heightPixels;
            Display.Mode mode = defaultDisplay.getMode();
            f42263c = mode.getPhysicalWidth();
            f42264d = mode.getPhysicalHeight();
        } catch (Throwable unused) {
        }
    }

    public static String e(Context context) {
        int i5 = -1;
        if (context != null) {
            try {
                i5 = Settings.System.getInt(context.getContentResolver(), "screen_brightness", -1);
            } catch (Throwable unused) {
            }
        }
        return String.valueOf(i5);
    }

    public static String f(Context context) {
        try {
            d(context);
            b(context);
            c(context);
        } catch (Throwable unused) {
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(f42265e);
        sb2.append("[<!>]");
        sb2.append(f42261a);
        sb2.append(",");
        sb2.append(f42262b);
        sb2.append("[<!>]");
        sb2.append(f42263c);
        sb2.append("x");
        return c0.o(sb2, f42264d, "[<!>]");
    }
}
