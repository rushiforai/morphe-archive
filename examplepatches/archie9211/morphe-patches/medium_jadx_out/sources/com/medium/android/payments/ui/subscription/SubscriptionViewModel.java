package com.medium.android.payments.ui.subscription;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellPromoId;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.graphql.type.MembershipType;
import com.medium.proto.event.OnboardingPlansContinueClicked;
import defpackage.a13;
import defpackage.ax2;
import defpackage.bo;
import defpackage.cr0;
import defpackage.da5;
import defpackage.ev6;
import defpackage.f76;
import defpackage.gp7;
import defpackage.gzc;
import defpackage.k40;
import defpackage.kb2;
import defpackage.nyc;
import defpackage.og3;
import defpackage.que;
import defpackage.r6c;
import defpackage.rqd;
import defpackage.u50;
import defpackage.ub5;
import defpackage.uua;
import defpackage.vob;
import defpackage.vwa;
import defpackage.vx0;
import defpackage.w2g;
import defpackage.wld;
import defpackage.wua;
import defpackage.xd4;
import defpackage.ync;
import defpackage.yx2;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0001\u0018\u00002\u00020\u0001:\u0007\u0002\u0003\u0004\u0005\u0006\u0007\b¨\u0006\t"}, d2 = {"Lcom/medium/android/payments/ui/subscription/SubscriptionViewModel;", "Lque;", "c0d", "xyc", "wyc", "ryc", "vyc", "ks2", "PurchaseNotFoundForGooglePlayAccount", "payments_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SubscriptionViewModel extends que {
    public final UpsellInfo b;
    public final String c;
    public final MembershipType d;
    public final vob e;
    public final cr0 f;
    public final ax2 g;
    public final yx2 h;
    public final a13 i;
    public final ax2 j;
    public final og3 k;
    public final xd4 l;
    public final da5 m;
    public final vwa n;
    public final og3 o;
    public final ub5 p;
    public boolean q;
    public boolean r;
    public final r6c s;
    public final uua t;
    public final r6c u;
    public final String v;
    public final wua w;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/medium/android/payments/ui/subscription/SubscriptionViewModel$PurchaseNotFoundForGooglePlayAccount;", "Ljava/lang/IllegalStateException;", "Lkotlin/IllegalStateException;", "payments_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PurchaseNotFoundForGooglePlayAccount extends IllegalStateException {
    }

    public SubscriptionViewModel(UpsellInfo upsellInfo, String str, MembershipType membershipType, vob vobVar, cr0 cr0Var, ax2 ax2Var, yx2 yx2Var, a13 a13Var, ax2 ax2Var2, og3 og3Var, xd4 xd4Var, da5 da5Var, vwa vwaVar, og3 og3Var2, ub5 ub5Var, kb2 kb2Var) {
        upsellInfo.getClass();
        str.getClass();
        vobVar.getClass();
        cr0Var.getClass();
        this.b = upsellInfo;
        this.c = str;
        this.d = membershipType;
        this.e = vobVar;
        this.f = cr0Var;
        this.g = ax2Var;
        this.h = yx2Var;
        this.i = a13Var;
        this.j = ax2Var2;
        this.k = og3Var;
        this.l = xd4Var;
        this.m = da5Var;
        this.n = vwaVar;
        this.o = og3Var2;
        this.p = ub5Var;
        vx0.c0(f76.F(this), null, null, new nyc(this, null, 0), 3);
        r6c r6cVarX = k40.x(0, 7, null);
        this.s = r6cVarX;
        this.t = bo.z(r6cVarX);
        this.u = k40.x(0, 7, null);
        this.v = "new_subscription";
        this.w = bo.e0(w2g.r(new u50(12, new b(this, null)), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), gzc.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:73:0x0220, code lost:
    
        if (r2.a(r14, r3) == r4) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0224, code lost:
    
        r6 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x027b, code lost:
    
        if (r2.a(r6, r3) == r4) goto L90;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0117  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0119 A[PHI: r1 r2
      0x0119: PHI (r1v5 do4) = (r1v1 do4), (r1v8 do4) binds: [B:27:0x009a, B:43:0x0117] A[DONT_GENERATE, DONT_INLINE]
      0x0119: PHI (r2v6 wyc) = (r2v3 wyc), (r2v10 wyc) binds: [B:27:0x009a, B:43:0x0117] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x027e A[PHI: r1 r2 r5
      0x027e: PHI (r1v17 java.lang.Object) = (r1v14 java.lang.Object), (r1v19 java.lang.Object) binds: [B:49:0x0132, B:76:0x0225] A[DONT_GENERATE, DONT_INLINE]
      0x027e: PHI (r2v17 do4) = (r2v13 do4), (r2v18 do4) binds: [B:49:0x0132, B:76:0x0225] A[DONT_GENERATE, DONT_INLINE]
      0x027e: PHI (r5v25 wyc) = (r5v22 wyc), (r5v30 wyc) binds: [B:49:0x0132, B:76:0x0225] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0284  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.do4 r35, defpackage.wyc r36, defpackage.p92 r37) {
        /*
            Method dump skipped, instruction units count: 734
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.payments.ui.subscription.SubscriptionViewModel.e(do4, wyc, p92):java.lang.Object");
    }

    public final String f() {
        UpsellInfo upsellInfo = this.b;
        String postId = upsellInfo.getPostId();
        String authorId = upsellInfo.getAuthorId();
        String dimension = upsellInfo.getDimension();
        UpsellPromoId promoId = upsellInfo.getPromoId();
        return gp7.u(new SourceParameter(this.v, null, null, dimension, null, postId, null, promoId != null ? promoId.getValue() : null, null, null, null, null, authorId, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4266, 8191, null));
    }

    public final void h(String str, String str2) {
        wld.a.e(null, ev6.y("Subscription Product id: ", str, ", Offer token: ", str2, " unavailable."), new Object[0]);
        vx0.c0(f76.F(this), null, null, new nyc(this, null, 2), 3);
    }

    public final void i() {
        if (this.r) {
            return;
        }
        this.r = true;
        UpsellReferrer referrer = this.b.getReferrer();
        UpsellReferrer upsellReferrer = UpsellReferrer.ONBOARDING;
        if (referrer == upsellReferrer) {
            String strF = f();
            String value = upsellReferrer.getValue();
            a13 a13Var = this.i;
            a13Var.getClass();
            String str = this.v;
            str.getClass();
            value.getClass();
            String str2 = this.c;
            str2.getClass();
            rqd.a(a13Var.a, new OnboardingPlansContinueClicked(null, a13Var.b.n(), "app", null, 9, null), str2, strF, false, value, str, 8);
            a13Var.a(str, f(), upsellReferrer.getValue(), str2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x015d  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x019c  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01ad  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01c7  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01cf A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r1v14 */
    /* JADX WARN: Type inference failed for: r1v15, types: [com.android.billingclient.api.Purchase, wyc] */
    /* JADX WARN: Type inference failed for: r1v31 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(java.util.Set r21, defpackage.wyc r22, defpackage.p92 r23) {
        /*
            Method dump skipped, instruction units count: 464
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.payments.ui.subscription.SubscriptionViewModel.j(java.util.Set, wyc, p92):java.lang.Object");
    }

    public final void g(String str, String str2) {
        wld.a.n(null, ev6.y("Subscription Product id: ", str, CspinKvYN.nTwDFQzItthDvu, str2, " already owned."), new Object[0]);
        vx0.c0(f76.F(this), null, null, new nyc(this, null, 1), 3);
    }
}
