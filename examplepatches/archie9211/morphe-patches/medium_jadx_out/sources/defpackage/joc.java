package defpackage;

import android.app.PendingIntent;
import android.os.Bundle;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.onboarding.ui.starterpacks.b;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.android.payments.ui.subscription.a;
import com.medium.android.susi.ui.auth.AuthFragment;
import com.medium.android.susi.ui.welcome.SusiWelcomeFragment;
import com.medium.reader.R;
import com.medium.stats.ui.subscriberslist.SubscribersListFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class joc extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ joc(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 0;
        int i3 = 1;
        int i4 = 3;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                uoc uocVar = ((koc) this.receiver).b;
                uocVar.l.a = true;
                uocVar.u.l(null);
                return c1eVar;
            case 1:
                ((cpc) this.receiver).b();
                return c1eVar;
            case 2:
                ((cpc) this.receiver).b();
                return c1eVar;
            case 3:
                ks8 ks8Var = ((b) ((cpc) this.receiver).a).a.u0;
                if (ks8Var != null) {
                    k40.X(ks8Var.a).f();
                    return c1eVar;
                }
                g76.g0("onboardingRouter");
                throw null;
            case 4:
                zsc zscVar = ((isc) this.receiver).a;
                vx0.c0(f76.F(zscVar), null, null, new vsc(zscVar, n92Var, i3), 3);
                return c1eVar;
            case 5:
                zsc zscVar2 = ((isc) this.receiver).a;
                vx0.c0(f76.F(zscVar2), null, null, new vsc(zscVar2, n92Var, i2), 3);
                return c1eVar;
            case 6:
                zsc zscVar3 = ((isc) this.receiver).a;
                vx0.c0(f76.F(zscVar3), null, null, new vsc(zscVar3, n92Var, i3), 3);
                return c1eVar;
            case 7:
                k40.X(((hwc) this.receiver).a).f();
                return c1eVar;
            case 8:
                owc owcVar = (owc) ((hwc) this.receiver).a.J0.getValue();
                vx0.c0(f76.F(owcVar), null, null, new xi7(owcVar, n92Var, 20), 3);
                return c1eVar;
            case 9:
                k40.X(((hwc) this.receiver).a).f();
                return c1eVar;
            case 10:
                ((gxc) this.receiver).a();
                return c1eVar;
            case 11:
                qxc qxcVar = ((gxc) this.receiver).b;
                vx0.c0(f76.F(qxcVar), null, null, new oxc(qxcVar, n92Var, i2), 3);
                return c1eVar;
            case 12:
                ((gxc) this.receiver).a();
                return c1eVar;
            case 13:
                k40.X((SubscribersListFragment) ((gxc) this.receiver).a.a).f();
                return c1eVar;
            case 14:
                lyc lycVar = (lyc) this.receiver;
                SubscriptionViewModel subscriptionViewModel = lycVar.a;
                UpsellReferrer referrer = subscriptionViewModel.b.getReferrer();
                UpsellReferrer upsellReferrer = UpsellReferrer.ONBOARDING;
                if (referrer == upsellReferrer) {
                    subscriptionViewModel.i.a(subscriptionViewModel.v, subscriptionViewModel.f(), upsellReferrer.getValue(), subscriptionViewModel.c);
                }
                ((a) lycVar.b).a(subscriptionViewModel.f());
                return c1eVar;
            case 15:
                SubscriptionViewModel subscriptionViewModel2 = ((lyc) this.receiver).a;
                vx0.c0(f76.F(subscriptionViewModel2), null, null, new nyc(subscriptionViewModel2, n92Var, i4), 3);
                return c1eVar;
            case 16:
                SubscriptionViewModel subscriptionViewModel3 = ((lyc) this.receiver).a;
                vx0.c0(f76.F(subscriptionViewModel3), null, null, new nyc(subscriptionViewModel3, n92Var, i4), 3);
                return c1eVar;
            case 17:
                lyc lycVar2 = (lyc) this.receiver;
                SubscriptionViewModel subscriptionViewModel4 = lycVar2.a;
                UpsellReferrer referrer2 = subscriptionViewModel4.b.getReferrer();
                UpsellReferrer upsellReferrer2 = UpsellReferrer.ONBOARDING;
                if (referrer2 == upsellReferrer2) {
                    subscriptionViewModel4.i.a(subscriptionViewModel4.v, subscriptionViewModel4.f(), upsellReferrer2.getValue(), subscriptionViewModel4.c);
                }
                ((a) lycVar2.b).a(subscriptionViewModel4.f());
                return c1eVar;
            case 18:
                lyc lycVar3 = (lyc) this.receiver;
                lycVar3.a.i();
                SubscriptionBottomSheetDialogFragment subscriptionBottomSheetDialogFragment = ((a) lycVar3.b).a;
                if (!k40.X(subscriptionBottomSheetDialogFragment).f()) {
                    subscriptionBottomSheetDialogFragment.Q().getOnBackPressedDispatcher().d();
                }
                return c1eVar;
            case 19:
                ((q1d) this.receiver).a();
                return c1eVar;
            case 20:
                ((q1d) this.receiver).a();
                return c1eVar;
            case 21:
                e4d e4dVar = (e4d) this.receiver;
                d4d d4dVar = e4dVar.a;
                String str = e4dVar.b.f;
                str.getClass();
                SusiWelcomeFragment susiWelcomeFragment = ((com.medium.android.susi.ui.welcome.a) d4dVar).a;
                lig ligVar = susiWelcomeFragment.u0;
                if (ligVar == null) {
                    g76.g0("susiRouter");
                    throw null;
                }
                SusiOperation susiOperation = SusiOperation.LOGIN;
                SusiDestination susiDestination = ((SusiWelcomeFragment.BundleInfo) susiWelcomeFragment.v0.getValue()).getSusiDestination();
                susiOperation.getClass();
                Bundle bundle = new Bundle();
                bundle.putParcelable("bundle_info", new AuthFragment.BundleInfo(str, susiDestination, susiOperation));
                ligVar.W(R.id.authFragment, bundle);
                return c1eVar;
            case 22:
                e4d e4dVar2 = (e4d) this.receiver;
                d4d d4dVar2 = e4dVar2.a;
                String str2 = e4dVar2.b.f;
                str2.getClass();
                SusiWelcomeFragment susiWelcomeFragment2 = ((com.medium.android.susi.ui.welcome.a) d4dVar2).a;
                lig ligVar2 = susiWelcomeFragment2.u0;
                if (ligVar2 == null) {
                    g76.g0("susiRouter");
                    throw null;
                }
                SusiOperation susiOperation2 = SusiOperation.REGISTER;
                SusiDestination susiDestination2 = ((SusiWelcomeFragment.BundleInfo) susiWelcomeFragment2.v0.getValue()).getSusiDestination();
                susiOperation2.getClass();
                Bundle bundle2 = new Bundle();
                bundle2.putParcelable("bundle_info", new AuthFragment.BundleInfo(str2, susiDestination2, susiOperation2));
                ligVar2.W(R.id.authFragment, bundle2);
                return c1eVar;
            case 23:
                p8d p8dVar = ((h8d) this.receiver).a;
                vx0.c0(f76.F(p8dVar), null, null, new xi7(p8dVar, n92Var, 24), 3);
                return c1eVar;
            case 24:
                ((f8d) this.receiver).a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 25:
                had hadVar = ((t9d) this.receiver).a;
                vx0.c0(f76.F(hadVar), null, null, new dad(hadVar, n92Var, i2), 3);
                return c1eVar;
            case 26:
                had hadVar2 = ((t9d) this.receiver).a;
                vx0.c0(f76.F(hadVar2), null, null, new dad(hadVar2, n92Var, i3), 3);
                return c1eVar;
            case 27:
                had hadVar3 = ((t9d) this.receiver).a;
                vx0.c0(f76.F(hadVar3), null, null, new dad(hadVar3, n92Var, i3), 3);
                return c1eVar;
            case 28:
                ((o9d) ((q9d) this.receiver)).a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            default:
                ((lbd) this.receiver).b();
                return c1eVar;
        }
    }
}
