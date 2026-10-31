package com.vungle.ads.internal.util;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.Window;
import android.webkit.WebView;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Pair;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public volatile Function2 f47695a;

    public static final /* synthetic */ void a(j jVar, Window window, Rect rect, Bitmap bitmap, Function1 function1) {
        jVar.getClass();
        a(window, rect, bitmap, function1);
    }

    public final void a(WebView webView, int i5, com.vungle.ads.internal.ui.q callback) {
        Activity activity;
        Intrinsics.g(callback, "callback");
        this.f47695a = callback;
        if (webView == null) {
            boolean z11 = u.f47714a;
            t.c("BlackScreenDetector", "Black screen detection failed: View not available");
            Function2 function2 = this.f47695a;
            if (function2 != null) {
                function2.invoke(-1, "View not available");
            }
            this.f47695a = null;
            return;
        }
        i iVar = new i(webView, this, i5);
        if (this.f47695a == null) {
            return;
        }
        Context context = webView.getContext();
        while (true) {
            if (!(context instanceof ContextWrapper)) {
                activity = null;
                break;
            } else {
                if (context instanceof Activity) {
                    activity = (Activity) context;
                    break;
                }
                context = ((ContextWrapper) context).getBaseContext();
            }
        }
        Window window = activity != null ? activity.getWindow() : null;
        if (window == null) {
            boolean z12 = u.f47714a;
            t.c("BlackScreenDetector", "Activity/Window not found for PixelCopy");
            iVar.invoke(null);
        } else {
            Context context2 = webView.getContext();
            Intrinsics.f(context2, "view.context");
            Lazy lazyB = LazyKt.b(LazyThreadSafetyMode.f71679a, new f(context2));
            Handler handler = y.f47718a;
            y.a(new g(webView, lazyB, this, window, iVar));
        }
    }

    public static final com.vungle.ads.internal.executor.a a(Lazy lazy) {
        return (com.vungle.ads.internal.executor.a) lazy.getValue();
    }

    public static void a(Window window, Rect rect, Bitmap bitmap, Function1 function1) {
        try {
            PixelCopy.request(window, rect, bitmap, new d10.b(2, function1, bitmap), new Handler(Looper.getMainLooper()));
        } catch (Throwable th2) {
            boolean z11 = u.f47714a;
            t.a("BlackScreenDetector", "PixelCopy request failed", th2);
            bitmap.recycle();
            function1.invoke(null);
        }
    }

    public static final void a(Function1 onComplete, Bitmap bitmap, int i5) {
        Intrinsics.g(onComplete, "$onComplete");
        Intrinsics.g(bitmap, "$bitmap");
        if (i5 == 0) {
            onComplete.invoke(bitmap);
            return;
        }
        boolean z11 = u.f47714a;
        t.c("BlackScreenDetector", "PixelCopy failed: " + i5);
        bitmap.recycle();
        onComplete.invoke(null);
    }

    public static Pair a(Bitmap bitmap, int i5) {
        if (bitmap != null) {
            int iA = a(bitmap, 0.1d, i5, 0.5d);
            return new Pair(Integer.valueOf(iA), iA == -1 ? "Internal calculation error" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        boolean z11 = u.f47714a;
        t.c("BlackScreenDetector", "Black screen detection failed: Snapshot capture failure");
        return new Pair(-1, "Snapshot capture failure");
    }

    public static int a(Bitmap bitmap, double d5, int i5, double d11) {
        int i11;
        int i12;
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        int i13 = (int) (width * d5);
        int i14 = (int) (height * d5);
        int i15 = width - (i13 * 2);
        int i16 = height - (i14 * 2);
        if (i15 <= 0 || i16 <= 0) {
            return -1;
        }
        long j11 = i15 * i16;
        if (j11 > 2147483647L) {
            if (d5 >= d11) {
                return -1;
            }
            return a(bitmap, d5 * 2, i5, d11);
        }
        int i17 = (int) j11;
        int[] iArr = new int[i17];
        bitmap.getPixels(iArr, 0, i15, i13, i14, i15, i16);
        int i18 = i17 - 1;
        if (i5 > 0) {
            int iA = ProgressionUtilKt.a(0, i18, i5);
            if (iA >= 0) {
                int i19 = 0;
                i11 = 0;
                i12 = 0;
                while (true) {
                    i11++;
                    int i21 = iArr[i19];
                    int i22 = (i21 >> 24) & 255;
                    int i23 = (i21 >> 16) & 255;
                    int i24 = (i21 >> 8) & 255;
                    int i25 = i21 & 255;
                    if (i22 > 0 && i23 < 10 && i24 < 10 && i25 < 10) {
                        i12++;
                    }
                    if (i19 == iA) {
                        break;
                    }
                    i19 += i5;
                }
            } else {
                i11 = 0;
                i12 = 0;
            }
            if (i11 > 0) {
                return (int) ((i12 * 100) / i11);
            }
            return 0;
        }
        throw new IllegalArgumentException("Step must be positive, was: " + i5 + '.');
    }
}
