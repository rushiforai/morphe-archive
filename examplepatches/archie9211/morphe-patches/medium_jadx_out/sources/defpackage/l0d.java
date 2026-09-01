package defpackage;

import com.medium.android.payments.ui.subscription.SubscriptionViewModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l0d extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ SubscriptionViewModel d;
    public final /* synthetic */ yd4 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l0d(SubscriptionViewModel subscriptionViewModel, yd4 yd4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = subscriptionViewModel;
        this.e = yd4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        yd4 yd4Var = this.e;
        SubscriptionViewModel subscriptionViewModel = this.d;
        switch (i) {
            case 0:
                return new l0d(subscriptionViewModel, yd4Var, n92Var, 0);
            case 1:
                return new l0d(subscriptionViewModel, yd4Var, n92Var, 1);
            default:
                return new l0d(subscriptionViewModel, yd4Var, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((l0d) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objA2;
        int i = this.b;
        yd4 yd4Var = this.e;
        SubscriptionViewModel subscriptionViewModel = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    ub5 ub5Var = subscriptionViewModel.p;
                    this.c = 1;
                    obj = ub5Var.c(yd4Var, true, this);
                    if (obj == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                lcb lcbVar = (lcb) obj;
                if (lcbVar instanceof jcb) {
                    return ((jcb) lcbVar).a;
                }
                return null;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    og3 og3Var = subscriptionViewModel.k;
                    this.c = 1;
                    objA = og3Var.a(yd4Var, true, this);
                    if (objA == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA = ((bjb) obj).a;
                }
                if (objA instanceof ajb) {
                    return null;
                }
                return objA;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    xd4 xd4Var = subscriptionViewModel.l;
                    this.c = 1;
                    objA2 = xd4Var.a(yd4Var, true, this);
                    if (objA2 == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA2 = ((bjb) obj).a;
                }
                return new bjb(objA2);
        }
    }
}
