package com.android.billingclient.api;

import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.internal.play_billing.l;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;

/* loaded from: classes2.dex */
final class zzce extends l {
    final ExternalOfferAvailabilityListener zza;
    final zzcz zzb;
    final int zzc;

    public zzce(ExternalOfferAvailabilityListener externalOfferAvailabilityListener, zzcz zzczVar, int i5, zzch zzchVar) {
        super("com.android.vending.billing.IInAppBillingIsExternalPaymentAvailableCallback");
        this.zza = externalOfferAvailabilityListener;
        this.zzb = zzczVar;
        this.zzc = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.m
    public final void zza(Bundle bundle) throws RemoteException {
        z4 z4Var = z4.BROADCAST_ACTION_UNSPECIFIED;
        if (bundle == null) {
            zzcz zzczVar = this.zzb;
            BillingResult billingResult = zzdc.zzh;
            zzczVar.zzb(zzcy.zzb(w4.NULL_BUNDLE_FROM_IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL, 23, billingResult, null, z4Var), this.zzc);
            this.zza.onExternalOfferAvailabilityResponse(billingResult);
            return;
        }
        int iA = m0.a("BillingClient", bundle);
        BillingResult billingResultZza = zzdc.zza(iA, m0.f("BillingClient", bundle));
        if (iA != 0) {
            m0.h("BillingClient", "isExternalOfferAvailableAsync() failed. Response code: " + iA);
            this.zzb.zzb(zzcy.zzb(w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, 23, billingResultZza, null, z4Var), this.zzc);
        }
        this.zza.onExternalOfferAvailabilityResponse(billingResultZza);
    }
}
