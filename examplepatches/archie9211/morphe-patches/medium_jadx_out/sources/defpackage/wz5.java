package defpackage;

import com.android.billingclient.api.BillingClient;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum wz5 {
    INAPP(BillingClient.ProductType.INAPP),
    SUBS(BillingClient.ProductType.SUBS);

    public final String a;

    wz5(String str) {
        this.a = str;
    }

    public final String getType() {
        return this.a;
    }
}
