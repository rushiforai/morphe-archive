package com.android.billingclient.api;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Parcel;
import com.android.billingclient.api.BillingClient;
import com.google.android.gms.internal.play_billing.i1;
import com.google.android.gms.internal.play_billing.k1;
import com.google.android.gms.internal.play_billing.l1;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.n1;
import com.google.android.gms.internal.play_billing.o1;
import com.google.android.gms.internal.play_billing.q1;
import com.google.android.gms.internal.play_billing.r4;
import com.google.android.gms.internal.play_billing.u;
import com.google.android.gms.internal.play_billing.u4;
import com.google.android.gms.internal.play_billing.u5;
import com.google.android.gms.internal.play_billing.v5;
import com.google.android.gms.internal.play_billing.w;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;
import g90.k;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import z4.a;

/* loaded from: classes2.dex */
final class zzcw extends BillingClientImpl {
    private final Context zza;
    private volatile int zzb;
    private volatile w zzc;
    private volatile zzcu zzd;
    private volatile ScheduledExecutorService zze;

    public zzcw(String str, Context context, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        super(null, context, null, null, builder);
        this.zzb = 0;
        this.zza = context;
    }

    public static Object zzaD(zzcw zzcwVar, int i5, u5 u5Var) {
        try {
            if (zzcwVar.zzc == null) {
                throw null;
            }
            w wVar = zzcwVar.zzc;
            String packageName = zzcwVar.zza.getPackageName();
            String str = i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? i5 != 6 ? "QUERY_PRODUCT_DETAILS_ASYNC" : "START_CONNECTION" : "IS_FEATURE_SUPPORTED" : "CONSUME_ASYNC" : "ACKNOWLEDGE_PURCHASE" : "LAUNCH_BILLING_FLOW";
            zzct zzctVar = new zzct(u5Var);
            u uVar = (u) wVar;
            Parcel parcelB0 = uVar.b0();
            parcelB0.writeString(packageName);
            parcelB0.writeString(str);
            p7.u.a0(parcelB0, zzctVar);
            uVar.e0(parcelB0, 1);
            return "billingOverrideService.getBillingOverride";
        } catch (Exception e3) {
            zzcwVar.zzaN(w4.BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION, 28, zzdc.zzE);
            m0.i("BillingClientTesting", "An error occurred while retrieving billing override.", e3);
            u5Var.a(0);
            return "billingOverrideService.getBillingOverride";
        }
    }

    private final int zzaG(n1 n1Var) {
        try {
            return ((Integer) n1Var.get(28500L, TimeUnit.MILLISECONDS)).intValue();
        } catch (TimeoutException e3) {
            zzaN(w4.BILLING_OVERRIDE_SERVICE_CALL_TIMEOUT, 28, zzdc.zzE);
            m0.i("BillingClientTesting", "Asynchronous call to Billing Override Service timed out.", e3);
            return 0;
        } catch (Exception e11) {
            if (e11 instanceof InterruptedException) {
                Thread.currentThread().interrupt();
            }
            zzaN(w4.BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION, 28, zzdc.zzE);
            m0.i("BillingClientTesting", "An error occurred while retrieving billing override.", e11);
            return 0;
        }
    }

