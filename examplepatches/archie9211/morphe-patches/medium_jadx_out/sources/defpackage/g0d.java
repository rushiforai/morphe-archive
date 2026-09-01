package defpackage;

import com.android.billingclient.api.Purchase;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class g0d extends p92 {
    public wyc b;
    public Purchase c;
    public Object d;
    public boolean e;
    public boolean f;
    public /* synthetic */ Object g;
    public final /* synthetic */ SubscriptionViewModel h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0d(SubscriptionViewModel subscriptionViewModel, p92 p92Var) {
        super(p92Var);
        this.h = subscriptionViewModel;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objJ = this.h.j(null, null, this);
        return objJ == tb2.COROUTINE_SUSPENDED ? objJ : new bjb(objJ);
    }
}
