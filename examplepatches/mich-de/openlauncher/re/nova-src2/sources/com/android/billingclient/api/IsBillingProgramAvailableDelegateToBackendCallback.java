package com.android.billingclient.api;

import android.os.Bundle;
import android.os.Handler;
import com.google.android.gms.internal.play_billing.b;
import com.google.android.gms.internal.play_billing.w4;
import java.util.concurrent.ExecutorService;

@zzh
/* loaded from: classes2.dex */
final class IsBillingProgramAvailableDelegateToBackendCallback extends b {
    private static final String TAG = "IsBillingProgramAvailableDelegateToBackendCallback";
    final int billingApiVersion;
    final zzcz billingLogger;
    final int billingProgram;
    final ExecutorService executorService;
    final Handler handler;
    final BillingProgramAvailabilityListener listener;

    public IsBillingProgramAvailableDelegateToBackendCallback(BillingProgramAvailabilityListener billingProgramAvailabilityListener, int i5, zzcz zzczVar, int i11, Handler handler, ExecutorService executorService) {
        billingProgramAvailabilityListener.getClass();
        this.listener = billingProgramAvailabilityListener;
        this.billingProgram = i5;
        this.billingLogger = zzczVar;
        this.billingApiVersion = i11;
        this.handler = handler;
        this.executorService = executorService;
    }

    @Override // com.google.android.gms.internal.play_billing.c
    @zzh
    public void onDelegateToBackendResponse(Bundle bundle) throws Exception {
        BillingProgramAvailabilityDetails billingProgramAvailabilityDetails = new BillingProgramAvailabilityDetails(this.billingProgram);
        if (bundle == null) {
            zzcz zzczVar = this.billingLogger;
            BillingResult billingResult = zzdc.zzh;
            zzde.zza(w4.NULL_BUNDLE_FROM_DELEGATE_TO_BACKEND_SERVICE_CALL, billingResult, zzczVar, zzdf.IS_BILLING_PROGRAM_AVAILABLE_ASYNC.zzb(), this.billingApiVersion);
            this.listener.onBillingProgramAvailabilityResponse(billingResult, billingProgramAvailabilityDetails);
            return;
        }
        zzdf zzdfVar = zzdf.IS_BILLING_PROGRAM_AVAILABLE_ASYNC;
        BillingResult billingResultZza = zzdh.zza(bundle, TAG, zzdfVar.zzb(), this.billingLogger, this.billingApiVersion);
        BillingProgramAvailabilityListener billingProgramAvailabilityListener = this.listener;
        if (billingProgramAvailabilityListener != null) {
            billingProgramAvailabilityListener.onBillingProgramAvailabilityResponse(billingResultZza, billingProgramAvailabilityDetails);
            return;
        }
        zzde.zza(w4.NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK, billingResultZza, this.billingLogger, zzdfVar.zzb(), this.billingApiVersion);
    }
}
