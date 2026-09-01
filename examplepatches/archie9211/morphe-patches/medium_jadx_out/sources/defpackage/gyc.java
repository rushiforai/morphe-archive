package defpackage;

import com.android.billingclient.api.BillingResult;
import com.medium.android.core.models.BillingPeriod;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.proto.event.IapPurchaseAttempt;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gyc implements m45 {
    public final /* synthetic */ lyc a;
    public final /* synthetic */ szc b;
    public final /* synthetic */ String c;
    public final /* synthetic */ String d;

    public gyc(lyc lycVar, szc szcVar, String str, String str2) {
        this.a = lycVar;
        this.b = szcVar;
        this.c = str;
        this.d = str2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        szc szcVar = this.b;
        String str = szcVar.a;
        String str2 = szcVar.b;
        String str3 = szcVar.c;
        zw7 zw7Var = szcVar.e;
        BillingPeriod billingPeriod = szcVar.d;
        boolean z = szcVar.f;
        rzc rzcVar = szcVar.j;
        qzc qzcVar = rzcVar instanceof qzc ? (qzc) rzcVar : null;
        String str4 = qzcVar != null ? qzcVar.d : null;
        lyc lycVar = this.a;
        lycVar.getClass();
        str3.getClass();
        zw7Var.getClass();
        billingPeriod.getClass();
        SubscriptionViewModel subscriptionViewModel = lycVar.a;
        subscriptionViewModel.e.d("confirmation_data", new wyc(str, str3, zw7Var, billingPeriod, z, str4));
        yx2 yx2Var = subscriptionViewModel.h;
        String str5 = subscriptionViewModel.c;
        String strF = subscriptionViewModel.f();
        String str6 = subscriptionViewModel.v;
        yx2Var.getClass();
        str5.getClass();
        str6.getClass();
        rqd.a(yx2Var.a, new IapPurchaseAttempt(null, str, null, 5, null), str5, strF, true, null, str6, 16);
        BillingResult billingResultE = ((xx2) lycVar.c).e(lycVar.d, str, str2, subscriptionViewModel.c, subscriptionViewModel.f(), subscriptionViewModel.v, this.c, this.d);
        int responseCode = billingResultE.getResponseCode();
        if (responseCode != 0 && responseCode != 1) {
            if (responseCode == 4) {
                subscriptionViewModel.h(str, str2);
            } else if (responseCode != 7) {
                int responseCode2 = billingResultE.getResponseCode();
                String debugMessage = billingResultE.getDebugMessage();
                debugMessage.getClass();
                if (muc.b0(debugMessage)) {
                    debugMessage = null;
                }
                if (debugMessage == null) {
                    debugMessage = "none";
                }
                String str7 = "launchBillingFlow. Response code: " + responseCode2 + ", Debug Message: " + debugMessage;
                dh7 dh7VarT = wo7.t(hv2.RESULT, str, Integer.valueOf(billingResultE.getResponseCode()), null, subscriptionViewModel.c, subscriptionViewModel.f(), subscriptionViewModel.v, null, 136);
                wld.a.e(null, str7, new Object[0]);
                hy2 hy2Var = g01.y;
                if (hy2Var != null) {
                    hy2Var.a(str7, null, dh7VarT);
                }
            } else {
                subscriptionViewModel.g(str, str2);
            }
        }
        return c1e.a;
    }
}
