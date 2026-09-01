package defpackage;

import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingResult;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class br0 implements BillingClientStateListener {
    public final /* synthetic */ x51 a;

    public br0(x51 x51Var) {
        this.a = x51Var;
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public final void onBillingServiceDisconnected() {
        x51 x51Var = this.a;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(BillingResult.newBuilder().setResponseCode(-1).build());
        }
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public final void onBillingSetupFinished(BillingResult billingResult) {
        billingResult.getClass();
        x51 x51Var = this.a;
        if (x51Var.r() instanceof ai8) {
            x51Var.resumeWith(billingResult);
        }
    }
}
