package defpackage;

import android.app.PendingIntent;
import android.content.Context;
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
import com.medium.android.donkey.write.publicationflow.PublicationFlowActivity;
import com.medium.android.donkey.write.publicationflow.a;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.profile.ui.you.posts.withdrawsubmission.WithdrawSubmissionConfirmationDialogFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mbf implements obf {
    public final /* synthetic */ YouProfileFragment a;

    public mbf(YouProfileFragment youProfileFragment) {
        this.a = youProfileFragment;
    }

    @Override // defpackage.obf
    public final void A(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        youProfileFragment.Z();
        Context contextS = youProfileFragment.S();
        String strU = gp7.u(sourceParameter);
        int i = PublicationFlowActivity.p;
        contextS.startActivity(a.a(contextS, new PublicationFlowActivity.BundleInfo(str, strU, "PUBLICATION_DESTINATION")));
    }

    @Override // defpackage.obf, defpackage.dle
    public final void B(String str, g08 g08Var) {
        g08Var.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).s0(youProfileFragment.S(), str, g08Var, null, true);
    }

    @Override // defpackage.obf, defpackage.nfe
    public final void C(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        s sVarZ = youProfileFragment.Z();
        Context contextS = youProfileFragment.S();
        if (youProfileFragment.u0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).f(contextS, Uri.parse(i03.n), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.h8e
    public final void D(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        b09.O(youProfileFragment.Z(), youProfileFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }

    @Override // defpackage.obf, defpackage.kee
    public final void F(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).e(youProfileFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void G(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).r(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.dle
    public final void H(String str, String str2, g08 g08Var) {
        g08Var.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).s0(youProfileFragment.S(), str, g08Var, str2, true);
    }

    @Override // defpackage.obf, defpackage.h8e
    public final void I(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).u(youProfileFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.dle
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).r0(youProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void L(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).k(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void M(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).P(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void S(String str, SourceParameter sourceParameter) {
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).y(youProfileFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.obf
    public final void U(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).v(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void Z(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        YouProfileFragment youProfileFragment = this.a;
        b09.K(youProfileFragment.Z(), youProfileFragment.S(), EditPostReference.NewPost.INSTANCE, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void c(CatalogItemType catalogItemType, String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        catalogItemType.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).m0(youProfileFragment.S(), catalogItemType, str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.qbe
    public final void d(String str, String str2) throws PendingIntent.CanceledException {
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).h0(youProfileFragment.S(), str, str2);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void e(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        postShareData.getClass();
        g08Var.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).t0(youProfileFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    @Override // defpackage.obf, defpackage.qbe
    public final void f(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).w0(youProfileFragment.S(), str, str2);
    }

    @Override // defpackage.obf, defpackage.kee, defpackage.nfe
    public final void g(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).m(youProfileFragment.S(), gp7.u(sourceParameter), false);
    }

    @Override // defpackage.obf, defpackage.kee, defpackage.h8e, defpackage.dle
    public final void i(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).y(youProfileFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.obf
    public final void j(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        b09.O(youProfileFragment.Z(), youProfileFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void k(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).j(youProfileFragment.S(), str, EntityType.AUTHOR, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void l(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).p0(youProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void m(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).u0(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.qbe
    public final void n() {
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).d0(youProfileFragment.S());
    }

    @Override // defpackage.obf
    public final void n0(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).W(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.kee, defpackage.nfe
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        py2 py2Var = youProfileFragment.v0;
        if (py2Var != null) {
            py2Var.a(youProfileFragment.S(), Uri.parse(str), gp7.u(sourceParameter), null);
        } else {
            g76.g0("deepLinkHandler");
            throw null;
        }
    }

    @Override // defpackage.obf
    public final void o0(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).G(youProfileFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void p(SourceParameter sourceParameter, String str, String str2, boolean z) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        youProfileFragment.Z();
        Context contextS = youProfileFragment.S();
        String strU = gp7.u(sourceParameter);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new WithdrawSubmissionConfirmationDialogFragment.BundleInfo(str, str2, z, strU));
        m4.w(contextS, R.id.withdrawSubmissionConfirmationDialogFragment, bundle, null, 12);
    }

    @Override // defpackage.obf
    public final void p0(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).e(youProfileFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.dle
    public final void q(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        s sVarZ = youProfileFragment.Z();
        Context contextS = youProfileFragment.S();
        if (youProfileFragment.u0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).f(contextS, Uri.parse(i03.z), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void r(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        b09.O(youProfileFragment.Z(), youProfileFragment.S(), str, gp7.u(sourceParameter), str2, null, null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
    }

    @Override // defpackage.obf, defpackage.qbe
    public final void s(UpsellInfo upsellInfo, String str) throws PendingIntent.CanceledException {
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).J(youProfileFragment.S(), upsellInfo, str, null);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void u(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).Q(youProfileFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.obf
    public final void v(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        b09.K(youProfileFragment.Z(), youProfileFragment.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.obf, defpackage.qbe
    public final void w(String str, String str2) {
        str.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).c(youProfileFragment.S(), str, str2);
    }

    @Override // defpackage.obf, defpackage.qbe
    public final void x(eg1 eg1Var) {
        eg1Var.getClass();
        j7c.a(this.a.S(), eg1Var);
    }

    @Override // defpackage.obf, defpackage.h8e, defpackage.dle
    public final void z(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YouProfileFragment youProfileFragment = this.a;
        ((p13) youProfileFragment.Z()).j0(youProfileFragment.S(), str, str2, gp7.u(sourceParameter));
    }
}
