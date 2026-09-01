package defpackage;

import com.android.billingclient.api.ProductDetails;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class o0d {
    public static final lzc a(ecb ecbVar) {
        ProductDetails.PricingPhase pricingPhase = ecbVar.f;
        ProductDetails.PricingPhase pricingPhase2 = ecbVar.c;
        if (pricingPhase == null || ecbVar.d) {
            pricingPhase = null;
        }
        return pricingPhase != null ? new jzc(m0a.e(pricingPhase), m0a.e(pricingPhase2)) : new kzc(m0a.e(pricingPhase2));
    }
}
