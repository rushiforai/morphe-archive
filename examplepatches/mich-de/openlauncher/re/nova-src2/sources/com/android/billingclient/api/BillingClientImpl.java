package com.android.billingclient.api;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
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
import b.c0;
import b.c9;
import bg.g;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.QueryProductDetailsParams;
import com.android.billingclient.ktx.BuildConfig;
import com.google.android.gms.internal.play_billing.b0;
import com.google.android.gms.internal.play_billing.b2;
import com.google.android.gms.internal.play_billing.b4;
import com.google.android.gms.internal.play_billing.b5;
import com.google.android.gms.internal.play_billing.c5;
import com.google.android.gms.internal.play_billing.d2;
import com.google.android.gms.internal.play_billing.d4;
import com.google.android.gms.internal.play_billing.e2;
import com.google.android.gms.internal.play_billing.e5;
import com.google.android.gms.internal.play_billing.f0;
import com.google.android.gms.internal.play_billing.f5;
import com.google.android.gms.internal.play_billing.i0;
import com.google.android.gms.internal.play_billing.k0;
import com.google.android.gms.internal.play_billing.l1;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.m4;
import com.google.android.gms.internal.play_billing.n;
import com.google.android.gms.internal.play_billing.n1;
import com.google.android.gms.internal.play_billing.n4;
import com.google.android.gms.internal.play_billing.o0;
import com.google.android.gms.internal.play_billing.p;
import com.google.android.gms.internal.play_billing.p5;
import com.google.android.gms.internal.play_billing.q4;
import com.google.android.gms.internal.play_billing.q5;
import com.google.android.gms.internal.play_billing.r4;
import com.google.android.gms.internal.play_billing.s4;
import com.google.android.gms.internal.play_billing.u4;
import com.google.android.gms.internal.play_billing.u5;
import com.google.android.gms.internal.play_billing.v1;
import com.google.android.gms.internal.play_billing.v4;
import com.google.android.gms.internal.play_billing.v5;
import com.google.android.gms.internal.play_billing.w1;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.x1;
import com.google.android.gms.internal.play_billing.x4;
import com.google.android.gms.internal.play_billing.y1;
import com.google.android.gms.internal.play_billing.z4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import g90.k;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
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
import p7.u;

/* loaded from: classes2.dex */
class BillingClientImpl extends BillingClient {
    private boolean zzA;
    private boolean zzB;
    private boolean zzC;
    private boolean zzD;
    private PendingPurchasesParams zzE;
    private boolean zzF;
    private boolean zzG;
    private volatile BillingClientStateListener zzH;
    private ExecutorService zzI;
    private final Long zzJ;
    private f0 zzK;
    private final Object zza;
    private volatile int zzb;
    private final String zzc;
    private final String zzd;
    private final Handler zze;
    private volatile zzab zzf;
    private Context zzg;
    private zzcz zzh;
    private volatile p zzi;
    private volatile zzbw zzj;
    private boolean zzk;
    private boolean zzl;
    private int zzm;
    private boolean zzn;
    private boolean zzo;
    private boolean zzp;
    private boolean zzq;
    private boolean zzr;
    private boolean zzs;
    private boolean zzt;
    private boolean zzu;
    private boolean zzv;
    private boolean zzw;
    private boolean zzx;
    private boolean zzy;
    private boolean zzz;

    private BillingClientImpl(Activity activity, PendingPurchasesParams pendingPurchasesParams, String str, BillingClient.Builder builder) {
        this(activity.getApplicationContext(), pendingPurchasesParams, new zzci(), str, null, null, null, null, null, builder);
    }

