package com.pgl.ssdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.hardware.input.InputManager;
import android.os.Build;
import android.text.TextUtils;
import android.view.InputDevice;
import android.view.MotionEvent;
import java.util.Arrays;

/* loaded from: classes4.dex */
public class y {

    /* renamed from: a, reason: collision with root package name */
    private static int f42392a = 0;

    /* renamed from: b, reason: collision with root package name */
    private static int f42393b = 0;

    /* renamed from: c, reason: collision with root package name */
    private static int f42394c = 0;

    /* renamed from: d, reason: collision with root package name */
    private static int f42395d = 0;

    /* renamed from: e, reason: collision with root package name */
    private static int f42396e = 0;

    /* renamed from: f, reason: collision with root package name */
    private static int f42397f = 0;

    /* renamed from: g, reason: collision with root package name */
    public static volatile boolean f42398g = false;

    /* renamed from: h, reason: collision with root package name */
    private static boolean f42399h = false;

    /* renamed from: i, reason: collision with root package name */
    private static InputManager f42400i;

    public static class a implements Runnable {

        /* renamed from: a, reason: collision with root package name */
        final /* synthetic */ String f42401a;

        /* renamed from: b, reason: collision with root package name */
        final /* synthetic */ Context f42402b;

        /* renamed from: c, reason: collision with root package name */
        final /* synthetic */ int f42403c;

        public a(String str, Context context, int i5) {
            this.f42401a = str;
            this.f42402b = context;
            this.f42403c = i5;
        }

        @Override // java.lang.Runnable
        public void run() {
            String str;
            if (y.f42398g) {
                com.pgl.ssdk.ces.a.meta(171, null, this.f42401a);
            }
            InputManager inputManagerB = y.b(this.f42402b);
            if (inputManagerB == null) {
                return;
            }
            InputDevice inputDevice = inputManagerB.getInputDevice(this.f42403c);
            y.h();
            if (inputDevice == null) {
                y.b();
                y.c();
                str = "nihc";
            } else if (inputDevice.isVirtual()) {
                y.d();
                y.e();
                str = "vihc";
            } else {
                if (Build.VERSION.SDK_INT < 29 || !inputDevice.isExternal()) {
                    return;
                }
                y.f();
                y.g();
                str = "eihc";
            }
            y.c(str);
        }
    }

    public static /* synthetic */ int b() {
        int i5 = f42394c;
        f42394c = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int c() {
        int i5 = f42397f;
        f42397f = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int d() {
        int i5 = f42392a;
        f42392a = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int e() {
        int i5 = f42395d;
        f42395d = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int f() {
        int i5 = f42393b;
        f42393b = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int g() {
        int i5 = f42396e;
        f42396e = i5 + 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void h() {
        if (f42399h) {
            return;
        }
        try {
            SharedPreferences sharedPreferencesA = aw.a(z.a());
            if (sharedPreferencesA != null) {
                f42397f = sharedPreferencesA.getInt("nihc", 0);
                f42396e = sharedPreferencesA.getInt("eihc", 0);
                f42395d = sharedPreferencesA.getInt("vihc", 0);
                f42399h = true;
            }
        } catch (Throwable unused) {
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int b(String str) {
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        h();
        str.getClass();
        switch (str) {
        }
        return -1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void c(String str) {
        try {
            SharedPreferences sharedPreferencesA = aw.a(z.a());
            if (sharedPreferencesA != null) {
                sharedPreferencesA.edit().putInt(str, sharedPreferencesA.getInt(str, 0) + 1).apply();
            }
        } catch (Throwable unused) {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0042  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(MotionEvent motionEvent, Context context) {
        String string;
        if (motionEvent == null || context == null) {
            return;
        }
        if (f42398g) {
            if (motionEvent.getToolType(0) == 0 || motionEvent.getSource() == 0 || motionEvent.getSource() == 2) {
                string = Arrays.toString(new Exception().getStackTrace());
                if (string.contains("android.view.InputEventReceiver") || string.contains("android.view.ViewRootImpl$WindowInputEventReceiver")) {
                    string = null;
                } else if (string.contains("android.view.ViewRootImpl$InputStage")) {
                }
            }
        }
        ar.b(new a(string, context, motionEvent.getDeviceId()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static InputManager b(Context context) {
        if (f42400i == null) {
            f42400i = (InputManager) context.getSystemService("input");
        }
        return f42400i;
    }
}
