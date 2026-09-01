package com.android.billingclient.api;

import android.R;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.ResultReceiver;
import android.text.TextUtils;
import android.view.View;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.QueryProductDetailsParams;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.a2g;
import defpackage.ay0;
import defpackage.b09;
import defpackage.c2g;
import defpackage.cbg;
import defpackage.dl7;
import defpackage.dlf;
import defpackage.dxf;
import defpackage.e2g;
import defpackage.evf;
import defpackage.ewf;
import defpackage.exf;
import defpackage.fbg;
import defpackage.g01;
import defpackage.gyf;
import defpackage.hvf;
import defpackage.i2g;
import defpackage.icg;
import defpackage.il7;
import defpackage.k1g;
import defpackage.kag;
import defpackage.kcg;
import defpackage.lbg;
import defpackage.lv2;
import defpackage.lyf;
import defpackage.nvf;
import defpackage.nvg;
import defpackage.ohg;
import defpackage.owf;
import defpackage.pjg;
import defpackage.q2g;
import defpackage.q8g;
import defpackage.qk7;
import defpackage.rwf;
import defpackage.rxf;
import defpackage.s0g;
import defpackage.s2g;
import defpackage.sag;
import defpackage.sbg;
import defpackage.swf;
import defpackage.tlf;
import defpackage.u8g;
import defpackage.uag;
import defpackage.uxf;
import defpackage.v0g;
import defpackage.v2g;
import defpackage.vdg;
import defpackage.wag;
import defpackage.wd2;
import defpackage.x0g;
import defpackage.xag;
import defpackage.xy5;
import defpackage.ywf;
import defpackage.z72;
import defpackage.z9g;
import defpackage.zag;
import defpackage.zbg;
import defpackage.zdg;
import defpackage.zjf;
import defpackage.zyf;
import j$.util.Objects;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class a extends BillingClient {
    public boolean A;
    public boolean B;
    public boolean C;
    public boolean D;
    public boolean E;
    public final PendingPurchasesParams F;
    public final boolean G;
    public final boolean H;
    public gyf I;
    public volatile BillingClientStateListener J;
    public ExecutorService K;
    public final Long L;
    public final swf M;
    public final String c;
    public final String d;
    public volatile tlf f;
    public final Context g;
    public final zjf h;
    public volatile hvf i;
    public volatile e j;
    public boolean k;
    public boolean l;
    public boolean n;
    public boolean o;
    public boolean p;
    public boolean q;
    public boolean r;
    public boolean s;
    public boolean t;
    public boolean u;
    public boolean v;
    public boolean w;
    public boolean x;
    public boolean y;
    public boolean z;
    public final Object a = new Object();
    public volatile int b = 0;
    public final Handler e = new Handler(Looper.getMainLooper());
    public int m = 0;

    public a(PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, BillingClient.Builder builder) {
        int i = gyf.c;
        this.I = zyf.j;
        long jNextLong = new Random().nextLong();
        this.L = Long.valueOf(jNextLong);
        this.M = ewf.a;
        this.c = "9.0.0";
        String strH = h();
        this.d = strH;
        this.g = context.getApplicationContext();
        sbg sbgVarA = zbg.A();
        sbgVarA.j();
        if (strH != null) {
            sbgVarA.b();
            zbg.z((zbg) sbgVarA.b, strH);
        }
        sbgVarA.i(this.g.getPackageName());
        sbgVarA.b();
        zbg.E((zbg) sbgVarA.b, jNextLong);
        boolean z = builder.zza;
        sbgVarA.b();
        zbg.x((zbg) sbgVarA.b, z);
        sbgVarA.d(Build.VERSION.SDK_INT);
        sbgVarA.h();
        K(sbgVarA, context);
        try {
            sbgVarA.e(this.g.getPackageManager().getPackageInfo(this.g.getPackageName(), 0).versionCode);
        } catch (Throwable th) {
            rxf.j("BillingClient", "Error getting app version code.", th);
        }
        this.h = new zjf(this.g, (zbg) sbgVarA.a());
        if (purchasesUpdatedListener == null) {
            rxf.i("BillingClient", "Billing client should have a valid listener but the provided is null.");
        }
        this.f = new tlf(this.g, purchasesUpdatedListener, userChoiceBillingListener, developerProvidedBillingListener, this.h);
        this.F = pendingPurchasesParams;
        this.H = userChoiceBillingListener != null;
        this.G = builder.zza;
    }

    public static Future b(Callable callable, long j, final Runnable runnable, Handler handler, ExecutorService executorService) {
        try {
            final Future futureSubmit = executorService.submit(callable);
            handler.postDelayed(new Runnable() { // from class: com.android.billingclient.api.zzbb
                @Override // java.lang.Runnable
                public final void run() {
                    Future future = futureSubmit;
                    if (future.isDone() || future.isCancelled()) {
                        return;
                    }
                    Runnable runnable2 = runnable;
                    future.cancel(true);
                    rxf.i("BillingClient", "Async task is taking too long, cancel it!");
                    if (runnable2 != null) {
                        runnable2.run();
                    }
                }
            }, (long) (j * 0.95d));
            return futureSubmit;
        } catch (Exception e) {
            rxf.j("BillingClient", "Async task throws exception!", e);
            return null;
        }
    }

    public static String h() {
        try {
            return (String) g01.class.getField("VERSION_NAME").get(null);
        } catch (Exception unused) {
            return null;
        }
    }

    public static /* bridge */ /* synthetic */ void r(a aVar, int i) {
        aVar.m = i;
        aVar.E = i >= 28;
        aVar.D = i >= 27;
        aVar.C = i >= 26;
        aVar.B = i >= 24;
        aVar.A = i >= 23;
        aVar.z = i >= 22;
        aVar.y = i >= 21;
        aVar.x = i >= 20;
        aVar.w = i >= 19;
        aVar.v = i >= 18;
        aVar.u = i >= 17;
        aVar.t = i >= 16;
        aVar.s = i >= 15;
        aVar.r = i >= 14;
        aVar.q = i >= 12;
        aVar.p = i >= 9;
        aVar.o = i >= 8;
        aVar.n = i >= 6;
    }

    public static void s(a aVar, int i) {
        if (i != 0) {
            aVar.D(0);
            return;
        }
        synchronized (aVar.a) {
            try {
                if (aVar.b == 3) {
                    return;
                }
                aVar.D(2);
                tlf tlfVar = aVar.f != null ? aVar.f : null;
                if (tlfVar != null) {
                    boolean z = aVar.y;
                    IntentFilter intentFilter = new IntentFilter("com.android.vending.billing.PURCHASES_UPDATED");
                    IntentFilter intentFilter2 = new IntentFilter("com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED");
                    intentFilter2.addAction("com.android.vending.billing.ALTERNATIVE_BILLING");
                    tlfVar.h = z;
                    dlf dlfVar = tlfVar.g;
                    Context context = tlfVar.a;
                    dlfVar.a(context, intentFilter2);
                    boolean z2 = tlfVar.h;
                    dlf dlfVar2 = tlfVar.f;
                    if (z2) {
                        dlfVar2.b(context, intentFilter);
                    } else {
                        dlfVar2.a(context, intentFilter);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static /* bridge */ /* synthetic */ boolean t(a aVar) {
        boolean z;
        synchronized (aVar.a) {
            z = true;
            if (aVar.b != 1) {
                z = false;
            }
        }
        return z;
    }

    public final void A(uag uagVar) {
        try {
            this.h.n(uagVar, this.m);
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
    }

    public final void B(xag xagVar) {
        try {
            zjf zjfVar = this.h;
            int i = this.m;
            zjfVar.getClass();
            try {
                sbg sbgVar = (sbg) ((zbg) zjfVar.b).l();
                sbgVar.b();
                zbg.D((zbg) sbgVar.b, i);
                zbg zbgVar = (zbg) sbgVar.a();
                zjfVar.b = zbgVar;
                try {
                    zjfVar.z(xagVar, zbgVar);
                } catch (Throwable th) {
                    rxf.j("BillingLogger", "Unable to log.", th);
                }
            } catch (Throwable th2) {
                rxf.j("BillingLogger", "Unable to log.", th2);
            }
        } catch (Throwable th3) {
            rxf.j("BillingClient", "Unable to log.", th3);
        }
    }

    public final void C(int i, BillingResult billingResult, cbg cbgVar) {
        try {
            int i2 = zzcy.zza;
            sag sagVar = (sag) zzcy.zzb(cbgVar, 6, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED).l();
            vdg vdgVarQ = zdg.q();
            vdgVarQ.d(i > 0);
            vdgVarQ.e(i);
            sagVar.e(vdgVarQ);
            A((uag) sagVar.a());
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
    }

    public final void D(int i) {
        synchronized (this.a) {
            try {
                if (this.b == 3) {
                    return;
                }
                int i2 = this.b;
                rxf.h("BillingClient", "Setting clientState from " + (i2 != 0 ? i2 != 1 ? i2 != 2 ? "CLOSED" : "CONNECTED" : "CONNECTING" : "DISCONNECTED") + " to " + (i != 0 ? i != 1 ? i != 2 ? "CLOSED" : "CONNECTED" : "CONNECTING" : "DISCONNECTED"));
                this.b = i;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final synchronized void E() {
        ExecutorService executorService = this.K;
        if (executorService != null) {
            executorService.shutdownNow();
            this.K = null;
        }
    }

    public final void F(BillingClientStateListener billingClientStateListener, int i) {
        cbg cbgVar;
        BillingResult billingResultD;
        BillingResult billingResult;
        synchronized (this.a) {
            try {
                if (J()) {
                    billingResultD = d(i);
                } else {
                    if (this.b == 1) {
                        rxf.i("BillingClient", "Client is already in the process of connecting to billing service.");
                        cbg cbgVar2 = cbg.BILLING_CLIENT_CONNECTING;
                        billingResult = n.d;
                        C(i, billingResult, cbgVar2);
                    } else if (this.b == 3) {
                        rxf.i("BillingClient", "Client was already closed and can't be reused. Please create another instance.");
                        cbg cbgVar3 = cbg.BILLING_CLIENT_CLOSED;
                        billingResult = n.j;
                        C(i, billingResult, cbgVar3);
                    } else {
                        D(1);
                        if (i == 0) {
                            this.J = billingClientStateListener;
                            i = 0;
                        }
                        G();
                        rxf.h("BillingClient", "Starting in-app billing setup.");
                        this.j = new e(this, billingClientStateListener, i);
                        this.j.a();
                        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
                        intent.setPackage("com.android.vending");
                        List<ResolveInfo> listQueryIntentServices = this.g.getPackageManager().queryIntentServices(intent, 0);
                        if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
                            cbgVar = cbg.INTENT_SERVICE_NOT_FOUND;
                        } else {
                            ServiceInfo serviceInfo = listQueryIntentServices.get(0).serviceInfo;
                            if (serviceInfo != null) {
                                String str = serviceInfo.packageName;
                                String str2 = serviceInfo.name;
                                if (!Objects.equals(str, "com.android.vending") || str2 == null) {
                                    cbgVar = cbg.INVALID_PHONESKY_PACKAGE;
                                    rxf.i("BillingClient", "The device doesn't have valid Play Store.");
                                } else {
                                    ComponentName componentName = new ComponentName(str, str2);
                                    Intent intent2 = new Intent(intent);
                                    intent2.setComponent(componentName);
                                    intent2.putExtra("playBillingLibraryVersion", this.c);
                                    synchronized (this.a) {
                                        try {
                                            if (this.b == 2) {
                                                billingResultD = d(i);
                                            } else if (this.b != 1) {
                                                rxf.i("BillingClient", "Client state no longer CONNECTING, returning service disconnected.");
                                                cbg cbgVar4 = cbg.BILLING_CLIENT_TRANSITIONED_OUT_OF_CONNECTING;
                                                billingResult = n.j;
                                                C(i, billingResult, cbgVar4);
                                            } else {
                                                e eVar = this.j;
                                                if ((i <= 0 || Build.VERSION.SDK_INT < 29) ? this.g.bindService(intent2, eVar, 1) : this.g.bindService(intent2, 1, a(), eVar)) {
                                                    rxf.h("BillingClient", "Service was bonded successfully.");
                                                    billingResultD = null;
                                                } else {
                                                    cbgVar = cbg.BILLING_SERVICE_BLOCKED;
                                                    rxf.i("BillingClient", "Connection to Billing service is blocked.");
                                                }
                                            }
                                        } finally {
                                        }
                                    }
                                }
                            } else {
                                cbgVar = cbg.INVALID_PHONESKY_PACKAGE;
                                rxf.i("BillingClient", "The device doesn't have valid Play Store.");
                            }
                        }
                        D(0);
                        rxf.h("BillingClient", "Billing service unavailable on device.");
                        BillingResult billingResult2 = n.b;
                        C(i, billingResult2, cbgVar);
                        billingResultD = billingResult2;
                    }
                    billingResultD = billingResult;
                }
            } finally {
            }
        }
        if (billingResultD != null) {
            billingClientStateListener.onBillingSetupFinished(billingResultD);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void G() {
        synchronized (this.a) {
            if (this.j != null) {
                try {
                    this.g.unbindService(this.j);
                } catch (Throwable th) {
                    try {
                        rxf.j("BillingClient", "There was an exception while unbinding service!", th);
                        this.i = null;
                        this.j = null;
                    } finally {
                        this.i = null;
                        this.j = null;
                    }
                }
            }
        }
    }

    public final boolean H(long j) {
        try {
            if (Build.VERSION.SDK_INT < 29) {
                j = 0;
            }
            BillingResult billingResult = (BillingResult) f(1).get(j, TimeUnit.MILLISECONDS);
            if (billingResult.getResponseCode() == 0) {
                rxf.h("BillingClient", "Reconnection succeeded with result: " + billingResult.getResponseCode());
            } else {
                rxf.i("BillingClient", "Reconnection failed with result: " + billingResult.getResponseCode());
            }
        } catch (Exception e) {
            if (e instanceof InterruptedException) {
                Thread.currentThread().interrupt();
            }
            rxf.j("BillingClient", "Error during reconnection attempt: ", e);
        }
        return J();
    }

    public final boolean I(long j) {
        long jMax;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        swf swfVar = this.M;
        if (swfVar == null) {
            z72.c("ticker");
            return false;
        }
        long jA = swfVar.a();
        int i = il7.h;
        long jA2 = j;
        for (int i2 = 1; i2 <= i; i2++) {
            try {
                jMax = Math.max(0L, jA2);
            } catch (Exception e) {
                if (e instanceof InterruptedException) {
                    Thread.currentThread().interrupt();
                }
                rxf.j("BillingClient", "Error during reconnection attempt: ", e);
            }
            if (jMax <= 0) {
                rxf.i("BillingClient", "No time remaining for reconnection attempt.");
                return J();
            }
            BillingResult billingResult = (BillingResult) f(i2).get(jMax, timeUnit);
            if (billingResult.getResponseCode() == 0) {
                rxf.h("BillingClient", "Reconnection succeeded with result: " + billingResult.getResponseCode());
                return J();
            }
            rxf.i("BillingClient", "Reconnection failed with result: " + billingResult.getResponseCode());
            jA2 = j - (((swfVar.a() - jA) + 0) / 1000000);
            long jPow = ((long) Math.pow(2.0d, i2 - 1)) * 1000;
            if (jA2 < jPow) {
                rxf.i("BillingClient", "Reconnection failed due to timeout limit reached.");
                return J();
            }
            if (i2 < i && jPow > 0) {
                try {
                    Thread.sleep(jPow);
                    jA2 = j - (((swfVar.a() - jA) + 0) / 1000000);
                } catch (InterruptedException e2) {
                    Thread.currentThread().interrupt();
                    rxf.j("BillingClient", "Error sleeping during reconnection attempt: ", e2);
                }
            }
        }
        rxf.i("BillingClient", "Max retries reached.");
        return J();
    }

    public final boolean J() {
        boolean z;
        synchronized (this.a) {
            try {
                z = false;
                if (this.b == 2 && this.i != null && this.j != null) {
                    z = true;
                }
            } finally {
            }
        }
        return z;
    }

    public final zzed L(BillingResult billingResult, cbg cbgVar, String str, Exception exc) {
        P(cbgVar, 9, billingResult, zzcy.zza(exc));
        rxf.j("BillingClient", str, exc);
        return new zzed(billingResult, null);
    }

    public final void M(int i, BillingResult billingResult, cbg cbgVar) {
        xag xagVar = null;
        uag uagVar = null;
        if (billingResult.getResponseCode() == 0) {
            int i2 = zzcy.zza;
            try {
                wag wagVarR = xag.r();
                wagVarR.b();
                xag.q((xag) wagVarR.b, 5);
                icg icgVarQ = kcg.q();
                icgVarQ.b();
                kcg.r((kcg) icgVarQ.b, i);
                kcg kcgVar = (kcg) icgVarQ.a();
                wagVarR.b();
                xag.u((xag) wagVarR.b, kcgVar);
                xagVar = (xag) wagVarR.a();
            } catch (Exception e) {
                rxf.j("BillingLogger", "Unable to create logging payload", e);
            }
            B(xagVar);
            return;
        }
        int i3 = zzcy.zza;
        try {
            sag sagVarT = uag.t();
            zag zagVarR = fbg.r();
            zagVarR.e(billingResult.getResponseCode());
            String debugMessage = billingResult.getDebugMessage();
            zagVarR.b();
            fbg.t((fbg) zagVarR.b, debugMessage);
            zagVarR.d(cbgVar);
            sagVarT.d(zagVarR);
            sagVarT.g(5);
            icg icgVarQ2 = kcg.q();
            icgVarQ2.b();
            kcg.r((kcg) icgVarQ2.b, i);
            kcg kcgVar2 = (kcg) icgVarQ2.a();
            sagVarT.b();
            uag.y((uag) sagVarT.b, kcgVar2);
            uagVar = (uag) sagVarT.a();
        } catch (Exception e2) {
            rxf.j("BillingLogger", "Unable to create logging payload", e2);
        }
        A(uagVar);
    }

    public final void N(int i, BillingResult billingResult, cbg cbgVar) {
        try {
            int i2 = zzcy.zza;
            A(zzcy.zzb(cbgVar, i, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED));
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
    }

    public final void O(cbg cbgVar, BillingResult billingResult, long j) {
        try {
            int i = zzcy.zza;
            try {
                this.h.p(zzcy.zzb(cbgVar, 2, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED), this.m, j);
            } catch (Throwable th) {
                rxf.j("BillingClient", "Unable to log.", th);
            }
        } catch (Throwable th2) {
            rxf.j("BillingClient", "Unable to log.", th2);
        }
    }

    public final void P(cbg cbgVar, int i, BillingResult billingResult, String str) {
        try {
            int i2 = zzcy.zza;
            A(zzcy.zzb(cbgVar, i, billingResult, str, lbg.BROADCAST_ACTION_UNSPECIFIED));
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
    }

    public final void Q(cbg cbgVar, BillingResult billingResult, long j, boolean z) {
        try {
            int i = zzcy.zza;
            try {
                this.h.r(zzcy.zzb(cbgVar, 2, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED), this.m, j, z);
            } catch (Throwable th) {
                rxf.j("BillingClient", "Unable to log.", th);
            }
        } catch (Throwable th2) {
            rxf.j("BillingClient", "Unable to log.", th2);
        }
    }

    public final void R(cbg cbgVar, BillingResult billingResult, String str, long j, boolean z) {
        try {
            int i = zzcy.zza;
            try {
                this.h.r(zzcy.zzb(cbgVar, 2, billingResult, str, lbg.BROADCAST_ACTION_UNSPECIFIED), this.m, j, z);
            } catch (Throwable th) {
                rxf.j("BillingClient", "Unable to log.", th);
            }
        } catch (Throwable th2) {
            rxf.j("BillingClient", "Unable to log.", th2);
        }
    }

    public final void S(final BillingResult billingResult) {
        if (Thread.interrupted()) {
            return;
        }
        this.e.post(new Runnable() { // from class: com.android.billingclient.api.zzam
            @Override // java.lang.Runnable
            public final void run() {
                a aVar = this.zza;
                BillingResult billingResult2 = billingResult;
                PurchasesUpdatedListener purchasesUpdatedListener = aVar.f.b;
                tlf tlfVar = aVar.f;
                if (purchasesUpdatedListener != null) {
                    tlfVar.b.onPurchasesUpdated(billingResult2, null);
                } else {
                    rxf.i("BillingClient", "No valid listener is set in BroadcastManager");
                }
            }
        });
    }

    public final synchronized ExecutorService a() {
        ExecutorService executorServiceNewFixedThreadPool;
        executorServiceNewFixedThreadPool = this.K;
        if (executorServiceNewFixedThreadPool == null) {
            executorServiceNewFixedThreadPool = Executors.newFixedThreadPool(rxf.a, new lv2(this));
            this.K = executorServiceNewFixedThreadPool;
        }
        return executorServiceNewFixedThreadPool;
    }

    @Override // com.android.billingclient.api.BillingClient
    public void acknowledgePurchase(final AcknowledgePurchaseParams acknowledgePurchaseParams, final AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzal
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener2 = acknowledgePurchaseResponseListener;
                AcknowledgePurchaseParams acknowledgePurchaseParams2 = acknowledgePurchaseParams;
                aVar.getClass();
                try {
                    if (!aVar.I(il7.g)) {
                        cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
                        BillingResult billingResult = n.j;
                        aVar.N(3, billingResult, cbgVar);
                        acknowledgePurchaseResponseListener2.onAcknowledgePurchaseResponse(billingResult);
                        return null;
                    }
                    if (TextUtils.isEmpty(acknowledgePurchaseParams2.getPurchaseToken())) {
                        rxf.i("BillingClient", "Please provide a valid purchase token.");
                        cbg cbgVar2 = cbg.EMPTY_PURCHASE_TOKEN;
                        BillingResult billingResult2 = n.g;
                        aVar.N(3, billingResult2, cbgVar2);
                        acknowledgePurchaseResponseListener2.onAcknowledgePurchaseResponse(billingResult2);
                        return null;
                    }
                    if (!aVar.p) {
                        cbg cbgVar3 = cbg.API_VERSION_NOT_V9;
                        BillingResult billingResult3 = n.a;
                        aVar.N(3, billingResult3, cbgVar3);
                        acknowledgePurchaseResponseListener2.onAcknowledgePurchaseResponse(billingResult3);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.j(acknowledgePurchaseResponseListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    String packageName = aVar.g.getPackageName();
                    String purchaseToken = acknowledgePurchaseParams2.getPurchaseToken();
                    String str = aVar.d;
                    long jLongValue = aVar.L.longValue();
                    int i = rxf.a;
                    Bundle bundle = new Bundle();
                    rxf.b(bundle, str, jLongValue);
                    Bundle bundleJ = ((evf) hvfVar).j(packageName, purchaseToken, bundle);
                    acknowledgePurchaseResponseListener2.onAcknowledgePurchaseResponse(n.a(rxf.a("BillingClient", bundleJ), rxf.g("BillingClient", bundleJ)));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.j(acknowledgePurchaseResponseListener2, n.j, cbg.ACKNOWLEDGE_PURCHASE_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.j(acknowledgePurchaseResponseListener2, n.h, cbg.ACKNOWLEDGE_PURCHASE_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzan
            @Override // java.lang.Runnable
            public final void run() {
                a aVar = this.zza;
                AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener2 = acknowledgePurchaseResponseListener;
                cbg cbgVar = cbg.EXECUTE_ASYNC_TIMEOUT;
                BillingResult billingResult = n.k;
                aVar.N(3, billingResult, cbgVar);
                acknowledgePurchaseResponseListener2.onAcknowledgePurchaseResponse(billingResult);
            }
        }, u(), a()) == null) {
            BillingResult billingResultE = e();
            N(3, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResultE);
        }
    }

    public final nvg c(BillingResult billingResult, cbg cbgVar, String str, Exception exc) {
        rxf.j("BillingClient", str, exc);
        P(cbgVar, 7, billingResult, zzcy.zza(exc));
        return new nvg(billingResult.getResponseCode(), billingResult.getDebugMessage(), new ArrayList(), new ArrayList());
    }

    @Override // com.android.billingclient.api.BillingClient
    public void consumeAsync(final ConsumeParams consumeParams, final ConsumeResponseListener consumeResponseListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzbc
            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Type inference failed for: r10v13 */
            /* JADX WARN: Type inference failed for: r10v16 */
            /* JADX WARN: Type inference failed for: r10v2, types: [java.lang.String] */
            /* JADX WARN: Type inference failed for: r10v28 */
            /* JADX WARN: Type inference failed for: r10v3 */
            /* JADX WARN: Type inference failed for: r10v4 */
            /* JADX WARN: Type inference failed for: r10v5 */
            /* JADX WARN: Type inference failed for: r10v9 */
            /* JADX WARN: Type inference failed for: r1v0, types: [com.android.billingclient.api.a] */
            /* JADX WARN: Type inference failed for: r2v0, types: [com.android.billingclient.api.ConsumeResponseListener] */
            /* JADX WARN: Type inference failed for: r3v10 */
            /* JADX WARN: Type inference failed for: r3v11 */
            /* JADX WARN: Type inference failed for: r3v13, types: [java.lang.String] */
            /* JADX WARN: Type inference failed for: r3v15 */
            /* JADX WARN: Type inference failed for: r3v16 */
            /* JADX WARN: Type inference failed for: r3v17 */
            /* JADX WARN: Type inference failed for: r3v2 */
            /* JADX WARN: Type inference failed for: r3v3 */
            /* JADX WARN: Type inference failed for: r3v4, types: [java.lang.String] */
            /* JADX WARN: Type inference failed for: r3v5, types: [java.lang.String] */
            /* JADX WARN: Type inference failed for: r3v7, types: [java.lang.Object] */
            /* JADX WARN: Type inference failed for: r3v8 */
            /* JADX WARN: Type inference failed for: r3v9 */
            /* JADX WARN: Type inference failed for: r4v10, types: [evf] */
            /* JADX WARN: Type inference failed for: r4v5, types: [evf, nif] */
            /* JADX WARN: Type inference failed for: r5v2, types: [java.lang.StringBuilder] */
            /* JADX WARN: Type inference failed for: r5v5, types: [android.os.Parcel] */
            /* JADX WARN: Type inference fix 'apply assigned field type' failed
            java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
            	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
            	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
            	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
            	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
            	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
            	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
            	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
             */
            @Override // java.util.concurrent.Callable
            public final Object call() {
                Exception exc;
                ?? r3;
                DeadObjectException deadObjectException;
                ?? r10;
                ?? r32;
                hvf hvfVar;
                int i;
                String strG;
                ?? r1 = this.zza;
                ?? r2 = consumeResponseListener;
                ConsumeParams consumeParams2 = consumeParams;
                if (!r1.I(il7.g)) {
                    cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
                    BillingResult billingResult = n.j;
                    r1.N(4, billingResult, cbgVar);
                    r2.onConsumeResponse(billingResult, consumeParams2.getPurchaseToken());
                    return null;
                }
                ?? purchaseToken = consumeParams2.getPurchaseToken();
                try {
                    rxf.h("BillingClient", "Consuming purchase with token: " + purchaseToken);
                    ?? r33 = r1.a;
                    synchronized (r33) {
                        hvfVar = r1.i;
                    }
                    try {
                        if (hvfVar == null) {
                            try {
                                r1.m(r2, purchaseToken, n.j, cbg.SERVICE_RESET_TO_NULL, "Service has been reset to null.", null);
                                return null;
                            } catch (DeadObjectException e) {
                                e = e;
                                r33 = purchaseToken;
                                deadObjectException = e;
                                r32 = r33;
                                r1.m(r2, r32, n.j, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", deadObjectException);
                                return null;
                            } catch (Exception e2) {
                                e = e2;
                                r33 = purchaseToken;
                                exc = e;
                                r10 = r33;
                                r1.m(r2, r10, n.h, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", exc);
                                return null;
                            }
                        }
                        r33 = purchaseToken;
                        try {
                            try {
                                boolean z = r1.p;
                                Context context = r1.g;
                                if (z) {
                                    String packageName = context.getPackageName();
                                    boolean z2 = r1.p;
                                    String str = r1.d;
                                    long jLongValue = r1.L.longValue();
                                    Bundle bundle = new Bundle();
                                    if (z2) {
                                        rxf.b(bundle, str, jLongValue);
                                    }
                                    try {
                                        Bundle bundleK = ((evf) hvfVar).k(packageName, r33, bundle);
                                        i = bundleK.getInt("RESPONSE_CODE");
                                        strG = rxf.g("BillingClient", bundleK);
                                    } catch (DeadObjectException e3) {
                                        e = e3;
                                        deadObjectException = e;
                                        r32 = r33;
                                        r1.m(r2, r32, n.j, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", deadObjectException);
                                        return null;
                                    } catch (Exception e4) {
                                        e = e4;
                                        exc = e;
                                        r10 = r33;
                                        r1.m(r2, r10, n.h, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", exc);
                                        return null;
                                    }
                                } else {
                                    String packageName2 = context.getPackageName();
                                    try {
                                        ?? r4 = (evf) hvfVar;
                                        ?? D = r4.d();
                                        D.writeInt(3);
                                        D.writeString(packageName2);
                                        D.writeString(r33);
                                        Parcel parcelE = r4.e(5, D);
                                        i = parcelE.readInt();
                                        parcelE.recycle();
                                        strG = "";
                                    } catch (DeadObjectException e5) {
                                        e = e5;
                                        purchaseToken = r33;
                                        r3 = purchaseToken;
                                        deadObjectException = e;
                                        r32 = r3;
                                        r1.m(r2, r32, n.j, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", deadObjectException);
                                        return null;
                                    }
                                }
                                BillingResult billingResultA = n.a(i, strG);
                                if (i == 0) {
                                    rxf.h("BillingClient", "Successfully consumed purchase.");
                                    r2.onConsumeResponse(billingResultA, r33);
                                    return null;
                                }
                                r1.m(r2, r33, billingResultA, cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY, "Error consuming purchase with token. Response code: " + i, null);
                                return null;
                            } catch (Exception e6) {
                                e = e6;
                                purchaseToken = r33;
                                exc = e;
                                r10 = purchaseToken;
                                r1.m(r2, r10, n.h, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", exc);
                                return null;
                            }
                        } catch (DeadObjectException e7) {
                            e = e7;
                            r3 = r33;
                            deadObjectException = e;
                            r32 = r3;
                            r1.m(r2, r32, n.j, cbg.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", deadObjectException);
                            return null;
                        }
                    } catch (DeadObjectException e8) {
                        e = e8;
                    } catch (Exception e9) {
                        e = e9;
                    }
                } catch (DeadObjectException e10) {
                    e = e10;
                } catch (Exception e11) {
                    e = e11;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbd
            @Override // java.lang.Runnable
            public final void run() {
                a aVar = this.zza;
                ConsumeResponseListener consumeResponseListener2 = consumeResponseListener;
                ConsumeParams consumeParams2 = consumeParams;
                cbg cbgVar = cbg.EXECUTE_ASYNC_TIMEOUT;
                BillingResult billingResult = n.k;
                aVar.N(4, billingResult, cbgVar);
                consumeResponseListener2.onConsumeResponse(billingResult, consumeParams2.getPurchaseToken());
            }
        }, u(), a()) == null) {
            BillingResult billingResultE = e();
            N(4, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
            consumeResponseListener.onConsumeResponse(billingResultE, consumeParams.getPurchaseToken());
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void createAlternativeBillingOnlyReportingDetailsAsync(final AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzax
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener2 = alternativeBillingOnlyReportingDetailsListener;
                aVar.getClass();
                try {
                    if (!aVar.I(il7.g)) {
                        aVar.n(alternativeBillingOnlyReportingDetailsListener2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                        return null;
                    }
                    if (!aVar.y) {
                        rxf.i("BillingClient", "Current client doesn't support alternative billing only.");
                        aVar.n(alternativeBillingOnlyReportingDetailsListener2, n.D, cbg.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED, null);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.n(alternativeBillingOnlyReportingDetailsListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    evf evfVar = (evf) hvfVar;
                    evfVar.q(aVar.g.getPackageName(), rxf.e(aVar.L.longValue(), aVar.d), new dxf(alternativeBillingOnlyReportingDetailsListener2, aVar.h, aVar.m));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.n(alternativeBillingOnlyReportingDetailsListener2, n.j, cbg.CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.n(alternativeBillingOnlyReportingDetailsListener2, n.h, cbg.CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzay
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.n(alternativeBillingOnlyReportingDetailsListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, u(), a()) == null) {
            n(alternativeBillingOnlyReportingDetailsListener, e(), cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void createBillingProgramReportingDetailsAsync(final BillingProgramReportingDetailsParams billingProgramReportingDetailsParams, final BillingProgramReportingDetailsListener billingProgramReportingDetailsListener) {
        try {
            i(new Callable() { // from class: com.android.billingclient.api.zzaq
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    hvf hvfVar;
                    a aVar = this.zza;
                    BillingProgramReportingDetailsListener billingProgramReportingDetailsListener2 = billingProgramReportingDetailsListener;
                    BillingProgramReportingDetailsParams billingProgramReportingDetailsParams2 = billingProgramReportingDetailsParams;
                    aVar.getClass();
                    try {
                        if (!aVar.I(il7.g)) {
                            aVar.o(billingProgramReportingDetailsListener2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                            return null;
                        }
                        if (!aVar.D) {
                            rxf.i("BillingClient", "Current client doesn't support the provided billing program.");
                            aVar.o(billingProgramReportingDetailsListener2, n.G, cbg.BILLING_PROGRAM_NOT_SUPPORTED, null);
                            return null;
                        }
                        synchronized (aVar.a) {
                            hvfVar = aVar.i;
                        }
                        if (hvfVar == null) {
                            aVar.o(billingProgramReportingDetailsListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                            return null;
                        }
                        String str = aVar.c;
                        q2g q2gVarC = dl7.C(aVar.g, s0g.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC.a);
                        q8g q8gVarQ = u8g.q();
                        z9g z9gVarQ = kag.q();
                        z9gVarQ.d(str);
                        q8gVarQ.d("PLAY_BILLING_LIBRARY_VERSION", (kag) z9gVarQ.a());
                        z9g z9gVarQ2 = kag.q();
                        z9gVarQ2.d(aVar.g.getPackageName());
                        q8gVarQ.d("CALLING_PACKAGE", (kag) z9gVarQ2.a());
                        String str2 = HrUBqHumRuLe.pGOvsMymJIf;
                        z9g z9gVarQ3 = kag.q();
                        z9gVarQ3.d(String.valueOf(billingProgramReportingDetailsParams2.getBillingProgram()));
                        q8gVarQ.d(str2, (kag) z9gVarQ3.a());
                        z9g z9gVarQ4 = kag.q();
                        z9gVarQ4.d("RESPONSE_FORMAT_PROTO");
                        q8gVarQ.d("RESPONSE_FORMAT", (kag) z9gVarQ4.a());
                        if (billingProgramReportingDetailsParams2.getBillingProgram() == 3) {
                            z9g z9gVarQ5 = kag.q();
                            z9gVarQ5.d(String.valueOf(aVar.g.getPackageManager().getPackageInfo(aVar.g.getPackageName(), 0).firstInstallTime));
                            q8gVarQ.d("APP_INSTALL_TIME_MILLIS", (kag) z9gVarQ5.a());
                        } else if (billingProgramReportingDetailsParams2.getBillingProgram() == 5) {
                            z9g z9gVarQ6 = kag.q();
                            z9gVarQ6.d("0");
                            q8gVarQ.d("DEVELOPER_BILLING_TYPE", (kag) z9gVarQ6.a());
                        }
                        Bundle bundleZ = dl7.z(q2gVarC, (u8g) q8gVarQ.a());
                        int billingProgram = billingProgramReportingDetailsParams2.getBillingProgram();
                        zjf zjfVar = aVar.h;
                        int i = aVar.m;
                        aVar.u();
                        ((evf) hvfVar).s(bundleZ, new wd2(billingProgramReportingDetailsListener2, billingProgram, zjfVar, i, aVar.a()));
                        return null;
                    } catch (DeadObjectException e) {
                        aVar.o(billingProgramReportingDetailsListener2, n.j, cbg.SERVICE_CALL_EXCEPTION, e);
                        return null;
                    } catch (RuntimeException e2) {
                        aVar.o(billingProgramReportingDetailsListener2, n.h, cbg.SERVICE_CALL_EXCEPTION, e2);
                        return null;
                    }
                }
            }, new Runnable() { // from class: com.android.billingclient.api.zzar
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.o(billingProgramReportingDetailsListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
                }
            }, u());
        } catch (Exception e) {
            o(billingProgramReportingDetailsListener, e(), cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC, e);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void createExternalOfferReportingDetailsAsync(final ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzav
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener2 = externalOfferReportingDetailsListener;
                aVar.getClass();
                try {
                    if (!aVar.I(il7.g)) {
                        aVar.p(externalOfferReportingDetailsListener2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                        return null;
                    }
                    if (!aVar.z) {
                        rxf.i("BillingClient", "Current client doesn't support external offer.");
                        aVar.p(externalOfferReportingDetailsListener2, n.u, cbg.EXTERNAL_OFFER_NOT_SUPPORTED, null);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.p(externalOfferReportingDetailsListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    String packageName = aVar.g.getPackageName();
                    long j = aVar.g.getPackageManager().getPackageInfo(aVar.g.getPackageName(), 0).firstInstallTime;
                    String str = aVar.d;
                    long jLongValue = aVar.L.longValue();
                    int i = rxf.a;
                    Bundle bundle = new Bundle();
                    rxf.b(bundle, str, jLongValue);
                    bundle.putLong("appInstallTimeMillis", j);
                    ((evf) hvfVar).r(packageName, bundle, new dxf(externalOfferReportingDetailsListener2, aVar.h, aVar.m));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.p(externalOfferReportingDetailsListener2, n.j, cbg.CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.p(externalOfferReportingDetailsListener2, n.h, cbg.CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbe
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.p(externalOfferReportingDetailsListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, u(), a()) == null) {
            p(externalOfferReportingDetailsListener, e(), cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    public final BillingResult d(int i) {
        rxf.h("BillingClient", "Service connection is valid. No need to re-initialize.");
        wag wagVarR = xag.r();
        wagVarR.b();
        xag.q((xag) wagVarR.b, 6);
        vdg vdgVarQ = zdg.q();
        vdgVarQ.b();
        zdg.v((zdg) vdgVarQ.b);
        vdgVarQ.d(i > 0);
        vdgVarQ.e(i);
        wagVarR.b();
        xag.w((xag) wagVarR.b, (zdg) vdgVarQ.a());
        B((xag) wagVarR.a());
        return n.i;
    }

    public final BillingResult e() {
        int[] iArr = {0, 3};
        synchronized (this.a) {
            for (int i = 0; i < 2; i++) {
                if (this.b == iArr[i]) {
                    return n.j;
                }
            }
            return n.h;
        }
    }

    public final x0g f(final int i) {
        if (this.G && !J()) {
            return qk7.C(new pjg() { // from class: com.android.billingclient.api.zzad
                @Override // defpackage.pjg
                public final Object zza(ohg ohgVar) {
                    a aVar = this.zza;
                    aVar.F(new ywf(aVar, ohgVar), i);
                    return "reconnectIfNeeded";
                }
            });
        }
        rxf.h("BillingClient", "Already connected or not opted into auto reconnection.");
        return new v0g(n.i);
    }

    public final void g() {
        if (TextUtils.isEmpty(null)) {
            this.g.getPackageName();
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void getBillingConfigAsync(GetBillingConfigParams getBillingConfigParams, final BillingConfigResponseListener billingConfigResponseListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzas
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                BillingConfigResponseListener billingConfigResponseListener2 = billingConfigResponseListener;
                aVar.getClass();
                try {
                    if (!aVar.I(il7.g)) {
                        rxf.i("BillingClient", "Service disconnected.");
                        cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
                        BillingResult billingResult = n.j;
                        aVar.N(13, billingResult, cbgVar);
                        billingConfigResponseListener2.onBillingConfigResponse(billingResult, null);
                        return null;
                    }
                    if (!aVar.v) {
                        rxf.i("BillingClient", "Current client doesn't support get billing config.");
                        cbg cbgVar2 = cbg.GET_BILLING_CONFIG_NOT_SUPPORTED;
                        BillingResult billingResult2 = n.z;
                        aVar.N(13, billingResult2, cbgVar2);
                        billingConfigResponseListener2.onBillingConfigResponse(billingResult2, null);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.w(billingConfigResponseListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    if (!il7.e || !aVar.B) {
                        String packageName = aVar.g.getPackageName();
                        String str = aVar.d;
                        long jLongValue = aVar.L.longValue();
                        int i = rxf.a;
                        Bundle bundle = new Bundle();
                        rxf.b(bundle, str, jLongValue);
                        if (!TextUtils.isEmpty(null)) {
                            bundle.putString("accountName", null);
                        }
                        ((evf) hvfVar).u(packageName, bundle, new g(billingConfigResponseListener2, aVar.h, aVar.m));
                        return null;
                    }
                    String str2 = aVar.c;
                    q2g q2gVarC = dl7.C(aVar.g, s0g.GET_BILLING_CONFIG.a);
                    q8g q8gVarQ = u8g.q();
                    z9g z9gVarQ = kag.q();
                    z9gVarQ.d(str2);
                    q8gVarQ.d("PLAY_BILLING_LIBRARY_VERSION", (kag) z9gVarQ.a());
                    z9g z9gVarQ2 = kag.q();
                    z9gVarQ2.d(aVar.g.getPackageName());
                    q8gVarQ.d("CALLING_PACKAGE", (kag) z9gVarQ2.a());
                    Bundle bundleZ = dl7.z(q2gVarC, (u8g) q8gVarQ.a());
                    if (!TextUtils.isEmpty(null)) {
                        bundleZ.putString("accountName", null);
                    }
                    ((evf) hvfVar).s(bundleZ, new k1g(billingConfigResponseListener2, aVar.h, aVar.m));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.w(billingConfigResponseListener2, n.j, cbg.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.w(billingConfigResponseListener2, n.h, cbg.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzat
            @Override // java.lang.Runnable
            public final void run() {
                a aVar = this.zza;
                BillingConfigResponseListener billingConfigResponseListener2 = billingConfigResponseListener;
                cbg cbgVar = cbg.EXECUTE_ASYNC_TIMEOUT;
                BillingResult billingResult = n.k;
                aVar.N(13, billingResult, cbgVar);
                billingConfigResponseListener2.onBillingConfigResponse(billingResult, null);
            }
        }, u(), a()) == null) {
            BillingResult billingResultE = e();
            N(13, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
            billingConfigResponseListener.onBillingConfigResponse(billingResultE, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final int getConnectionState() {
        int i;
        synchronized (this.a) {
            i = this.b;
        }
        return i;
    }

    public final void i(Callable callable, final Runnable runnable, Handler handler) throws Exception {
        try {
            final Future futureSubmit = a().submit(callable);
            handler.postDelayed(new Runnable() { // from class: com.android.billingclient.api.zzbk
                @Override // java.lang.Runnable
                public final void run() {
                    Future future = futureSubmit;
                    if (future.isDone() || future.isCancelled()) {
                        return;
                    }
                    Runnable runnable2 = runnable;
                    future.cancel(true);
                    rxf.i("BillingClient", "Async task is taking too long, cancel it!");
                    runnable2.run();
                }
            }, 28500L);
        } catch (Exception e) {
            rxf.j("BillingClient", "Async task throws exception!", e);
            throw e;
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void isAlternativeBillingOnlyAvailableAsync(final AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzaz
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener2 = alternativeBillingOnlyAvailabilityListener;
                try {
                    if (!aVar.I(il7.g)) {
                        aVar.k(alternativeBillingOnlyAvailabilityListener2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                        return null;
                    }
                    if (!aVar.y) {
                        rxf.i("BillingClient", "Current client doesn't support alternative billing only.");
                        aVar.k(alternativeBillingOnlyAvailabilityListener2, n.D, cbg.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED, null);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.k(alternativeBillingOnlyAvailabilityListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    String packageName = aVar.g.getPackageName();
                    Bundle bundleE = rxf.e(aVar.L.longValue(), aVar.d);
                    dxf dxfVar = new dxf(alternativeBillingOnlyAvailabilityListener2, aVar.h, aVar.m);
                    evf evfVar = (evf) hvfVar;
                    Parcel parcelD = evfVar.d();
                    parcelD.writeInt(21);
                    parcelD.writeString(packageName);
                    int i = nvf.a;
                    parcelD.writeInt(1);
                    bundleE.writeToParcel(parcelD, 0);
                    parcelD.writeStrongBinder(dxfVar);
                    evfVar.g(1401, parcelD);
                    return null;
                } catch (Exception e) {
                    aVar.k(alternativeBillingOnlyAvailabilityListener2, e instanceof DeadObjectException ? n.j : n.h, cbg.IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL_EXCEPTION, e);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzba
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.k(alternativeBillingOnlyAvailabilityListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, u(), a()) == null) {
            k(alternativeBillingOnlyAvailabilityListener, e(), cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void isBillingProgramAvailableAsync(final int i, final BillingProgramAvailabilityListener billingProgramAvailabilityListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzao
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                wd2 wd2Var;
                a aVar = this.zza;
                BillingProgramAvailabilityListener billingProgramAvailabilityListener2 = billingProgramAvailabilityListener;
                int i2 = i;
                aVar.getClass();
                try {
                    if (!aVar.I(il7.g)) {
                        aVar.l(billingProgramAvailabilityListener2, i2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                        return null;
                    }
                    if (!aVar.D) {
                        rxf.i("BillingClient", "Current client doesn't support the provided billing program.");
                        aVar.l(billingProgramAvailabilityListener2, i2, n.G, cbg.BILLING_PROGRAM_NOT_SUPPORTED, null);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.l(billingProgramAvailabilityListener2, i2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    String str = aVar.c;
                    q2g q2gVarC = dl7.C(aVar.g, s0g.IS_BILLING_PROGRAM_AVAILABLE_ASYNC.a);
                    q8g q8gVarQ = u8g.q();
                    z9g z9gVarQ = kag.q();
                    z9gVarQ.d(str);
                    q8gVarQ.d("PLAY_BILLING_LIBRARY_VERSION", (kag) z9gVarQ.a());
                    z9g z9gVarQ2 = kag.q();
                    z9gVarQ2.d(aVar.g.getPackageName());
                    q8gVarQ.d("CALLING_PACKAGE", (kag) z9gVarQ2.a());
                    z9g z9gVarQ3 = kag.q();
                    z9gVarQ3.d(String.valueOf(i2));
                    q8gVarQ.d("BILLING_PROGRAM", (kag) z9gVarQ3.a());
                    Bundle bundleZ = dl7.z(q2gVarC, (u8g) q8gVarQ.a());
                    try {
                        zjf zjfVar = aVar.h;
                        int i3 = aVar.m;
                        aVar.u();
                        wd2Var = new wd2(billingProgramAvailabilityListener2, i2, zjfVar, i3, aVar.a());
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener2;
                        i2 = i2;
                    } catch (DeadObjectException e) {
                        e = e;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener2;
                        i2 = i2;
                    } catch (Exception e2) {
                        e = e2;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener2;
                        i2 = i2;
                    }
                    try {
                        ((evf) hvfVar).s(bundleZ, wd2Var);
                        return null;
                    } catch (DeadObjectException e3) {
                        e = e3;
                    } catch (Exception e4) {
                        e = e4;
                        aVar.l(billingProgramAvailabilityListener2, i2, n.h, cbg.SERVICE_CALL_EXCEPTION, e);
                        return null;
                    }
                } catch (DeadObjectException e5) {
                    e = e5;
                } catch (Exception e6) {
                    e = e6;
                }
                aVar.l(billingProgramAvailabilityListener2, i2, n.j, cbg.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzap
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.l(billingProgramAvailabilityListener, i, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, u(), a()) == null) {
            l(billingProgramAvailabilityListener, i, e(), cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void isExternalOfferAvailableAsync(final ExternalOfferAvailabilityListener externalOfferAvailabilityListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzaf
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                ExternalOfferAvailabilityListener externalOfferAvailabilityListener2 = externalOfferAvailabilityListener;
                aVar.getClass();
                try {
                    if (!aVar.I(il7.g)) {
                        aVar.q(externalOfferAvailabilityListener2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                        return null;
                    }
                    if (!aVar.B) {
                        rxf.i("BillingClient", "Current client doesn't support external offer.");
                        aVar.q(externalOfferAvailabilityListener2, n.u, cbg.EXTERNAL_OFFER_NOT_SUPPORTED, null);
                        return null;
                    }
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.q(externalOfferAvailabilityListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    evf evfVar = (evf) hvfVar;
                    evfVar.w(aVar.g.getPackageName(), rxf.e(aVar.L.longValue(), aVar.d), new dxf(externalOfferAvailabilityListener2, aVar.h, aVar.m));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.q(externalOfferAvailabilityListener2, n.j, cbg.IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.q(externalOfferAvailabilityListener2, n.h, cbg.IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzag
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.q(externalOfferAvailabilityListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, u(), a()) == null) {
            q(externalOfferAvailabilityListener, e(), cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult isFeatureSupported(String str) {
        if (!H(il7.f)) {
            BillingResult billingResult = n.j;
            cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
            if (billingResult.getResponseCode() != 0) {
                N(5, billingResult, cbgVar);
                return billingResult;
            }
            try {
                int i = zzcy.zza;
                B(zzcy.zzc(5, lbg.BROADCAST_ACTION_UNSPECIFIED));
                return billingResult;
            } catch (Throwable th) {
                rxf.j("BillingClient", "Unable to log.", th);
                return billingResult;
            }
        }
        BillingResult billingResult2 = n.a;
        switch (str.hashCode()) {
            case -422092961:
                if (str.equals(BillingClient.FeatureType.SUBSCRIPTIONS_UPDATE)) {
                    BillingResult billingResult3 = this.l ? n.i : n.m;
                    M(3, billingResult3, cbg.SUBSCRIPTIONS_UPDATE_NOT_SUPPORTED);
                    return billingResult3;
                }
                break;
            case 96321:
                if (str.equals("aaa")) {
                    BillingResult billingResult4 = this.s ? n.i : n.o;
                    M(6, billingResult4, cbg.CROSS_APP_NOT_SUPPORTED);
                    return billingResult4;
                }
                break;
            case 97314:
                if (str.equals(BillingClient.FeatureType.IN_APP_MESSAGING)) {
                    BillingResult billingResult5 = this.q ? n.i : n.t;
                    M(5, billingResult5, cbg.IN_APP_MESSAGE_NOT_SUPPORTED);
                    return billingResult5;
                }
                break;
            case 98307:
                if (str.equals("ccc")) {
                    BillingResult billingResult6 = this.t ? n.i : n.p;
                    M(8, billingResult6, cbg.MULTI_ITEM_NOT_SUPPORTED);
                    return billingResult6;
                }
                break;
            case 99300:
                if (str.equals("ddd")) {
                    BillingResult billingResult7 = this.r ? n.i : n.q;
                    M(7, billingResult7, cbg.OFFER_ID_TOKEN_NOT_SUPPORTED);
                    return billingResult7;
                }
                break;
            case 100293:
                if (str.equals("eee")) {
                    BillingResult billingResult8 = this.t ? n.i : n.p;
                    M(9, billingResult8, cbg.PBL_FOR_PAYMENTS_GATEWAY_BUYFLOW_NOT_SUPPORTED);
                    return billingResult8;
                }
                break;
            case 101286:
                if (str.equals(BillingClient.FeatureType.PRODUCT_DETAILS)) {
                    BillingResult billingResult9 = this.u ? n.i : n.s;
                    M(10, billingResult9, cbg.PRODUCT_DETAILS_NOT_SUPPORTED);
                    return billingResult9;
                }
                break;
            case 102279:
                if (str.equals(BillingClient.FeatureType.BILLING_CONFIG)) {
                    BillingResult billingResult10 = this.v ? n.i : n.z;
                    M(11, billingResult10, cbg.GET_BILLING_CONFIG_NOT_SUPPORTED);
                    return billingResult10;
                }
                break;
            case 103272:
                if (str.equals("hhh")) {
                    BillingResult billingResult11 = this.v ? n.i : n.A;
                    M(12, billingResult11, cbg.QUERY_PRODUCT_DETAILS_WITH_SERIALIZED_DOCID_NOT_SUPPORTED);
                    return billingResult11;
                }
                break;
            case 104265:
                if (str.equals("iii")) {
                    BillingResult billingResult12 = this.x ? n.i : n.C;
                    M(13, billingResult12, cbg.QUERY_PRODUCT_DETAILS_WITH_DEVELOPER_SPECIFIED_ACCOUNT_NOT_SUPPORTED);
                    return billingResult12;
                }
                break;
            case 105258:
                if (str.equals(BillingClient.FeatureType.ALTERNATIVE_BILLING_ONLY)) {
                    BillingResult billingResult13 = this.y ? n.i : n.D;
                    M(14, billingResult13, cbg.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED);
                    return billingResult13;
                }
                break;
            case 106251:
                if (str.equals(BillingClient.FeatureType.EXTERNAL_OFFER)) {
                    BillingResult billingResult14 = this.B ? n.i : n.u;
                    M(18, billingResult14, cbg.EXTERNAL_OFFER_NOT_SUPPORTED);
                    return billingResult14;
                }
                break;
            case 107244:
                if (str.equals("lll")) {
                    BillingResult billingResult15 = this.A ? n.i : n.v;
                    M(19, billingResult15, cbg.MULTI_ITEM_WITH_SEASON_PASS_NOT_SUPPORTED);
                    return billingResult15;
                }
                break;
            case 108237:
                if (str.equals("mmm")) {
                    BillingResult billingResult16 = this.B ? n.i : n.w;
                    M(20, billingResult16, cbg.AUTO_PAY_NOT_SUPPORTED);
                    return billingResult16;
                }
                break;
            case 109230:
                if (str.equals(BillingClient.FeatureType.INCLUDE_SUSPENDED_SUBSCRIPTIONS)) {
                    BillingResult billingResult17 = this.C ? n.i : n.x;
                    M(21, billingResult17, cbg.INCLUDE_SUSPENDED_SUBSCRIPTIONS_NOT_SUPPORTED);
                    return billingResult17;
                }
                break;
            case 110223:
                if (str.equals("ooo")) {
                    BillingResult billingResult18 = this.E ? n.i : n.r;
                    M(22, billingResult18, cbg.GIFT_CODE_PURCHASE_NOT_SUPPORTED);
                    return billingResult18;
                }
                break;
            case 207616302:
                if (str.equals(BillingClient.FeatureType.PRICE_CHANGE_CONFIRMATION)) {
                    BillingResult billingResult19 = this.o ? n.i : n.n;
                    M(4, billingResult19, cbg.PRICE_CHANGE_CONFIRMATION_NOT_SUPPORTED);
                    return billingResult19;
                }
                break;
            case 1987365622:
                if (str.equals(BillingClient.FeatureType.SUBSCRIPTIONS)) {
                    BillingResult billingResult20 = this.k ? n.i : n.l;
                    M(2, billingResult20, cbg.SUBSCRIPTIONS_NOT_SUPPORTED);
                    return billingResult20;
                }
                break;
        }
        rxf.i("BillingClient", "Unsupported feature: ".concat(str));
        BillingResult billingResult21 = n.y;
        M(1, billingResult21, cbg.UNKNOWN_FEATURE);
        return billingResult21;
    }

    @Override // com.android.billingclient.api.BillingClient
    public final boolean isReady() {
        if (this.G) {
            return true;
        }
        return J();
    }

    public final void j(AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        rxf.j("BillingClient", "Error in acknowledge purchase!", exc);
        P(cbgVar, 3, billingResult, zzcy.zza(exc));
        acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResult);
    }

    public final void k(AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 14, billingResult, zzcy.zza(exc));
        alternativeBillingOnlyAvailabilityListener.onAlternativeBillingOnlyAvailabilityResponse(billingResult);
    }

    public final void l(BillingProgramAvailabilityListener billingProgramAvailabilityListener, int i, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 33, billingResult, zzcy.zza(exc));
        billingProgramAvailabilityListener.onBillingProgramAvailabilityResponse(billingResult, new BillingProgramAvailabilityDetails(i));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r30v0, types: [com.android.billingclient.api.a] */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v55 */
    /* JADX WARN: Type inference failed for: r4v56 */
    /* JADX WARN: Type inference failed for: r4v57 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r5v0, types: [long] */
    /* JADX WARN: Type inference failed for: r5v1, types: [long] */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v20 */
    /* JADX WARN: Type inference failed for: r6v21 */
    /* JADX WARN: Type inference failed for: r6v22 */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r6v5 */
    /* JADX WARN: Type inference failed for: r6v6 */
    /* JADX WARN: Type inference failed for: r6v7 */
    /* JADX WARN: Type inference failed for: r7v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r7v2, types: [boolean] */
    @Override // com.android.billingclient.api.BillingClient
    public BillingResult launchBillingFlow(Activity activity, final BillingFlowParams billingFlowParams) {
        int i;
        boolean z;
        long j;
        boolean z2;
        Future futureB;
        ?? r6;
        String str;
        ?? r62;
        ?? r4;
        ?? r63;
        ?? r42;
        cbg cbgVarZzb;
        cbg cbgVar;
        boolean z3;
        long j2;
        String str2;
        Object obj;
        String str3;
        boolean z4;
        boolean z5;
        final int i2;
        int i3;
        int i4;
        long jNextLong = new Random().nextLong();
        if (this.f == null || this.f.b == null) {
            cbg cbgVar2 = cbg.MISSING_LISTENER;
            BillingResult billingResult = n.E;
            O(cbgVar2, billingResult, jNextLong);
            return billingResult;
        }
        if (billingFlowParams.getDeveloperBillingOptionParams() != null && this.f.d == null) {
            cbg cbgVar3 = cbg.MISSING_DEVELOPER_PROVIDED_BILLING_LISTENER;
            BillingResult billingResult2 = n.I;
            O(cbgVar3, billingResult2, jNextLong);
            return billingResult2;
        }
        if (!H(il7.f)) {
            cbg cbgVar4 = cbg.SERVICE_CONNECTION_NOT_READY;
            BillingResult billingResult3 = n.j;
            O(cbgVar4, billingResult3, jNextLong);
            S(billingResult3);
            return billingResult3;
        }
        synchronized (this.a) {
            try {
                if (this.j != null) {
                    z = this.j.d > 0;
                    i = 1;
                } else {
                    i = 1;
                    z = false;
                }
            } finally {
            }
        }
        ArrayList arrayListZzj = billingFlowParams.zzj();
        List listZzk = billingFlowParams.zzk();
        Iterator it2 = arrayListZzj.iterator();
        zzen zzenVar = (zzen) (it2.hasNext() ? it2.next() : null);
        Iterator it3 = listZzk.iterator();
        BillingFlowParams.ProductDetailsParams productDetailsParams = (BillingFlowParams.ProductDetailsParams) (it3.hasNext() ? it3.next() : null);
        if (zzenVar != null) {
            throw null;
        }
        final String productId = productDetailsParams.zza().getProductId();
        String productType = productDetailsParams.zza().getProductType();
        if (productType.equals(BillingClient.ProductType.SUBS) && !this.k) {
            rxf.i("BillingClient", "Current client doesn't support subscriptions.");
            cbg cbgVar5 = cbg.SUBSCRIPTIONS_NOT_SUPPORTED;
            BillingResult billingResult4 = n.l;
            Q(cbgVar5, billingResult4, jNextLong, z);
            S(billingResult4);
            return billingResult4;
        }
        if (billingFlowParams.zzu() && !this.n) {
            rxf.i("BillingClient", "Current client doesn't support extra params for buy intent.");
            cbg cbgVar6 = cbg.EXTRA_PARAMS_NOT_SUPPORTED;
            BillingResult billingResult5 = n.f;
            Q(cbgVar6, billingResult5, jNextLong, z);
            S(billingResult5);
            return billingResult5;
        }
        if (arrayListZzj.size() > i && !this.t) {
            rxf.i("BillingClient", "Current client doesn't support multi-item purchases.");
            cbg cbgVar7 = cbg.MULTI_ITEM_NOT_SUPPORTED;
            BillingResult billingResult6 = n.p;
            Q(cbgVar7, billingResult6, jNextLong, z);
            S(billingResult6);
            return billingResult6;
        }
        if (!listZzk.isEmpty() && !this.u) {
            rxf.i("BillingClient", "Current client doesn't support purchases with ProductDetails.");
            cbg cbgVar8 = cbg.PRODUCT_DETAILS_NOT_SUPPORTED;
            BillingResult billingResult7 = n.s;
            Q(cbgVar8, billingResult7, jNextLong, z);
            S(billingResult7);
            return billingResult7;
        }
        Iterator it4 = listZzk.iterator();
        while (it4.hasNext()) {
            String strZzb = ((BillingFlowParams.ProductDetailsParams) it4.next()).zzb();
            if (strZzb != null && strZzb.contains(":") && !this.E) {
                rxf.i("BillingClient", "Current Play Store version doesn't support gift code purchase.");
                cbg cbgVar9 = cbg.GIFT_CODE_PURCHASE_NOT_SUPPORTED;
                BillingResult billingResult8 = n.r;
                Q(cbgVar9, billingResult8, jNextLong, z);
                S(billingResult8);
                return billingResult8;
            }
        }
        BillingResult billingResultZzd = billingFlowParams.zzd();
        if (billingResultZzd != n.i) {
            Q(cbg.INVALID_BILLING_FLOW_PARAMS, billingResultZzd, jNextLong, z);
            S(billingResultZzd);
            return billingResultZzd;
        }
        if (this.n) {
            boolean z6 = this.p;
            boolean z7 = this.w;
            boolean zIsEnabledForOneTimeProducts = this.F.isEnabledForOneTimeProducts();
            boolean zIsEnabledForPrepaidPlans = this.F.isEnabledForPrepaidPlans();
            boolean z8 = this.H;
            String str4 = this.d;
            long jLongValue = this.L.longValue();
            String packageName = this.g.getPackageName();
            int i5 = rxf.a;
            boolean z9 = z;
            final Bundle bundle = new Bundle();
            rxf.b(bundle, str4, jLongValue);
            bundle.putLong("billingClientTransactionId", jNextLong);
            if (billingFlowParams.zzb() != 0) {
                bundle.putInt("prorationMode", billingFlowParams.zzb());
            }
            if (!TextUtils.isEmpty(billingFlowParams.zze())) {
                bundle.putString("accountId", billingFlowParams.zze());
            }
            if (!TextUtils.isEmpty(billingFlowParams.zzf())) {
                bundle.putString("obfuscatedProfileId", billingFlowParams.zzf());
            }
            if (billingFlowParams.zzt()) {
                bundle.putBoolean("isOfferPersonalizedByDeveloper", true);
            }
            if (!TextUtils.isEmpty(null)) {
                bundle.putStringArrayList("skusToReplace", new ArrayList<>(Arrays.asList(null)));
            }
            if (!TextUtils.isEmpty(billingFlowParams.zzh())) {
                bundle.putString("oldSkuPurchaseToken", billingFlowParams.zzh());
            }
            billingFlowParams.zzg();
            if (TextUtils.isEmpty(null)) {
                str3 = null;
            } else {
                billingFlowParams.zzg();
                str3 = null;
                bundle.putString("oldSkuPurchaseId", null);
            }
            if (!TextUtils.isEmpty(billingFlowParams.zzi())) {
                bundle.putString("originalExternalTransactionId", billingFlowParams.zzi());
            }
            if (!TextUtils.isEmpty(str3)) {
                bundle.putString("paymentsPurchaseParams", str3);
            }
            if (z6 && zIsEnabledForOneTimeProducts) {
                z4 = true;
                bundle.putBoolean("enablePendingPurchases", true);
            } else {
                z4 = true;
            }
            if (z7 && zIsEnabledForPrepaidPlans) {
                bundle.putBoolean("enablePendingPurchaseForSubscriptions", z4);
            }
            if (z8 || billingFlowParams.getDeveloperBillingOptionParams() != null) {
                bundle.putBoolean("enableAlternativeBilling", z4);
            }
            billingFlowParams.zzc();
            billingFlowParams.zza();
            if (billingFlowParams.getDeveloperBillingOptionParams() != null) {
                if (billingFlowParams.getDeveloperBillingOptionParams().getLinkUri() != null) {
                    bundle.putString("developerBillingLinkUri", billingFlowParams.getDeveloperBillingOptionParams().getLinkUri().toString());
                }
                if (billingFlowParams.getDeveloperBillingOptionParams().getLaunchMode() != 0) {
                    bundle.putInt("developerBillingLaunchMode", billingFlowParams.getDeveloperBillingOptionParams().getLaunchMode());
                }
                bundle.putInt("developerBillingProgram", billingFlowParams.getDeveloperBillingOptionParams().getBillingProgram());
                billingFlowParams.getDeveloperBillingOptionParams();
            }
            ArrayList arrayList = new ArrayList();
            for (BillingFlowParams.ProductDetailsParams productDetailsParams2 : billingFlowParams.zzk()) {
                if (productDetailsParams2.getSubscriptionProductReplacementParams() != null) {
                    String productId2 = productDetailsParams2.zza().getProductId();
                    BillingFlowParams.ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams = productDetailsParams2.getSubscriptionProductReplacementParams();
                    a2g a2gVarQ = c2g.q();
                    s2g s2gVarQ = v2g.q();
                    long j3 = jNextLong;
                    s2gVarQ.b();
                    v2g.r((v2g) s2gVarQ.b, "subs:" + packageName + ":" + productId2);
                    a2gVarQ.b();
                    c2g.r((c2g) a2gVarQ.b, (v2g) s2gVarQ.a());
                    s2g s2gVarQ2 = v2g.q();
                    String str5 = "subs:" + packageName + ":" + subscriptionProductReplacementParams.getOldProductId();
                    s2gVarQ2.b();
                    v2g.r((v2g) s2gVarQ2.b, str5);
                    a2gVarQ.b();
                    c2g.s((c2g) a2gVarQ.b, (v2g) s2gVarQ2.a());
                    switch (subscriptionProductReplacementParams.getReplacementMode()) {
                        case 1:
                            i4 = 2;
                            break;
                        case 2:
                            i4 = 3;
                            break;
                        case 3:
                            i4 = 4;
                            break;
                        case 4:
                            i4 = 6;
                            break;
                        case 5:
                            i4 = 7;
                            break;
                        case 6:
                            i4 = 8;
                            break;
                        case 7:
                            i4 = 9;
                            break;
                        default:
                            i4 = 1;
                            break;
                    }
                    a2gVarQ.b();
                    c2g.t((c2g) a2gVarQ.b, i4);
                    arrayList.add((c2g) a2gVarQ.a());
                    jNextLong = j3;
                }
            }
            j = jNextLong;
            if (!arrayList.isEmpty()) {
                e2g e2gVarQ = i2g.q();
                e2gVarQ.b();
                i2g.r((i2g) e2gVarQ.b, arrayList);
                bundle.putByteArray("subscriptionProductReplacementParamsList", ((i2g) e2gVarQ.a()).b());
            }
            if (arrayListZzj.isEmpty()) {
                z5 = true;
                ArrayList<String> arrayList2 = new ArrayList<>(listZzk.size() - 1);
                ArrayList<String> arrayList3 = new ArrayList<>(listZzk.size() - 1);
                ArrayList<String> arrayList4 = new ArrayList<>();
                ArrayList<String> arrayList5 = new ArrayList<>();
                ArrayList<String> arrayList6 = new ArrayList<>();
                ArrayList<Integer> arrayList7 = new ArrayList<>();
                for (int i6 = 0; i6 < listZzk.size(); i6++) {
                    BillingFlowParams.ProductDetailsParams productDetailsParams3 = (BillingFlowParams.ProductDetailsParams) listZzk.get(i6);
                    ProductDetails productDetailsZza = productDetailsParams3.zza();
                    if (!productDetailsZza.zzb().isEmpty()) {
                        arrayList4.add(productDetailsZza.zzb());
                    }
                    String strZzb2 = productDetailsParams3.zzb();
                    arrayList5.add(strZzb2);
                    String strZzc = productDetailsZza.zzc(strZzb2);
                    if (!TextUtils.isEmpty(strZzc)) {
                        arrayList6.add(strZzc);
                    }
                    if (i6 > 0) {
                        arrayList2.add(((BillingFlowParams.ProductDetailsParams) listZzk.get(i6)).zza().getProductId());
                        arrayList3.add(((BillingFlowParams.ProductDetailsParams) listZzk.get(i6)).zza().getProductType());
                    }
                }
                bundle.putStringArrayList("SKU_OFFER_ID_TOKEN_LIST", arrayList5);
                if (!arrayList7.isEmpty()) {
                    bundle.putIntegerArrayList("autoPayBalanceThresholdList", arrayList7);
                }
                if (!arrayList4.isEmpty()) {
                    bundle.putStringArrayList("skuDetailsTokens", arrayList4);
                }
                if (!arrayList6.isEmpty()) {
                    bundle.putStringArrayList("SKU_SERIALIZED_DOCID_LIST", arrayList6);
                }
                if (!arrayList2.isEmpty()) {
                    bundle.putStringArrayList("additionalSkus", arrayList2);
                    bundle.putStringArrayList("additionalSkuTypes", arrayList3);
                }
            } else {
                ArrayList<String> arrayList8 = new ArrayList<>();
                new ArrayList();
                new ArrayList();
                new ArrayList();
                new ArrayList();
                Iterator it5 = arrayListZzj.iterator();
                if (it5.hasNext()) {
                    throw null;
                }
                if (!arrayList8.isEmpty()) {
                    bundle.putStringArrayList("skuDetailsTokens", arrayList8);
                }
                z5 = true;
                if (arrayListZzj.size() > 1) {
                    ArrayList<String> arrayList9 = new ArrayList<>(arrayListZzj.size() - 1);
                    ArrayList<String> arrayList10 = new ArrayList<>(arrayListZzj.size() - 1);
                    if (arrayListZzj.size() > 1) {
                        throw null;
                    }
                    bundle.putStringArrayList("additionalSkus", arrayList9);
                    bundle.putStringArrayList("additionalSkuTypes", arrayList10);
                }
            }
            if (bundle.containsKey("SKU_OFFER_ID_TOKEN_LIST") && !this.r) {
                cbg cbgVar10 = cbg.OFFER_ID_TOKEN_NOT_SUPPORTED;
                BillingResult billingResult9 = n.q;
                Q(cbgVar10, billingResult9, j, z9);
                S(billingResult9);
                return billingResult9;
            }
            if (TextUtils.isEmpty(productDetailsParams.zza().zza())) {
                z5 = false;
            } else {
                bundle.putString("skuPackageName", productDetailsParams.zza().zza());
            }
            if (!TextUtils.isEmpty(null)) {
                bundle.putString("accountName", null);
            }
            Intent intent = activity.getIntent();
            if (intent == null) {
                rxf.i("BillingClient", "Activity's intent is null.");
            } else if (!TextUtils.isEmpty(intent.getStringExtra("PROXY_PACKAGE"))) {
                String stringExtra = intent.getStringExtra("PROXY_PACKAGE");
                bundle.putString("proxyPackage", stringExtra);
                try {
                    bundle.putString("proxyPackageVersion", this.g.getPackageManager().getPackageInfo(stringExtra, 0).versionName);
                } catch (PackageManager.NameNotFoundException unused) {
                    bundle.putString("proxyPackageVersion", "package not found");
                }
            }
            if (this.E) {
                i3 = 28;
            } else if (this.u && !listZzk.isEmpty()) {
                i3 = 17;
            } else if (this.s && z5) {
                i3 = 15;
            } else {
                i2 = this.p ? 9 : 6;
                final String str6 = productType;
                futureB = b(new Callable() { // from class: com.android.billingclient.api.zzah
                    @Override // java.util.concurrent.Callable
                    public final Object call() {
                        Bundle bundleC;
                        hvf hvfVar;
                        a aVar = this.zza;
                        int i7 = i2;
                        String str7 = productId;
                        String str8 = str6;
                        Bundle bundle2 = bundle;
                        aVar.getClass();
                        try {
                            synchronized (aVar.a) {
                                hvfVar = aVar.i;
                            }
                            if (hvfVar == null) {
                                return rxf.c(n.j, cbg.SERVICE_RESET_TO_NULL);
                            }
                            return ((evf) hvfVar).m(i7, aVar.g.getPackageName(), str7, str8, bundle2);
                        } catch (DeadObjectException e) {
                            BillingResult billingResult10 = n.j;
                            cbg cbgVar11 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                            String strZza = zzcy.zza(e);
                            bundleC = rxf.c(billingResult10, cbgVar11);
                            if (strZza != null) {
                                bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza);
                            }
                            return bundleC;
                        } catch (Exception e2) {
                            BillingResult billingResult11 = n.h;
                            cbg cbgVar12 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                            String strZza2 = zzcy.zza(e2);
                            bundleC = rxf.c(billingResult11, cbgVar12);
                            if (strZza2 != null) {
                                bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza2);
                            }
                            return bundleC;
                        }
                    }
                }, 5000L, null, this.e, a());
                str = str6;
                r6 = bundle;
                z2 = z9;
            }
            i2 = i3;
            final String str62 = productType;
            futureB = b(new Callable() { // from class: com.android.billingclient.api.zzah
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    Bundle bundleC;
                    hvf hvfVar;
                    a aVar = this.zza;
                    int i7 = i2;
                    String str7 = productId;
                    String str8 = str62;
                    Bundle bundle2 = bundle;
                    aVar.getClass();
                    try {
                        synchronized (aVar.a) {
                            hvfVar = aVar.i;
                        }
                        if (hvfVar == null) {
                            return rxf.c(n.j, cbg.SERVICE_RESET_TO_NULL);
                        }
                        return ((evf) hvfVar).m(i7, aVar.g.getPackageName(), str7, str8, bundle2);
                    } catch (DeadObjectException e) {
                        BillingResult billingResult10 = n.j;
                        cbg cbgVar11 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                        String strZza = zzcy.zza(e);
                        bundleC = rxf.c(billingResult10, cbgVar11);
                        if (strZza != null) {
                            bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza);
                        }
                        return bundleC;
                    } catch (Exception e2) {
                        BillingResult billingResult11 = n.h;
                        cbg cbgVar12 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                        String strZza2 = zzcy.zza(e2);
                        bundleC = rxf.c(billingResult11, cbgVar12);
                        if (strZza2 != null) {
                            bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza2);
                        }
                        return bundleC;
                    }
                }
            }, 5000L, null, this.e, a());
            str = str62;
            r6 = bundle;
            z2 = z9;
        } else {
            j = jNextLong;
            z2 = z;
            final String str7 = productType;
            futureB = b(new Callable() { // from class: com.android.billingclient.api.zzai
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    Bundle bundleC;
                    hvf hvfVar;
                    a aVar = this.zza;
                    String str8 = productId;
                    String str9 = str7;
                    aVar.getClass();
                    try {
                        synchronized (aVar.a) {
                            hvfVar = aVar.i;
                        }
                        if (hvfVar == null) {
                            return rxf.c(n.j, cbg.SERVICE_RESET_TO_NULL);
                        }
                        return ((evf) hvfVar).l(aVar.g.getPackageName(), str8, str9);
                    } catch (DeadObjectException e) {
                        BillingResult billingResult10 = n.j;
                        cbg cbgVar11 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                        String strZza = zzcy.zza(e);
                        bundleC = rxf.c(billingResult10, cbgVar11);
                        if (strZza != null) {
                            bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza);
                        }
                        return bundleC;
                    } catch (Exception e2) {
                        BillingResult billingResult11 = n.h;
                        cbg cbgVar12 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                        String strZza2 = zzcy.zza(e2);
                        bundleC = rxf.c(billingResult11, cbgVar12);
                        if (strZza2 != null) {
                            bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza2);
                        }
                        return bundleC;
                    }
                }
            }, 5000L, null, this.e, a());
            str = str7;
            r6 = z;
        }
        try {
            if (futureB == null) {
                try {
                    cbg cbgVar11 = cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC;
                    BillingResult billingResult10 = n.c;
                    Q(cbgVar11, billingResult10, j, z2);
                    S(billingResult10);
                    return billingResult10;
                } catch (CancellationException e) {
                    e = e;
                    r63 = z2;
                    r42 = j;
                    rxf.j("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                    cbg cbgVar12 = cbg.LAUNCH_BILLING_FLOW_TIMEOUT;
                    BillingResult billingResult11 = n.k;
                    R(cbgVar12, billingResult11, zzcy.zza(e), r42, r63);
                    S(billingResult11);
                    return billingResult11;
                } catch (TimeoutException e2) {
                    e = e2;
                    r63 = z2;
                    r42 = j;
                    rxf.j("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                    cbg cbgVar122 = cbg.LAUNCH_BILLING_FLOW_TIMEOUT;
                    BillingResult billingResult112 = n.k;
                    R(cbgVar122, billingResult112, zzcy.zza(e), r42, r63);
                    S(billingResult112);
                    return billingResult112;
                } catch (Exception e3) {
                    e = e3;
                    r62 = z2;
                    r4 = j;
                    rxf.j("BillingClient", "Exception while launching billing flow. Try to reconnect", e);
                    cbg cbgVar13 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                    BillingResult billingResult12 = n.j;
                    R(cbgVar13, billingResult12, zzcy.zza(e), r4, r62);
                    S(billingResult12);
                    return billingResult12;
                }
            }
            boolean z10 = z2;
            long j4 = j;
            Bundle bundle2 = (Bundle) futureB.get(5000L, TimeUnit.MILLISECONDS);
            int iA = rxf.a("BillingClient", bundle2);
            String strG = rxf.g("BillingClient", bundle2);
            if (iA == 0) {
                Intent intent2 = new Intent(activity, (Class<?>) ProxyBillingActivity.class);
                intent2.putExtra("BUY_INTENT", (PendingIntent) bundle2.getParcelable("BUY_INTENT"));
                intent2.putExtra("billingClientTransactionId", j4);
                intent2.putExtra("wasServiceAutoReconnected", z10);
                activity.startActivity(intent2);
                return n.i;
            }
            rxf.i("BillingClient", "Unable to buy item, Error response code: " + iA);
            BillingResult billingResultA = n.a(iA, strG);
            try {
                if (bundle2 == null || (obj = bundle2.get("LOG_REASON")) == null) {
                    cbgVarZzb = cbg.REASON_UNSPECIFIED;
                } else if (obj instanceof Integer) {
                    cbgVarZzb = cbg.zzb(((Integer) obj).intValue());
                } else {
                    rxf.i("BillingClient", "Unexpected type for bundle log reason: " + obj.getClass().getName());
                    cbgVarZzb = cbg.REASON_UNSPECIFIED;
                }
            } catch (Throwable th) {
                rxf.i("BillingClient", "Failed to get log reason from bundle: ".concat(String.valueOf(th.getMessage())));
                cbgVarZzb = cbg.REASON_UNSPECIFIED;
            }
            if (cbgVarZzb == cbg.REASON_UNSPECIFIED) {
                cbgVarZzb = cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
            }
            cbg cbgVar14 = cbgVarZzb;
            try {
                if (bundle2 != null) {
                    try {
                        String string = bundle2.getString("ADDITIONAL_LOG_DETAILS");
                        cbgVar = cbgVar14;
                        z3 = z10 ? 1 : 0;
                        j2 = j4;
                        str2 = string;
                    } catch (Throwable th2) {
                        rxf.i("BillingClient", "Failed to get additional log details from bundle: ".concat(String.valueOf(th2.getMessage())));
                        cbgVar = cbgVar14;
                        z3 = z10 ? 1 : 0;
                        j2 = j4;
                        str2 = null;
                    }
                    R(cbgVar, billingResultA, str2, j2, z3);
                    S(billingResultA);
                    return billingResultA;
                }
                R(cbgVar, billingResultA, str2, j2, z3);
                S(billingResultA);
                return billingResultA;
            } catch (CancellationException e4) {
                e = e4;
                r42 = j2;
                r63 = z3;
                rxf.j("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                cbg cbgVar1222 = cbg.LAUNCH_BILLING_FLOW_TIMEOUT;
                BillingResult billingResult1122 = n.k;
                R(cbgVar1222, billingResult1122, zzcy.zza(e), r42, r63);
                S(billingResult1122);
                return billingResult1122;
            } catch (TimeoutException e5) {
                e = e5;
                r42 = j2;
                r63 = z3;
                rxf.j("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                cbg cbgVar12222 = cbg.LAUNCH_BILLING_FLOW_TIMEOUT;
                BillingResult billingResult11222 = n.k;
                R(cbgVar12222, billingResult11222, zzcy.zza(e), r42, r63);
                S(billingResult11222);
                return billingResult11222;
            } catch (Exception e6) {
                e = e6;
                r4 = j2;
                r62 = z3;
                rxf.j("BillingClient", "Exception while launching billing flow. Try to reconnect", e);
                cbg cbgVar132 = cbg.LAUNCH_BILLING_FLOW_EXCEPTION;
                BillingResult billingResult122 = n.j;
                R(cbgVar132, billingResult122, zzcy.zza(e), r4, r62);
                S(billingResult122);
                return billingResult122;
            }
            cbgVar = cbgVar14;
            z3 = z10 ? 1 : 0;
            j2 = j4;
            str2 = null;
        } catch (CancellationException e7) {
            e = e7;
        } catch (TimeoutException e8) {
            e = e8;
            r42 = str;
            r63 = r6;
        } catch (Exception e9) {
            e = e9;
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void launchExternalLink(final Activity activity, final LaunchExternalLinkParams launchExternalLinkParams, final LaunchExternalLinkResponseListener launchExternalLinkResponseListener) {
        if (activity == null) {
            ay0.e("Please provide a valid activity.");
            return;
        }
        try {
            i(new Callable() { // from class: com.android.billingclient.api.zzau
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    hvf hvfVar;
                    a aVar = this.zza;
                    LaunchExternalLinkResponseListener launchExternalLinkResponseListener2 = launchExternalLinkResponseListener;
                    LaunchExternalLinkParams launchExternalLinkParams2 = launchExternalLinkParams;
                    Activity activity2 = activity;
                    try {
                        if (!aVar.I(il7.g)) {
                            aVar.x(launchExternalLinkResponseListener2, n.j, cbg.SERVICE_CONNECTION_NOT_READY, null);
                            return null;
                        }
                        if (!aVar.D) {
                            rxf.i("BillingClient", "Current client doesn't support launch external link.");
                            aVar.x(launchExternalLinkResponseListener2, n.H, cbg.LAUNCH_EXTERNAL_LINK_NOT_SUPPORTED, null);
                            return null;
                        }
                        synchronized (aVar.a) {
                            hvfVar = aVar.i;
                        }
                        if (hvfVar == null) {
                            aVar.x(launchExternalLinkResponseListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                            return null;
                        }
                        String packageName = aVar.g.getPackageName();
                        String str = aVar.d;
                        long jLongValue = aVar.L.longValue();
                        int i = rxf.a;
                        Bundle bundle = new Bundle();
                        rxf.b(bundle, str, jLongValue);
                        q8g q8gVarQ = u8g.q();
                        z9g z9gVarQ = kag.q();
                        z9gVarQ.d(launchExternalLinkParams2.getLinkUri().toString());
                        q8gVarQ.d("externalOfferUri", (kag) z9gVarQ.a());
                        z9g z9gVarQ2 = kag.q();
                        z9gVarQ2.d(String.valueOf(launchExternalLinkParams2.getLaunchMode()));
                        q8gVarQ.d("externalOfferLaunchMode", (kag) z9gVarQ2.a());
                        z9g z9gVarQ3 = kag.q();
                        z9gVarQ3.d(String.valueOf(launchExternalLinkParams2.getLinkType()));
                        q8gVarQ.d("externalOfferLinkType", (kag) z9gVarQ3.a());
                        z9g z9gVarQ4 = kag.q();
                        z9gVarQ4.d(String.valueOf(launchExternalLinkParams2.getBillingProgram()));
                        q8gVarQ.d("externalOfferBillingProgram", (kag) z9gVarQ4.a());
                        if (!TextUtils.isEmpty(null)) {
                            z9g z9gVarQ5 = kag.q();
                            z9gVarQ5.d(null);
                            q8gVarQ.d("externalTransactionToken", (kag) z9gVarQ5.a());
                        }
                        bundle.putByteArray("REQUEST_PARAMS", ((u8g) q8gVarQ.a()).b());
                        i iVar = new i(aVar, new WeakReference(activity2), launchExternalLinkResponseListener2);
                        evf evfVar = (evf) hvfVar;
                        Parcel parcelD = evfVar.d();
                        parcelD.writeInt(27);
                        parcelD.writeString(packageName);
                        int i2 = nvf.a;
                        parcelD.writeInt(1);
                        bundle.writeToParcel(parcelD, 0);
                        parcelD.writeStrongBinder(iVar);
                        evfVar.g(1901, parcelD);
                        return null;
                    } catch (RuntimeException e) {
                        aVar.x(launchExternalLinkResponseListener2, n.h, cbg.SERVICE_CALL_EXCEPTION, e);
                        return null;
                    }
                }
            }, new Runnable() { // from class: com.android.billingclient.api.zzaw
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.x(launchExternalLinkResponseListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
                }
            }, u());
        } catch (Exception e) {
            x(launchExternalLinkResponseListener, e(), cbg.SERVICE_CALL_EXCEPTION, e);
        }
    }

    public final void m(ConsumeResponseListener consumeResponseListener, String str, BillingResult billingResult, cbg cbgVar, String str2, Exception exc) {
        rxf.j("BillingClient", str2, exc);
        P(cbgVar, 4, billingResult, zzcy.zza(exc));
        consumeResponseListener.onConsumeResponse(billingResult, str);
    }

    public final void n(AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 15, billingResult, zzcy.zza(exc));
        alternativeBillingOnlyReportingDetailsListener.onAlternativeBillingOnlyTokenResponse(billingResult, null);
    }

    public final void o(BillingProgramReportingDetailsListener billingProgramReportingDetailsListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 35, billingResult, zzcy.zza(exc));
        billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResult, null);
    }

    public final void p(ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 24, billingResult, zzcy.zza(exc));
        externalOfferReportingDetailsListener.onExternalOfferReportingDetailsResponse(billingResult, null);
    }

    public final void q(ExternalOfferAvailabilityListener externalOfferAvailabilityListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 23, billingResult, zzcy.zza(exc));
        externalOfferAvailabilityListener.onExternalOfferAvailabilityResponse(billingResult);
    }

    @Override // com.android.billingclient.api.BillingClient
    public void queryProductDetailsAsync(final QueryProductDetailsParams queryProductDetailsParams, final ProductDetailsResponseListener productDetailsResponseListener) {
        if (b(new Callable() { // from class: com.android.billingclient.api.zzbh
            @Override // java.util.concurrent.Callable
            public final Object call() {
                nvg nvgVar;
                hvf hvfVar;
                a aVar = this.zza;
                ProductDetailsResponseListener productDetailsResponseListener2 = productDetailsResponseListener;
                QueryProductDetailsParams queryProductDetailsParams2 = queryProductDetailsParams;
                Exception exc = null;
                if (!aVar.I(il7.g)) {
                    cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
                    BillingResult billingResult = n.j;
                    aVar.N(7, billingResult, cbgVar);
                    exf exfVar = uxf.b;
                    lyf lyfVar = lyf.e;
                    productDetailsResponseListener2.onProductDetailsResponse(billingResult, new QueryProductDetailsResult(lyfVar, lyfVar));
                    return null;
                }
                if (!aVar.u) {
                    rxf.i("BillingClient", "Querying product details is not supported.");
                    cbg cbgVar2 = cbg.PRODUCT_DETAILS_NOT_SUPPORTED;
                    BillingResult billingResult2 = n.s;
                    aVar.N(7, billingResult2, cbgVar2);
                    exf exfVar2 = uxf.b;
                    lyf lyfVar2 = lyf.e;
                    productDetailsResponseListener2.onProductDetailsResponse(billingResult2, new QueryProductDetailsResult(lyfVar2, lyfVar2));
                    return null;
                }
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                String strZzb = queryProductDetailsParams2.zzb();
                uxf uxfVarZza = queryProductDetailsParams2.zza();
                int size = uxfVarZza.size();
                int i = 0;
                while (true) {
                    if (i >= size) {
                        nvgVar = new nvg(0, "", arrayList, arrayList2);
                        break;
                    }
                    int i2 = i + 20;
                    ArrayList<QueryProductDetailsParams.Product> arrayList3 = new ArrayList(uxfVarZza.subList(i, i2 > size ? size : i2));
                    ArrayList<String> arrayList4 = new ArrayList<>();
                    int size2 = arrayList3.size();
                    for (int i3 = 0; i3 < size2; i3++) {
                        arrayList4.add(((QueryProductDetailsParams.Product) arrayList3.get(i3)).zza());
                    }
                    Bundle bundle = new Bundle();
                    bundle.putStringArrayList("ITEM_ID_LIST", arrayList4);
                    bundle.putString("playBillingLibraryVersion", aVar.c);
                    try {
                        synchronized (aVar.a) {
                            hvfVar = aVar.i;
                        }
                        if (hvfVar == null) {
                            nvgVar = aVar.c(n.j, cbg.SERVICE_RESET_TO_NULL, "Service has been reset to null.", exc);
                            break;
                        }
                        boolean z = aVar.w && aVar.F.isEnabledForPrepaidPlans();
                        aVar.g();
                        aVar.g();
                        aVar.g();
                        aVar.g();
                        xy5 xy5Var = new xy5(z);
                        Bundle bundleP = ((evf) hvfVar).p(true != aVar.x ? 17 : 20, aVar.g.getPackageName(), strZzb, bundle, rxf.d(aVar.d, arrayList3, xy5Var, aVar.L.longValue()));
                        if (bundleP == null) {
                            nvgVar = aVar.c(n.B, cbg.NULL_BUNDLE_FROM_GET_SKU_DETAILS_SERVICE_CALL, "queryProductDetailsAsync got empty product details response.", null);
                            break;
                        }
                        if (bundleP.containsKey("DETAILS_LIST")) {
                            ArrayList<String> stringArrayList = bundleP.getStringArrayList("DETAILS_LIST");
                            if (stringArrayList == null) {
                                nvgVar = aVar.c(n.B, cbg.NULL_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE, "queryProductDetailsAsync got null response list", null);
                                break;
                            }
                            ArrayList arrayList5 = new ArrayList();
                            int size3 = stringArrayList.size();
                            int i4 = 0;
                            while (i4 < size3) {
                                try {
                                    ProductDetails productDetails = new ProductDetails(stringArrayList.get(i4));
                                    rxf.h("BillingClient", "Got product details: ".concat(productDetails.toString()));
                                    arrayList5.add(productDetails);
                                    i4++;
                                    uxfVarZza = uxfVarZza;
                                } catch (JSONException e) {
                                    nvgVar = aVar.c(n.a(6, "Error trying to decode SkuDetails."), cbg.ERROR_DECODING_SKU_DETAILS, "Got a JSON exception trying to decode ProductDetails. \n Exception: ", e);
                                }
                            }
                            uxf uxfVar = uxfVarZza;
                            ArrayList<String> stringArrayList2 = bundleP.getStringArrayList("UNFETCHED_PRODUCT_LIST");
                            new ArrayList();
                            try {
                                ArrayList arrayList6 = new ArrayList();
                                if (stringArrayList2 == null) {
                                    for (QueryProductDetailsParams.Product product : arrayList3) {
                                        Iterator it2 = arrayList5.iterator();
                                        while (true) {
                                            if (!it2.hasNext()) {
                                                arrayList6.add(new UnfetchedProduct(new JSONObject().put("productId", product.zza()).put("type", product.zzb()).put("statusCode", 0).toString()));
                                                break;
                                            }
                                            ProductDetails productDetails2 = (ProductDetails) it2.next();
                                            if (!product.zza().equals(productDetails2.getProductId()) || !product.zzb().equals(productDetails2.getProductType())) {
                                            }
                                        }
                                    }
                                } else {
                                    Iterator<String> it3 = stringArrayList2.iterator();
                                    while (it3.hasNext()) {
                                        UnfetchedProduct unfetchedProduct = new UnfetchedProduct(it3.next());
                                        rxf.h("BillingClient", "Got unfetchedProduct: ".concat(unfetchedProduct.toString()));
                                        arrayList6.add(unfetchedProduct);
                                    }
                                }
                                arrayList.addAll(arrayList5);
                                arrayList2.addAll(arrayList6);
                                i = i2;
                                uxfVarZza = uxfVar;
                                exc = null;
                            } catch (JSONException e2) {
                                nvgVar = aVar.c(n.a(6, "Error trying to decode SkuDetails."), cbg.ERROR_DECODING_SKU_DETAILS, "Got a JSON exception trying to decode UnfetchedProduct. \n Exception: ", e2);
                            }
                        } else {
                            int iA = rxf.a("BillingClient", bundleP);
                            String strG = rxf.g("BillingClient", bundleP);
                            nvgVar = iA != 0 ? aVar.c(n.a(iA, strG), cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY, b09.w(iA, "getSkuDetails() failed for queryProductDetailsAsync. Response code: "), null) : aVar.c(n.a(6, strG), cbg.MISSING_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE, "getSkuDetails() returned a bundle with neither an error nor a product detail list for queryProductDetailsAsync.", null);
                        }
                    } catch (DeadObjectException e3) {
                        nvgVar = aVar.c(n.j, cbg.GET_SKU_DETAILS_SERVICE_CALL_EXCEPTION, "queryProductDetailsAsync got a remote exception (try to reconnect).", e3);
                    } catch (Exception e4) {
                        nvgVar = aVar.c(n.h, cbg.GET_SKU_DETAILS_SERVICE_CALL_EXCEPTION, "queryProductDetailsAsync got a remote exception (try to reconnect).", e4);
                    }
                }
                productDetailsResponseListener2.onProductDetailsResponse(n.a(nvgVar.a, (String) nvgVar.d), new QueryProductDetailsResult((ArrayList) nvgVar.b, (ArrayList) nvgVar.c));
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbi
            @Override // java.lang.Runnable
            public final void run() {
                a aVar = this.zza;
                ProductDetailsResponseListener productDetailsResponseListener2 = productDetailsResponseListener;
                cbg cbgVar = cbg.EXECUTE_ASYNC_TIMEOUT;
                BillingResult billingResult = n.k;
                aVar.N(7, billingResult, cbgVar);
                exf exfVar = uxf.b;
                lyf lyfVar = lyf.e;
                productDetailsResponseListener2.onProductDetailsResponse(billingResult, new QueryProductDetailsResult(lyfVar, lyfVar));
            }
        }, u(), a()) == null) {
            BillingResult billingResultE = e();
            N(7, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
            exf exfVar = uxf.b;
            lyf lyfVar = lyf.e;
            productDetailsResponseListener.onProductDetailsResponse(billingResultE, new QueryProductDetailsResult(lyfVar, lyfVar));
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void queryPurchasesAsync(QueryPurchasesParams queryPurchasesParams, final PurchasesResponseListener purchasesResponseListener) {
        if (b(new owf(this, purchasesResponseListener, queryPurchasesParams.zza(), queryPurchasesParams.getIncludeSuspendedSubscriptions()), 30000L, new Runnable() { // from class: com.android.billingclient.api.zzae
            @Override // java.lang.Runnable
            public final void run() {
                a aVar = this.zza;
                PurchasesResponseListener purchasesResponseListener2 = purchasesResponseListener;
                cbg cbgVar = cbg.EXECUTE_ASYNC_TIMEOUT;
                BillingResult billingResult = n.k;
                aVar.N(9, billingResult, cbgVar);
                exf exfVar = uxf.b;
                purchasesResponseListener2.onQueryPurchasesResponse(billingResult, lyf.e);
            }
        }, u(), a()) == null) {
            BillingResult billingResultE = e();
            N(9, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
            exf exfVar = uxf.b;
            purchasesResponseListener.onQueryPurchasesResponse(billingResultE, lyf.e);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult showAlternativeBillingOnlyInformationDialog(final Activity activity, final AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener) {
        if (activity == null) {
            ay0.e("Please provide a valid activity.");
            return null;
        }
        if (!H(il7.f)) {
            cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
            BillingResult billingResult = n.j;
            N(16, billingResult, cbgVar);
            return billingResult;
        }
        if (!this.y) {
            rxf.i("BillingClient", "Current Play Store version doesn't support alternative billing only.");
            cbg cbgVar2 = cbg.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED;
            BillingResult billingResult2 = n.D;
            N(16, billingResult2, cbgVar2);
            return billingResult2;
        }
        Handler handler = this.e;
        final b bVar = new b(this, handler, alternativeBillingOnlyInformationDialogListener);
        if (b(new Callable() { // from class: com.android.billingclient.api.zzaj
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener2 = alternativeBillingOnlyInformationDialogListener;
                Activity activity2 = activity;
                ResultReceiver resultReceiver = bVar;
                aVar.getClass();
                try {
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.y(alternativeBillingOnlyInformationDialogListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    evf evfVar = (evf) hvfVar;
                    evfVar.t(aVar.g.getPackageName(), rxf.e(aVar.L.longValue(), aVar.d), new f(new WeakReference(activity2), resultReceiver));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.y(alternativeBillingOnlyInformationDialogListener2, n.j, cbg.SHOW_ALTERNATIVE_BILLING_ONLY_DIALOG_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.y(alternativeBillingOnlyInformationDialogListener2, n.h, cbg.SHOW_ALTERNATIVE_BILLING_ONLY_DIALOG_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzak
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.y(alternativeBillingOnlyInformationDialogListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, handler, a()) != null) {
            return n.i;
        }
        BillingResult billingResultE = e();
        N(16, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
        return billingResultE;
    }

    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult showExternalOfferInformationDialog(final Activity activity, final ExternalOfferInformationDialogListener externalOfferInformationDialogListener) {
        if (activity == null) {
            ay0.e("Please provide a valid activity.");
            return null;
        }
        if (!H(il7.f)) {
            cbg cbgVar = cbg.SERVICE_CONNECTION_NOT_READY;
            BillingResult billingResult = n.j;
            N(25, billingResult, cbgVar);
            return billingResult;
        }
        if (!this.z) {
            rxf.i("BillingClient", "Current Play Store version doesn't support external offer.");
            cbg cbgVar2 = cbg.EXTERNAL_OFFER_NOT_SUPPORTED;
            BillingResult billingResult2 = n.u;
            N(25, billingResult2, cbgVar2);
            return billingResult2;
        }
        Handler handler = this.e;
        final c cVar = new c(this, handler, externalOfferInformationDialogListener);
        if (b(new Callable() { // from class: com.android.billingclient.api.zzbf
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                ExternalOfferInformationDialogListener externalOfferInformationDialogListener2 = externalOfferInformationDialogListener;
                Activity activity2 = activity;
                ResultReceiver resultReceiver = cVar;
                aVar.getClass();
                try {
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.v(externalOfferInformationDialogListener2, n.j, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    String packageName = aVar.g.getPackageName();
                    Bundle bundleE = rxf.e(aVar.L.longValue(), aVar.d);
                    h hVar = new h(new WeakReference(activity2), resultReceiver);
                    evf evfVar = (evf) hvfVar;
                    Parcel parcelD = evfVar.d();
                    parcelD.writeInt(22);
                    parcelD.writeString(packageName);
                    int i = nvf.a;
                    parcelD.writeInt(1);
                    bundleE.writeToParcel(parcelD, 0);
                    parcelD.writeStrongBinder(hVar);
                    evfVar.g(1901, parcelD);
                    return null;
                } catch (DeadObjectException e) {
                    aVar.v(externalOfferInformationDialogListener2, n.j, cbg.SHOW_EXTERNAL_PAYMENT_DIALOG_SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.v(externalOfferInformationDialogListener2, n.h, cbg.SHOW_EXTERNAL_PAYMENT_DIALOG_SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbg
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.v(externalOfferInformationDialogListener, n.k, cbg.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, handler, a()) != null) {
            return n.i;
        }
        BillingResult billingResultE = e();
        N(25, billingResultE, cbg.MISSING_RESULT_FROM_EXECUTE_ASYNC);
        return billingResultE;
    }

    @Override // com.android.billingclient.api.BillingClient
    public void startConnection(BillingClientStateListener billingClientStateListener) {
        F(billingClientStateListener, 0);
    }

    public final Handler u() {
        return Looper.myLooper() == null ? this.e : new Handler(Looper.myLooper());
    }

    public final void v(ExternalOfferInformationDialogListener externalOfferInformationDialogListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 25, billingResult, zzcy.zza(exc));
        externalOfferInformationDialogListener.onExternalOfferInformationDialogResponse(billingResult);
    }

    public final void w(BillingConfigResponseListener billingConfigResponseListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        rxf.j("BillingClient", "getBillingConfig got an exception.", exc);
        P(cbgVar, 13, billingResult, zzcy.zza(exc));
        billingConfigResponseListener.onBillingConfigResponse(billingResult, null);
    }

    public final void x(LaunchExternalLinkResponseListener launchExternalLinkResponseListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 37, billingResult, zzcy.zza(exc));
        launchExternalLinkResponseListener.onLaunchExternalLinkResponse(billingResult);
    }

    public final void y(AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener, BillingResult billingResult, cbg cbgVar, Exception exc) {
        P(cbgVar, 16, billingResult, zzcy.zza(exc));
        alternativeBillingOnlyInformationDialogListener.onAlternativeBillingOnlyInformationDialogResponse(billingResult);
    }

    public final void z(int i, cbg cbgVar, Exception exc) {
        uag uagVar;
        rxf.j("BillingClient", "showInAppMessages error.", exc);
        String strZza = zzcy.zza(exc);
        try {
            zag zagVarR = fbg.r();
            zagVarR.e(i);
            if (cbgVar != null) {
                zagVarR.d(cbgVar);
            }
            if (strZza != null) {
                zagVarR.b();
                fbg.s((fbg) zagVarR.b, strZza);
            }
            sag sagVarT = uag.t();
            sagVarT.d(zagVarR);
            sagVarT.g(30);
            uagVar = (uag) sagVarT.a();
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to create logging payload", th);
            uagVar = null;
        }
        this.h.e(uagVar);
    }

    public static final void K(sbg sbgVar, Context context) {
        try {
            ActivityManager activityManager = (ActivityManager) context.getSystemService(PqkdNGCEoxOKZk.MiRbPdv);
            if (activityManager != null) {
                ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
                activityManager.getMemoryInfo(memoryInfo);
                int i = (int) (memoryInfo.totalMem / 1048576);
                sbgVar.b();
                zbg.w((zbg) sbgVar.b, i);
                String str = Build.BRAND;
                sbgVar.b();
                zbg.s((zbg) sbgVar.b);
                String str2 = Build.MODEL;
                sbgVar.b();
                zbg.v((zbg) sbgVar.b);
                String str3 = Build.MANUFACTURER;
                sbgVar.b();
                zbg.u((zbg) sbgVar.b);
                String str4 = Build.FINGERPRINT;
                sbgVar.b();
                zbg.t((zbg) sbgVar.b);
            }
        } catch (RuntimeException e) {
            rxf.j("BillingClient", "Runtime error while populating device info.", e);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public void endConnection() {
        try {
            int i = zzcy.zza;
            B(zzcy.zzc(12, lbg.BROADCAST_ACTION_UNSPECIFIED));
        } catch (Throwable th) {
            rxf.j("BillingClient", "Unable to log.", th);
        }
        synchronized (this.a) {
            try {
            } finally {
            }
            if (this.f != null) {
                tlf tlfVar = this.f;
                dlf dlfVar = tlfVar.f;
                Context context = tlfVar.a;
                dlfVar.c(context);
                tlfVar.g.c(context);
                try {
                    rxf.h("BillingClient", "Unbinding from service.");
                    G();
                } catch (Throwable th2) {
                    rxf.j("BillingClient", PqkdNGCEoxOKZk.PjdgugA, th2);
                }
                try {
                    E();
                } finally {
                    try {
                    } finally {
                    }
                }
            } else {
                rxf.h("BillingClient", "Unbinding from service.");
                G();
                E();
            }
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult showInAppMessages(final Activity activity, InAppMessageParams inAppMessageParams, InAppMessageResponseListener inAppMessageResponseListener) {
        if (!H(il7.f)) {
            rxf.i("BillingClient", "Service disconnected.");
            return n.j;
        }
        if (!this.q) {
            rxf.i("BillingClient", "Current client doesn't support showing in-app messages.");
            return n.t;
        }
        View viewFindViewById = activity.findViewById(R.id.content);
        IBinder windowToken = viewFindViewById.getWindowToken();
        if (windowToken == null) {
            rxf.i("BillingClient", "Could not retrieve the window token from the activity instance.");
        }
        Rect rect = new Rect();
        viewFindViewById.getGlobalVisibleRect(rect);
        final Bundle bundle = new Bundle();
        bundle.putBinder("KEY_WINDOW_TOKEN", windowToken);
        bundle.putInt("KEY_DIMEN_LEFT", rect.left);
        bundle.putInt("KEY_DIMEN_TOP", rect.top);
        bundle.putInt(ezwlgQm.VPMwMzNMx, rect.right);
        bundle.putInt("KEY_DIMEN_BOTTOM", rect.bottom);
        bundle.putString("playBillingLibraryVersion", this.c);
        String str = this.d;
        if (str != null) {
            bundle.putString("playBillingLibraryWrapperVersion", str);
        }
        bundle.putIntegerArrayList("KEY_CATEGORY_IDS", inAppMessageParams.zza());
        Handler handler = this.e;
        final rwf rwfVar = new rwf(this, handler, inAppMessageResponseListener);
        b(new Callable() { // from class: com.android.billingclient.api.zzbj
            @Override // java.util.concurrent.Callable
            public final Object call() {
                hvf hvfVar;
                a aVar = this.zza;
                Bundle bundle2 = bundle;
                Activity activity2 = activity;
                ResultReceiver resultReceiver = rwfVar;
                aVar.getClass();
                try {
                    synchronized (aVar.a) {
                        hvfVar = aVar.i;
                    }
                    if (hvfVar == null) {
                        aVar.z(-1, cbg.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    ((evf) hvfVar).x(aVar.g.getPackageName(), bundle2, new k(new WeakReference(activity2), resultReceiver));
                    return null;
                } catch (DeadObjectException e) {
                    aVar.z(-1, cbg.SERVICE_CALL_EXCEPTION, e);
                    return null;
                } catch (Exception e2) {
                    aVar.z(6, cbg.SERVICE_CALL_EXCEPTION, e2);
                    return null;
                }
            }
        }, 5000L, null, handler, a());
        return n.i;
    }

    public a(PendingPurchasesParams pendingPurchasesParams, Context context, BillingClient.Builder builder) {
        int i = gyf.c;
        this.I = zyf.j;
        long jNextLong = new Random().nextLong();
        this.L = Long.valueOf(jNextLong);
        this.M = ewf.a;
        this.c = "9.0.0";
        String strH = h();
        this.d = strH;
        this.g = context.getApplicationContext();
        sbg sbgVarA = zbg.A();
        sbgVarA.j();
        if (strH != null) {
            sbgVarA.b();
            zbg.z((zbg) sbgVarA.b, strH);
        }
        sbgVarA.i(this.g.getPackageName());
        sbgVarA.b();
        zbg.E((zbg) sbgVarA.b, jNextLong);
        boolean z = builder.zza;
        sbgVarA.b();
        zbg.x((zbg) sbgVarA.b, z);
        sbgVarA.d(Build.VERSION.SDK_INT);
        sbgVarA.h();
        K(sbgVarA, context);
        try {
            sbgVarA.e(this.g.getPackageManager().getPackageInfo(this.g.getPackageName(), 0).versionCode);
        } catch (Throwable th) {
            rxf.j("BillingClient", "Error getting app version code.", th);
        }
        this.h = new zjf(this.g, (zbg) sbgVarA.a());
        rxf.i("BillingClient", "Billing client should have a valid listener but the provided is null.");
        this.f = new tlf(this.g, null, null, null, this.h);
        this.F = pendingPurchasesParams;
        this.g.getPackageName();
        this.G = builder.zza;
    }

    public a(PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, BillingClient.Builder builder) {
        int i = gyf.c;
        this.I = zyf.j;
        long jNextLong = new Random().nextLong();
        this.L = Long.valueOf(jNextLong);
        this.M = ewf.a;
        this.c = "9.0.0";
        String strH = h();
        this.d = strH;
        this.g = context.getApplicationContext();
        sbg sbgVarA = zbg.A();
        sbgVarA.j();
        if (strH != null) {
            sbgVarA.b();
            zbg.z((zbg) sbgVarA.b, strH);
        }
        sbgVarA.i(this.g.getPackageName());
        sbgVarA.b();
        zbg.E((zbg) sbgVarA.b, jNextLong);
        boolean z = builder.zza;
        sbgVarA.b();
        zbg.x((zbg) sbgVarA.b, z);
        sbgVarA.d(Build.VERSION.SDK_INT);
        sbgVarA.h();
        K(sbgVarA, context);
        try {
            sbgVarA.e(this.g.getPackageManager().getPackageInfo(this.g.getPackageName(), 0).versionCode);
        } catch (Throwable th) {
            rxf.j("BillingClient", "Error getting app version code.", th);
        }
        this.h = new zjf(this.g, (zbg) sbgVarA.a());
        if (purchasesUpdatedListener == null) {
            rxf.i("BillingClient", "Billing client should have a valid listener but the provided is null.");
        }
        this.f = new tlf(this.g, purchasesUpdatedListener, null, null, this.h);
        this.F = pendingPurchasesParams;
        this.H = false;
        this.g.getPackageName();
        this.G = builder.zza;
    }

    public a(Context context, BillingClient.Builder builder) {
        int i = gyf.c;
        this.I = zyf.j;
        long jNextLong = new Random().nextLong();
        this.L = Long.valueOf(jNextLong);
        this.M = ewf.a;
        this.c = "9.0.0";
        String strH = h();
        this.d = strH;
        this.g = context.getApplicationContext();
        sbg sbgVarA = zbg.A();
        sbgVarA.j();
        if (strH != null) {
            sbgVarA.b();
            zbg.z((zbg) sbgVarA.b, strH);
        }
        sbgVarA.i(this.g.getPackageName());
        sbgVarA.b();
        zbg.E((zbg) sbgVarA.b, jNextLong);
        boolean z = builder.zza;
        sbgVarA.b();
        zbg.x((zbg) sbgVarA.b, z);
        sbgVarA.d(Build.VERSION.SDK_INT);
        sbgVarA.h();
        K(sbgVarA, context);
        try {
            sbgVarA.e(this.g.getPackageManager().getPackageInfo(this.g.getPackageName(), 0).versionCode);
        } catch (Throwable th) {
            rxf.j("BillingClient", "Error getting app version code.", th);
        }
        this.h = new zjf(this.g, (zbg) sbgVarA.a());
        this.g.getPackageName();
        this.G = builder.zza;
    }
}
