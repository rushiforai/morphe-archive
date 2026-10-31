package com.android.billingclient.api;

import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;
import com.google.android.gms.internal.play_billing.z5;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class zzbx extends z5 {
    final AlternativeBillingOnlyReportingDetailsListener zza;
    final zzcz zzb;
    final int zzc;

    public zzbx(AlternativeBillingOnlyReportingDetailsListener alternativeBillingOnlyReportingDetailsListener, zzcz zzczVar, int i5, zzch zzchVar) {
        super("com.android.vending.billing.IInAppBillingCreateAlternativeBillingOnlyTokenCallback");
        this.zza = alternativeBillingOnlyReportingDetailsListener;
        this.zzb = zzczVar;
        this.zzc = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.a6
    public final void zza(Bundle bundle) throws RemoteException {
        z4 z4Var = z4.BROADCAST_ACTION_UNSPECIFIED;
        if (bundle == null) {
            zzcz zzczVar = this.zzb;
            BillingResult billingResult = zzdc.zzh;
            zzczVar.zzb(zzcy.zzb(w4.NULL_BUNDLE_FROM_CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL, 15, billingResult, null, z4Var), this.zzc);
            this.zza.onAlternativeBillingOnlyTokenResponse(billingResult, null);
            return;
        }
        int iA = m0.a("BillingClient", bundle);
        BillingResult billingResultZza = zzdc.zza(iA, m0.f("BillingClient", bundle));
        if (iA != 0) {
            m0.h("BillingClient", "createAlternativeBillingOnlyReportingDetailsAsync() failed. Response code: " + iA);
            this.zzb.zzb(zzcy.zzb(w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, 15, billingResultZza, null, z4Var), this.zzc);
            this.zza.onAlternativeBillingOnlyTokenResponse(billingResultZza, null);
            return;
        }
        try {
            this.zza.onAlternativeBillingOnlyTokenResponse(billingResultZza, new AlternativeBillingOnlyReportingDetails(bundle.getString("CREATE_ALTERNATIVE_BILLING_ONLY_REPORTING_DETAILS")));
        } catch (JSONException e3) {
            m0.i("BillingClient", "Error when parsing invalid alternative billing only reporting details. \n Exception: ", e3);
            zzcz zzczVar2 = this.zzb;
            BillingResult billingResult2 = zzdc.zzh;
            zzczVar2.zzb(zzcy.zzb(w4.ERROR_DECODING_ALTERNATIVE_BILLING_ONLY_REPORTING_DETAILS, 15, billingResult2, null, z4Var), this.zzc);
            this.zza.onAlternativeBillingOnlyTokenResponse(billingResult2, null);
        }
    }
}
