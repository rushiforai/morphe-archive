package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import com.medium.android.payments.ui.subscription.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class sxc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SubscriptionBottomSheetDialogFragment b;
    public final /* synthetic */ a c;

    public /* synthetic */ sxc(SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment, a aVar, int i) {
        this.a = i;
        this.b = subscriptionBottomSheetDialogFragment;
        this.c = aVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(-1809331092, new sxc(subscriptionBottomSheetDialogFragment, this.c, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                vq6 vq6Var = subscriptionBottomSheetDialogFragment.K0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    UpsellInfo upsellInfo = ((SubscriptionBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getUpsellInfo();
                    String referrerSource = ((SubscriptionBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                    MembershipType initialMembershipType = ((SubscriptionBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getInitialMembershipType();
                    i03 i03Var = subscriptionBottomSheetDialogFragment.J0;
                    if (i03Var == null) {
                        g76.g0("mediumUris");
                        throw null;
                    }
                    cr0 cr0Var = subscriptionBottomSheetDialogFragment.I0;
                    if (cr0Var == null) {
                        g76.g0("billingManager");
                        throw null;
                    }
                    nk7.a0(upsellInfo, referrerSource, initialMembershipType, i03Var, cr0Var, this.c, null, null, p65Var2, UpsellInfo.$stable);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
