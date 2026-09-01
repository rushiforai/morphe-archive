package defpackage;

import com.medium.android.payments.ui.subscription.SubscriptionViewModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e0d extends p92 {
    public do4 b;
    public wyc c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ SubscriptionViewModel f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0d(SubscriptionViewModel subscriptionViewModel, p92 p92Var) {
        super(p92Var);
        this.f = subscriptionViewModel;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.e(null, null, this);
    }
}
