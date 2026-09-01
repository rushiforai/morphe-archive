package defpackage;

import android.os.Bundle;
import com.android.billingclient.api.BillingConfig;
import com.android.billingclient.api.BillingConfigResponseListener;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.n;
import com.android.billingclient.api.o;
import com.android.billingclient.api.zzcy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k1g extends plf {
    public final BillingConfigResponseListener g;
    public final d0g h;
    public final int i;

    public k1g(BillingConfigResponseListener billingConfigResponseListener, zjf zjfVar, int i) {
        super(0);
        billingConfigResponseListener.getClass();
        this.g = billingConfigResponseListener;
        this.h = zjfVar;
        this.i = i;
    }

    @Override // defpackage.plf
    public final void o(Bundle bundle) {
        int i = this.i;
        d0g d0gVar = this.h;
        if (bundle == null) {
            cbg cbgVar = cbg.zzaT;
            BillingResult billingResult = n.h;
            qk7.F(cbgVar, billingResult, d0gVar, s0g.GET_BILLING_CONFIG.b, i);
            q(billingResult);
            return;
        }
        BillingResult billingResultA = o.a(bundle, "GetBillingConfigDelegateToBackendCallback", s0g.GET_BILLING_CONFIG.b, d0gVar, i);
        if (billingResultA.getResponseCode() != 0) {
            q(billingResultA);
            return;
        }
        try {
            byte[] byteArray = bundle.getByteArray("RESPONSE_DATA");
            if (byteArray == null) {
                throw new IllegalArgumentException("Response data is null");
            }
            this.g.onBillingConfigResponse(billingResultA, BillingConfig.forCountryCode(s1g.q(byteArray).r()));
        } catch (Exception e) {
            rxf.j("GetBillingConfigDelegateToBackendCallback", "Got a JSON exception trying to decode BillingConfig. \n Exception: ", e);
            cbg cbgVar2 = cbg.ERROR_DECODING_DELEGATE_TO_BACKEND_RESPONSE_DATA;
            BillingResult billingResult2 = n.h;
            ((zjf) d0gVar).n(zzcy.zzb(cbgVar2, s0g.GET_BILLING_CONFIG.b, billingResult2, zzcy.zza(e), lbg.BROADCAST_ACTION_UNSPECIFIED), i);
            q(billingResult2);
        }
    }

    public final void q(BillingResult billingResult) {
        BillingConfigResponseListener billingConfigResponseListener = this.g;
        if (billingConfigResponseListener != null) {
            billingConfigResponseListener.onBillingConfigResponse(billingResult, null);
            return;
        }
        qk7.F(cbg.NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK, billingResult, this.h, s0g.GET_BILLING_CONFIG.b, this.i);
    }
}
