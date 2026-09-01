package com.android.billingclient.api;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Parcel;
import com.android.billingclient.api.BillingClient;
import defpackage.cbg;
import defpackage.h1g;
import defpackage.j0g;
import defpackage.jn;
import defpackage.jzf;
import defpackage.lbg;
import defpackage.nvf;
import defpackage.ohg;
import defpackage.opg;
import defpackage.p0g;
import defpackage.pjg;
import defpackage.qk7;
import defpackage.rvf;
import defpackage.rxf;
import defpackage.t72;
import defpackage.uag;
import defpackage.v0g;
import defpackage.x0g;
import defpackage.xag;
import defpackage.zbg;
import defpackage.zjf;
import defpackage.zvf;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m extends a {
    public final Context N;
    public volatile int O;
    public volatile zvf P;
    public volatile l Q;
    public volatile ScheduledExecutorService R;

    public m(Context context, BillingClient.Builder builder) {
        super(context, builder);
        this.O = 0;
        this.N = context;
    }

    public final synchronized boolean U() {
        if (this.O == 2 && this.P != null) {
            if (this.Q != null) {
                return true;
            }
        }
        return false;
    }

    public final x0g V(final int i) {
        if (U()) {
            return qk7.C(new pjg() { // from class: com.android.billingclient.api.zzcn
                @Override // defpackage.pjg
                public final Object zza(ohg ohgVar) {
                    m mVar = this.zza;
                    int i2 = i;
                    try {
                        if (mVar.P == null) {
                            throw null;
                        }
                        zvf zvfVar = mVar.P;
                        String packageName = mVar.N.getPackageName();
                        String str = i2 != 2 ? i2 != 3 ? i2 != 4 ? i2 != 5 ? i2 != 6 ? "QUERY_PRODUCT_DETAILS_ASYNC" : "START_CONNECTION" : "IS_FEATURE_SUPPORTED" : "CONSUME_ASYNC" : "ACKNOWLEDGE_PURCHASE" : "LAUNCH_BILLING_FLOW";
                        jzf jzfVar = new jzf(ohgVar);
                        rvf rvfVar = (rvf) zvfVar;
                        Parcel parcelD = rvfVar.d();
                        parcelD.writeString(packageName);
                        parcelD.writeString(str);
                        int i3 = nvf.a;
                        parcelD.writeStrongBinder(jzfVar);
                        rvfVar.g(1, parcelD);
                        return "billingOverrideService.getBillingOverride";
                    } catch (Exception e) {
                        mVar.W(28, n.F, cbg.BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION);
                        rxf.j("BillingClientTesting", "An error occurred while retrieving billing override.", e);
                        ohgVar.a(0);
                        return "billingOverrideService.getBillingOverride";
                    }
                }
            });
        }
        rxf.i("BillingClientTesting", "Billing Override Service is not ready.");
        W(28, n.a(-1, "Billing Override Service connection is disconnected."), cbg.BILLING_OVERRIDE_SERVICE_CONNECTION_NOT_READY);
        return new v0g(0);
    }

    public final void W(int i, BillingResult billingResult, cbg cbgVar) {
        int i2 = zzcy.zza;
        uag uagVarZzb = zzcy.zzb(cbgVar, i, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED);
        Objects.requireNonNull(uagVarZzb, "ApiFailure should not be null");
        this.h.e(uagVarZzb);
    }

    public final void X(int i) {
        int i2 = zzcy.zza;
        xag xagVarZzc = zzcy.zzc(i, lbg.BROADCAST_ACTION_UNSPECIFIED);
        Objects.requireNonNull(xagVarZzc, "ApiSuccess should not be null");
        zjf zjfVar = this.h;
        zjfVar.getClass();
        try {
            zjfVar.z(xagVarZzc, (zbg) zjfVar.b);
        } catch (Throwable th) {
            rxf.j("BillingLogger", "Unable to log.", th);
        }
    }

    public final void Y(int i, t72 t72Var, Runnable runnable) {
        ScheduledExecutorService scheduledExecutorService;
        x0g x0gVarV = V(i);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        synchronized (this) {
            try {
                if (this.R == null) {
                    this.R = Executors.newSingleThreadScheduledExecutor();
                }
                scheduledExecutorService = this.R;
            } catch (Throwable th) {
                throw th;
            }
        }
        if (!x0gVarV.isDone()) {
            h1g h1gVar = new h1g();
            h1gVar.h = x0gVarV;
            jn jnVar = new jn();
            jnVar.b = h1gVar;
            h1gVar.i = scheduledExecutorService.schedule(jnVar, 28500L, timeUnit);
            x0gVarV.b(jnVar, j0g.zza);
            x0gVarV = h1gVar;
        }
        opg opgVar = new opg();
        opgVar.a = i;
        opgVar.b = t72Var;
        opgVar.c = runnable;
        opgVar.d = this;
        x0gVarV.b(new p0g(x0gVarV, 0, opgVar), a());
    }

    @Override // com.android.billingclient.api.a, com.android.billingclient.api.BillingClient
    public final void acknowledgePurchase(final AcknowledgePurchaseParams acknowledgePurchaseParams, final AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) {
        Objects.requireNonNull(acknowledgePurchaseResponseListener);
        Y(3, new t72() { // from class: com.android.billingclient.api.zzco
            @Override // defpackage.t72
            public final void accept(Object obj) {
                acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse((BillingResult) obj);
            }
        }, new Runnable() { // from class: com.android.billingclient.api.zzcp
            @Override // java.lang.Runnable
            public final void run() {
                super/*com.android.billingclient.api.a*/.acknowledgePurchase(acknowledgePurchaseParams, acknowledgePurchaseResponseListener);
            }
        });
    }

    @Override // com.android.billingclient.api.a, com.android.billingclient.api.BillingClient
    public final void consumeAsync(final ConsumeParams consumeParams, final ConsumeResponseListener consumeResponseListener) {
        Y(4, new t72() { // from class: com.android.billingclient.api.zzcl
            @Override // defpackage.t72
            public final void accept(Object obj) {
                consumeResponseListener.onConsumeResponse((BillingResult) obj, consumeParams.getPurchaseToken());
            }
        }, new Runnable() { // from class: com.android.billingclient.api.zzcm
            @Override // java.lang.Runnable
            public final void run() {
                super/*com.android.billingclient.api.a*/.consumeAsync(consumeParams, consumeResponseListener);
            }
        });
    }

    @Override // com.android.billingclient.api.a, com.android.billingclient.api.BillingClient
    public final void endConnection() {
        synchronized (this) {
            X(27);
            try {
                try {
                    if (this.Q != null && this.P != null) {
                        rxf.h("BillingClientTesting", "Unbinding from Billing Override Service.");
                        this.N.unbindService(this.Q);
                        this.Q = new l(this);
                    }
                    this.P = null;
                    if (this.R != null) {
                        this.R.shutdownNow();
                        this.R = null;
                    }
                } catch (RuntimeException e) {
                    rxf.j("BillingClientTesting", "There was an exception while ending Billing Override Service connection!", e);
                }
                this.O = 3;
            } catch (Throwable th) {
                this.O = 3;
                throw th;
            }
        }
        super.endConnection();
    }

    @Override // com.android.billingclient.api.a, com.android.billingclient.api.BillingClient
    public final BillingResult launchBillingFlow(final Activity activity, final BillingFlowParams billingFlowParams) {
        t72 t72Var = new t72() { // from class: com.android.billingclient.api.zzcq
            @Override // defpackage.t72
            public final void accept(Object obj) {
                this.zza.S((BillingResult) obj);
            }
        };
        Callable callable = new Callable() { // from class: com.android.billingclient.api.zzcr
            @Override // java.util.concurrent.Callable
            public final Object call() {
                return super/*com.android.billingclient.api.a*/.launchBillingFlow(activity, billingFlowParams);
            }
        };
        int iIntValue = 0;
        try {
            iIntValue = ((Integer) V(2).get(28500L, TimeUnit.MILLISECONDS)).intValue();
        } catch (TimeoutException e) {
            W(28, n.F, cbg.BILLING_OVERRIDE_SERVICE_CALL_TIMEOUT);
            rxf.j("BillingClientTesting", "Asynchronous call to Billing Override Service timed out.", e);
        } catch (Exception e2) {
            if (e2 instanceof InterruptedException) {
                Thread.currentThread().interrupt();
            }
            W(28, n.F, cbg.BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION);
            rxf.j("BillingClientTesting", "An error occurred while retrieving billing override.", e2);
        }
        if (iIntValue > 0) {
            BillingResult billingResultA = n.a(iIntValue, "Billing override value was set by a license tester.");
            W(2, billingResultA, cbg.LICENSE_TESTER_BILLING_OVERRIDE);
            t72Var.accept(billingResultA);
            return billingResultA;
        }
        try {
            return (BillingResult) callable.call();
        } catch (Exception e3) {
            cbg cbgVar = cbg.BILLING_OVERRIDE_SERVICE_FALLBACK_ERROR;
            BillingResult billingResult = n.h;
            W(2, billingResult, cbgVar);
            rxf.j("BillingClientTesting", "An internal error occurred.", e3);
            return billingResult;
        }
    }

    @Override // com.android.billingclient.api.a, com.android.billingclient.api.BillingClient
    public final void queryProductDetailsAsync(final QueryProductDetailsParams queryProductDetailsParams, final ProductDetailsResponseListener productDetailsResponseListener) {
        Y(7, new t72() { // from class: com.android.billingclient.api.zzcj
            @Override // defpackage.t72
            public final void accept(Object obj) {
                QueryProductDetailsResult queryProductDetailsResult = new QueryProductDetailsResult(new ArrayList(), new ArrayList());
                productDetailsResponseListener.onProductDetailsResponse((BillingResult) obj, queryProductDetailsResult);
            }
        }, new Runnable() { // from class: com.android.billingclient.api.zzck
            @Override // java.lang.Runnable
            public final void run() {
                super/*com.android.billingclient.api.a*/.queryProductDetailsAsync(queryProductDetailsParams, productDetailsResponseListener);
            }
        });
    }

    @Override // com.android.billingclient.api.a, com.android.billingclient.api.BillingClient
    public final void startConnection(BillingClientStateListener billingClientStateListener) {
        synchronized (this) {
            if (U()) {
                rxf.h("BillingClientTesting", "Billing Override Service connection is valid. No need to re-initialize.");
                X(26);
            } else if (this.O == 1) {
                rxf.i("BillingClientTesting", "Client is already in the process of connecting to Billing Override Service.");
            } else if (this.O == 3) {
                rxf.i("BillingClientTesting", "Billing Override Service Client was already closed and can't be reused. Please create another instance.");
                W(26, n.a(-1, "Billing Override Service connection is disconnected."), cbg.BILLING_CLIENT_CLOSED);
            } else {
                this.O = 1;
                rxf.h("BillingClientTesting", "Starting Billing Override Service setup.");
                this.Q = new l(this);
                Intent intent = new Intent("com.google.android.apps.play.billingtestcompanion.BillingOverrideService.BIND");
                intent.setPackage("com.google.android.apps.play.billingtestcompanion");
                Context context = this.N;
                List<ResolveInfo> listQueryIntentServices = context.getPackageManager().queryIntentServices(intent, 0);
                cbg cbgVar = cbg.REASON_UNSPECIFIED;
                if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
                    cbgVar = cbg.INTENT_SERVICE_NOT_FOUND;
                } else {
                    ServiceInfo serviceInfo = listQueryIntentServices.get(0).serviceInfo;
                    if (serviceInfo != null) {
                        String str = serviceInfo.packageName;
                        String str2 = serviceInfo.name;
                        if (!Objects.equals(str, "com.google.android.apps.play.billingtestcompanion") || str2 == null) {
                            cbgVar = cbg.BILLING_SERVICE_BLOCKED;
                            rxf.i("BillingClientTesting", "The device doesn't have valid Play Billing Lab.");
                        } else {
                            ComponentName componentName = new ComponentName(str, str2);
                            Intent intent2 = new Intent(intent);
                            intent2.setComponent(componentName);
                            if (context.bindService(intent2, this.Q, 1)) {
                                rxf.h("BillingClientTesting", "Billing Override Service was bonded successfully.");
                            } else {
                                cbgVar = cbg.BILLING_SERVICE_BLOCKED;
                                rxf.i("BillingClientTesting", "Connection to Billing Override Service is blocked.");
                            }
                        }
                    }
                }
                this.O = 0;
                rxf.h("BillingClientTesting", "Billing Override Service unavailable on device.");
                W(26, n.a(2, "Billing Override Service unavailable on device."), cbgVar);
            }
        }
        F(billingClientStateListener, 0);
    }

    public m(PendingPurchasesParams pendingPurchasesParams, Context context, BillingClient.Builder builder) {
        super(pendingPurchasesParams, context, builder);
        this.O = 0;
        this.N = context;
    }

    public m(PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, BillingClient.Builder builder) {
        super(pendingPurchasesParams, context, purchasesUpdatedListener, builder);
        this.O = 0;
        this.N = context;
    }

    public m(PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, BillingClient.Builder builder) {
        super(pendingPurchasesParams, context, purchasesUpdatedListener, userChoiceBillingListener, developerProvidedBillingListener, builder);
        this.O = 0;
        this.N = context;
    }
}
