package com.vungle.ads.internal.presenter;

import android.content.Context;
import android.os.Handler;
import android.webkit.WebView;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.model.j3;
import java.util.LinkedHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final ReentrantLock f47373a = new ReentrantLock();

    /* renamed from: b, reason: collision with root package name */
    public static final LinkedHashMap f47374b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicBoolean f47375c = new AtomicBoolean(false);

    public static void a(Context context, i0 adv, j3 placement, String templatePath, com.vungle.ads.internal.model.f0 f0Var, com.vungle.ads.internal.load.f delegate, Long l9) {
        Intrinsics.g(context, "context");
        Intrinsics.g(adv, "adv");
        Intrinsics.g(placement, "placement");
        Intrinsics.g(templatePath, "templatePath");
        Intrinsics.g(delegate, "delegate");
        ReentrantLock reentrantLock = f47373a;
        reentrantLock.lock();
        try {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sb2 = new StringBuilder("Preload webview start. Cache size: ");
            LinkedHashMap linkedHashMap = f47374b;
            sb2.append(linkedHashMap.size());
            com.vungle.ads.internal.util.t.a("WebViewManager", sb2.toString());
            String strH = adv.h();
            if (!linkedHashMap.containsKey(strH)) {
                Handler handler = com.vungle.ads.internal.util.y.f47718a;
                com.vungle.ads.internal.util.y.a(new d0(context, adv, placement, delegate, l9, templatePath, strH, f0Var));
            }
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public static WebView a(Context context, String str) {
        WebView webView;
        Intrinsics.g(context, "context");
        ReentrantLock reentrantLock = f47373a;
        reentrantLock.lock();
        try {
            LinkedHashMap linkedHashMap = f47374b;
            a0 a0Var = (a0) linkedHashMap.get(str);
            if (a0Var != null) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("WebViewManager", "Reusing cached webview. Cache size: " + linkedHashMap.size());
                webView = a0Var.a();
            } else {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("WebViewManager", "Creating new webview. Cache size: " + linkedHashMap.size());
                webView = new WebView(context);
            }
            reentrantLock.unlock();
            return webView;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public static void a(Context context) {
        Intrinsics.g(context, "context");
        if (!f47375c.compareAndSet(false, true)) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("WebViewManager", "Prewarm already done, skip");
        } else {
            Context applicationContext = context.getApplicationContext();
            Handler handler = com.vungle.ads.internal.util.y.f47718a;
            com.vungle.ads.internal.util.y.a(new e0(applicationContext));
        }
    }

    public static com.vungle.ads.internal.ui.z a(i0 advertisement, j3 placement, com.vungle.ads.internal.executor.j offloadExecutor, com.vungle.ads.internal.platform.f platform) {
        Intrinsics.g(advertisement, "advertisement");
        Intrinsics.g(placement, "placement");
        Intrinsics.g(offloadExecutor, "offloadExecutor");
        Intrinsics.g(platform, "platform");
        ReentrantLock reentrantLock = f47373a;
        reentrantLock.lock();
        try {
            a0 a0Var = (a0) f47374b.get(advertisement.h());
            com.vungle.ads.internal.ui.z zVarB = a0Var != null ? a0Var.b() : null;
            if (zVarB == null) {
                zVarB = new com.vungle.ads.internal.ui.z(advertisement, placement, offloadExecutor, platform);
            }
            reentrantLock.unlock();
            return zVarB;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public static void a(String key) {
        Intrinsics.g(key, "key");
        ReentrantLock reentrantLock = f47373a;
        reentrantLock.lock();
        try {
            f47374b.remove(key);
            Unit unit = Unit.f71706a;
        } finally {
            reentrantLock.unlock();
        }
    }
}
