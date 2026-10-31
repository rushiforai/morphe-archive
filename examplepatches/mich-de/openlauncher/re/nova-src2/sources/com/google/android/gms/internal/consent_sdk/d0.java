package com.google.android.gms.internal.consent_sdk;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Iterator;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: b, reason: collision with root package name */
    public final Application f32036b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f32037c;

    /* renamed from: d, reason: collision with root package name */
    public final Executor f32038d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f32039e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicReference f32040f = new AtomicReference(new ArrayDeque());

    /* renamed from: g, reason: collision with root package name */
    public final AtomicReference f32041g = new AtomicReference(new ArrayDeque());

    /* renamed from: h, reason: collision with root package name */
    public final AtomicReference f32042h = new AtomicReference(new ArrayDeque());

    /* renamed from: i, reason: collision with root package name */
    public final AtomicReference f32043i = new AtomicReference(new ArrayDeque());

    /* renamed from: j, reason: collision with root package name */
    public final AtomicReference f32044j = new AtomicReference(new ArrayDeque());

    /* renamed from: k, reason: collision with root package name */
    public final AtomicReference f32045k = new AtomicReference(new ArrayDeque());

    /* renamed from: l, reason: collision with root package name */
    public final AtomicReference f32046l = new AtomicReference(new ArrayDeque());

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f32035a = new AtomicReference(null);

    public d0(Application application, Executor executor, c0 c0Var, boolean z11) {
        this.f32039e = z11;
        this.f32036b = application;
        this.f32037c = c0Var;
        this.f32038d = executor;
    }

    public final void a(Queue queue, int i5, int i11, String str) {
        Bundle bundle;
        Long l9 = (Long) queue.poll();
        if (l9 != null) {
            long jCurrentTimeMillis = System.currentTimeMillis() - l9.longValue();
            if (str != null) {
                i5 = i11;
            }
            AtomicReference atomicReference = this.f32045k;
            Queue queue2 = (Queue) atomicReference.get();
            c0 c0Var = this.f32037c;
            Application application = c0Var.f32000a;
            u2 u2VarM = v2.m();
            z1 z1VarM = h2.m();
            c2 c2VarM = d2.m();
            c2VarM.g(i5);
            if (str != null) {
                c2VarM.e(str);
            }
            if (jCurrentTimeMillis > 0) {
                c2VarM.f(jCurrentTimeMillis);
            }
            z1VarM.i((d2) c2VarM.a());
            String str2 = c0Var.f32004e;
            PackageInfo packageInfo = null;
            if (str2 == null) {
                try {
                    bundle = application.getPackageManager().getApplicationInfo(application.getPackageName(), 128).metaData;
                } catch (PackageManager.NameNotFoundException unused) {
                    bundle = null;
                }
                if (bundle != null) {
                    c0Var.f32004e = bundle.getString("com.google.android.gms.ads.APPLICATION_ID");
                }
                if (TextUtils.isEmpty(c0Var.f32004e)) {
                    Log.w("UserMessagingPlatform", "The UMP SDK requires a valid application ID in your AndroidManifest.xml through a com.google.android.gms.ads.APPLICATION_ID meta-data tag.\nExample AndroidManifest:\n    <meta-data\n        android:name=\"com.google.android.gms.ads.APPLICATION_ID\"\n        android:value=\"ca-app-pub-0000000000000000~0000000000\">");
                }
                str2 = c0Var.f32004e;
            }
            if (str2 != null) {
                z1VarM.f(str2);
            }
            g2 g2Var = c0Var.f32001b;
            if (g2Var == null) {
                e2 e2VarM = g2.m();
                e2VarM.e();
                g2Var = (g2) e2VarM.a();
                c0Var.f32001b = g2Var;
            }
            z1VarM.j(g2Var);
            b2 b2Var = c0Var.f32003d;
            if (b2Var == null) {
                a2 a2VarM = b2.m();
                a2VarM.e(Build.VERSION.SDK_INT);
                String str3 = Build.MODEL;
                a2VarM.f();
                a2VarM.h();
                String str4 = Build.VERSION.RELEASE;
                a2VarM.g();
                b2Var = (b2) a2VarM.a();
                c0Var.f32003d = b2Var;
            }
            z1VarM.h(b2Var);
            y1 y1Var = c0Var.f32002c;
            if (y1Var == null) {
                String packageName = application.getPackageName();
                try {
                    packageInfo = application.getPackageManager().getPackageInfo(packageName, 0);
                } catch (PackageManager.NameNotFoundException unused2) {
                }
                if (packageInfo != null) {
                    x1 x1VarM = y1.m();
                    x1VarM.f(Long.toString(Build.VERSION.SDK_INT >= 28 ? packageInfo.getLongVersionCode() : packageInfo.versionCode));
                    x1VarM.e(packageName);
                    c0Var.f32002c = (y1) x1VarM.a();
                }
                y1Var = c0Var.f32002c;
            }
            if (y1Var != null) {
                z1VarM.g(y1Var);
            }
            String string = PreferenceManager.getDefaultSharedPreferences(application).getString("UMP_eids", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            if (string != null && !string.isEmpty()) {
                Iterator it = h6.d().e(string).iterator();
                while (true) {
                    l0 l0Var = (l0) it;
                    if (!l0Var.hasNext()) {
                        break;
                    } else {
                        z1VarM.e((String) l0Var.next());
                    }
                }
            }
            u2VarM.e((h2) z1VarM.a());
            u2VarM.f(System.currentTimeMillis());
            queue2.add((v2) u2VarM.a());
            if (this.f32039e) {
                ((ArrayDeque) this.f32046l.get()).addAll((Collection) atomicReference.get());
            }
            this.f32038d.execute(new j(this, 2));
        }
    }
}
