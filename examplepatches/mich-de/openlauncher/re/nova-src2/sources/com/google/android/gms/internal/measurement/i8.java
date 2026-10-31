package com.google.android.gms.internal.measurement;

import android.app.Application;
import android.content.Context;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.os.NetworkOnMainThreadException;
import android.os.RemoteException;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.dynamite.DynamiteModule$LoadingException;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.google.android.gms.measurement.api.AppMeasurementSdk;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class i8 {

    /* renamed from: i, reason: collision with root package name */
    public static volatile i8 f32641i;

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f32642a;

    /* renamed from: b, reason: collision with root package name */
    public final AppMeasurementSdk f32643b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f32644c;

    /* renamed from: d, reason: collision with root package name */
    public int f32645d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f32646e;

    /* renamed from: f, reason: collision with root package name */
    public final String f32647f;

    /* renamed from: g, reason: collision with root package name */
    public volatile d7 f32648g;

    /* renamed from: h, reason: collision with root package name */
    public volatile long f32649h;

    public i8(Context context, Bundle bundle) throws ClassNotFoundException {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new z7(this));
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        this.f32642a = Executors.unconfigurableExecutorService(threadPoolExecutor);
        this.f32643b = new AppMeasurementSdk(this);
        this.f32644c = new ArrayList();
        try {
            if (ai.b2.b(context, ai.b2.a(context)) != null) {
                try {
                    Class.forName("com.google.firebase.analytics.FirebaseAnalytics", false, i8.class.getClassLoader());
                } catch (ClassNotFoundException unused) {
                    this.f32647f = null;
                    this.f32646e = true;
                    Log.w("FA", "Disabling data collection. Found google_app_id in strings.xml but Google Analytics for Firebase is missing. Add Google Analytics for Firebase to resume data collection.");
                    return;
                }
            }
        } catch (IllegalStateException unused2) {
        }
        this.f32647f = "fa";
        o(new u7(this, context, bundle));
        Application application = (Application) context.getApplicationContext();
        if (application == null) {
            Log.w("FA", "Unable to register lifecycle notifications. Application null.");
        } else {
            application.registerActivityLifecycleCallbacks(new h8(this));
        }
    }

    public static i8 q(Context context, Bundle bundle) {
        sg.w.h(context);
        if (f32641i == null) {
            synchronized (i8.class) {
                try {
                    if (f32641i == null) {
                        f32641i = new i8(context, bundle == null ? new Bundle() : new Bundle(bundle));
                    }
                } finally {
                }
            }
        }
        return f32641i;
    }

    public final void A(Bundle bundle) {
        o(new p7(this, bundle));
    }

    public final void B(String str, String str2, Bundle bundle) {
        o(new q7(this, str, str2, bundle));
    }

    public final List C(String str, String str2) {
        a7 a7Var = new a7();
        o(new q7(this, str, str2, a7Var));
        List list = (List) a7.V(List.class, a7Var.U(5000L));
        return list == null ? Collections.EMPTY_LIST : list;
    }

    public final void D(String str) {
        o(new r7(this, str));
    }

    public final void E(zzdd zzddVar, String str, String str2) {
        o(new s7(this, zzddVar, str, str2));
    }

    public final void F(Boolean bool) {
        o(new r7(this, bool));
    }

    public final void G(Bundle bundle) {
        o(new r7(this, bundle));
    }

    public final void H(String str) {
        o(new v7(this, str, 0));
    }

    public final void I(String str) {
        o(new v7(this, str, 1));
    }

    public final String J() {
        a7 a7Var = new a7();
        o(new p7(this, a7Var));
        return (String) a7.V(String.class, a7Var.U(500L));
    }

    public final String K() {
        a7 a7Var = new a7();
        o(new x7(this, a7Var, 0));
        return (String) a7.V(String.class, a7Var.U(50L));
    }

    public final long L() {
        a7 a7Var = new a7();
        o(new x7(this, a7Var, 1));
        Long l9 = (Long) a7.V(Long.class, a7Var.U(500L));
        if (l9 != null) {
            return l9.longValue();
        }
        long jNextLong = new Random(System.nanoTime() ^ System.currentTimeMillis()).nextLong();
        int i5 = this.f32645d + 1;
        this.f32645d = i5;
        return jNextLong + i5;
    }

    public final String a() {
        a7 a7Var = new a7();
        o(new x7(this, a7Var, 2));
        return (String) a7.V(String.class, a7Var.U(500L));
    }

    public final String b() {
        a7 a7Var = new a7();
        o(new x7(this, a7Var, 3));
        return (String) a7.V(String.class, a7Var.U(500L));
    }

    public final Map c(String str, String str2, boolean z11) {
        a7 a7Var = new a7();
        o(new o7(this, str, str2, z11, a7Var));
        Bundle bundleU = a7Var.U(5000L);
        if (bundleU == null || bundleU.size() == 0) {
            return Collections.EMPTY_MAP;
        }
        HashMap map = new HashMap(bundleU.size());
        for (String str3 : bundleU.keySet()) {
            Object obj = bundleU.get(str3);
            if ((obj instanceof Double) || (obj instanceof Long) || (obj instanceof String)) {
                map.put(str3, obj);
            }
        }
        return map;
    }

    public final Bundle d(boolean z11, Bundle bundle) {
        a7 a7Var = new a7();
        o(new a8(this, bundle, a7Var));
        if (z11) {
            return a7Var.U(5000L);
        }
        return null;
    }

    public final int e(String str) {
        a7 a7Var = new a7();
        o(new a8(this, str, a7Var));
        Integer num = (Integer) a7.V(Integer.class, a7Var.U(com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c));
        if (num == null) {
            return 25;
        }
        return num.intValue();
    }

    public final String f() {
        return this.f32647f;
    }

    public final void g(boolean z11) {
        o(new b8(this, z11));
    }

    public final /* synthetic */ boolean i() {
        return this.f32649h >= 169;
    }

    public final /* synthetic */ boolean j() {
        return this.f32649h >= 170;
    }

    public final /* synthetic */ boolean k() {
        return this.f32646e;
    }

    public final /* synthetic */ d7 l() {
        return this.f32648g;
    }

    public final /* synthetic */ void m(d7 d7Var) {
        this.f32648g = d7Var;
    }

    public final /* synthetic */ void n(long j11) {
        this.f32649h = j11;
    }

    public final void o(d8 d8Var) {
        this.f32642a.execute(d8Var);
    }

    /* renamed from: p, reason: merged with bridge method [inline-methods] */
    public final void h(Exception exc, boolean z11, boolean z12) {
        this.f32646e |= z11;
        if (z11) {
            Log.w("FA", "Data collection startup failed. No data will be collected.", exc);
            return;
        }
        if (z12) {
            o(new r7(this, exc));
        }
        Log.w("FA", "Error with data collection. Data lost.", exc);
    }

    public final AppMeasurementSdk r() {
        return this.f32643b;
    }

    public final d7 s(Context context, boolean z11) {
        try {
            return c7.asInterface(bh.e.c(context, z11 ? bh.e.f17894d : bh.e.f17893c, ModuleDescriptor.MODULE_ID).b("com.google.android.gms.measurement.internal.AppMeasurementDynamiteService"));
        } catch (DynamiteModule$LoadingException e3) {
            h(e3, true, false);
            return null;
        }
    }

    public final void t(zh.a aVar) {
        e8 e8Var = new e8(aVar);
        if (this.f32648g != null) {
            try {
                this.f32648g.setEventInterceptor(e8Var);
                return;
            } catch (BadParcelableException | NetworkOnMainThreadException | RemoteException | IllegalArgumentException | IllegalStateException | NullPointerException | SecurityException | UnsupportedOperationException unused) {
                Log.w("FA", "Failed to set event interceptor on calling thread. Trying again on the dynamite thread.");
            }
        }
        o(new p7(this, e8Var));
    }

    public final void u(zh.b bVar) {
        sg.w.h(bVar);
        ArrayList arrayList = this.f32644c;
        synchronized (arrayList) {
            for (int i5 = 0; i5 < arrayList.size(); i5++) {
                try {
                    if (bVar.equals(((Pair) arrayList.get(i5)).first)) {
                        Log.w("FA", "OnEventListener already registered.");
                        return;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            f8 f8Var = new f8(bVar);
            arrayList.add(new Pair(bVar, f8Var));
            if (this.f32648g != null) {
                try {
                    this.f32648g.registerOnMeasurementEventListener(f8Var);
                    return;
                } catch (BadParcelableException | NetworkOnMainThreadException | RemoteException | IllegalArgumentException | IllegalStateException | NullPointerException | SecurityException | UnsupportedOperationException unused) {
                    Log.w("FA", "Failed to register event listener on calling thread. Trying again on the dynamite thread.");
                }
            }
            o(new r7(this, f8Var));
        }
    }

    public final void v(zh.b bVar) {
        Pair pair;
        sg.w.h(bVar);
        ArrayList arrayList = this.f32644c;
        synchronized (arrayList) {
            int i5 = 0;
            while (true) {
                try {
                    if (i5 >= arrayList.size()) {
                        pair = null;
                        break;
                    } else {
                        if (bVar.equals(((Pair) arrayList.get(i5)).first)) {
                            pair = (Pair) arrayList.get(i5);
                            break;
                        }
                        i5++;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (pair == null) {
                Log.w("FA", "OnEventListener had not been registered.");
                return;
            }
            arrayList.remove(pair);
            f8 f8Var = (f8) pair.second;
            if (this.f32648g != null) {
                try {
                    this.f32648g.unregisterOnMeasurementEventListener(f8Var);
                    return;
                } catch (BadParcelableException | NetworkOnMainThreadException | RemoteException | IllegalArgumentException | IllegalStateException | NullPointerException | SecurityException | UnsupportedOperationException unused) {
                    Log.w("FA", "Failed to unregister event listener on calling thread. Trying again on the dynamite thread.");
                }
            }
            o(new p7(this, f8Var));
        }
    }

    public final void w(String str, Bundle bundle) {
        o(new c8(this, null, null, null, str, bundle, false, true));
    }

    public final void x(String str, String str2, Bundle bundle) {
        o(new c8(this, null, null, str, str2, bundle, true, true));
    }

    public final void y(String str, String str2, Bundle bundle, long j11) {
        o(new c8(this, Long.valueOf(j11), 0L, str, str2, bundle, true, false));
    }

    public final void z(String str, String str2, Object obj, boolean z11) {
        o(new o7(this, str, str2, obj, z11));
    }
}