    private final synchronized ScheduledExecutorService zzaH() {
        try {
            if (this.zze == null) {
                this.zze = Executors.newSingleThreadScheduledExecutor();
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.zze;
    }

    private final synchronized void zzaI() {
        zzaO(27);
        try {
            try {
                zzcv zzcvVar = null;
                if (this.zzd != null && this.zzc != null) {
                    m0.g("BillingClientTesting", "Unbinding from Billing Override Service.");
                    this.zza.unbindService(this.zzd);
                    this.zzd = new zzcu(this, zzcvVar);
                }
                this.zzc = null;
                if (this.zze != null) {
                    this.zze.shutdownNow();
                    this.zze = null;
                }
            } catch (RuntimeException e3) {
                m0.i("BillingClientTesting", "There was an exception while ending Billing Override Service connection!", e3);
            }
            this.zzb = 3;
        } catch (Throwable th2) {
            this.zzb = 3;
            throw th2;
        }
    }

    private final synchronized void zzaJ() {
        if (zzaB()) {
            m0.g("BillingClientTesting", "Billing Override Service connection is valid. No need to re-initialize.");
            zzaO(26);
            return;
        }
        if (this.zzb == 1) {
            m0.h("BillingClientTesting", "Client is already in the process of connecting to Billing Override Service.");
            return;
        }
        if (this.zzb == 3) {
            m0.h("BillingClientTesting", "Billing Override Service Client was already closed and can't be reused. Please create another instance.");
            zzaN(w4.BILLING_CLIENT_CLOSED, 26, zzdc.zza(-1, "Billing Override Service connection is disconnected."));
            return;
        }
        this.zzb = 1;
        m0.g("BillingClientTesting", "Starting Billing Override Service setup.");
        this.zzd = new zzcu(this, null);
        Intent intent = new Intent("com.google.android.apps.play.billingtestcompanion.BillingOverrideService.BIND");
        intent.setPackage("com.google.android.apps.play.billingtestcompanion");
        Context context = this.zza;
        List<ResolveInfo> listQueryIntentServices = context.getPackageManager().queryIntentServices(intent, 0);
        w4 w4Var = w4.REASON_UNSPECIFIED;
        if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
            w4Var = w4.INTENT_SERVICE_NOT_FOUND;
        } else {
            ServiceInfo serviceInfo = listQueryIntentServices.get(0).serviceInfo;
            if (serviceInfo != null) {
                String str = serviceInfo.packageName;
                String str2 = serviceInfo.name;
                if (!Objects.equals(str, "com.google.android.apps.play.billingtestcompanion") || str2 == null) {
                    w4Var = w4.BILLING_SERVICE_BLOCKED;
                    m0.h("BillingClientTesting", "The device doesn't have valid Play Billing Lab.");
                } else {
                    ComponentName componentName = new ComponentName(str, str2);
                    Intent intent2 = new Intent(intent);
                    intent2.setComponent(componentName);
                    if (context.bindService(intent2, this.zzd, 1)) {
                        m0.g("BillingClientTesting", "Billing Override Service was bonded successfully.");
                        return;
                    } else {
                        w4Var = w4.BILLING_SERVICE_BLOCKED;
                        m0.h("BillingClientTesting", "Connection to Billing Override Service is blocked.");
                    }
                }
            }
        }
        this.zzb = 0;
        m0.g("BillingClientTesting", "Billing Override Service unavailable on device.");
        zzaN(w4Var, 26, zzdc.zza(2, "Billing Override Service unavailable on device."));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean zzaK(int i5) {
        return i5 > 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final BillingResult zzaL(int i5, int i11) {
        BillingResult billingResultZza = zzdc.zza(i11, "Billing override value was set by a license tester.");
        zzaN(w4.LICENSE_TESTER_BILLING_OVERRIDE, i5, billingResultZza);
        return billingResultZza;
    }

    private final n1 zzaM(final int i5) {
        if (zzaB()) {
            return k.r0(new v5() { // from class: com.android.billingclient.api.zzcn
                @Override // com.google.android.gms.internal.play_billing.v5
                public final Object zza(u5 u5Var) {
                    return zzcw.zzaD(this.zza, i5, u5Var);
                }
            });
        }
        m0.h("BillingClientTesting", "Billing Override Service is not ready.");
        zzaN(w4.BILLING_OVERRIDE_SERVICE_CONNECTION_NOT_READY, 28, zzdc.zza(-1, "Billing Override Service connection is disconnected."));
        return new l1(0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaN(w4 w4Var, int i5, BillingResult billingResult) {
        int i11 = zzcy.zza;
        r4 r4VarZzb = zzcy.zzb(w4Var, i5, billingResult, null, z4.BROADCAST_ACTION_UNSPECIFIED);
        Objects.requireNonNull(r4VarZzb, "ApiFailure should not be null");
        zzk().zza(r4VarZzb);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaO(int i5) {
        int i11 = zzcy.zza;
        u4 u4VarZzc = zzcy.zzc(i5, z4.BROADCAST_ACTION_UNSPECIFIED);
        Objects.requireNonNull(u4VarZzc, "ApiSuccess should not be null");
        zzk().zzf(u4VarZzc);
    }

    private final void zzaP(int i5, a aVar, Runnable runnable) {
        n1 n1VarZzaM = zzaM(i5);
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ScheduledExecutorService scheduledExecutorServiceZzaH = zzaH();
        if (!n1VarZzaM.isDone()) {
            q1 q1Var = new q1();
            q1Var.f33494h = n1VarZzaM;
            o1 o1Var = new o1();
            o1Var.f33468a = q1Var;
            q1Var.f33495i = scheduledExecutorServiceZzaH.schedule(o1Var, 28500L, timeUnit);
            n1VarZzaM.c(o1Var, i1.f33419a);
            n1VarZzaM = q1Var;
        }
        zzcs zzcsVar = new zzcs(this, i5, aVar, runnable);
        n1VarZzaM.c(new k1(n1VarZzaM, zzcsVar), zzJ());
    }

    @Override // com.android.billingclient.api.BillingClientImpl, com.android.billingclient.api.BillingClient
    public final void acknowledgePurchase(final AcknowledgePurchaseParams acknowledgePurchaseParams, final AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) {
        Objects.requireNonNull(acknowledgePurchaseResponseListener);
        zzaP(3, new a() { // from class: com.android.billingclient.api.zzco
            @Override // z4.a
            public final void accept(Object obj) {
                acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse((BillingResult) obj);
            }
        }, new Runnable() { // from class: com.android.billingclient.api.zzcp
            @Override // java.lang.Runnable
            public final void run() {
                super/*com.android.billingclient.api.BillingClientImpl*/.acknowledgePurchase(acknowledgePurchaseParams, acknowledgePurchaseResponseListener);
            }
        });
    }

    @Override // com.android.billingclient.api.BillingClientImpl, com.android.billingclient.api.BillingClient
    public final void consumeAsync(final ConsumeParams consumeParams, final ConsumeResponseListener consumeResponseListener) {
        zzaP(4, new a() { // from class: com.android.billingclient.api.zzcl
            @Override // z4.a
            public final void accept(Object obj) {
                consumeResponseListener.onConsumeResponse((BillingResult) obj, consumeParams.getPurchaseToken());
            }
        }, new Runnable() { // from class: com.android.billingclient.api.zzcm
            @Override // java.lang.Runnable
            public final void run() {
                super/*com.android.billingclient.api.BillingClientImpl*/.consumeAsync(consumeParams, consumeResponseListener);
            }
        });
    }

    @Override // com.android.billingclient.api.BillingClientImpl, com.android.billingclient.api.BillingClient
    public final void endConnection() {
        zzaI();
        super.endConnection();
    }

    @Override // com.android.billingclient.api.BillingClientImpl, com.android.billingclient.api.BillingClient
    public final BillingResult launchBillingFlow(final Activity activity, final BillingFlowParams billingFlowParams) {
        a aVar = new a() { // from class: com.android.billingclient.api.zzcq
            @Override // z4.a
            public final void accept(Object obj) {
                this.zza.zzn((BillingResult) obj);
            }
        };
        Callable callable = new Callable() { // from class: com.android.billingclient.api.zzcr
            @Override // java.util.concurrent.Callable
            public final Object call() {
                return super/*com.android.billingclient.api.BillingClientImpl*/.launchBillingFlow(activity, billingFlowParams);
            }
        };
        int iZzaG = zzaG(zzaM(2));
        if (zzaK(iZzaG)) {
            BillingResult billingResultZzaL = zzaL(2, iZzaG);
            aVar.accept(billingResultZzaL);
            return billingResultZzaL;
        }
        try {
            return (BillingResult) callable.call();
        } catch (Exception e3) {
            BillingResult billingResult = zzdc.zzh;
            zzaN(w4.BILLING_OVERRIDE_SERVICE_FALLBACK_ERROR, 2, billingResult);
            m0.i("BillingClientTesting", "An internal error occurred.", e3);
            return billingResult;
        }
    }

    @Override // com.android.billingclient.api.BillingClientImpl, com.android.billingclient.api.BillingClient
    public final void queryProductDetailsAsync(final QueryProductDetailsParams queryProductDetailsParams, final ProductDetailsResponseListener productDetailsResponseListener) {
        zzaP(7, new a() { // from class: com.android.billingclient.api.zzcj
            @Override // z4.a
            public final void accept(Object obj) {
                QueryProductDetailsResult queryProductDetailsResult = new QueryProductDetailsResult(new ArrayList(), new ArrayList());
                productDetailsResponseListener.onProductDetailsResponse((BillingResult) obj, queryProductDetailsResult);
            }
        }, new Runnable() { // from class: com.android.billingclient.api.zzck
            @Override // java.lang.Runnable
            public final void run() {
                super/*com.android.billingclient.api.BillingClientImpl*/.queryProductDetailsAsync(queryProductDetailsParams, productDetailsResponseListener);
            }
        });
    }

    @Override // com.android.billingclient.api.BillingClientImpl, com.android.billingclient.api.BillingClient
    public final void startConnection(BillingClientStateListener billingClientStateListener) {
        zzaJ();
        super.startConnection(billingClientStateListener);
    }

    public final synchronized boolean zzaB() {
        if (this.zzb == 2 && this.zzc != null) {
            if (this.zzd != null) {
                return true;
            }
        }
        return false;
    }

    public zzcw(String str, PendingPurchasesParams pendingPurchasesParams, Context context, zzdo zzdoVar, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        super(null, pendingPurchasesParams, context, null, null, null, builder);
        this.zzb = 0;
        this.zza = context;
    }

    public zzcw(String str, PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, zzb zzbVar, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        super(null, pendingPurchasesParams, context, purchasesUpdatedListener, null, null, null, builder);
        this.zzb = 0;
        this.zza = context;
    }

    public zzcw(String str, PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        super(null, pendingPurchasesParams, context, purchasesUpdatedListener, userChoiceBillingListener, developerProvidedBillingListener, null, null, builder);
        this.zzb = 0;
        this.zza = context;
    }
}
