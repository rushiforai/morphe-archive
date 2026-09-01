package defpackage;

import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.graphql.type.UserDismissableFlags;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nyc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ SubscriptionViewModel d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nyc(SubscriptionViewModel subscriptionViewModel, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = subscriptionViewModel;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        SubscriptionViewModel subscriptionViewModel = this.d;
        switch (i) {
            case 0:
                return new nyc(subscriptionViewModel, n92Var, 0);
            case 1:
                return new nyc(subscriptionViewModel, n92Var, 1);
            case 2:
                return new nyc(subscriptionViewModel, n92Var, 2);
            case 3:
                return new nyc(subscriptionViewModel, n92Var, 3);
            default:
                return new nyc(subscriptionViewModel, n92Var, 4);
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
        return ((nyc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        SubscriptionViewModel subscriptionViewModel = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    if (subscriptionViewModel.b.getReferrer() == UpsellReferrer.ONBOARDING) {
                        og3 og3Var = subscriptionViewModel.o;
                        UserDismissableFlags userDismissableFlags = UserDismissableFlags.MOBILE_PREMIUM_TIER_EDUCATIONAL_DIALOG;
                        this.c = 1;
                        if (og3Var.c(userDismissableFlags, this) != tb2Var) {
                        }
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj2 = ((bjb) obj).a;
                cr0 cr0Var = subscriptionViewModel.f;
                cr0Var.getClass();
                l41 l41VarL = o7f.l(new j0(cr0Var, n92Var, 27));
                a7c a7cVar = new a7c(4, subscriptionViewModel);
                this.c = 2;
                if (l41VarL.b(a7cVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    r6c r6cVar = subscriptionViewModel.s;
                    this.c = 1;
                    return r6cVar.a(tyc.a, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    r6c r6cVar2 = subscriptionViewModel.s;
                    this.c = 1;
                    return r6cVar2.a(uyc.a, this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    r6c r6cVar3 = subscriptionViewModel.u;
                    this.c = 1;
                    return r6cVar3.a(qyc.a, this) == tb2Var4 ? tb2Var4 : c1eVar;
                }
                if (i5 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    cr0 cr0Var2 = subscriptionViewModel.f;
                    this.c = 1;
                    return ((xx2) cr0Var2).i(this) == tb2Var5 ? tb2Var5 : c1eVar;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
