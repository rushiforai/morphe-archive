package defpackage;

import com.android.billingclient.api.BillingResult;
import com.medium.android.domain.payments.BillingResultException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class r2a {
    public static final BillingResultException a(q2a q2aVar) {
        if (!(q2aVar instanceof o2a)) {
            return null;
        }
        o2a o2aVar = (o2a) q2aVar;
        BillingResult.Builder responseCode = BillingResult.newBuilder().setResponseCode(o2aVar.a);
        String str = o2aVar.b;
        if (str == null) {
            str = "";
        }
        BillingResult billingResultBuild = responseCode.setDebugMessage(str).build();
        billingResultBuild.getClass();
        return new BillingResultException(billingResultBuild);
    }
}