    private void initialize(Context context, PurchasesUpdatedListener purchasesUpdatedListener, PendingPurchasesParams pendingPurchasesParams, zzb zzbVar, String str, zzcz zzczVar, BillingClient.Builder builder) {
        this.zzg = context.getApplicationContext();
        b5 b5VarA = c5.A();
        b5VarA.d();
        c5.y((c5) b5VarA.f33564b, str);
        String str2 = this.zzd;
        if (str2 != null) {
            b5VarA.d();
            c5.z((c5) b5VarA.f33564b, str2);
        }
        String packageName = this.zzg.getPackageName();
        b5VarA.d();
        c5.r((c5) b5VarA.f33564b, packageName);
        long jLongValue = this.zzJ.longValue();
        b5VarA.d();
        c5.E((c5) b5VarA.f33564b, jLongValue);
        boolean z11 = builder.zza;
        b5VarA.d();
        c5.x((c5) b5VarA.f33564b, z11);
        int i5 = Build.VERSION.SDK_INT;
        b5VarA.d();
        c5.B((c5) b5VarA.f33564b, i5);
        b5VarA.f();
        zzbo(b5VarA, context);
        try {
            int i11 = this.zzg.getPackageManager().getPackageInfo(this.zzg.getPackageName(), 0).versionCode;
            b5VarA.d();
            c5.C((c5) b5VarA.f33564b, i11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Error getting app version code.", th2);
        }
        if (zzczVar != null) {
            this.zzh = zzczVar;
        } else {
            this.zzh = new zzdl(this.zzg, (c5) b5VarA.a());
        }
        if (purchasesUpdatedListener == null) {
            m0.h("BillingClient", "Billing client should have a valid listener but the provided is null.");
        }
        this.zzf = new zzab(this.zzg, purchasesUpdatedListener, null, zzbVar, null, null, this.zzh);
        this.zzE = pendingPurchasesParams;
        this.zzG = zzbVar != null;
        this.zzg.getPackageName();
        this.zzF = builder.zza;
    }

    private int launchBillingFlowCpp(Activity activity, BillingFlowParams billingFlowParams) {
        return launchBillingFlow(activity, billingFlowParams).getResponseCode();
    }

    private void startConnection(long j11) {
        startConnection(new zzci(j11));
    }

    public static /* synthetic */ Void zzA(BillingClientImpl billingClientImpl, AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener, Activity activity, ResultReceiver resultReceiver) throws Exception {
        billingClientImpl.zzaL(alternativeBillingOnlyInformationDialogListener, activity, resultReceiver);
        return null;
    }

    public static /* synthetic */ Void zzB(BillingClientImpl billingClientImpl, ExternalOfferAvailabilityListener externalOfferAvailabilityListener) throws Exception {
        billingClientImpl.zzaK(externalOfferAvailabilityListener);
        return null;
    }

    public static /* synthetic */ Void zzC(BillingClientImpl billingClientImpl, BillingProgramAvailabilityListener billingProgramAvailabilityListener, int i5) throws Exception {
        billingClientImpl.zzaJ(billingProgramAvailabilityListener, i5);
        return null;
    }

    public static Void zzD(BillingClientImpl billingClientImpl, LaunchExternalLinkResponseListener launchExternalLinkResponseListener, LaunchExternalLinkParams launchExternalLinkParams, Activity activity) {
        p pVar;
        zzch zzchVar = null;
        try {
            if (!billingClientImpl.zzbl(30000L)) {
                billingClientImpl.zzaZ(launchExternalLinkResponseListener, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                return null;
            }
            if (!billingClientImpl.zzD) {
                m0.h("BillingClient", "Current client doesn't support launch external link.");
                billingClientImpl.zzaZ(launchExternalLinkResponseListener, zzdc.zzG, w4.LAUNCH_EXTERNAL_LINK_NOT_SUPPORTED, null);
                return null;
            }
            synchronized (billingClientImpl.zza) {
                pVar = billingClientImpl.zzi;
            }
            if (pVar == null) {
                billingClientImpl.zzaZ(launchExternalLinkResponseListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = billingClientImpl.zzg.getPackageName();
            String str = billingClientImpl.zzc;
            String str2 = billingClientImpl.zzd;
            long jLongValue = billingClientImpl.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            b4 b4VarQ = d4.q();
            m4 m4VarQ = n4.q();
            m4VarQ.f(launchExternalLinkParams.getLinkUri().toString());
            b4VarQ.f((n4) m4VarQ.a(), "externalOfferUri");
            m4 m4VarQ2 = n4.q();
            m4VarQ2.f(String.valueOf(launchExternalLinkParams.getLaunchMode()));
            b4VarQ.f((n4) m4VarQ2.a(), "externalOfferLaunchMode");
            m4 m4VarQ3 = n4.q();
            m4VarQ3.f(String.valueOf(launchExternalLinkParams.getLinkType()));
            b4VarQ.f((n4) m4VarQ3.a(), "externalOfferLinkType");
            m4 m4VarQ4 = n4.q();
            m4VarQ4.f(String.valueOf(launchExternalLinkParams.getBillingProgram()));
            b4VarQ.f((n4) m4VarQ4.a(), "externalOfferBillingProgram");
            bundle.putByteArray("REQUEST_PARAMS", ((d4) b4VarQ.a()).b());
            zzcc zzccVar = new zzcc(billingClientImpl, new WeakReference(activity), launchExternalLinkResponseListener, zzchVar);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(27);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzccVar);
            nVar.e0(parcelB0, 1901);
            return null;
        } catch (RuntimeException e3) {
            billingClientImpl.zzaZ(launchExternalLinkResponseListener, zzdc.zzh, w4.SERVICE_CALL_EXCEPTION, e3);
            return null;
        }
    }

    public static /* synthetic */ Void zzE(BillingClientImpl billingClientImpl, ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener) throws Exception {
        billingClientImpl.zzaH(externalOfferReportingDetailsListener);
        return null;
    }

    public static /* synthetic */ Void zzF(BillingClientImpl billingClientImpl, ExternalOfferInformationDialogListener externalOfferInformationDialogListener, Activity activity, ResultReceiver resultReceiver) throws Exception {
        billingClientImpl.zzaM(externalOfferInformationDialogListener, activity, resultReceiver);
        return null;
    }

    public static /* synthetic */ Void zzG(BillingClientImpl billingClientImpl, AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener) throws Exception {
        billingClientImpl.zzaF(alternativeBillingOnlyReportingDetailsListener);
        return null;
    }

    public static /* synthetic */ Void zzH(BillingClientImpl billingClientImpl, BillingProgramReportingDetailsListener billingProgramReportingDetailsListener, BillingProgramReportingDetailsParams billingProgramReportingDetailsParams) throws Exception {
        billingClientImpl.zzaG(billingProgramReportingDetailsListener, billingProgramReportingDetailsParams);
        return null;
    }

    public static /* synthetic */ Void zzI(BillingClientImpl billingClientImpl, AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener) throws Exception {
        billingClientImpl.zzaI(alternativeBillingOnlyAvailabilityListener);
        return null;
    }

    public static Future zzK(Callable callable, long j11, final Runnable runnable, Handler handler, ExecutorService executorService) {
        try {
            final Future futureSubmit = executorService.submit(callable);
            handler.postDelayed(new Runnable() { // from class: com.android.billingclient.api.zzaz
                @Override // java.lang.Runnable
                public final void run() {
                    Future future = futureSubmit;
                    if (future.isDone() || future.isCancelled()) {
                        return;
                    }
                    Runnable runnable2 = runnable;
                    future.cancel(true);
                    m0.h("BillingClient", "Async task is taking too long, cancel it!");
                    if (runnable2 != null) {
                        runnable2.run();
                    }
                }
            }, (long) (j11 * 0.95d));
            return futureSubmit;
        } catch (Exception e3) {
            m0.i("BillingClient", "Async task throws exception!", e3);
            return null;
        }
    }

    public static /* synthetic */ void zzL(BillingClientImpl billingClientImpl, ConsumeResponseListener consumeResponseListener, ConsumeParams consumeParams) {
        BillingResult billingResult = zzdc.zzk;
        billingClientImpl.zzbs(w4.EXECUTE_ASYNC_TIMEOUT, 4, billingResult);
        consumeResponseListener.onConsumeResponse(billingResult, consumeParams.getPurchaseToken());
    }

    public static void zzM(BillingClientImpl billingClientImpl, PurchasesResponseListener purchasesResponseListener) {
        BillingResult billingResult = zzdc.zzk;
        billingClientImpl.zzbs(w4.EXECUTE_ASYNC_TIMEOUT, 9, billingResult);
        i0 i0Var = k0.f33433b;
        purchasesResponseListener.onQueryPurchasesResponse(billingResult, o0.f33465e);
    }

    public static /* synthetic */ void zzN(BillingClientImpl billingClientImpl, BillingConfigResponseListener billingConfigResponseListener) {
        BillingResult billingResult = zzdc.zzk;
        billingClientImpl.zzbs(w4.EXECUTE_ASYNC_TIMEOUT, 13, billingResult);
        billingConfigResponseListener.onBillingConfigResponse(billingResult, null);
    }

    public static /* synthetic */ void zzR(BillingClientImpl billingClientImpl, AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) {
        BillingResult billingResult = zzdc.zzk;
        billingClientImpl.zzbs(w4.EXECUTE_ASYNC_TIMEOUT, 3, billingResult);
        acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResult);
    }

    public static void zzT(BillingClientImpl billingClientImpl, ProductDetailsResponseListener productDetailsResponseListener) {
        BillingResult billingResult = zzdc.zzk;
        billingClientImpl.zzbs(w4.EXECUTE_ASYNC_TIMEOUT, 7, billingResult);
        i0 i0Var = k0.f33433b;
        o0 o0Var = o0.f33465e;
        productDetailsResponseListener.onProductDetailsResponse(billingResult, new QueryProductDetailsResult(o0Var, o0Var));
    }

    public static /* synthetic */ void zzV(BillingClientImpl billingClientImpl, BillingResult billingResult) {
        if (billingClientImpl.zzf.zzf() != null) {
            billingClientImpl.zzf.zzf().onPurchasesUpdated(billingResult, null);
        } else {
            m0.h("BillingClient", "No valid listener is set in BroadcastManager");
        }
    }

    private final /* synthetic */ Object zzaA(AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener, AcknowledgePurchaseParams acknowledgePurchaseParams) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                w4 w4Var = w4.SERVICE_CONNECTION_NOT_READY;
                BillingResult billingResult = zzdc.zzj;
                zzbs(w4Var, 3, billingResult);
                acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResult);
                return null;
            }
            if (TextUtils.isEmpty(acknowledgePurchaseParams.getPurchaseToken())) {
                m0.h("BillingClient", "Please provide a valid purchase token.");
                w4 w4Var2 = w4.EMPTY_PURCHASE_TOKEN;
                BillingResult billingResult2 = zzdc.zzg;
                zzbs(w4Var2, 3, billingResult2);
                acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResult2);
                return null;
            }
            if (!this.zzp) {
                w4 w4Var3 = w4.API_VERSION_NOT_V9;
                BillingResult billingResult3 = zzdc.zza;
                zzbs(w4Var3, 3, billingResult3);
                acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResult3);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaP(acknowledgePurchaseResponseListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String purchaseToken = acknowledgePurchaseParams.getPurchaseToken();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            Bundle bundleG0 = ((n) pVar).g0(packageName, purchaseToken, bundle);
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(zzdc.zza(m0.a("BillingClient", bundleG0), m0.f("BillingClient", bundleG0)));
            return null;
        } catch (DeadObjectException e3) {
            zzaP(acknowledgePurchaseResponseListener, zzdc.zzj, w4.ACKNOWLEDGE_PURCHASE_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaP(acknowledgePurchaseResponseListener, zzdc.zzh, w4.ACKNOWLEDGE_PURCHASE_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Object zzaB(BillingConfigResponseListener billingConfigResponseListener) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                m0.h("BillingClient", "Service disconnected.");
                w4 w4Var = w4.SERVICE_CONNECTION_NOT_READY;
                BillingResult billingResult = zzdc.zzj;
                zzbs(w4Var, 13, billingResult);
                billingConfigResponseListener.onBillingConfigResponse(billingResult, null);
                return null;
            }
            if (!this.zzv) {
                m0.h("BillingClient", "Current client doesn't support get billing config.");
                w4 w4Var2 = w4.GET_BILLING_CONFIG_NOT_SUPPORTED;
                BillingResult billingResult2 = zzdc.zzy;
                zzbs(w4Var2, 13, billingResult2);
                billingConfigResponseListener.onBillingConfigResponse(billingResult2, null);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaY(billingConfigResponseListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            zzca zzcaVar = new zzca(billingConfigResponseListener, this.zzh, this.zzm, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(18);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzcaVar);
            nVar.d0(parcelB0, 1301);
            return null;
        } catch (DeadObjectException e3) {
            zzaY(billingConfigResponseListener, zzdc.zzj, w4.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaY(billingConfigResponseListener, zzdc.zzh, w4.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Object zzaC(Bundle bundle, Activity activity, ResultReceiver resultReceiver) throws Exception {
        p pVar;
        try {
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzbb(-1, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            zzcf zzcfVar = new zzcf(new WeakReference(activity), resultReceiver, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(12);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzcfVar);
            nVar.d0(parcelB0, 1201);
            return null;
        } catch (DeadObjectException e3) {
            zzbb(-1, w4.SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzbb(6, w4.SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final String zzaD(QueryProductDetailsParams queryProductDetailsParams) {
        if (TextUtils.isEmpty(null)) {
            return this.zzg.getPackageName();
        }
        return null;
    }

    @SuppressLint({"PrivateApi"})
    private static String zzaE() {
        try {
            return (String) BuildConfig.class.getField("VERSION_NAME").get(null);
        } catch (Exception unused) {
            return null;
        }
    }

    private final Void zzaF(AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                zzaT(alternativeBillingOnlyReportingDetailsListener, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                return null;
            }
            if (!this.zzy) {
                m0.h("BillingClient", "Current client doesn't support alternative billing only.");
                zzaT(alternativeBillingOnlyReportingDetailsListener, zzdc.zzC, w4.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED, null);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaT(alternativeBillingOnlyReportingDetailsListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            zzbx zzbxVar = new zzbx(alternativeBillingOnlyReportingDetailsListener, this.zzh, this.zzm, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(21);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzbxVar);
            nVar.e0(parcelB0, 1501);
            return null;
        } catch (DeadObjectException e3) {
            zzaT(alternativeBillingOnlyReportingDetailsListener, zzdc.zzj, w4.CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaT(alternativeBillingOnlyReportingDetailsListener, zzdc.zzh, w4.CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Void zzaG(BillingProgramReportingDetailsListener billingProgramReportingDetailsListener, BillingProgramReportingDetailsParams billingProgramReportingDetailsParams) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                zzaU(billingProgramReportingDetailsListener, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                return null;
            }
            if (!this.zzD) {
                m0.h("BillingClient", "Current client doesn't support the provided billing program.");
                zzaU(billingProgramReportingDetailsListener, zzdc.zzF, w4.BILLING_PROGRAM_NOT_SUPPORTED, null);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaU(billingProgramReportingDetailsListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String str = this.zzc;
            b2 b2VarZzb = zzdg.zzb(str, 24, this.zzg, zzdf.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC.zza());
            b4 b4VarQ = d4.q();
            m4 m4VarQ = n4.q();
            m4VarQ.f(str);
            b4VarQ.f((n4) m4VarQ.a(), "PLAY_BILLING_LIBRARY_VERSION");
            m4 m4VarQ2 = n4.q();
            m4VarQ2.f(this.zzg.getPackageName());
            b4VarQ.f((n4) m4VarQ2.a(), "CALLING_PACKAGE");
            m4 m4VarQ3 = n4.q();
            m4VarQ3.f(String.valueOf(billingProgramReportingDetailsParams.getBillingProgram()));
            b4VarQ.f((n4) m4VarQ3.a(), "BILLING_PROGRAM");
            m4 m4VarQ4 = n4.q();
            m4VarQ4.f("RESPONSE_FORMAT_PROTO");
            b4VarQ.f((n4) m4VarQ4.a(), "RESPONSE_FORMAT");
            if (billingProgramReportingDetailsParams.getBillingProgram() == 3) {
                m4 m4VarQ5 = n4.q();
                m4VarQ5.f(String.valueOf(this.zzg.getPackageManager().getPackageInfo(this.zzg.getPackageName(), 0).firstInstallTime));
                b4VarQ.f((n4) m4VarQ5.a(), "APP_INSTALL_TIME_MILLIS");
            }
            Bundle bundleZza = zzdg.zza(b2VarZzb, (d4) b4VarQ.a());
            CreateBillingProgramReportingDetailsDelegateToBackendCallback createBillingProgramReportingDetailsDelegateToBackendCallback = new CreateBillingProgramReportingDetailsDelegateToBackendCallback(billingProgramReportingDetailsListener, billingProgramReportingDetailsParams.getBillingProgram(), this.zzh, this.zzm, zzav(), zzJ());
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(1);
            bundleZza.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, createBillingProgramReportingDetailsDelegateToBackendCallback);
            nVar.e0(parcelB0, 2001);
            return null;
        } catch (DeadObjectException e3) {
            zzaU(billingProgramReportingDetailsListener, zzdc.zzj, w4.SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (RuntimeException e11) {
            zzaU(billingProgramReportingDetailsListener, zzdc.zzh, w4.SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Void zzaH(ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                zzaV(externalOfferReportingDetailsListener, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                return null;
            }
            if (!this.zzz) {
                m0.h("BillingClient", "Current client doesn't support external offer.");
                zzaV(externalOfferReportingDetailsListener, zzdc.zzt, w4.EXTERNAL_OFFER_NOT_SUPPORTED, null);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaV(externalOfferReportingDetailsListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            long j11 = this.zzg.getPackageManager().getPackageInfo(this.zzg.getPackageName(), 0).firstInstallTime;
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            bundle.putLong("appInstallTimeMillis", j11);
            zzby zzbyVar = new zzby(externalOfferReportingDetailsListener, this.zzh, this.zzm, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(22);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzbyVar);
            nVar.e0(parcelB0, 1801);
            return null;
        } catch (DeadObjectException e3) {
            zzaV(externalOfferReportingDetailsListener, zzdc.zzj, w4.CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaV(externalOfferReportingDetailsListener, zzdc.zzh, w4.CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Void zzaI(AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                zzaQ(alternativeBillingOnlyAvailabilityListener, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                return null;
            }
            if (!this.zzy) {
                m0.h("BillingClient", "Current client doesn't support alternative billing only.");
                zzaQ(alternativeBillingOnlyAvailabilityListener, zzdc.zzC, w4.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED, null);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaQ(alternativeBillingOnlyAvailabilityListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            zzcd zzcdVar = new zzcd(alternativeBillingOnlyAvailabilityListener, this.zzh, this.zzm, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(21);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzcdVar);
            nVar.e0(parcelB0, 1401);
            return null;
        } catch (DeadObjectException e3) {
            zzaQ(alternativeBillingOnlyAvailabilityListener, zzdc.zzj, w4.IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaQ(alternativeBillingOnlyAvailabilityListener, zzdc.zzh, w4.IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Void zzaJ(BillingProgramAvailabilityListener billingProgramAvailabilityListener, int i5) throws Exception {
        BillingClientImpl billingClientImpl;
        BillingProgramAvailabilityListener billingProgramAvailabilityListener2;
        int i11;
        p pVar;
        IsBillingProgramAvailableDelegateToBackendCallback isBillingProgramAvailableDelegateToBackendCallback;
        try {
            try {
                if (!zzbl(30000L)) {
                    try {
                    } catch (DeadObjectException e3) {
                        e = e3;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener;
                        i11 = i5;
                        zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzj, w4.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e);
                        return null;
                    }
                    try {
                        zzaR(billingProgramAvailabilityListener, i5, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                        return null;
                    } catch (DeadObjectException e11) {
                        e = e11;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener;
                        i11 = i5;
                        zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzj, w4.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e);
                        return null;
                    } catch (Exception e12) {
                        e = e12;
                        billingClientImpl = this;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener;
                        i11 = i5;
                        billingClientImpl.zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzh, w4.SERVICE_CALL_EXCEPTION, e);
                        return null;
                    }
                }
                billingClientImpl = this;
                billingProgramAvailabilityListener2 = billingProgramAvailabilityListener;
                i11 = i5;
                try {
                    if (!billingClientImpl.zzD) {
                        m0.h("BillingClient", "Current client doesn't support the provided billing program.");
                        billingClientImpl.zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzF, w4.BILLING_PROGRAM_NOT_SUPPORTED, null);
                        return null;
                    }
                    synchronized (billingClientImpl.zza) {
                        pVar = billingClientImpl.zzi;
                    }
                    if (pVar == null) {
                        billingClientImpl.zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                        return null;
                    }
                    String str = billingClientImpl.zzc;
                    b2 b2VarZzb = zzdg.zzb(str, 24, billingClientImpl.zzg, zzdf.IS_BILLING_PROGRAM_AVAILABLE_ASYNC.zza());
                    b4 b4VarQ = d4.q();
                    m4 m4VarQ = n4.q();
                    m4VarQ.f(str);
                    b4VarQ.f((n4) m4VarQ.a(), "PLAY_BILLING_LIBRARY_VERSION");
                    m4 m4VarQ2 = n4.q();
                    m4VarQ2.f(billingClientImpl.zzg.getPackageName());
                    b4VarQ.f((n4) m4VarQ2.a(), "CALLING_PACKAGE");
                    m4 m4VarQ3 = n4.q();
                    m4VarQ3.f(String.valueOf(i11));
                    b4VarQ.f((n4) m4VarQ3.a(), "BILLING_PROGRAM");
                    Bundle bundleZza = zzdg.zza(b2VarZzb, (d4) b4VarQ.a());
                    try {
                        isBillingProgramAvailableDelegateToBackendCallback = new IsBillingProgramAvailableDelegateToBackendCallback(billingProgramAvailabilityListener2, i11, billingClientImpl.zzh, billingClientImpl.zzm, zzav(), zzJ());
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener2;
                        i11 = i11;
                    } catch (DeadObjectException e13) {
                        e = e13;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener2;
                        i11 = i11;
                    } catch (Exception e14) {
                        e = e14;
                        billingProgramAvailabilityListener2 = billingProgramAvailabilityListener2;
                        i11 = i11;
                    }
                    try {
                        n nVar = (n) pVar;
                        Parcel parcelB0 = nVar.b0();
                        parcelB0.writeInt(1);
                        bundleZza.writeToParcel(parcelB0, 0);
                        u.a0(parcelB0, isBillingProgramAvailableDelegateToBackendCallback);
                        nVar.e0(parcelB0, 2001);
                        return null;
                    } catch (DeadObjectException e15) {
                        e = e15;
                        zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzj, w4.GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION, e);
                        return null;
                    } catch (Exception e16) {
                        e = e16;
                        billingClientImpl.zzaR(billingProgramAvailabilityListener2, i11, zzdc.zzh, w4.SERVICE_CALL_EXCEPTION, e);
                        return null;
                    }
                } catch (DeadObjectException e17) {
                    e = e17;
                } catch (Exception e18) {
                    e = e18;
                }
            } catch (DeadObjectException e19) {
                e = e19;
            }
        } catch (Exception e21) {
            e = e21;
            billingClientImpl = this;
            billingProgramAvailabilityListener2 = billingProgramAvailabilityListener;
            i11 = i5;
        }
    }

    private final Void zzaK(ExternalOfferAvailabilityListener externalOfferAvailabilityListener) throws Exception {
        p pVar;
        try {
            if (!zzbl(30000L)) {
                zzaW(externalOfferAvailabilityListener, zzdc.zzj, w4.SERVICE_CONNECTION_NOT_READY, null);
                return null;
            }
            if (!this.zzB) {
                m0.h("BillingClient", "Current client doesn't support external offer.");
                zzaW(externalOfferAvailabilityListener, zzdc.zzt, w4.EXTERNAL_OFFER_NOT_SUPPORTED, null);
                return null;
            }
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaW(externalOfferAvailabilityListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            zzce zzceVar = new zzce(externalOfferAvailabilityListener, this.zzh, this.zzm, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(24);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzceVar);
            nVar.e0(parcelB0, 1701);
            return null;
        } catch (DeadObjectException e3) {
            zzaW(externalOfferAvailabilityListener, zzdc.zzj, w4.IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaW(externalOfferAvailabilityListener, zzdc.zzh, w4.IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Void zzaL(AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener, Activity activity, ResultReceiver resultReceiver) throws Exception {
        p pVar;
        try {
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzba(alternativeBillingOnlyInformationDialogListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            zzbz zzbzVar = new zzbz(new WeakReference(activity), resultReceiver, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(21);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzbzVar);
            nVar.e0(parcelB0, 1601);
            return null;
        } catch (DeadObjectException e3) {
            zzba(alternativeBillingOnlyInformationDialogListener, zzdc.zzj, w4.SHOW_ALTERNATIVE_BILLING_ONLY_DIALOG_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzba(alternativeBillingOnlyInformationDialogListener, zzdc.zzh, w4.SHOW_ALTERNATIVE_BILLING_ONLY_DIALOG_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Void zzaM(ExternalOfferInformationDialogListener externalOfferInformationDialogListener, Activity activity, ResultReceiver resultReceiver) throws Exception {
        p pVar;
        try {
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                zzaX(externalOfferInformationDialogListener, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, null);
                return null;
            }
            String packageName = this.zzg.getPackageName();
            String str = this.zzc;
            String str2 = this.zzd;
            long jLongValue = this.zzJ.longValue();
            int i5 = m0.f33450a;
            Bundle bundle = new Bundle();
            m0.b(str, str2, bundle, jLongValue);
            zzcb zzcbVar = new zzcb(new WeakReference(activity), resultReceiver, null);
            n nVar = (n) pVar;
            Parcel parcelB0 = nVar.b0();
            parcelB0.writeInt(22);
            parcelB0.writeString(packageName);
            parcelB0.writeInt(1);
            bundle.writeToParcel(parcelB0, 0);
            u.a0(parcelB0, zzcbVar);
            nVar.e0(parcelB0, 1901);
            return null;
        } catch (DeadObjectException e3) {
            zzaX(externalOfferInformationDialogListener, zzdc.zzj, w4.SHOW_EXTERNAL_PAYMENT_DIALOG_SERVICE_CALL_EXCEPTION, e3);
            return null;
        } catch (Exception e11) {
            zzaX(externalOfferInformationDialogListener, zzdc.zzh, w4.SHOW_EXTERNAL_PAYMENT_DIALOG_SERVICE_CALL_EXCEPTION, e11);
            return null;
        }
    }

    private final Future zzaN(Callable callable, long j11, final Runnable runnable, Handler handler) throws Exception {
        try {
            final Future futureSubmit = zzJ().submit(callable);
            handler.postDelayed(new Runnable() { // from class: com.android.billingclient.api.zzbi
                @Override // java.lang.Runnable
                public final void run() {
                    Future future = futureSubmit;
                    if (future.isDone() || future.isCancelled()) {
                        return;
                    }
                    Runnable runnable2 = runnable;
                    future.cancel(true);
                    m0.h("BillingClient", "Async task is taking too long, cancel it!");
                    runnable2.run();
                }
            }, 28500L);
            return futureSubmit;
        } catch (Exception e3) {
            m0.i("BillingClient", "Async task throws exception!", e3);
            throw e3;
        }
    }

    private final void zzaO(ConsumeParams consumeParams, ConsumeResponseListener consumeResponseListener) throws Throwable {
        ConsumeResponseListener consumeResponseListener2;
        p pVar;
        int i5;
        String strF;
        String purchaseToken = consumeParams.getPurchaseToken();
        try {
            m0.g("BillingClient", "Consuming purchase with token: " + purchaseToken);
            synchronized (this.zza) {
                try {
                    try {
                        pVar = this.zzi;
                    } catch (Throwable th2) {
                        th = th2;
                        while (true) {
                            try {
                                throw th;
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        }
                    }
                } catch (DeadObjectException e3) {
                    e = e3;
                } catch (Exception e11) {
                    e = e11;
                }
            }
            if (pVar == null) {
                try {
                    zzaS(consumeResponseListener, purchaseToken, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, "Service has been reset to null.", null);
                    return;
                } catch (DeadObjectException e12) {
                    e = e12;
                    consumeResponseListener2 = consumeResponseListener;
                    zzaS(consumeResponseListener2, purchaseToken, zzdc.zzj, w4.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", e);
                } catch (Exception e13) {
                    e = e13;
                    consumeResponseListener2 = consumeResponseListener;
                    zzaS(consumeResponseListener2, purchaseToken, zzdc.zzh, w4.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", e);
                }
            }
            consumeResponseListener2 = consumeResponseListener;
            try {
                if (this.zzp) {
                    String packageName = this.zzg.getPackageName();
                    boolean z11 = this.zzp;
                    String str = this.zzc;
                    String str2 = this.zzd;
                    long jLongValue = this.zzJ.longValue();
                    Bundle bundle = new Bundle();
                    if (z11) {
                        m0.b(str, str2, bundle, jLongValue);
                    }
                    Bundle bundleH0 = ((n) pVar).h0(packageName, purchaseToken, bundle);
                    i5 = bundleH0.getInt("RESPONSE_CODE");
                    strF = m0.f("BillingClient", bundleH0);
                } else {
                    String packageName2 = this.zzg.getPackageName();
                    n nVar = (n) pVar;
                    Parcel parcelB0 = nVar.b0();
                    parcelB0.writeInt(3);
                    parcelB0.writeString(packageName2);
                    parcelB0.writeString(purchaseToken);
                    Parcel parcelC0 = nVar.c0(parcelB0, 5);
                    i5 = parcelC0.readInt();
                    parcelC0.recycle();
                    strF = b.f42142b;
                }
                BillingResult billingResultZza = zzdc.zza(i5, strF);
                if (i5 == 0) {
                    m0.g("BillingClient", "Successfully consumed purchase.");
                    consumeResponseListener2.onConsumeResponse(billingResultZza, purchaseToken);
                } else {
                    zzaS(consumeResponseListener2, purchaseToken, billingResultZza, w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, "Error consuming purchase with token. Response code: " + i5, null);
                }
            } catch (DeadObjectException e14) {
                e = e14;
                zzaS(consumeResponseListener2, purchaseToken, zzdc.zzj, w4.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", e);
            } catch (Exception e15) {
                e = e15;
                zzaS(consumeResponseListener2, purchaseToken, zzdc.zzh, w4.CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION, "Error consuming purchase!", e);
            }
        } catch (DeadObjectException e16) {
            e = e16;
        } catch (Exception e17) {
            e = e17;
        }
    }

    private final void zzaP(AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        m0.i("BillingClient", "Error in acknowledge purchase!", exc);
        zzbu(w4Var, 3, billingResult, zzcy.zza(exc));
        acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResult);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaQ(AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 14, billingResult, zzcy.zza(exc));
        alternativeBillingOnlyAvailabilityListener.onAlternativeBillingOnlyAvailabilityResponse(billingResult);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaR(BillingProgramAvailabilityListener billingProgramAvailabilityListener, int i5, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 33, billingResult, zzcy.zza(exc));
        billingProgramAvailabilityListener.onBillingProgramAvailabilityResponse(billingResult, new BillingProgramAvailabilityDetails(i5));
    }

    private final void zzaS(ConsumeResponseListener consumeResponseListener, String str, BillingResult billingResult, w4 w4Var, String str2, Exception exc) {
        m0.i("BillingClient", str2, exc);
        zzbu(w4Var, 4, billingResult, zzcy.zza(exc));
        consumeResponseListener.onConsumeResponse(billingResult, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaT(AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 15, billingResult, zzcy.zza(exc));
        alternativeBillingOnlyReportingDetailsListener.onAlternativeBillingOnlyTokenResponse(billingResult, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaU(BillingProgramReportingDetailsListener billingProgramReportingDetailsListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 35, billingResult, zzcy.zza(exc));
        billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResult, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaV(ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 24, billingResult, zzcy.zza(exc));
        externalOfferReportingDetailsListener.onExternalOfferReportingDetailsResponse(billingResult, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaW(ExternalOfferAvailabilityListener externalOfferAvailabilityListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 23, billingResult, zzcy.zza(exc));
        externalOfferAvailabilityListener.onExternalOfferAvailabilityResponse(billingResult);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaX(ExternalOfferInformationDialogListener externalOfferInformationDialogListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 25, billingResult, zzcy.zza(exc));
        externalOfferInformationDialogListener.onExternalOfferInformationDialogResponse(billingResult);
    }

    private final void zzaY(BillingConfigResponseListener billingConfigResponseListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        m0.i("BillingClient", "getBillingConfig got an exception.", exc);
        zzbu(w4Var, 13, billingResult, zzcy.zza(exc));
        billingConfigResponseListener.onBillingConfigResponse(billingResult, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzaZ(LaunchExternalLinkResponseListener launchExternalLinkResponseListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 37, billingResult, zzcy.zza(exc));
        launchExternalLinkResponseListener.onLaunchExternalLinkResponse(billingResult);
    }

    public static /* bridge */ /* synthetic */ void zzak(BillingClientImpl billingClientImpl, int i5) {
        billingClientImpl.zzm = i5;
        billingClientImpl.zzD = i5 >= 27;
        billingClientImpl.zzC = i5 >= 26;
        billingClientImpl.zzB = i5 >= 24;
        billingClientImpl.zzA = i5 >= 23;
        billingClientImpl.zzz = i5 >= 22;
        billingClientImpl.zzy = i5 >= 21;
        billingClientImpl.zzx = i5 >= 20;
        billingClientImpl.zzw = i5 >= 19;
        billingClientImpl.zzv = i5 >= 18;
        billingClientImpl.zzu = i5 >= 17;
        billingClientImpl.zzt = i5 >= 16;
        billingClientImpl.zzs = i5 >= 15;
        billingClientImpl.zzr = i5 >= 14;
        billingClientImpl.zzq = i5 >= 12;
        billingClientImpl.zzp = i5 >= 9;
        billingClientImpl.zzo = i5 >= 8;
        billingClientImpl.zzn = i5 >= 6;
    }

    public static /* bridge */ /* synthetic */ void zzam(BillingClientImpl billingClientImpl, int i5) {
        if (i5 != 0) {
            billingClientImpl.zzbg(0);
            return;
        }
        synchronized (billingClientImpl.zza) {
            try {
                if (billingClientImpl.zzb == 3) {
                    return;
                }
                billingClientImpl.zzbg(2);
                zzab zzabVar = billingClientImpl.zzf != null ? billingClientImpl.zzf : null;
                if (zzabVar != null) {
                    zzabVar.zzi(billingClientImpl.zzy);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static /* bridge */ /* synthetic */ boolean zzaq(BillingClientImpl billingClientImpl) {
        boolean z11;
        synchronized (billingClientImpl.zza) {
            z11 = true;
            if (billingClientImpl.zzb != 1) {
                z11 = false;
            }
        }
        return z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Bundle zzat(int i5, String str, String str2, BillingFlowParams billingFlowParams, Bundle bundle) throws Exception {
        p pVar;
        try {
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                return m0.c(zzdc.zzj, w4.SERVICE_RESET_TO_NULL);
            }
            return ((n) pVar).j0(i5, this.zzg.getPackageName(), str, str2, bundle);
        } catch (DeadObjectException e3) {
            BillingResult billingResult = zzdc.zzj;
            String strZza = zzcy.zza(e3);
            Bundle bundleC = m0.c(billingResult, w4.LAUNCH_BILLING_FLOW_EXCEPTION);
            if (strZza != null) {
                bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza);
            }
            return bundleC;
        } catch (Exception e11) {
            BillingResult billingResult2 = zzdc.zzh;
            String strZza2 = zzcy.zza(e11);
            Bundle bundleC2 = m0.c(billingResult2, w4.LAUNCH_BILLING_FLOW_EXCEPTION);
            if (strZza2 != null) {
                bundleC2.putString("ADDITIONAL_LOG_DETAILS", strZza2);
            }
            return bundleC2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Bundle zzau(String str, String str2) throws Exception {
        p pVar;
        try {
            synchronized (this.zza) {
                pVar = this.zzi;
            }
            if (pVar == null) {
                return m0.c(zzdc.zzj, w4.SERVICE_RESET_TO_NULL);
            }
            return ((n) pVar).i0(this.zzg.getPackageName(), str, str2);
        } catch (DeadObjectException e3) {
            BillingResult billingResult = zzdc.zzj;
            String strZza = zzcy.zza(e3);
            Bundle bundleC = m0.c(billingResult, w4.LAUNCH_BILLING_FLOW_EXCEPTION);
            if (strZza != null) {
                bundleC.putString("ADDITIONAL_LOG_DETAILS", strZza);
            }
            return bundleC;
        } catch (Exception e11) {
            BillingResult billingResult2 = zzdc.zzh;
            String strZza2 = zzcy.zza(e11);
            Bundle bundleC2 = m0.c(billingResult2, w4.LAUNCH_BILLING_FLOW_EXCEPTION);
            if (strZza2 != null) {
                bundleC2.putString("ADDITIONAL_LOG_DETAILS", strZza2);
            }
            return bundleC2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Handler zzav() {
        return Looper.myLooper() == null ? this.zze : new Handler(Looper.myLooper());
    }

    private final zzcg zzaw(BillingResult billingResult, w4 w4Var, String str, Exception exc) {
        m0.i("BillingClient", str, exc);
        zzbu(w4Var, 7, billingResult, zzcy.zza(exc));
        return new zzcg(billingResult.getResponseCode(), billingResult.getDebugMessage(), new ArrayList(), new ArrayList());
    }

    private final BillingResult zzax(int i5) {
        m0.g("BillingClient", "Service connection is valid. No need to re-initialize.");
        s4 s4VarR = u4.r();
        s4VarR.d();
        u4.q((u4) s4VarR.f33564b, 6);
        p5 p5VarQ = q5.q();
        p5VarQ.d();
        q5.v((q5) p5VarQ.f33564b);
        p5VarQ.f(i5 > 0);
        p5VarQ.g(i5);
        s4VarR.d();
        u4.w((u4) s4VarR.f33564b, (q5) p5VarQ.a());
        zzbe((u4) s4VarR.a());
        return zzdc.zzi;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final BillingResult zzay() {
        int[] iArr = {0, 3};
        synchronized (this.zza) {
            for (int i5 = 0; i5 < 2; i5++) {
                if (this.zzb == iArr[i5]) {
                    return zzdc.zzj;
                }
            }
            return zzdc.zzh;
        }
    }

    private final n1 zzaz(final int i5) {
        if (this.zzF && !zzbm()) {
            return k.r0(new v5() { // from class: com.android.billingclient.api.zzad
                @Override // com.google.android.gms.internal.play_billing.v5
                public final Object zza(u5 u5Var) {
                    return BillingClientImpl.zzr(this.zza, i5, u5Var);
                }
            });
        }
        m0.g("BillingClient", "Already connected or not opted into auto reconnection.");
        return new l1(zzdc.zzi);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzba(AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener, BillingResult billingResult, w4 w4Var, Exception exc) {
        zzbu(w4Var, 16, billingResult, zzcy.zza(exc));
        alternativeBillingOnlyInformationDialogListener.onAlternativeBillingOnlyInformationDialogResponse(billingResult);
    }

    private final void zzbb(int i5, w4 w4Var, Exception exc) {
        r4 r4Var;
        m0.i("BillingClient", "showInAppMessages error.", exc);
        zzcz zzczVar = this.zzh;
        String strZza = zzcy.zza(exc);
        try {
            v4 v4VarR = x4.r();
            v4VarR.g(i5);
            if (w4Var != null) {
                v4VarR.f(w4Var);
            }
            if (strZza != null) {
                v4VarR.d();
                x4.s((x4) v4VarR.f33564b, strZza);
            }
            q4 q4VarT = r4.t();
            q4VarT.f(v4VarR);
            q4VarT.h(30);
            r4Var = (r4) q4VarT.a();
        } catch (Throwable th2) {
            m0.i("BillingLogger", "Unable to create logging payload", th2);
            r4Var = null;
        }
        zzczVar.zza(r4Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzbc(r4 r4Var) {
        try {
            this.zzh.zzb(r4Var, this.zzm);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    private final void zzbd(r4 r4Var, long j11, boolean z11) {
        try {
            this.zzh.zze(r4Var, this.zzm, j11, z11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzbe(u4 u4Var) {
        try {
            this.zzh.zzg(u4Var, this.zzm);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzbf(w4 w4Var, BillingResult billingResult, int i5) {
        try {
            int i11 = zzcy.zza;
            q4 q4Var = (q4) zzcy.zzb(w4Var, 6, billingResult, null, z4.BROADCAST_ACTION_UNSPECIFIED).l();
            p5 p5VarQ = q5.q();
            p5VarQ.f(i5 > 0);
            p5VarQ.g(i5);
            q4Var.g(p5VarQ);
            zzbc((r4) q4Var.a());
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void zzbg(int i5) {
        synchronized (this.zza) {
            try {
                if (this.zzb == 3) {
                    return;
                }
                m0.g("BillingClient", "Setting clientState from " + zzbn(this.zzb) + " to " + zzbn(i5));
                this.zzb = i5;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final synchronized void zzbh() {
        ExecutorService executorService = this.zzI;
        if (executorService != null) {
            executorService.shutdownNow();
            this.zzI = null;
        }
    }

    private final void zzbi(BillingClientStateListener billingClientStateListener, int i5) {
        w4 w4Var;
        BillingResult billingResultZzax;
        BillingResult billingResult;
        synchronized (this.zza) {
            try {
                if (zzbm()) {
                    billingResultZzax = zzax(i5);
                } else {
                    if (this.zzb == 1) {
                        m0.h("BillingClient", "Client is already in the process of connecting to billing service.");
                        w4 w4Var2 = w4.BILLING_CLIENT_CONNECTING;
                        billingResult = zzdc.zzd;
                        zzbf(w4Var2, billingResult, i5);
                    } else if (this.zzb == 3) {
                        m0.h("BillingClient", "Client was already closed and can't be reused. Please create another instance.");
                        w4 w4Var3 = w4.BILLING_CLIENT_CLOSED;
                        billingResult = zzdc.zzj;
                        zzbf(w4Var3, billingResult, i5);
                    } else {
                        zzbg(1);
                        if (i5 == 0) {
                            this.zzH = billingClientStateListener;
                            i5 = 0;
                        }
                        zzbj();
                        m0.g("BillingClient", "Starting in-app billing setup.");
                        this.zzj = new zzbw(this, billingClientStateListener, i5, null);
                        this.zzj.zzc();
                        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
                        intent.setPackage("com.android.vending");
                        List<ResolveInfo> listQueryIntentServices = this.zzg.getPackageManager().queryIntentServices(intent, 0);
                        if (listQueryIntentServices == null || listQueryIntentServices.isEmpty()) {
                            w4Var = w4.INTENT_SERVICE_NOT_FOUND;
                        } else {
                            ServiceInfo serviceInfo = listQueryIntentServices.get(0).serviceInfo;
                            if (serviceInfo != null) {
                                String str = serviceInfo.packageName;
                                String str2 = serviceInfo.name;
                                if (!Objects.equals(str, "com.android.vending") || str2 == null) {
                                    w4Var = w4.INVALID_PHONESKY_PACKAGE;
                                    m0.h("BillingClient", "The device doesn't have valid Play Store.");
                                } else {
                                    ComponentName componentName = new ComponentName(str, str2);
                                    Intent intent2 = new Intent(intent);
                                    intent2.setComponent(componentName);
                                    intent2.putExtra("playBillingLibraryVersion", this.zzc);
                                    synchronized (this.zza) {
                                        try {
                                            if (this.zzb == 2) {
                                                billingResultZzax = zzax(i5);
                                            } else if (this.zzb != 1) {
                                                m0.h("BillingClient", "Client state no longer CONNECTING, returning service disconnected.");
                                                w4 w4Var4 = w4.BILLING_CLIENT_TRANSITIONED_OUT_OF_CONNECTING;
                                                billingResult = zzdc.zzj;
                                                zzbf(w4Var4, billingResult, i5);
                                            } else {
                                                zzbw zzbwVar = this.zzj;
                                                if ((i5 <= 0 || Build.VERSION.SDK_INT < 29) ? this.zzg.bindService(intent2, zzbwVar, 1) : this.zzg.bindService(intent2, 1, zzJ(), zzbwVar)) {
                                                    m0.g("BillingClient", "Service was bonded successfully.");
                                                    billingResultZzax = null;
                                                } else {
                                                    w4Var = w4.BILLING_SERVICE_BLOCKED;
                                                    m0.h("BillingClient", "Connection to Billing service is blocked.");
                                                }
                                            }
                                        } finally {
                                        }
                                    }
                                }
                            } else {
                                w4Var = w4.INVALID_PHONESKY_PACKAGE;
                                m0.h("BillingClient", "The device doesn't have valid Play Store.");
                            }
                        }
                        zzbg(0);
                        m0.g("BillingClient", "Billing service unavailable on device.");
                        BillingResult billingResult2 = zzdc.zzb;
                        zzbf(w4Var, billingResult2, i5);
                        billingResultZzax = billingResult2;
                    }
                    billingResultZzax = billingResult;
                }
            } finally {
            }
        }
        if (billingResultZzax != null) {
            billingClientStateListener.onBillingSetupFinished(billingResultZzax);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public final void zzbj() {
        synchronized (this.zza) {
            if (this.zzj != null) {
                try {
                    this.zzg.unbindService(this.zzj);
                } catch (Throwable th2) {
                    try {
                        m0.i("BillingClient", "There was an exception while unbinding service!", th2);
                        this.zzi = null;
                        this.zzj = null;
                    } finally {
                        this.zzi = null;
                        this.zzj = null;
                    }
                }
            }
        }
    }

    private final boolean zzbk(long j11) {
        try {
            BillingResult billingResult = (BillingResult) zzaz(1).get(Build.VERSION.SDK_INT < 29 ? 0L : 3000L, TimeUnit.MILLISECONDS);
            if (billingResult.getResponseCode() == 0) {
                m0.g("BillingClient", "Reconnection succeeded with result: " + billingResult.getResponseCode());
            } else {
                m0.h("BillingClient", "Reconnection failed with result: " + billingResult.getResponseCode());
            }
        } catch (Exception e3) {
            if (e3 instanceof InterruptedException) {
                Thread.currentThread().interrupt();
            }
            m0.i("BillingClient", "Error during reconnection attempt: ", e3);
        }
        return zzbm();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean zzbl(long j11) throws InterruptedException {
        long jMax;
        f0 f0Var = this.zzK;
        if (f0Var == null) {
            throw new NullPointerException("ticker");
        }
        long jA = f0Var.a();
        long j12 = 30000;
        int i5 = 1;
        long jConvert = 30000;
        while (i5 <= 3) {
            try {
                jMax = Math.max(0L, jConvert);
            } catch (Exception e3) {
                if (e3 instanceof InterruptedException) {
                    Thread.currentThread().interrupt();
                }
                m0.i("BillingClient", "Error during reconnection attempt: ", e3);
            }
            if (jMax <= 0) {
                m0.h("BillingClient", "No time remaining for reconnection attempt.");
                return zzbm();
            }
            BillingResult billingResult = (BillingResult) zzaz(i5).get(jMax, TimeUnit.MILLISECONDS);
            if (billingResult.getResponseCode() == 0) {
                m0.g("BillingClient", "Reconnection succeeded with result: " + billingResult.getResponseCode());
                return zzbm();
            }
            m0.h("BillingClient", "Reconnection failed with result: " + billingResult.getResponseCode());
            TimeUnit timeUnit = TimeUnit.MILLISECONDS;
            long jA2 = (f0Var.a() - jA) + 0;
            TimeUnit timeUnit2 = TimeUnit.NANOSECONDS;
            jConvert = j12 - timeUnit.convert(jA2, timeUnit2);
            long j13 = j12;
            long jPow = ((long) Math.pow(2.0d, i5 - 1)) * 1000;
            if (jConvert < jPow) {
                m0.h("BillingClient", "Reconnection failed due to timeout limit reached.");
                return zzbm();
            }
            if (i5 < 3 && jPow > 0) {
                try {
                    Thread.sleep(jPow);
                    jConvert = j13 - timeUnit.convert((f0Var.a() - jA) + 0, timeUnit2);
                } catch (InterruptedException e11) {
                    Thread.currentThread().interrupt();
                    m0.i("BillingClient", "Error sleeping during reconnection attempt: ", e11);
                }
            }
            i5++;
            j12 = j13;
        }
        m0.h("BillingClient", "Max retries reached.");
        return zzbm();
    }

    private final boolean zzbm() {
        boolean z11;
        synchronized (this.zza) {
            try {
                z11 = false;
                if (this.zzb == 2 && this.zzi != null && this.zzj != null) {
                    z11 = true;
                }
            } finally {
            }
        }
        return z11;
    }

    private static final String zzbn(int i5) {
        return i5 != 0 ? i5 != 1 ? i5 != 2 ? "CLOSED" : "CONNECTED" : "CONNECTING" : "DISCONNECTED";
    }

    private static final void zzbo(b5 b5Var, Context context) {
        try {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            if (activityManager != null) {
                ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
                activityManager.getMemoryInfo(memoryInfo);
                int i5 = (int) (memoryInfo.totalMem / 1048576);
                b5Var.d();
                c5.w((c5) b5Var.f33564b, i5);
                String str = Build.BRAND;
                b5Var.d();
                c5.s((c5) b5Var.f33564b);
                String str2 = Build.MODEL;
                b5Var.d();
                c5.v((c5) b5Var.f33564b);
                String str3 = Build.MANUFACTURER;
                b5Var.d();
                c5.u((c5) b5Var.f33564b);
                String str4 = Build.FINGERPRINT;
                b5Var.d();
                c5.t((c5) b5Var.f33564b);
            }
        } catch (RuntimeException e3) {
            m0.i("BillingClient", "Runtime error while populating device info.", e3);
        }
    }

    private final zzdz zzbp(int i5, BillingResult billingResult, w4 w4Var, String str, Exception exc) {
        zzbu(w4Var, 9, billingResult, zzcy.zza(exc));
        m0.i("BillingClient", str, exc);
        return new zzdz(billingResult, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:104:0x014d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0159  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final zzdz zzbq(String str, boolean z11, int i5) {
        p pVar;
        int i11;
        int i12;
        Bundle bundleL0;
        BillingResult billingResultG;
        w4 w4Var;
        BillingClientImpl billingClientImpl = this;
        m0.g("BillingClient", "Querying owned items, item type: ".concat(String.valueOf(str)));
        ArrayList arrayList = new ArrayList();
        boolean z12 = billingClientImpl.zzp;
        boolean z13 = billingClientImpl.zzw;
        boolean zIsEnabledForOneTimeProducts = billingClientImpl.zzE.isEnabledForOneTimeProducts();
        boolean zIsEnabledForPrepaidPlans = billingClientImpl.zzE.isEnabledForPrepaidPlans();
        long jLongValue = billingClientImpl.zzJ.longValue();
        Bundle bundle = new Bundle();
        m0.b(billingClientImpl.zzc, billingClientImpl.zzd, bundle, jLongValue);
        if (z12 && zIsEnabledForOneTimeProducts) {
            bundle.putBoolean("enablePendingPurchases", true);
        }
        if (z13 && zIsEnabledForPrepaidPlans) {
            bundle.putBoolean("enablePendingPurchaseForSubscriptions", true);
        }
        if (z11) {
            bundle.putBoolean("includeSuspendedSubscriptions", true);
        }
        String string = null;
        do {
            try {
                synchronized (billingClientImpl.zza) {
                    pVar = billingClientImpl.zzi;
                }
                if (pVar == null) {
                    return billingClientImpl.zzbp(9, zzdc.zzj, w4.SERVICE_RESET_TO_NULL, "Service has been reset to null", null);
                }
                if (z11 && !billingClientImpl.zzC) {
                    return billingClientImpl.zzbp(9, zzdc.zzw, w4.INCLUDE_SUSPENDED_SUBSCRIPTIONS_NOT_SUPPORTED, "Include suspended subscriptions is not supported", null);
                }
                if (billingClientImpl.zzp) {
                    if (billingClientImpl.zzC) {
                        i12 = 26;
                    } else if (billingClientImpl.zzB) {
                        i12 = 24;
                    } else if (billingClientImpl.zzw) {
                        i12 = 19;
                    } else {
                        i11 = 9;
                        bundleL0 = ((n) pVar).l0(i11, billingClientImpl.zzg.getPackageName(), str, string, bundle);
                    }
                    i11 = i12;
                    bundleL0 = ((n) pVar).l0(i11, billingClientImpl.zzg.getPackageName(), str, string, bundle);
                } else {
                    bundleL0 = ((n) pVar).k0(billingClientImpl.zzg.getPackageName(), str, string);
                }
                BillingResult billingResult = zzdc.zzh;
                if (bundleL0 == null) {
                    m0.h("BillingClient", "getPurchase() got null owned items list");
                    w4Var = w4.NULL_OWNED_ITEMS_LIST;
                } else {
                    int iA = m0.a("BillingClient", bundleL0);
                    billingResultG = c9.g(iA, m0.f("BillingClient", bundleL0));
                    if (iA != 0) {
                        m0.h("BillingClient", "getPurchase() failed. Response code: " + iA);
                        w4Var = w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                    } else if (bundleL0.containsKey("INAPP_PURCHASE_ITEM_LIST") && bundleL0.containsKey("INAPP_PURCHASE_DATA_LIST") && bundleL0.containsKey("INAPP_DATA_SIGNATURE_LIST")) {
                        ArrayList<String> stringArrayList = bundleL0.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
                        ArrayList<String> stringArrayList2 = bundleL0.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
                        ArrayList<String> stringArrayList3 = bundleL0.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
                        if (stringArrayList == null) {
                            m0.h("BillingClient", "Bundle returned from getPurchase() contains null SKUs list.");
                            w4Var = w4.NULL_SKUS_LIST;
                        } else if (stringArrayList2 == null) {
                            m0.h("BillingClient", "Bundle returned from getPurchase() contains null purchases list.");
                            w4Var = w4.NULL_PURCHASES_LIST;
                        } else if (stringArrayList3 == null) {
                            m0.h("BillingClient", "Bundle returned from getPurchase() contains null signatures list.");
                            w4Var = w4.NULL_SIGNATURES_LIST;
                        } else {
                            billingResultG = zzdc.zzi;
                            w4Var = w4.REASON_UNSPECIFIED;
                        }
                    } else {
                        m0.h("BillingClient", "Bundle returned from getPurchase() doesn't contain required fields.");
                        w4Var = w4.MISSING_REQUIRED_PURCHASE_KEY;
                    }
                    if (billingResultG == zzdc.zzi) {
                        return billingClientImpl.zzbp(9, billingResultG, w4Var, "Purchase bundle invalid", null);
                    }
                    ArrayList<String> stringArrayList4 = bundleL0.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
                    ArrayList<String> stringArrayList5 = bundleL0.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
                    ArrayList<String> stringArrayList6 = bundleL0.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
                    boolean z14 = false;
                    for (int i13 = 0; i13 < stringArrayList5.size(); i13++) {
                        String str2 = stringArrayList5.get(i13);
                        String str3 = stringArrayList6.get(i13);
                        m0.g("BillingClient", "Sku is owned: ".concat(String.valueOf(stringArrayList4.get(i13))));
                        try {
                            Purchase purchase = new Purchase(str2, str3);
                            if (TextUtils.isEmpty(purchase.getPurchaseToken())) {
                                m0.h("BillingClient", "BUG: empty/null token!");
                                z14 = true;
                            }
                            arrayList.add(purchase);
                        } catch (JSONException e3) {
                            return zzbp(9, zzdc.zzh, w4.ERROR_DECODING_PURCHASE_DATA, "Got an exception trying to decode the purchase!", e3);
                        }
                    }
                    billingClientImpl = this;
                    if (z14) {
                        billingClientImpl.zzbs(w4.EMPTY_PURCHASE_TOKEN, 9, billingResult);
                    }
                    string = bundleL0.getString("INAPP_CONTINUATION_TOKEN");
                    m0.g("BillingClient", "Continuation token: ".concat(String.valueOf(string)));
                }
                billingResultG = billingResult;
                if (billingResultG == zzdc.zzi) {
                }
            } catch (DeadObjectException e11) {
                return zzbp(9, zzdc.zzj, w4.GET_PURCHASE_SERVICE_CALL_EXCEPTION, "Got exception trying to get purchases try to reconnect", e11);
            } catch (Exception e12) {
                return billingClientImpl.zzbp(9, zzdc.zzh, w4.GET_PURCHASE_SERVICE_CALL_EXCEPTION, "Got exception trying to get purchases try to reconnect", e12);
            }
        } while (!TextUtils.isEmpty(string));
        return new zzdz(zzdc.zzi, arrayList);
    }

    private final void zzbr(BillingResult billingResult, w4 w4Var, int i5) {
        u4 u4Var = null;
        r4 r4Var = null;
        if (billingResult.getResponseCode() == 0) {
            int i11 = zzcy.zza;
            try {
                s4 s4VarR = u4.r();
                s4VarR.d();
                u4.q((u4) s4VarR.f33564b, 5);
                e5 e5VarQ = f5.q();
                e5VarQ.d();
                f5.r((f5) e5VarQ.f33564b, i5);
                f5 f5Var = (f5) e5VarQ.a();
                s4VarR.d();
                u4.u((u4) s4VarR.f33564b, f5Var);
                u4Var = (u4) s4VarR.a();
            } catch (Exception e3) {
                m0.i("BillingLogger", "Unable to create logging payload", e3);
            }
            zzbe(u4Var);
            return;
        }
        int i12 = zzcy.zza;
        try {
            q4 q4VarT = r4.t();
            v4 v4VarR = x4.r();
            v4VarR.g(billingResult.getResponseCode());
            String debugMessage = billingResult.getDebugMessage();
            v4VarR.d();
            x4.t((x4) v4VarR.f33564b, debugMessage);
            v4VarR.f(w4Var);
            q4VarT.f(v4VarR);
            q4VarT.h(5);
            e5 e5VarQ2 = f5.q();
            e5VarQ2.d();
            f5.r((f5) e5VarQ2.f33564b, i5);
            f5 f5Var2 = (f5) e5VarQ2.a();
            q4VarT.d();
            r4.y((r4) q4VarT.f33564b, f5Var2);
            r4Var = (r4) q4VarT.a();
        } catch (Exception e11) {
            m0.i("BillingLogger", "Unable to create logging payload", e11);
        }
        zzbc(r4Var);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzbs(w4 w4Var, int i5, BillingResult billingResult) {
        try {
            int i11 = zzcy.zza;
            zzbc(zzcy.zzb(w4Var, i5, billingResult, null, z4.BROADCAST_ACTION_UNSPECIFIED));
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    private final void zzbt(w4 w4Var, int i5, BillingResult billingResult, long j11) {
        try {
            int i11 = zzcy.zza;
            try {
                this.zzh.zzc(zzcy.zzb(w4Var, 2, billingResult, null, z4.BROADCAST_ACTION_UNSPECIFIED), this.zzm, j11);
            } catch (Throwable th2) {
                m0.i("BillingClient", "Unable to log.", th2);
            }
        } catch (Throwable th3) {
            m0.i("BillingClient", "Unable to log.", th3);
        }
    }

    private final void zzbu(w4 w4Var, int i5, BillingResult billingResult, String str) {
        try {
            int i11 = zzcy.zza;
            zzbc(zzcy.zzb(w4Var, i5, billingResult, str, z4.BROADCAST_ACTION_UNSPECIFIED));
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    private final void zzbv(w4 w4Var, int i5, BillingResult billingResult, long j11, boolean z11) {
        try {
            int i11 = zzcy.zza;
            zzbd(zzcy.zzb(w4Var, 2, billingResult, null, z4.BROADCAST_ACTION_UNSPECIFIED), j11, z11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    private final void zzbw(w4 w4Var, int i5, BillingResult billingResult, String str, long j11, boolean z11) {
        try {
            int i11 = zzcy.zza;
            zzbd(zzcy.zzb(w4Var, 2, billingResult, str, z4.BROADCAST_ACTION_UNSPECIFIED), j11, z11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    private void zzbx(int i5) {
        try {
            int i11 = zzcy.zza;
            zzbe(zzcy.zzc(i5, z4.BROADCAST_ACTION_UNSPECIFIED));
        } catch (Throwable th2) {
            m0.i("BillingClient", "Unable to log.", th2);
        }
    }

    public static /* bridge */ /* synthetic */ ResultReceiver zzg(BillingClientImpl billingClientImpl, LaunchExternalLinkResponseListener launchExternalLinkResponseListener) {
        return new zzbt(billingClientImpl, billingClientImpl.zze, launchExternalLinkResponseListener);
    }

    public static /* bridge */ /* synthetic */ BillingResult zzm(Exception exc) {
        return exc instanceof DeadObjectException ? zzdc.zzj : zzdc.zzh;
    }

    public static /* synthetic */ Object zzr(BillingClientImpl billingClientImpl, int i5, u5 u5Var) {
        billingClientImpl.zzbi(new zzbs(billingClientImpl, u5Var), i5);
        return "reconnectIfNeeded";
    }

    public static /* synthetic */ Object zzs(BillingClientImpl billingClientImpl, ConsumeResponseListener consumeResponseListener, ConsumeParams consumeParams) throws Throwable {
        if (billingClientImpl.zzbl(30000L)) {
            billingClientImpl.zzaO(consumeParams, consumeResponseListener);
            return null;
        }
        BillingResult billingResult = zzdc.zzj;
        billingClientImpl.zzbs(w4.SERVICE_CONNECTION_NOT_READY, 4, billingResult);
        consumeResponseListener.onConsumeResponse(billingResult, consumeParams.getPurchaseToken());
        return null;
    }

    public static Object zzt(BillingClientImpl billingClientImpl, ProductDetailsResponseListener productDetailsResponseListener, QueryProductDetailsParams queryProductDetailsParams) throws JSONException {
        if (!billingClientImpl.zzbl(30000L)) {
            BillingResult billingResult = zzdc.zzj;
            billingClientImpl.zzbs(w4.SERVICE_CONNECTION_NOT_READY, 7, billingResult);
            i0 i0Var = k0.f33433b;
            o0 o0Var = o0.f33465e;
            productDetailsResponseListener.onProductDetailsResponse(billingResult, new QueryProductDetailsResult(o0Var, o0Var));
            return null;
        }
        if (billingClientImpl.zzu) {
            zzcg zzcgVarZzh = billingClientImpl.zzh(queryProductDetailsParams);
            productDetailsResponseListener.onProductDetailsResponse(zzdc.zza(zzcgVarZzh.zza(), zzcgVarZzh.zzb()), new QueryProductDetailsResult(zzcgVarZzh.zzc(), zzcgVarZzh.zzd()));
            return null;
        }
        m0.h("BillingClient", "Querying product details is not supported.");
        BillingResult billingResult2 = zzdc.zzr;
        billingClientImpl.zzbs(w4.PRODUCT_DETAILS_NOT_SUPPORTED, 7, billingResult2);
        i0 i0Var2 = k0.f33433b;
        o0 o0Var2 = o0.f33465e;
        productDetailsResponseListener.onProductDetailsResponse(billingResult2, new QueryProductDetailsResult(o0Var2, o0Var2));
        return null;
    }

    public static /* synthetic */ Object zzu(BillingClientImpl billingClientImpl, AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener, AcknowledgePurchaseParams acknowledgePurchaseParams) throws Exception {
        billingClientImpl.zzaA(acknowledgePurchaseResponseListener, acknowledgePurchaseParams);
        return null;
    }

    public static /* synthetic */ Object zzv(BillingClientImpl billingClientImpl, Bundle bundle, Activity activity, ResultReceiver resultReceiver) throws Exception {
        billingClientImpl.zzaC(bundle, activity, resultReceiver);
        return null;
    }

    public static /* synthetic */ Object zzw(BillingClientImpl billingClientImpl, BillingConfigResponseListener billingConfigResponseListener) throws Exception {
        billingClientImpl.zzaB(billingConfigResponseListener);
        return null;
    }

    @Override // com.android.billingclient.api.BillingClient
    public void acknowledgePurchase(final AcknowledgePurchaseParams acknowledgePurchaseParams, final AcknowledgePurchaseResponseListener acknowledgePurchaseResponseListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzaj
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzu(this.zza, acknowledgePurchaseResponseListener, acknowledgePurchaseParams);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzak
            @Override // java.lang.Runnable
            public final void run() {
                BillingClientImpl.zzR(this.zza, acknowledgePurchaseResponseListener);
            }
        }, zzav(), zzJ()) == null) {
            BillingResult billingResultZzay = zzay();
            zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 3, billingResultZzay);
            acknowledgePurchaseResponseListener.onAcknowledgePurchaseResponse(billingResultZzay);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public void consumeAsync(final ConsumeParams consumeParams, final ConsumeResponseListener consumeResponseListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzba
            @Override // java.util.concurrent.Callable
            public final Object call() throws Throwable {
                BillingClientImpl.zzs(this.zza, consumeResponseListener, consumeParams);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbb
            @Override // java.lang.Runnable
            public final void run() {
                BillingClientImpl.zzL(this.zza, consumeResponseListener, consumeParams);
            }
        }, zzav(), zzJ()) == null) {
            BillingResult billingResultZzay = zzay();
            zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 4, billingResultZzay);
            consumeResponseListener.onConsumeResponse(billingResultZzay, consumeParams.getPurchaseToken());
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzf
    public void createAlternativeBillingOnlyReportingDetailsAsync(final AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzau
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzG(this.zza, alternativeBillingOnlyReportingDetailsListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzav
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzaT(alternativeBillingOnlyReportingDetailsListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, zzav(), zzJ()) == null) {
            zzaT(alternativeBillingOnlyReportingDetailsListener, zzay(), w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzh
    public void createBillingProgramReportingDetailsAsync(final BillingProgramReportingDetailsParams billingProgramReportingDetailsParams, final BillingProgramReportingDetailsListener billingProgramReportingDetailsListener) {
        try {
        } catch (Exception e3) {
            e = e3;
        }
        try {
            zzaN(new Callable() { // from class: com.android.billingclient.api.zzao
                @Override // java.util.concurrent.Callable
                public final Object call() throws Exception {
                    BillingClientImpl.zzH(this.zza, billingProgramReportingDetailsListener, billingProgramReportingDetailsParams);
                    return null;
                }
            }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzap
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.zzaU(billingProgramReportingDetailsListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
                }
            }, zzav());
        } catch (Exception e11) {
            e = e11;
            zzaU(billingProgramReportingDetailsListener, zzay(), w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, e);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzj
    public void createExternalOfferReportingDetailsAsync(final ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzaw
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzE(this.zza, externalOfferReportingDetailsListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbe
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzaV(externalOfferReportingDetailsListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, zzav(), zzJ()) == null) {
            zzaV(externalOfferReportingDetailsListener, zzay(), w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public void endConnection() {
        zzbx(12);
        synchronized (this.zza) {
            try {
            } finally {
                try {
                    m0.g("BillingClient", "Unbinding from service.");
                    zzbj();
                } catch (Throwable th2) {
                    m0.i("BillingClient", "There was an exception while unbinding from the service while ending connection!", th2);
                }
                try {
                    zzbh();
                } finally {
                    try {
                    } finally {
                    }
                }
            }
            if (this.zzf != null) {
                this.zzf.zzh();
                m0.g("BillingClient", "Unbinding from service.");
                zzbj();
                zzbh();
            } else {
                m0.g("BillingClient", "Unbinding from service.");
                zzbj();
                zzbh();
            }
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzm
    public void getBillingConfigAsync(GetBillingConfigParams getBillingConfigParams, final BillingConfigResponseListener billingConfigResponseListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzaq
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzw(this.zza, billingConfigResponseListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzar
            @Override // java.lang.Runnable
            public final void run() {
                BillingClientImpl.zzN(this.zza, billingConfigResponseListener);
            }
        }, zzav(), zzJ()) == null) {
            BillingResult billingResultZzay = zzay();
            zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 13, billingResultZzay);
            billingConfigResponseListener.onBillingConfigResponse(billingResultZzay, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final int getConnectionState() {
        int i5;
        synchronized (this.zza) {
            i5 = this.zzb;
        }
        return i5;
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzf
    public void isAlternativeBillingOnlyAvailableAsync(final AlternativeBillingOnlyAvailabilityListener alternativeBillingOnlyAvailabilityListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzax
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzI(this.zza, alternativeBillingOnlyAvailabilityListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzay
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzaQ(alternativeBillingOnlyAvailabilityListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, zzav(), zzJ()) == null) {
            zzaQ(alternativeBillingOnlyAvailabilityListener, zzay(), w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzh
    public void isBillingProgramAvailableAsync(final int i5, final BillingProgramAvailabilityListener billingProgramAvailabilityListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzal
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzC(this.zza, billingProgramAvailabilityListener, i5);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzam
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzaR(billingProgramAvailabilityListener, i5, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, zzav(), zzJ()) == null) {
            zzaR(billingProgramAvailabilityListener, i5, zzay(), w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzj
    public void isExternalOfferAvailableAsync(final ExternalOfferAvailabilityListener externalOfferAvailabilityListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzbk
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzB(this.zza, externalOfferAvailabilityListener);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzae
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzaW(externalOfferAvailabilityListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, zzav(), zzJ()) == null) {
            zzaW(externalOfferAvailabilityListener, zzay(), w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, null);
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult isFeatureSupported(String str) {
        if (!zzbk(3000L)) {
            BillingResult billingResult = zzdc.zzj;
            if (billingResult.getResponseCode() != 0) {
                zzbs(w4.SERVICE_CONNECTION_NOT_READY, 5, billingResult);
                return billingResult;
            }
            zzbx(5);
            return billingResult;
        }
        int i5 = zzdc.zzI;
        switch (str.hashCode()) {
            case -422092961:
                if (str.equals(BillingClient.FeatureType.SUBSCRIPTIONS_UPDATE)) {
                    BillingResult billingResult2 = this.zzl ? zzdc.zzi : zzdc.zzm;
                    zzbr(billingResult2, w4.SUBSCRIPTIONS_UPDATE_NOT_SUPPORTED, 3);
                    return billingResult2;
                }
                break;
            case 96321:
                if (str.equals("aaa")) {
                    BillingResult billingResult3 = this.zzs ? zzdc.zzi : zzdc.zzo;
                    zzbr(billingResult3, w4.CROSS_APP_NOT_SUPPORTED, 6);
                    return billingResult3;
                }
                break;
            case 97314:
                if (str.equals(BillingClient.FeatureType.IN_APP_MESSAGING)) {
                    BillingResult billingResult4 = this.zzq ? zzdc.zzi : zzdc.zzs;
                    zzbr(billingResult4, w4.IN_APP_MESSAGE_NOT_SUPPORTED, 5);
                    return billingResult4;
                }
                break;
            case 98307:
                if (str.equals("ccc")) {
                    BillingResult billingResult5 = this.zzt ? zzdc.zzi : zzdc.zzp;
                    zzbr(billingResult5, w4.MULTI_ITEM_NOT_SUPPORTED, 8);
                    return billingResult5;
                }
                break;
            case 99300:
                if (str.equals("ddd")) {
                    BillingResult billingResult6 = this.zzr ? zzdc.zzi : zzdc.zzq;
                    zzbr(billingResult6, w4.OFFER_ID_TOKEN_NOT_SUPPORTED, 7);
                    return billingResult6;
                }
                break;
            case 100293:
                if (str.equals("eee")) {
                    BillingResult billingResult7 = this.zzt ? zzdc.zzi : zzdc.zzp;
                    zzbr(billingResult7, w4.PBL_FOR_PAYMENTS_GATEWAY_BUYFLOW_NOT_SUPPORTED, 9);
                    return billingResult7;
                }
                break;
            case 101286:
                if (str.equals(BillingClient.FeatureType.PRODUCT_DETAILS)) {
                    BillingResult billingResult8 = this.zzu ? zzdc.zzi : zzdc.zzr;
                    zzbr(billingResult8, w4.PRODUCT_DETAILS_NOT_SUPPORTED, 10);
                    return billingResult8;
                }
                break;
            case 102279:
                if (str.equals(BillingClient.FeatureType.BILLING_CONFIG)) {
                    BillingResult billingResult9 = this.zzv ? zzdc.zzi : zzdc.zzy;
                    zzbr(billingResult9, w4.GET_BILLING_CONFIG_NOT_SUPPORTED, 11);
                    return billingResult9;
                }
                break;
            case 103272:
                if (str.equals("hhh")) {
                    BillingResult billingResult10 = this.zzv ? zzdc.zzi : zzdc.zzz;
                    zzbr(billingResult10, w4.QUERY_PRODUCT_DETAILS_WITH_SERIALIZED_DOCID_NOT_SUPPORTED, 12);
                    return billingResult10;
                }
                break;
            case 104265:
                if (str.equals("iii")) {
                    BillingResult billingResult11 = this.zzx ? zzdc.zzi : zzdc.zzB;
                    zzbr(billingResult11, w4.QUERY_PRODUCT_DETAILS_WITH_DEVELOPER_SPECIFIED_ACCOUNT_NOT_SUPPORTED, 13);
                    return billingResult11;
                }
                break;
            case 105258:
                if (str.equals(BillingClient.FeatureType.ALTERNATIVE_BILLING_ONLY)) {
                    BillingResult billingResult12 = this.zzy ? zzdc.zzi : zzdc.zzC;
                    zzbr(billingResult12, w4.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED, 14);
                    return billingResult12;
                }
                break;
            case 106251:
                if (str.equals(BillingClient.FeatureType.EXTERNAL_OFFER)) {
                    BillingResult billingResult13 = this.zzB ? zzdc.zzi : zzdc.zzt;
                    zzbr(billingResult13, w4.EXTERNAL_OFFER_NOT_SUPPORTED, 18);
                    return billingResult13;
                }
                break;
            case 107244:
                if (str.equals("lll")) {
                    BillingResult billingResult14 = this.zzA ? zzdc.zzi : zzdc.zzu;
                    zzbr(billingResult14, w4.MULTI_ITEM_WITH_SEASON_PASS_NOT_SUPPORTED, 19);
                    return billingResult14;
                }
                break;
            case 108237:
                if (str.equals("mmm")) {
                    BillingResult billingResult15 = this.zzB ? zzdc.zzi : zzdc.zzv;
                    zzbr(billingResult15, w4.AUTO_PAY_NOT_SUPPORTED, 20);
                    return billingResult15;
                }
                break;
            case 109230:
                if (str.equals(BillingClient.FeatureType.INCLUDE_SUSPENDED_SUBSCRIPTIONS)) {
                    BillingResult billingResult16 = this.zzC ? zzdc.zzi : zzdc.zzw;
                    zzbr(billingResult16, w4.INCLUDE_SUSPENDED_SUBSCRIPTIONS_NOT_SUPPORTED, 21);
                    return billingResult16;
                }
                break;
            case 207616302:
                if (str.equals(BillingClient.FeatureType.PRICE_CHANGE_CONFIRMATION)) {
                    BillingResult billingResult17 = this.zzo ? zzdc.zzi : zzdc.zzn;
                    zzbr(billingResult17, w4.PRICE_CHANGE_CONFIRMATION_NOT_SUPPORTED, 4);
                    return billingResult17;
                }
                break;
            case 1987365622:
                if (str.equals(BillingClient.FeatureType.SUBSCRIPTIONS)) {
                    BillingResult billingResult18 = this.zzk ? zzdc.zzi : zzdc.zzl;
                    zzbr(billingResult18, w4.SUBSCRIPTIONS_NOT_SUPPORTED, 2);
                    return billingResult18;
                }
                break;
        }
        m0.h("BillingClient", "Unsupported feature: ".concat(str));
        BillingResult billingResult19 = zzdc.zzx;
        zzbr(billingResult19, w4.UNKNOWN_FEATURE, 1);
        return billingResult19;
    }

    @Override // com.android.billingclient.api.BillingClient
    public final boolean isReady() {
        if (this.zzF) {
            return true;
        }
        return zzbm();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:210:0x059f  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x05aa  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x05b2  */
    /* JADX WARN: Removed duplicated region for block: B:226:0x05f1  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x05fe  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x0601  */
    @Override // com.android.billingclient.api.BillingClient
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public BillingResult launchBillingFlow(Activity activity, BillingFlowParams billingFlowParams) {
        boolean zZzd;
        String productId;
        String productType;
        long j11;
        String str;
        Future futureZzK;
        long j12;
        long j13;
        long j14;
        w4 w4VarA;
        String string;
        w4 w4Var;
        Object obj;
        String str2;
        boolean z11;
        String str3;
        boolean z12;
        boolean z13;
        Intent intent;
        final int i5;
        int i11;
        Iterator it;
        int i12;
        long jNextLong = new Random().nextLong();
        if (this.zzf == null || this.zzf.zzf() == null) {
            w4 w4Var2 = w4.MISSING_LISTENER;
            BillingResult billingResult = zzdc.zzD;
            zzbt(w4Var2, 2, billingResult, jNextLong);
            return billingResult;
        }
        if (billingFlowParams.getDeveloperBillingOptionParams() != null && this.zzf.zzd() == null) {
            w4 w4Var3 = w4.MISSING_DEVELOPER_PROVIDED_BILLING_LISTENER;
            BillingResult billingResult2 = zzdc.zzH;
            zzbt(w4Var3, 2, billingResult2, jNextLong);
            return billingResult2;
        }
        if (!zzbk(3000L)) {
            w4 w4Var4 = w4.SERVICE_CONNECTION_NOT_READY;
            BillingResult billingResult3 = zzdc.zzj;
            zzbt(w4Var4, 2, billingResult3, jNextLong);
            zzn(billingResult3);
            return billingResult3;
        }
        synchronized (this.zza) {
            try {
                zZzd = this.zzj != null ? this.zzj.zzd() : false;
            } finally {
            }
        }
        ArrayList arrayListZzj = billingFlowParams.zzj();
        List listZzk = billingFlowParams.zzk();
        Iterator it2 = arrayListZzj.iterator();
        SkuDetails skuDetails = (SkuDetails) (it2.hasNext() ? it2.next() : null);
        Iterator it3 = listZzk.iterator();
        BillingFlowParams.ProductDetailsParams productDetailsParams = (BillingFlowParams.ProductDetailsParams) (it3.hasNext() ? it3.next() : null);
        if (skuDetails != null) {
            productId = skuDetails.getSku();
            productType = skuDetails.getType();
        } else {
            productId = productDetailsParams.zza().getProductId();
            productType = productDetailsParams.zza().getProductType();
        }
        if (productType.equals("subs") && !this.zzk) {
            m0.h("BillingClient", "Current client doesn't support subscriptions.");
            w4 w4Var5 = w4.SUBSCRIPTIONS_NOT_SUPPORTED;
            BillingResult billingResult4 = zzdc.zzl;
            zzbv(w4Var5, 2, billingResult4, jNextLong, zZzd);
            zzn(billingResult4);
            return billingResult4;
        }
        if (billingFlowParams.zzu() && !this.zzn) {
            m0.h("BillingClient", "Current client doesn't support extra params for buy intent.");
            w4 w4Var6 = w4.EXTRA_PARAMS_NOT_SUPPORTED;
            BillingResult billingResult5 = zzdc.zzf;
            zzbv(w4Var6, 2, billingResult5, jNextLong, zZzd);
            zzn(billingResult5);
            return billingResult5;
        }
        if (arrayListZzj.size() > 1 && !this.zzt) {
            m0.h("BillingClient", "Current client doesn't support multi-item purchases.");
            w4 w4Var7 = w4.MULTI_ITEM_NOT_SUPPORTED;
            BillingResult billingResult6 = zzdc.zzp;
            zzbv(w4Var7, 2, billingResult6, jNextLong, zZzd);
            zzn(billingResult6);
            return billingResult6;
        }
        if (!listZzk.isEmpty() && !this.zzu) {
            m0.h("BillingClient", "Current client doesn't support purchases with ProductDetails.");
            w4 w4Var8 = w4.PRODUCT_DETAILS_NOT_SUPPORTED;
            BillingResult billingResult7 = zzdc.zzr;
            zzbv(w4Var8, 2, billingResult7, jNextLong, zZzd);
            zzn(billingResult7);
            return billingResult7;
        }
        BillingResult billingResultZzd = billingFlowParams.zzd();
        if (billingResultZzd != zzdc.zzi) {
            zzbv(w4.INVALID_BILLING_FLOW_PARAMS, 2, billingResultZzd, jNextLong, zZzd);
            zzn(billingResultZzd);
            return billingResultZzd;
        }
        if (this.zzn) {
            boolean z14 = this.zzp;
            boolean z15 = this.zzw;
            boolean zIsEnabledForOneTimeProducts = this.zzE.isEnabledForOneTimeProducts();
            boolean zIsEnabledForPrepaidPlans = this.zzE.isEnabledForPrepaidPlans();
            boolean z16 = this.zzG;
            String str4 = this.zzc;
            String str5 = this.zzd;
            boolean z17 = zZzd;
            long jLongValue = this.zzJ.longValue();
            String packageName = this.zzg.getPackageName();
            int i13 = m0.f33450a;
            final String str6 = productId;
            final Bundle bundle = new Bundle();
            m0.b(str4, str5, bundle, jLongValue);
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
                str2 = null;
            } else {
                billingFlowParams.zzg();
                str2 = null;
                bundle.putString("oldSkuPurchaseId", null);
            }
            if (!TextUtils.isEmpty(billingFlowParams.zzi())) {
                bundle.putString("originalExternalTransactionId", billingFlowParams.zzi());
            }
            if (!TextUtils.isEmpty(str2)) {
                bundle.putString("paymentsPurchaseParams", str2);
            }
            if (z14 && zIsEnabledForOneTimeProducts) {
                z11 = true;
                bundle.putBoolean("enablePendingPurchases", true);
            } else {
                z11 = true;
            }
            if (z15 && zIsEnabledForPrepaidPlans) {
                bundle.putBoolean("enablePendingPurchaseForSubscriptions", z11);
            }
            if (z16 || billingFlowParams.getDeveloperBillingOptionParams() != null) {
                bundle.putBoolean("enableAlternativeBilling", z11);
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
            }
            ArrayList arrayList = new ArrayList();
            Iterator it4 = billingFlowParams.zzk().iterator();
            while (it4.hasNext()) {
                BillingFlowParams.ProductDetailsParams productDetailsParams2 = (BillingFlowParams.ProductDetailsParams) it4.next();
                if (productDetailsParams2.getSubscriptionProductReplacementParams() != null) {
                    String productId2 = productDetailsParams2.zza().getProductId();
                    BillingFlowParams.ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams = productDetailsParams2.getSubscriptionProductReplacementParams();
                    v1 v1VarQ = w1.q();
                    d2 d2VarQ = e2.q();
                    Iterator it5 = it4;
                    long j15 = jNextLong;
                    d2VarQ.d();
                    e2.r((e2) d2VarQ.f33564b, "subs:" + packageName + ":" + productId2);
                    v1VarQ.d();
                    w1.r((w1) v1VarQ.f33564b, (e2) d2VarQ.a());
                    d2 d2VarQ2 = e2.q();
                    String str7 = "subs:" + packageName + ":" + subscriptionProductReplacementParams.getOldProductId();
                    d2VarQ2.d();
                    e2.r((e2) d2VarQ2.f33564b, str7);
                    v1VarQ.d();
                    w1.s((w1) v1VarQ.f33564b, (e2) d2VarQ2.a());
                    switch (subscriptionProductReplacementParams.getReplacementMode()) {
                        case 1:
                            i12 = 2;
                            break;
                        case 2:
                            i12 = 3;
                            break;
                        case 3:
                            i12 = 4;
                            break;
                        case 4:
                            i12 = 6;
                            break;
                        case 5:
                            i12 = 7;
                            break;
                        case 6:
                            i12 = 8;
                            break;
                        case 7:
                            i12 = 9;
                            break;
                        default:
                            i12 = 1;
                            break;
                    }
                    v1VarQ.d();
                    w1.t((w1) v1VarQ.f33564b, i12);
                    arrayList.add((w1) v1VarQ.a());
                    it4 = it5;
                    jNextLong = j15;
                }
            }
            j11 = jNextLong;
            if (!arrayList.isEmpty()) {
                x1 x1VarQ = y1.q();
                x1VarQ.d();
                y1.r((y1) x1VarQ.f33564b, arrayList);
                bundle.putByteArray("subscriptionProductReplacementParamsList", ((y1) x1VarQ.a()).b());
            }
            if (arrayListZzj.isEmpty()) {
                str3 = productType;
                z12 = true;
                ArrayList<String> arrayList2 = new ArrayList<>(listZzk.size() - 1);
                ArrayList<String> arrayList3 = new ArrayList<>(listZzk.size() - 1);
                ArrayList<String> arrayList4 = new ArrayList<>();
                ArrayList<String> arrayList5 = new ArrayList<>();
                ArrayList<String> arrayList6 = new ArrayList<>();
                ArrayList<Integer> arrayList7 = new ArrayList<>();
                for (int i14 = 0; i14 < listZzk.size(); i14++) {
                    BillingFlowParams.ProductDetailsParams productDetailsParams3 = (BillingFlowParams.ProductDetailsParams) listZzk.get(i14);
                    ProductDetails productDetailsZza = productDetailsParams3.zza();
                    if (!productDetailsZza.zzb().isEmpty()) {
                        arrayList4.add(productDetailsZza.zzb());
                    }
                    String strZzb = productDetailsParams3.zzb();
                    arrayList5.add(strZzb);
                    String strZzc = productDetailsZza.zzc(strZzb);
                    if (!TextUtils.isEmpty(strZzc)) {
                        arrayList6.add(strZzc);
                    }
                    if (i14 > 0) {
                        arrayList2.add(((BillingFlowParams.ProductDetailsParams) listZzk.get(i14)).zza().getProductId());
                        arrayList3.add(((BillingFlowParams.ProductDetailsParams) listZzk.get(i14)).zza().getProductType());
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
                ArrayList<String> arrayList9 = new ArrayList<>();
                ArrayList<String> arrayList10 = new ArrayList<>();
                ArrayList<Integer> arrayList11 = new ArrayList<>();
                ArrayList<String> arrayList12 = new ArrayList<>();
                Iterator it6 = arrayListZzj.iterator();
                boolean z18 = false;
                boolean z19 = false;
                boolean z21 = false;
                boolean z22 = false;
                while (it6.hasNext()) {
                    SkuDetails skuDetails2 = (SkuDetails) it6.next();
                    if (skuDetails2.zzf().isEmpty()) {
                        it = it6;
                    } else {
                        it = it6;
                        arrayList8.add(skuDetails2.zzf());
                    }
                    String strZzc2 = skuDetails2.zzc();
                    boolean z23 = z18;
                    String strZzb2 = skuDetails2.zzb();
                    int iZza = skuDetails2.zza();
                    String str8 = productType;
                    String strZze = skuDetails2.zze();
                    arrayList9.add(strZzc2);
                    boolean z24 = z23 | (!TextUtils.isEmpty(strZzc2));
                    arrayList10.add(strZzb2);
                    z19 |= !TextUtils.isEmpty(strZzb2);
                    arrayList11.add(Integer.valueOf(iZza));
                    z21 |= iZza != 0;
                    z22 |= !TextUtils.isEmpty(strZze);
                    arrayList12.add(strZze);
                    z18 = z24;
                    it6 = it;
                    productType = str8;
                }
                boolean z25 = z18;
                str3 = productType;
                if (!arrayList8.isEmpty()) {
                    bundle.putStringArrayList("skuDetailsTokens", arrayList8);
                }
                if (z25) {
                    bundle.putStringArrayList("SKU_OFFER_ID_TOKEN_LIST", arrayList9);
                }
                if (z19) {
                    bundle.putStringArrayList("SKU_OFFER_ID_LIST", arrayList10);
                }
                if (z21) {
                    bundle.putIntegerArrayList("SKU_OFFER_TYPE_LIST", arrayList11);
                }
                if (z22) {
                    bundle.putStringArrayList("SKU_SERIALIZED_DOCID_LIST", arrayList12);
                }
                z12 = true;
                if (arrayListZzj.size() > 1) {
                    ArrayList<String> arrayList13 = new ArrayList<>(arrayListZzj.size() - 1);
                    ArrayList<String> arrayList14 = new ArrayList<>(arrayListZzj.size() - 1);
                    for (int i15 = 1; i15 < arrayListZzj.size(); i15++) {
                        arrayList13.add(((SkuDetails) arrayListZzj.get(i15)).getSku());
                        arrayList14.add(((SkuDetails) arrayListZzj.get(i15)).getType());
                    }
                    bundle.putStringArrayList("additionalSkus", arrayList13);
                    bundle.putStringArrayList("additionalSkuTypes", arrayList14);
                }
            }
            if (bundle.containsKey("SKU_OFFER_ID_TOKEN_LIST") && !this.zzr) {
                w4 w4Var9 = w4.OFFER_ID_TOKEN_NOT_SUPPORTED;
                BillingResult billingResult8 = zzdc.zzq;
                zzbv(w4Var9, 2, billingResult8, j11, z17);
                zzn(billingResult8);
                return billingResult8;
            }
            zZzd = z17;
            if (skuDetails != null && !TextUtils.isEmpty(skuDetails.zzd())) {
                bundle.putString("skuPackageName", skuDetails.zzd());
            } else if (productDetailsParams == null || TextUtils.isEmpty(productDetailsParams.zza().zza())) {
                str = null;
                z13 = false;
                if (!TextUtils.isEmpty(str)) {
                    bundle.putString("accountName", str);
                }
                intent = activity.getIntent();
                if (intent != null) {
                    m0.h("BillingClient", "Activity's intent is null.");
                } else if (!TextUtils.isEmpty(intent.getStringExtra("PROXY_PACKAGE"))) {
                    String stringExtra = intent.getStringExtra("PROXY_PACKAGE");
                    bundle.putString("proxyPackage", stringExtra);
                    try {
                        bundle.putString("proxyPackageVersion", this.zzg.getPackageManager().getPackageInfo(stringExtra, 0).versionName);
                    } catch (PackageManager.NameNotFoundException unused) {
                        bundle.putString("proxyPackageVersion", "package not found");
                    }
                }
                if (!this.zzu && !listZzk.isEmpty()) {
                    i11 = 17;
                } else if (this.zzs || !z13) {
                    i5 = !this.zzp ? 9 : 6;
                    final BillingFlowParams billingFlowParams2 = billingFlowParams;
                    final String str9 = str3;
                    futureZzK = zzK(new Callable() { // from class: com.android.billingclient.api.zzaf
                        @Override // java.util.concurrent.Callable
                        public final Object call() {
                            return this.zza.zzat(i5, str6, str9, billingFlowParams2, bundle);
                        }
                    }, 5000L, null, this.zze, zzJ());
                    j12 = billingFlowParams2;
                } else {
                    i11 = 15;
                }
                i5 = i11;
                final BillingFlowParams billingFlowParams22 = billingFlowParams;
                final String str92 = str3;
                futureZzK = zzK(new Callable() { // from class: com.android.billingclient.api.zzaf
                    @Override // java.util.concurrent.Callable
                    public final Object call() {
                        return this.zza.zzat(i5, str6, str92, billingFlowParams22, bundle);
                    }
                }, 5000L, null, this.zze, zzJ());
                j12 = billingFlowParams22;
            } else {
                bundle.putString("skuPackageName", productDetailsParams.zza().zza());
            }
            z13 = z12;
            str = null;
            if (!TextUtils.isEmpty(str)) {
            }
            intent = activity.getIntent();
            if (intent != null) {
            }
            if (!this.zzu) {
                if (this.zzs) {
                }
                if (!this.zzp) {
                }
                final BillingFlowParams billingFlowParams222 = billingFlowParams;
                final String str922 = str3;
                futureZzK = zzK(new Callable() { // from class: com.android.billingclient.api.zzaf
                    @Override // java.util.concurrent.Callable
                    public final Object call() {
                        return this.zza.zzat(i5, str6, str922, billingFlowParams222, bundle);
                    }
                }, 5000L, null, this.zze, zzJ());
                j12 = billingFlowParams222;
            }
        } else {
            j11 = jNextLong;
            final String str10 = productId;
            final String str11 = productType;
            str = null;
            futureZzK = zzK(new Callable() { // from class: com.android.billingclient.api.zzag
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return this.zza.zzau(str10, str11);
                }
            }, 5000L, null, this.zze, zzJ());
            j12 = jNextLong;
        }
        try {
            if (futureZzK == null) {
                try {
                    w4 w4Var10 = w4.MISSING_RESULT_FROM_EXECUTE_ASYNC;
                    BillingResult billingResult9 = zzdc.zzc;
                    boolean z26 = zZzd;
                    long j16 = j11;
                    try {
                        zzbv(w4Var10, 2, billingResult9, j16, z26);
                        zzn(billingResult9);
                        return billingResult9;
                    } catch (CancellationException e3) {
                        e = e3;
                        zZzd = z26;
                        j14 = j16;
                        m0.i("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                        w4 w4Var11 = w4.LAUNCH_BILLING_FLOW_TIMEOUT;
                        BillingResult billingResult10 = zzdc.zzk;
                        zzbw(w4Var11, 2, billingResult10, zzcy.zza(e), j14, zZzd);
                        zzn(billingResult10);
                        return billingResult10;
                    } catch (TimeoutException e11) {
                        e = e11;
                        zZzd = z26;
                        j14 = j16;
                        m0.i("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                        w4 w4Var112 = w4.LAUNCH_BILLING_FLOW_TIMEOUT;
                        BillingResult billingResult102 = zzdc.zzk;
                        zzbw(w4Var112, 2, billingResult102, zzcy.zza(e), j14, zZzd);
                        zzn(billingResult102);
                        return billingResult102;
                    } catch (Exception e12) {
                        e = e12;
                        zZzd = z26;
                        j13 = j16;
                        m0.i("BillingClient", "Exception while launching billing flow. Try to reconnect", e);
                        w4 w4Var12 = w4.LAUNCH_BILLING_FLOW_EXCEPTION;
                        BillingResult billingResult11 = zzdc.zzj;
                        zzbw(w4Var12, 2, billingResult11, zzcy.zza(e), j13, zZzd);
                        zzn(billingResult11);
                        return billingResult11;
                    }
                } catch (CancellationException e13) {
                    e = e13;
                    j14 = j11;
                    m0.i("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                    w4 w4Var1122 = w4.LAUNCH_BILLING_FLOW_TIMEOUT;
                    BillingResult billingResult1022 = zzdc.zzk;
                    zzbw(w4Var1122, 2, billingResult1022, zzcy.zza(e), j14, zZzd);
                    zzn(billingResult1022);
                    return billingResult1022;
                } catch (TimeoutException e14) {
                    e = e14;
                    j14 = j11;
                    m0.i("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                    w4 w4Var11222 = w4.LAUNCH_BILLING_FLOW_TIMEOUT;
                    BillingResult billingResult10222 = zzdc.zzk;
                    zzbw(w4Var11222, 2, billingResult10222, zzcy.zza(e), j14, zZzd);
                    zzn(billingResult10222);
                    return billingResult10222;
                } catch (Exception e15) {
                    e = e15;
                    j13 = j11;
                }
            } else {
                long j17 = j11;
                Bundle bundle2 = (Bundle) futureZzK.get(5000L, TimeUnit.MILLISECONDS);
                int iA = m0.a("BillingClient", bundle2);
                String strF = m0.f("BillingClient", bundle2);
                if (iA == 0) {
                    Intent intent2 = new Intent(activity, (Class<?>) ProxyBillingActivity.class);
                    intent2.putExtra("BUY_INTENT", (PendingIntent) bundle2.getParcelable("BUY_INTENT"));
                    intent2.putExtra("billingClientTransactionId", j17);
                    intent2.putExtra("wasServiceAutoReconnected", zZzd);
                    activity.startActivity(intent2);
                    return zzdc.zzi;
                }
                m0.h("BillingClient", "Unable to buy item, Error response code: " + iA);
                BillingResult billingResultZza = zzdc.zza(iA, strF);
                try {
                    if (bundle2 == null || (obj = bundle2.get("LOG_REASON")) == null) {
                        w4VarA = w4.REASON_UNSPECIFIED;
                    } else if (obj instanceof Integer) {
                        w4VarA = w4.a(((Integer) obj).intValue());
                    } else {
                        m0.h("BillingClient", "Unexpected type for bundle log reason: " + obj.getClass().getName());
                        w4VarA = w4.REASON_UNSPECIFIED;
                    }
                } catch (Throwable th2) {
                    m0.h("BillingClient", "Failed to get log reason from bundle: ".concat(String.valueOf(th2.getMessage())));
                    w4VarA = w4.REASON_UNSPECIFIED;
                }
                if (w4VarA == w4.REASON_UNSPECIFIED) {
                    w4VarA = w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY;
                }
                w4 w4Var13 = w4VarA;
                try {
                    if (bundle2 != null) {
                        try {
                            string = bundle2.getString("ADDITIONAL_LOG_DETAILS");
                            w4Var = w4Var13;
                        } catch (Throwable th3) {
                            m0.h("BillingClient", "Failed to get additional log details from bundle: ".concat(String.valueOf(th3.getMessage())));
                        }
                        zzbw(w4Var, 2, billingResultZza, string, j17, zZzd);
                        zzn(billingResultZza);
                        return billingResultZza;
                    }
                    zzbw(w4Var, 2, billingResultZza, string, j17, zZzd);
                    zzn(billingResultZza);
                    return billingResultZza;
                } catch (CancellationException e16) {
                    e = e16;
                    j14 = j17;
                    m0.i("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                    w4 w4Var112222 = w4.LAUNCH_BILLING_FLOW_TIMEOUT;
                    BillingResult billingResult102222 = zzdc.zzk;
                    zzbw(w4Var112222, 2, billingResult102222, zzcy.zza(e), j14, zZzd);
                    zzn(billingResult102222);
                    return billingResult102222;
                } catch (TimeoutException e17) {
                    e = e17;
                    j14 = j17;
                    m0.i("BillingClient", "Time out while launching billing flow. Try to reconnect", e);
                    w4 w4Var1122222 = w4.LAUNCH_BILLING_FLOW_TIMEOUT;
                    BillingResult billingResult1022222 = zzdc.zzk;
                    zzbw(w4Var1122222, 2, billingResult1022222, zzcy.zza(e), j14, zZzd);
                    zzn(billingResult1022222);
                    return billingResult1022222;
                } catch (Exception e18) {
                    e = e18;
                    j13 = j17;
                    m0.i("BillingClient", "Exception while launching billing flow. Try to reconnect", e);
                    w4 w4Var122 = w4.LAUNCH_BILLING_FLOW_EXCEPTION;
                    BillingResult billingResult112 = zzdc.zzj;
                    zzbw(w4Var122, 2, billingResult112, zzcy.zza(e), j13, zZzd);
                    zzn(billingResult112);
                    return billingResult112;
                }
                w4Var = w4Var13;
                string = str;
            }
        } catch (CancellationException e19) {
            e = e19;
        } catch (TimeoutException e21) {
            e = e21;
            j14 = j12;
        } catch (Exception e22) {
            e = e22;
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzo
    public void launchExternalLink(final Activity activity, final LaunchExternalLinkParams launchExternalLinkParams, final LaunchExternalLinkResponseListener launchExternalLinkResponseListener) {
        if (activity == null) {
            throw new IllegalArgumentException("Please provide a valid activity.");
        }
        try {
        } catch (Exception e3) {
            e = e3;
        }
        try {
            zzaN(new Callable() { // from class: com.android.billingclient.api.zzas
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    BillingClientImpl.zzD(this.zza, launchExternalLinkResponseListener, launchExternalLinkParams, activity);
                    return null;
                }
            }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzat
                @Override // java.lang.Runnable
                public final void run() {
                    this.zza.zzaZ(launchExternalLinkResponseListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
                }
            }, zzav());
        } catch (Exception e11) {
            e = e11;
            zzaZ(launchExternalLinkResponseListener, zzay(), w4.SERVICE_CALL_EXCEPTION, e);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public void queryProductDetailsAsync(final QueryProductDetailsParams queryProductDetailsParams, final ProductDetailsResponseListener productDetailsResponseListener) {
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzbf
            @Override // java.util.concurrent.Callable
            public final Object call() throws JSONException {
                BillingClientImpl.zzt(this.zza, productDetailsResponseListener, queryProductDetailsParams);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbg
            @Override // java.lang.Runnable
            public final void run() {
                BillingClientImpl.zzT(this.zza, productDetailsResponseListener);
            }
        }, zzav(), zzJ()) == null) {
            BillingResult billingResultZzay = zzay();
            zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 7, billingResultZzay);
            i0 i0Var = k0.f33433b;
            o0 o0Var = o0.f33465e;
            productDetailsResponseListener.onProductDetailsResponse(billingResultZzay, new QueryProductDetailsResult(o0Var, o0Var));
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    public final void queryPurchasesAsync(QueryPurchasesParams queryPurchasesParams, final PurchasesResponseListener purchasesResponseListener) {
        if (zzK(new zzbm(this, purchasesResponseListener, queryPurchasesParams.zza(), queryPurchasesParams.getIncludeSuspendedSubscriptions()), 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbj
            @Override // java.lang.Runnable
            public final void run() {
                BillingClientImpl.zzM(this.zza, purchasesResponseListener);
            }
        }, zzav(), zzJ()) == null) {
            BillingResult billingResultZzay = zzay();
            zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 9, billingResultZzay);
            i0 i0Var = k0.f33433b;
            purchasesResponseListener.onQueryPurchasesResponse(billingResultZzay, o0.f33465e);
        }
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzf
    public BillingResult showAlternativeBillingOnlyInformationDialog(final Activity activity, final AlternativeBillingOnlyInformationDialogListener alternativeBillingOnlyInformationDialogListener) {
        if (activity == null) {
            throw new IllegalArgumentException("Please provide a valid activity.");
        }
        if (!zzbk(3000L)) {
            BillingResult billingResult = zzdc.zzj;
            zzbs(w4.SERVICE_CONNECTION_NOT_READY, 16, billingResult);
            return billingResult;
        }
        if (!this.zzy) {
            m0.h("BillingClient", "Current Play Store version doesn't support alternative billing only.");
            BillingResult billingResult2 = zzdc.zzC;
            zzbs(w4.ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED, 16, billingResult2);
            return billingResult2;
        }
        Handler handler = this.zze;
        final zzbo zzboVar = new zzbo(this, handler, alternativeBillingOnlyInformationDialogListener);
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzah
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzA(this.zza, alternativeBillingOnlyInformationDialogListener, activity, zzboVar);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzai
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzba(alternativeBillingOnlyInformationDialogListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, handler, zzJ()) != null) {
            return zzdc.zzi;
        }
        BillingResult billingResultZzay = zzay();
        zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 16, billingResultZzay);
        return billingResultZzay;
    }

    @Override // com.android.billingclient.api.BillingClient
    @zzj
    public BillingResult showExternalOfferInformationDialog(final Activity activity, final ExternalOfferInformationDialogListener externalOfferInformationDialogListener) {
        if (activity == null) {
            throw new IllegalArgumentException("Please provide a valid activity.");
        }
        if (!zzbk(3000L)) {
            BillingResult billingResult = zzdc.zzj;
            zzbs(w4.SERVICE_CONNECTION_NOT_READY, 25, billingResult);
            return billingResult;
        }
        if (!this.zzz) {
            m0.h("BillingClient", "Current Play Store version doesn't support external offer.");
            BillingResult billingResult2 = zzdc.zzt;
            zzbs(w4.EXTERNAL_OFFER_NOT_SUPPORTED, 25, billingResult2);
            return billingResult2;
        }
        Handler handler = this.zze;
        final zzbp zzbpVar = new zzbp(this, handler, externalOfferInformationDialogListener);
        if (zzK(new Callable() { // from class: com.android.billingclient.api.zzbc
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzF(this.zza, externalOfferInformationDialogListener, activity, zzbpVar);
                return null;
            }
        }, 30000L, new Runnable() { // from class: com.android.billingclient.api.zzbd
            @Override // java.lang.Runnable
            public final void run() {
                this.zza.zzaX(externalOfferInformationDialogListener, zzdc.zzk, w4.EXECUTE_ASYNC_TIMEOUT, null);
            }
        }, handler, zzJ()) != null) {
            return zzdc.zzi;
        }
        BillingResult billingResultZzay = zzay();
        zzbs(w4.MISSING_RESULT_FROM_EXECUTE_ASYNC, 25, billingResultZzay);
        return billingResultZzay;
    }

    @Override // com.android.billingclient.api.BillingClient
    public final BillingResult showInAppMessages(final Activity activity, InAppMessageParams inAppMessageParams, InAppMessageResponseListener inAppMessageResponseListener) {
        if (!zzbk(3000L)) {
            m0.h("BillingClient", "Service disconnected.");
            return zzdc.zzj;
        }
        if (!this.zzq) {
            m0.h("BillingClient", "Current client doesn't support showing in-app messages.");
            return zzdc.zzs;
        }
        View viewFindViewById = activity.findViewById(16908290);
        IBinder windowToken = viewFindViewById.getWindowToken();
        Rect rect = new Rect();
        viewFindViewById.getGlobalVisibleRect(rect);
        final Bundle bundle = new Bundle();
        bundle.putBinder("KEY_WINDOW_TOKEN", windowToken);
        bundle.putInt("KEY_DIMEN_LEFT", rect.left);
        bundle.putInt("KEY_DIMEN_TOP", rect.top);
        bundle.putInt("KEY_DIMEN_RIGHT", rect.right);
        bundle.putInt("KEY_DIMEN_BOTTOM", rect.bottom);
        bundle.putString("playBillingLibraryVersion", this.zzc);
        String str = this.zzd;
        if (str != null) {
            bundle.putString("playBillingLibraryWrapperVersion", str);
        }
        bundle.putIntegerArrayList("KEY_CATEGORY_IDS", inAppMessageParams.zza());
        Handler handler = this.zze;
        final zzbn zzbnVar = new zzbn(this, handler, inAppMessageResponseListener);
        zzK(new Callable() { // from class: com.android.billingclient.api.zzbh
            @Override // java.util.concurrent.Callable
            public final Object call() throws Exception {
                BillingClientImpl.zzv(this.zza, bundle, activity, zzbnVar);
                return null;
            }
        }, 5000L, null, handler, zzJ());
        return zzdc.zzi;
    }

    public final synchronized ExecutorService zzJ() {
        try {
            if (this.zzI == null) {
                this.zzI = Executors.newFixedThreadPool(m0.f33450a, new zzbl(this));
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.zzI;
    }

    public final void zzao(Runnable runnable) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            runnable.run();
        } else {
            this.zze.post(runnable);
        }
    }

    public final zzcg zzh(QueryProductDetailsParams queryProductDetailsParams) throws JSONException {
        p pVar;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        String strZzb = queryProductDetailsParams.zzb();
        k0 k0VarZza = queryProductDetailsParams.zza();
        int size = k0VarZza.size();
        int i5 = 0;
        while (i5 < size) {
            int i11 = i5 + 20;
            ArrayList arrayList3 = new ArrayList(k0VarZza.subList(i5, i11 > size ? size : i11));
            ArrayList<String> arrayList4 = new ArrayList<>();
            int size2 = arrayList3.size();
            for (int i12 = 0; i12 < size2; i12++) {
                arrayList4.add(((QueryProductDetailsParams.Product) arrayList3.get(i12)).zza());
            }
            Bundle bundle = new Bundle();
            bundle.putStringArrayList("ITEM_ID_LIST", arrayList4);
            String str = this.zzc;
            bundle.putString("playBillingLibraryVersion", str);
            try {
                synchronized (this.zza) {
                    pVar = this.zzi;
                }
                if (pVar == null) {
                    return zzaw(zzdc.zzj, w4.SERVICE_RESET_TO_NULL, "Service has been reset to null.", null);
                }
                boolean z11 = this.zzw && this.zzE.isEnabledForPrepaidPlans();
                zzaD(queryProductDetailsParams);
                zzaD(queryProductDetailsParams);
                zzaD(queryProductDetailsParams);
                zzaD(queryProductDetailsParams);
                Bundle bundleM0 = ((n) pVar).m0(true != this.zzx ? 17 : 20, this.zzg.getPackageName(), strZzb, bundle, m0.d(str, this.zzd, arrayList3, new g(z11, false), this.zzJ.longValue()));
                if (bundleM0 == null) {
                    return zzaw(zzdc.zzA, w4.NULL_BUNDLE_FROM_GET_SKU_DETAILS_SERVICE_CALL, "queryProductDetailsAsync got empty product details response.", null);
                }
                if (!bundleM0.containsKey("DETAILS_LIST")) {
                    int iA = m0.a("BillingClient", bundleM0);
                    String strF = m0.f("BillingClient", bundleM0);
                    return iA != 0 ? zzaw(zzdc.zza(iA, strF), w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, c0.h(iA, "getSkuDetails() failed for queryProductDetailsAsync. Response code: "), null) : zzaw(zzdc.zza(6, strF), w4.MISSING_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE, "getSkuDetails() returned a bundle with neither an error nor a product detail list for queryProductDetailsAsync.", null);
                }
                ArrayList<String> stringArrayList = bundleM0.getStringArrayList("DETAILS_LIST");
                if (stringArrayList == null) {
                    return zzaw(zzdc.zzA, w4.NULL_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE, "queryProductDetailsAsync got null response list", null);
                }
                ArrayList arrayList5 = new ArrayList();
                int size3 = stringArrayList.size();
                for (int i13 = 0; i13 < size3; i13++) {
                    try {
                        ProductDetails productDetails = new ProductDetails(stringArrayList.get(i13));
                        m0.g("BillingClient", "Got product details: ".concat(productDetails.toString()));
                        arrayList5.add(productDetails);
                    } catch (JSONException e3) {
                        return zzaw(zzdc.zza(6, "Error trying to decode SkuDetails."), w4.ERROR_DECODING_SKU_DETAILS, "Got a JSON exception trying to decode ProductDetails. \n Exception: ", e3);
                    }
                }
                ArrayList<String> stringArrayList2 = bundleM0.getStringArrayList("UNFETCHED_PRODUCT_LIST");
                new ArrayList();
                try {
                    ArrayList arrayList6 = new ArrayList();
                    if (stringArrayList2 == null) {
                        Iterator it = arrayList3.iterator();
                        while (it.hasNext()) {
                            QueryProductDetailsParams.Product product = (QueryProductDetailsParams.Product) it.next();
                            Iterator it2 = arrayList5.iterator();
                            while (true) {
                                if (!it2.hasNext()) {
                                    arrayList6.add(new UnfetchedProduct(new JSONObject().put("productId", product.zza()).put(TTConst.TRACK_TYPE, product.zzb()).put("statusCode", 0).toString()));
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
                            m0.g("BillingClient", "Got unfetchedProduct: ".concat(unfetchedProduct.toString()));
                            arrayList6.add(unfetchedProduct);
                        }
                    }
                    arrayList.addAll(arrayList5);
                    arrayList2.addAll(arrayList6);
                    i5 = i11;
                } catch (JSONException e11) {
                    return zzaw(zzdc.zza(6, "Error trying to decode SkuDetails."), w4.ERROR_DECODING_SKU_DETAILS, "Got a JSON exception trying to decode UnfetchedProduct. \n Exception: ", e11);
                }
            } catch (DeadObjectException e12) {
                return zzaw(zzdc.zzj, w4.GET_SKU_DETAILS_SERVICE_CALL_EXCEPTION, "queryProductDetailsAsync got a remote exception (try to reconnect).", e12);
            } catch (Exception e13) {
                return zzaw(zzdc.zzh, w4.GET_SKU_DETAILS_SERVICE_CALL_EXCEPTION, "queryProductDetailsAsync got a remote exception (try to reconnect).", e13);
            }
        }
        return new zzcg(0, b.f42142b, arrayList, arrayList2);
    }

    public final zzcz zzk() {
        return this.zzh;
    }

    public final BillingResult zzn(final BillingResult billingResult) {
        if (Thread.interrupted()) {
            return billingResult;
        }
        this.zze.post(new Runnable() { // from class: com.android.billingclient.api.zzan
            @Override // java.lang.Runnable
            public final void run() {
                BillingClientImpl.zzV(this.zza, billingResult);
            }
        });
        return billingResult;
    }

    @Override // com.android.billingclient.api.BillingClient
    public void startConnection(BillingClientStateListener billingClientStateListener) {
        zzbi(billingClientStateListener, 0);
    }

    private BillingClientImpl(Context context, PendingPurchasesParams pendingPurchasesParams, PurchasesUpdatedListener purchasesUpdatedListener, String str, String str2, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        this.zza = new Object();
        this.zzb = 0;
        this.zze = new Handler(Looper.getMainLooper());
        this.zzm = 0;
        this.zzJ = Long.valueOf(new Random().nextLong());
        this.zzK = b0.f33356a;
        this.zzc = str;
        this.zzd = zzaE();
        initialize(context, purchasesUpdatedListener, pendingPurchasesParams, userChoiceBillingListener, developerProvidedBillingListener, str, null, builder);
    }

    private BillingClientImpl(String str) {
        this.zza = new Object();
        this.zzb = 0;
        this.zze = new Handler(Looper.getMainLooper());
        this.zzm = 0;
        this.zzJ = Long.valueOf(new Random().nextLong());
        this.zzK = b0.f33356a;
        this.zzc = str;
        this.zzd = zzaE();
    }

    public BillingClientImpl(String str, Context context, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        this.zza = new Object();
        this.zzb = 0;
        this.zze = new Handler(Looper.getMainLooper());
        this.zzm = 0;
        long jNextLong = new Random().nextLong();
        this.zzJ = Long.valueOf(jNextLong);
        this.zzK = b0.f33356a;
        this.zzc = com.android.billingclient.BuildConfig.VERSION_NAME;
        String strZzaE = zzaE();
        this.zzd = strZzaE;
        this.zzg = context.getApplicationContext();
        b5 b5VarA = c5.A();
        b5VarA.d();
        c5.y((c5) b5VarA.f33564b, com.android.billingclient.BuildConfig.VERSION_NAME);
        if (strZzaE != null) {
            b5VarA.d();
            c5.z((c5) b5VarA.f33564b, strZzaE);
        }
        String packageName = this.zzg.getPackageName();
        b5VarA.d();
        c5.r((c5) b5VarA.f33564b, packageName);
        b5VarA.d();
        c5.E((c5) b5VarA.f33564b, jNextLong);
        boolean z11 = builder.zza;
        b5VarA.d();
        c5.x((c5) b5VarA.f33564b, z11);
        int i5 = Build.VERSION.SDK_INT;
        b5VarA.d();
        c5.B((c5) b5VarA.f33564b, i5);
        b5VarA.f();
        zzbo(b5VarA, context);
        try {
            int i11 = this.zzg.getPackageManager().getPackageInfo(this.zzg.getPackageName(), 0).versionCode;
            b5VarA.d();
            c5.C((c5) b5VarA.f33564b, i11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Error getting app version code.", th2);
        }
        this.zzh = new zzdl(this.zzg, (c5) b5VarA.a());
        this.zzg.getPackageName();
        this.zzF = builder.zza;
    }

    private void initialize(Context context, PurchasesUpdatedListener purchasesUpdatedListener, PendingPurchasesParams pendingPurchasesParams, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, String str, zzcz zzczVar, BillingClient.Builder builder) {
        this.zzg = context.getApplicationContext();
        b5 b5VarA = c5.A();
        b5VarA.d();
        c5.y((c5) b5VarA.f33564b, str);
        String str2 = this.zzd;
        if (str2 != null) {
            b5VarA.d();
            c5.z((c5) b5VarA.f33564b, str2);
        }
        String packageName = this.zzg.getPackageName();
        b5VarA.d();
        c5.r((c5) b5VarA.f33564b, packageName);
        long jLongValue = this.zzJ.longValue();
        b5VarA.d();
        c5.E((c5) b5VarA.f33564b, jLongValue);
        boolean z11 = builder.zza;
        b5VarA.d();
        c5.x((c5) b5VarA.f33564b, z11);
        int i5 = Build.VERSION.SDK_INT;
        b5VarA.d();
        c5.B((c5) b5VarA.f33564b, i5);
        b5VarA.f();
        zzbo(b5VarA, context);
        try {
            int i11 = this.zzg.getPackageManager().getPackageInfo(this.zzg.getPackageName(), 0).versionCode;
            b5VarA.d();
            c5.C((c5) b5VarA.f33564b, i11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Error getting app version code.", th2);
        }
        if (zzczVar != null) {
            this.zzh = zzczVar;
        } else {
            this.zzh = new zzdl(this.zzg, (c5) b5VarA.a());
        }
        if (purchasesUpdatedListener == null) {
            m0.h("BillingClient", "Billing client should have a valid listener but the provided is null.");
        }
        this.zzf = new zzab(this.zzg, purchasesUpdatedListener, null, null, userChoiceBillingListener, developerProvidedBillingListener, this.zzh);
        this.zzE = pendingPurchasesParams;
        this.zzG = userChoiceBillingListener != null;
        this.zzF = builder.zza;
    }

    public BillingClientImpl(String str, PendingPurchasesParams pendingPurchasesParams, Context context, zzdo zzdoVar, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        this.zza = new Object();
        this.zzb = 0;
        this.zze = new Handler(Looper.getMainLooper());
        this.zzm = 0;
        long jNextLong = new Random().nextLong();
        this.zzJ = Long.valueOf(jNextLong);
        this.zzK = b0.f33356a;
        this.zzc = com.android.billingclient.BuildConfig.VERSION_NAME;
        String strZzaE = zzaE();
        this.zzd = strZzaE;
        this.zzg = context.getApplicationContext();
        b5 b5VarA = c5.A();
        b5VarA.d();
        c5.y((c5) b5VarA.f33564b, com.android.billingclient.BuildConfig.VERSION_NAME);
        if (strZzaE != null) {
            b5VarA.d();
            c5.z((c5) b5VarA.f33564b, strZzaE);
        }
        String packageName = this.zzg.getPackageName();
        b5VarA.d();
        c5.r((c5) b5VarA.f33564b, packageName);
        b5VarA.d();
        c5.E((c5) b5VarA.f33564b, jNextLong);
        boolean z11 = builder.zza;
        b5VarA.d();
        c5.x((c5) b5VarA.f33564b, z11);
        int i5 = Build.VERSION.SDK_INT;
        b5VarA.d();
        c5.B((c5) b5VarA.f33564b, i5);
        b5VarA.f();
        zzbo(b5VarA, context);
        try {
            int i11 = this.zzg.getPackageManager().getPackageInfo(this.zzg.getPackageName(), 0).versionCode;
            b5VarA.d();
            c5.C((c5) b5VarA.f33564b, i11);
        } catch (Throwable th2) {
            m0.i("BillingClient", "Error getting app version code.", th2);
        }
        this.zzh = new zzdl(this.zzg, (c5) b5VarA.a());
        m0.h("BillingClient", "Billing client should have a valid listener but the provided is null.");
        this.zzf = new zzab(this.zzg, null, null, null, null, null, this.zzh);
        this.zzE = pendingPurchasesParams;
        this.zzg.getPackageName();
        this.zzF = builder.zza;
    }

    public BillingClientImpl(String str, PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, zzb zzbVar, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        this.zza = new Object();
        this.zzb = 0;
        this.zze = new Handler(Looper.getMainLooper());
        this.zzm = 0;
        this.zzJ = Long.valueOf(new Random().nextLong());
        this.zzK = b0.f33356a;
        this.zzc = com.android.billingclient.BuildConfig.VERSION_NAME;
        this.zzd = zzaE();
        initialize(context, purchasesUpdatedListener, pendingPurchasesParams, null, com.android.billingclient.BuildConfig.VERSION_NAME, null, builder);
    }

    public BillingClientImpl(String str, PendingPurchasesParams pendingPurchasesParams, Context context, PurchasesUpdatedListener purchasesUpdatedListener, UserChoiceBillingListener userChoiceBillingListener, DeveloperProvidedBillingListener developerProvidedBillingListener, zzcz zzczVar, ExecutorService executorService, BillingClient.Builder builder) {
        this(context, pendingPurchasesParams, purchasesUpdatedListener, com.android.billingclient.BuildConfig.VERSION_NAME, null, userChoiceBillingListener, developerProvidedBillingListener, null, null, builder);
    }
}
