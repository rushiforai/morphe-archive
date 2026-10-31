package com.android.billingclient.api;

import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.internal.play_billing.b6;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class zzby extends b6 {
    final ExternalOfferReportingDetailsListener zza;
    final zzcz zzb;
    final int zzc;

    public zzby(ExternalOfferReportingDetailsListener externalOfferReportingDetailsListener, zzcz zzczVar, int i5, zzch zzchVar) {
        super("com.android.vending.billing.IInAppBillingCreateExternalPaymentReportingDetailsCallback");
        this.zza = externalOfferReportingDetailsListener;
        this.zzb = zzczVar;
        this.zzc = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.c6
    public final void zza(Bundle bundle) throws RemoteException {
        z4 z4Var = z4.BROADCAST_ACTION_UNSPECIFIED;
        if (bundle == null) {
            zzcz zzczVar = this.zzb;
            BillingResult billingResult = zzdc.zzh;
            zzczVar.zzb(zzcy.zzb(w4.NULL_BUNDLE_FROM_CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL, 24, billingResult, null, z4Var), this.zzc);
            this.zza.onExternalOfferReportingDetailsResponse(billingResult, null);
            return;
        }
        int iA = m0.a("BillingClient", bundle);
        BillingResult billingResultZza = zzdc.zza(iA, m0.f("BillingClient", bundle));
        if (iA != 0) {
            m0.h("BillingClient", "createExternalOfferReportingDetailsAsync() failed. Response code: " + iA);
            this.zzb.zzb(zzcy.zzb(w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, 24, billingResultZza, null, z4Var), this.zzc);
            this.zza.onExternalOfferReportingDetailsResponse(billingResultZza, null);
            return;
        }
        try {
            this.zza.onExternalOfferReportingDetailsResponse(billingResultZza, new ExternalOfferReportingDetails(bundle.getString("CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS")));
        } catch (JSONException e3) {
            m0.i("BillingClient", "Error when parsing invalid external offer reporting details. \n Exception: ", e3);
            zzcz zzczVar2 = this.zzb;
            BillingResult billingResult2 = zzdc.zzh;
            zzczVar2.zzb(zzcy.zzb(w4.ERROR_DECODING_EXTERNAL_OFFER_REPORTING_DETAILS, 24, billingResult2, null, z4Var), this.zzc);
            this.zza.onExternalOfferReportingDetailsResponse(billingResult2, null);
        }
    }
}
