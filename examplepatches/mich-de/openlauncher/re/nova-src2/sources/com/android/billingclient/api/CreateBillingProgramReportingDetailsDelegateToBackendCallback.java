package com.android.billingclient.api;

import android.os.Bundle;
import android.os.Handler;
import com.google.android.gms.internal.play_billing.b;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.t1;
import com.google.android.gms.internal.play_billing.w4;
import java.util.concurrent.ExecutorService;

@zzh
/* loaded from: classes2.dex */
final class CreateBillingProgramReportingDetailsDelegateToBackendCallback extends b {
    private static final String DELEGATE_TO_BACKEND_RESPONSE_DATA_KEY = "RESPONSE_DATA";
    private static final String TAG = "CreateBillingProgramReportingDetailsDelegateToBackendCallback";
    final int billingApiVersion;
    final zzcz billingLogger;
    final int billingProgram;
    final ExecutorService executorService;
    final Handler handler;
    final BillingProgramReportingDetailsListener listener;

    public CreateBillingProgramReportingDetailsDelegateToBackendCallback(BillingProgramReportingDetailsListener billingProgramReportingDetailsListener, int i5, zzcz zzczVar, int i11, Handler handler, ExecutorService executorService) {
        billingProgramReportingDetailsListener.getClass();
        this.listener = billingProgramReportingDetailsListener;
        this.billingProgram = i5;
        this.billingLogger = zzczVar;
        this.billingApiVersion = i11;
        this.handler = handler;
        this.executorService = executorService;
    }

    private BillingProgramReportingDetails parseReportingDetails(Bundle bundle) throws Exception {
        byte[] byteArray = bundle.getByteArray(DELEGATE_TO_BACKEND_RESPONSE_DATA_KEY);
        if (byteArray != null) {
            return new BillingProgramReportingDetails(t1.q(byteArray).r().r(), this.billingProgram);
        }
        throw new Exception("Response data is null");
    }

    private void returnListenerResponseOnSuccess(BillingResult billingResult, Bundle bundle) {
        try {
            this.listener.onCreateBillingProgramReportingDetailsResponse(billingResult, parseReportingDetails(bundle));
        } catch (Exception e3) {
            m0.h(TAG, "Got a JSON exception trying to decode billing program reporting details.");
            zzcz zzczVar = this.billingLogger;
            BillingResult billingResult2 = zzdc.zzh;
            zzde.zzb(w4.ERROR_DECODING_DELEGATE_TO_BACKEND_RESPONSE_DATA, billingResult2, zzczVar, zzdf.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC.zzb(), this.billingApiVersion, zzcy.zza(e3));
            this.listener.onCreateBillingProgramReportingDetailsResponse(billingResult2, null);
        }
    }

    @Override // com.google.android.gms.internal.play_billing.c
    @zzh
    public void onDelegateToBackendResponse(Bundle bundle) throws Exception {
        if (bundle == null) {
            zzcz zzczVar = this.billingLogger;
            BillingResult billingResult = zzdc.zzh;
            zzde.zza(w4.NULL_BUNDLE_FROM_DELEGATE_TO_BACKEND_SERVICE_CALL, billingResult, zzczVar, zzdf.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC.zzb(), this.billingApiVersion);
            this.listener.onCreateBillingProgramReportingDetailsResponse(billingResult, null);
            return;
        }
        zzdf zzdfVar = zzdf.CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC;
        BillingResult billingResultZza = zzdh.zza(bundle, TAG, zzdfVar.zzb(), this.billingLogger, this.billingApiVersion);
        BillingProgramReportingDetailsListener billingProgramReportingDetailsListener = this.listener;
        if (billingProgramReportingDetailsListener == null) {
            zzde.zza(w4.NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK, billingResultZza, this.billingLogger, zzdfVar.zzb(), this.billingApiVersion);
            return;
        }
        if (billingResultZza.getResponseCode() != 0) {
            billingProgramReportingDetailsListener.onCreateBillingProgramReportingDetailsResponse(billingResultZza, null);
        } else {
            returnListenerResponseOnSuccess(billingResultZza, bundle);
        }
    }
}
