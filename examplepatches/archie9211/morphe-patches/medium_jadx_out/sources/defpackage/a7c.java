package defpackage;

import android.content.res.Resources;
import android.view.View;
import android.webkit.CookieManager;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.android.billingclient.api.Purchase;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.graphql.type.AppConfigSupportStatus;
import com.medium.android.newsletters.consent.SubscribeToNewsletterConsentDialogFragment;
import com.medium.android.onboarding.ui.topics.TopicsFragment;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.android.showlesslikethis.ui.ShowLessLikeThisDialogFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a7c implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public a7c(nhc nhcVar, Resources resources, qlb qlbVar) {
        this.a = 6;
        this.b = qlbVar;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        int i2 = 3;
        final int i3 = 1;
        n92 n92Var2 = null;
        final int i4 = 0;
        c1e c1eVar = c1e.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                t0c t0cVar = (t0c) obj;
                g7c g7cVar = (g7c) obj2;
                t0cVar.getClass();
                g7cVar.h = t0cVar;
                if (g7cVar.j) {
                    g7cVar.j = false;
                    g7cVar.b();
                }
                Object objE = g7cVar.e(t0cVar.a.a, c7c.GENERAL, n92Var);
                return objE == tb2.COROUTINE_SUSPENDED ? objE : c1eVar;
            case 1:
                zwa zwaVar = (zwa) obj;
                y7c y7cVar = (y7c) obj2;
                if (!g76.L(y7cVar.c, zwaVar)) {
                    y7cVar.c = zwaVar;
                    y7cVar.a();
                }
                return c1eVar;
            case 2:
                e9c e9cVar = (e9c) obj;
                u8c u8cVar = (u8c) obj2;
                if (g76.L(e9cVar, c9c.d)) {
                    ConstraintLayout constraintLayoutU = ((MainActivity) u8cVar.a.Q()).u();
                    int[] iArr = ahc.C;
                    ahc.h(constraintLayoutU, constraintLayoutU.getResources().getText(R.string.common_undo_show_less_like_this_success), -1).j();
                    u8cVar.a();
                } else if (g76.L(e9cVar, c9c.c)) {
                    ShowLessLikeThisDialogFragment showLessLikeThisDialogFragment = u8cVar.a;
                    ConstraintLayout constraintLayoutU2 = ((MainActivity) showLessLikeThisDialogFragment.Q()).u();
                    int[] iArr2 = ahc.C;
                    ahc ahcVarH = ahc.h(constraintLayoutU2, constraintLayoutU2.getResources().getText(R.string.common_undo_show_less_like_this_failure), 0);
                    ahcVarH.i(R.string.common_retry, new na3(showLessLikeThisDialogFragment, i2));
                    ahcVarH.j();
                } else if (g76.L(e9cVar, c9c.a)) {
                    ConstraintLayout constraintLayoutU3 = ((MainActivity) u8cVar.a.Q()).u();
                    int[] iArr3 = ahc.C;
                    ahc.h(constraintLayoutU3, constraintLayoutU3.getResources().getText(R.string.common_mute_author_success), -1).j();
                    u8cVar.a();
                } else if (e9cVar instanceof b9c) {
                    b9c b9cVar = (b9c) e9cVar;
                    final String str = b9cVar.a;
                    b24 b24Var = b9cVar.b;
                    final ShowLessLikeThisDialogFragment showLessLikeThisDialogFragment2 = u8cVar.a;
                    ConstraintLayout constraintLayoutU4 = ((MainActivity) showLessLikeThisDialogFragment2.Q()).u();
                    int i5 = b24Var instanceof x14 ? R.string.common_mute_author_network_failure : R.string.common_mute_author_failure;
                    int[] iArr4 = ahc.C;
                    ahc ahcVarH2 = ahc.h(constraintLayoutU4, constraintLayoutU4.getResources().getText(i5), 0);
                    ahcVarH2.i(R.string.common_retry, new View.OnClickListener() { // from class: t8c
                        @Override // android.view.View.OnClickListener
                        public final void onClick(View view) {
                            int i6 = i3;
                            n92 n92Var3 = null;
                            String str2 = str;
                            ShowLessLikeThisDialogFragment showLessLikeThisDialogFragment3 = showLessLikeThisDialogFragment2;
                            switch (i6) {
                                case 0:
                                    l9c l9cVarG0 = showLessLikeThisDialogFragment3.g0();
                                    str2.getClass();
                                    vx0.c0(f76.F(l9cVarG0), null, null, new j9c(l9cVarG0, str2, n92Var3, 1), 3);
                                    break;
                                default:
                                    l9c l9cVarG02 = showLessLikeThisDialogFragment3.g0();
                                    vx0.c0(f76.F(l9cVarG02), null, null, new j9c(l9cVarG02, str2, n92Var3, 0), 3);
                                    break;
                            }
                        }
                    });
                    ahcVarH2.j();
                } else if (g76.L(e9cVar, c9c.b)) {
                    ConstraintLayout constraintLayoutU5 = ((MainActivity) u8cVar.a.Q()).u();
                    int[] iArr5 = ahc.C;
                    ahc.h(constraintLayoutU5, constraintLayoutU5.getResources().getText(R.string.common_mute_publication_success), -1).j();
                    u8cVar.a();
                } else {
                    if (!(e9cVar instanceof d9c)) {
                        ygf.a();
                        return null;
                    }
                    d9c d9cVar = (d9c) e9cVar;
                    final String str2 = d9cVar.a;
                    b24 b24Var2 = d9cVar.b;
                    str2.getClass();
                    final ShowLessLikeThisDialogFragment showLessLikeThisDialogFragment3 = u8cVar.a;
                    ConstraintLayout constraintLayoutU6 = ((MainActivity) showLessLikeThisDialogFragment3.Q()).u();
                    int i6 = b24Var2 instanceof x14 ? R.string.common_mute_publication_network_failure : R.string.common_mute_publication_failure;
                    int[] iArr6 = ahc.C;
                    ahc ahcVarH3 = ahc.h(constraintLayoutU6, constraintLayoutU6.getResources().getText(i6), 0);
                    ahcVarH3.i(R.string.common_retry, new View.OnClickListener() { // from class: t8c
                        @Override // android.view.View.OnClickListener
                        public final void onClick(View view) {
                            int i62 = i4;
                            n92 n92Var3 = null;
                            String str22 = str2;
                            ShowLessLikeThisDialogFragment showLessLikeThisDialogFragment32 = showLessLikeThisDialogFragment3;
                            switch (i62) {
                                case 0:
                                    l9c l9cVarG0 = showLessLikeThisDialogFragment32.g0();
                                    str22.getClass();
                                    vx0.c0(f76.F(l9cVarG0), null, null, new j9c(l9cVarG0, str22, n92Var3, 1), 3);
                                    break;
                                default:
                                    l9c l9cVarG02 = showLessLikeThisDialogFragment32.g0();
                                    vx0.c0(f76.F(l9cVarG02), null, null, new j9c(l9cVarG02, str22, n92Var3, 0), 3);
                                    break;
                            }
                        }
                    });
                    ahcVarH3.j();
                }
                return c1eVar;
            case 3:
                lwc lwcVar = (lwc) obj;
                SubscribeToNewsletterConsentDialogFragment subscribeToNewsletterConsentDialogFragment = ((hwc) obj2).a;
                if (g76.L(lwcVar, jwc.a)) {
                    ConstraintLayout constraintLayoutU7 = ((MainActivity) subscribeToNewsletterConsentDialogFragment.Q()).u();
                    int[] iArr7 = ahc.C;
                    ahc.h(constraintLayoutU7, constraintLayoutU7.getResources().getText(R.string.subscribe_to_newsletter_failure), 0).j();
                } else {
                    if (!g76.L(lwcVar, kwc.a)) {
                        ygf.a();
                        return null;
                    }
                    ConstraintLayout constraintLayoutU8 = ((MainActivity) subscribeToNewsletterConsentDialogFragment.Q()).u();
                    int[] iArr8 = ahc.C;
                    ahc.h(constraintLayoutU8, constraintLayoutU8.getResources().getText(R.string.subscribe_to_newsletter_success), -1).j();
                    k40.X(subscribeToNewsletterConsentDialogFragment).f();
                }
                return c1eVar;
            case 4:
                km4.I(wld.a, null, "onSubscriptionsUpdated", new Object[0], "onSubscriptionsUpdated");
                SubscriptionViewModel subscriptionViewModel = (SubscriptionViewModel) obj2;
                vob vobVar = subscriptionViewModel.e;
                wyc wycVar = (wyc) vobVar.a("confirmation_data");
                ArrayList arrayList = new ArrayList();
                for (Object obj3 : (Set) obj) {
                    if (((Purchase) obj3).getPurchaseState() == 1) {
                        arrayList.add(obj3);
                    }
                }
                ArrayList arrayList2 = new ArrayList();
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    bu1.n0(((Purchase) it2.next()).getProducts(), arrayList2);
                }
                if (wycVar == null || !arrayList2.contains(wycVar.a)) {
                    return c1eVar;
                }
                vobVar.d("is_confirming_purchase", Boolean.TRUE);
                Object objA = subscriptionViewModel.u.a(new pyc(wycVar), n92Var);
                return objA == tb2.COROUTINE_SUSPENDED ? objA : c1eVar;
            case 5:
                AppConfigSupportStatus appConfigSupportStatus = (AppConfigSupportStatus) obj;
                SusiActivity susiActivity = (SusiActivity) obj2;
                p13 p13Var = susiActivity.p;
                if (p13Var == null) {
                    g76.g0("router");
                    throw null;
                }
                String str3 = susiActivity.q;
                if (str3 != null) {
                    wgf.H(susiActivity, appConfigSupportStatus, p13Var, str3);
                    return c1eVar;
                }
                g76.g0("appVersionName");
                throw null;
            case 6:
                tpd tpdVar = (tpd) obj;
                if (!(tpdVar instanceof tpd)) {
                    ygf.a();
                    return null;
                }
                SourceParameter sourceParameter = tpdVar.a;
                sourceParameter.getClass();
                TopicsFragment topicsFragment = (TopicsFragment) ((qlb) obj2).a;
                vx0.c0(o7f.x(topicsFragment), null, null, new cfd(topicsFragment, sourceParameter, n92Var2, 2), 3);
                return c1eVar;
            case 7:
                q9e q9eVar = (q9e) obj2;
                w9e w9eVar = w9e.ALL_ACTIVITIES;
                w9eVar.getClass();
                q9eVar.i.d("selectedActivityType", w9eVar);
                c9e c9eVar = (c9e) q9eVar.m.get(w9eVar);
                if (c9eVar == null) {
                    return c1eVar;
                }
                Object objA2 = c9eVar.b.a(v8e.a, n92Var);
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                if (objA2 != tb2Var) {
                    objA2 = c1eVar;
                }
                return objA2 == tb2Var ? objA2 : c1eVar;
            case 8:
                return b((rd1) obj, n92Var);
            case 9:
                Object objL0 = ((ime) obj2).c.c.l0(new zzb(17, (if9) obj), n92Var);
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                if (objL0 != tb2Var2) {
                    objL0 = c1eVar;
                }
                return objL0 == tb2Var2 ? objL0 : c1eVar;
            case 10:
                Set set = (Set) obj;
                z92 z92Var = new z92();
                j2f j2fVar = (j2f) obj2;
                z92Var.b(j2fVar.a);
                z92Var.c(System.currentTimeMillis() + 86400000);
                z92Var.g = true;
                z92Var.d("var");
                z92Var.e("/");
                if (set.isEmpty()) {
                    z92Var.f("");
                    wld.a.a("Unset variants cookie", new Object[0]);
                } else {
                    String string = muc.y0(bu1.F0(set, "&", null, null, null, 62)).toString();
                    z92Var.f(string);
                    wld.a.a("Updating variants cookie: ".concat(string), new Object[0]);
                }
                aa2 aa2VarA = z92Var.a();
                try {
                    CookieManager cookieManager = (CookieManager) j2fVar.b.getValue();
                    if (cookieManager != null) {
                        cookieManager.setCookie(j2f.a(aa2VarA), aa2VarA.toString());
                    }
                    break;
                } catch (Exception e) {
                    wld.a.e(e, "An error occurred while trying to set variants cookie.", new Object[0]);
                }
                return c1eVar;
            default:
                v6f v6fVar = (v6f) obj;
                r6f r6fVar = (r6f) obj2;
                ConstraintLayout constraintLayout = r6fVar.b;
                if (v6fVar instanceof u6f) {
                    int[] iArr9 = ahc.C;
                    ahc.h(constraintLayout, constraintLayout.getResources().getText(R.string.withdraw_submission_confirmation_success), -1).j();
                    k40.X(r6fVar.a).f();
                } else {
                    if (!(v6fVar instanceof t6f)) {
                        ygf.a();
                        return null;
                    }
                    int[] iArr10 = ahc.C;
                    ahc.h(constraintLayout, constraintLayout.getResources().getText(R.string.withdraw_submission_confirmation_failure), 0).j();
                }
                return c1eVar;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:62:0x00e1, code lost:
    
        if (r1.a(r0, r2) == r13) goto L63;
     */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00e3 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00f4 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.rd1 r12, defpackage.n92 r13) {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a7c.b(rd1, n92):java.lang.Object");
    }

    public /* synthetic */ a7c(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
