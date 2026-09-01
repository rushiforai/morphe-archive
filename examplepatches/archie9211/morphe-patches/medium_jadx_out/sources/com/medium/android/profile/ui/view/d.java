package com.medium.android.profile.ui.view;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.android.reportuser.ui.ReportUserDialogFragment;
import com.medium.proto.event.UserShare;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.b09;
import defpackage.do9;
import defpackage.eg1;
import defpackage.f76;
import defpackage.g08;
import defpackage.g76;
import defpackage.gp7;
import defpackage.ho2;
import defpackage.i03;
import defpackage.ihe;
import defpackage.iq7;
import defpackage.j7c;
import defpackage.jt0;
import defpackage.k40;
import defpackage.kyc;
import defpackage.m4;
import defpackage.n92;
import defpackage.nl4;
import defpackage.o2b;
import defpackage.oje;
import defpackage.p13;
import defpackage.pge;
import defpackage.pje;
import defpackage.pme;
import defpackage.rqd;
import defpackage.s26;
import defpackage.sje;
import defpackage.slc;
import defpackage.vx0;
import defpackage.xpc;
import gen.model.SourceParameter;
import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d implements ihe {
    public final /* synthetic */ pge a;
    public final /* synthetic */ m b;

    public d(pge pgeVar, m mVar) {
        this.a = pgeVar;
        this.b = mVar;
    }

    @Override // defpackage.dle
    public final void B(String str, g08 g08Var) {
        g08Var.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).s0(userProfileFragment.S(), str, g08Var, null, true);
    }

    @Override // defpackage.nfe
    public final void C(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        s sVarZ = userProfileFragment.Z();
        Context contextS = userProfileFragment.S();
        if (userProfileFragment.v0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).f(contextS, Uri.parse(i03.n), gp7.u(sourceParameter));
    }

    @Override // defpackage.h8e
    public final void D(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        b09.O(userProfileFragment.Z(), userProfileFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }

    @Override // defpackage.ihe
    public final void E(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).j0(userProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.kee
    public final void F(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).e(userProfileFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe
    public final void G(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).r(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.dle
    public final void H(String str, String str2, g08 g08Var) {
        g08Var.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).s0(userProfileFragment.S(), str, g08Var, str2, true);
    }

    @Override // defpackage.h8e
    public final void I(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).u(userProfileFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.dle
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).r0(userProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe
    public final void K(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).k(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new do9(mVar, str3, sourceParameter, str, str2, null), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        m mVar = this.b;
        if (mVar.v) {
            mVar.o.i(str, mVar.d, gp7.u(sourceParameter), mVar.z);
            mVar.v = false;
        }
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new sje(str, mVar, str2, sourceParameter, (n92) null), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new kyc(mVar, str3, str, str2, sourceParameter, (n92) null, 8), 3);
    }

    @Override // defpackage.ihe
    public final void R(pme pmeVar) {
        pmeVar.getClass();
        String str = pmeVar.b;
        str.getClass();
        m mVar = this.b;
        s26 s26Var = mVar.r;
        String str2 = mVar.d;
        String strU = gp7.u(mVar.A);
        String str3 = mVar.z;
        s26Var.getClass();
        str2.getClass();
        str3.getClass();
        rqd.a((rqd) s26Var.b, new UserShare(null, str, null, 5, null), str2, strU, false, null, str3, 24);
        Context contextS = this.a.a.S();
        String str4 = pmeVar.c;
        String string = contextS.getString(R.string.share_user_content, str4, pmeVar.a.toString());
        string.getClass();
        String string2 = contextS.getString(R.string.share_user_email_subject, str4);
        string2.getClass();
        String string3 = contextS.getString(R.string.share_user_prompt);
        string3.getClass();
        o2b o2bVar = new o2b(contextS);
        o2bVar.d = string3;
        Intent intent = (Intent) o2bVar.c;
        intent.setType("text/plain");
        intent.putExtra("android.intent.extra.SUBJECT", string2);
        intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
        o2bVar.K();
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new sje(mVar, str, sourceParameter, str2, (n92) null), 3);
    }

    @Override // defpackage.ihe
    public final void T() {
        UserProfileTab.Books books = UserProfileTab.Books.INSTANCE;
        books.getClass();
        this.b.t.d("selected_tab", books);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new oje(mVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.ihe
    public final void V(jt0 jt0Var) {
        UserProfileFragment userProfileFragment = this.a.a;
        s sVarZ = userProfileFragment.Z();
        Context contextS = userProfileFragment.S();
        String str = jt0Var.e;
        Uri uri = str != null ? Uri.parse(str) : null;
        if (uri != null) {
            ((p13) sVarZ).f(contextS, uri, gp7.u(jt0Var.h));
        } else {
            ay0.e("Book link is null");
        }
    }

    @Override // defpackage.dle
    public final void X(Uri uri, SourceParameter sourceParameter) {
        uri.getClass();
        sourceParameter.getClass();
        String string = uri.toString();
        string.getClass();
        this.a.a(string, sourceParameter);
    }

    @Override // defpackage.ihe
    public final void a() {
        k40.X(this.a.a).f();
    }

    @Override // defpackage.kee, defpackage.nfe, defpackage.qbe, defpackage.h8e, defpackage.dle
    public final void b(boolean z) {
        m mVar = this.b;
        xpc xpcVar = mVar.D;
        int iIntValue = ((Number) xpcVar.getValue()).intValue();
        xpcVar.m(null, Integer.valueOf(iq7.v(z ? iIntValue + 1 : iIntValue - 1, 0, mVar.y)));
    }

    @Override // defpackage.ihe
    public final void b0() {
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new pje(mVar, null, 0), 3);
    }

    @Override // defpackage.ihe, defpackage.h8e, defpackage.dle
    public final void c(CatalogItemType catalogItemType, String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        catalogItemType.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).m0(userProfileFragment.S(), catalogItemType, str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe
    public final void c0(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new oje(mVar, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.qbe
    public final void d(String str, String str2) throws PendingIntent.CanceledException {
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).h0(userProfileFragment.S(), str, str2);
    }

    @Override // defpackage.ihe
    public final void d0(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new oje(mVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.ihe, defpackage.h8e, defpackage.dle
    public final void e(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        postShareData.getClass();
        g08Var.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).t0(userProfileFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    @Override // defpackage.ihe
    public final void e0(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        userProfileFragment.Z();
        Context contextS = userProfileFragment.S();
        String strU = gp7.u(sourceParameter);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new ReportUserDialogFragment.BundleInfo(str, strU));
        m4.w(contextS, R.id.reportUserDialogFragment, bundle, null, 12);
    }

    @Override // defpackage.qbe
    public final void f(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).w0(userProfileFragment.S(), str, str2);
    }

    @Override // defpackage.ihe
    public final void f0(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new oje(mVar, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.ihe, defpackage.kee, defpackage.nfe
    public final void g(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).m(userProfileFragment.S(), gp7.u(sourceParameter), false);
    }

    @Override // defpackage.ihe
    public final void g0(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new oje(mVar, str, sourceParameter, null, 4), 3);
    }

    @Override // defpackage.ihe
    public final void h() {
        m mVar = this.b;
        String str = mVar.d;
        String str2 = mVar.z;
        if (mVar.w) {
            return;
        }
        mVar.w = true;
        SourceParameter sourceParameter = mVar.A;
        String str3 = sourceParameter.author_id;
        if (str3 == null) {
            return;
        }
        String strU = gp7.u(sourceParameter);
        mVar.p.k(str3, str, strU, str2);
        mVar.q.j(str, strU, str2);
        if (mVar.x) {
            return;
        }
        slc slcVar = mVar.s;
        slcVar.getClass();
        nl4 nl4Var = nl4.ENABLE_SPRIG_EVENT_PROFILE_VIEWED;
        Map mapSingletonMap = Collections.singletonMap("profileViewed.userId", str3);
        mapSingletonMap.getClass();
        slcVar.a("user.otherProfileViewed", nl4Var, mapSingletonMap);
    }

    @Override // defpackage.kee, defpackage.h8e, defpackage.dle
    public final void i(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).y(userProfileFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.ihe
    public final void j(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        b09.O(userProfileFragment.Z(), userProfileFragment.S(), str, gp7.u(sourceParameter), null, null, null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
    }

    @Override // defpackage.ihe
    public final void j0(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).W(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe, defpackage.h8e, defpackage.dle
    public final void k(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).j(userProfileFragment.S(), str, EntityType.AUTHOR, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe, defpackage.h8e, defpackage.dle
    public final void l(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).p0(userProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe
    public final void l0(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).P(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe, defpackage.h8e, defpackage.dle
    public final void m(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).u0(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.qbe
    public final void n() {
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).d0(userProfileFragment.S());
    }

    @Override // defpackage.kee, defpackage.nfe
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.a(str, sourceParameter);
    }

    @Override // defpackage.ihe, defpackage.dle
    public final void q(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        s sVarZ = userProfileFragment.Z();
        Context contextS = userProfileFragment.S();
        if (userProfileFragment.v0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).f(contextS, Uri.parse(i03.z), gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe
    public final void q0(UserProfileTab userProfileTab) {
        userProfileTab.getClass();
        this.b.t.d("selected_tab", userProfileTab);
    }

    @Override // defpackage.h8e, defpackage.dle
    public final void r(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        b09.O(userProfileFragment.Z(), userProfileFragment.S(), str, gp7.u(sourceParameter), str2, null, null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
    }

    @Override // defpackage.ihe
    public final void r0(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).v(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.qbe
    public final void s(UpsellInfo upsellInfo, String str) throws PendingIntent.CanceledException {
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).J(userProfileFragment.S(), upsellInfo, str, null);
    }

    @Override // defpackage.ihe
    public final void t() {
        m mVar = this.b;
        vx0.c0(f76.F(mVar), null, null, new pje(mVar, null, 1), 3);
    }

    @Override // defpackage.h8e, defpackage.dle
    public final void u(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).Q(userProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ihe
    public final void v(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        b09.K(userProfileFragment.Z(), userProfileFragment.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.qbe
    public final void w(String str, String str2) {
        str.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).c(userProfileFragment.S(), str, str2);
    }

    @Override // defpackage.qbe
    public final void x(eg1 eg1Var) {
        eg1Var.getClass();
        j7c.a(this.a.a.S(), eg1Var);
    }

    @Override // defpackage.h8e, defpackage.dle
    public final void z(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a.a;
        ((p13) userProfileFragment.Z()).j0(userProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }
}
