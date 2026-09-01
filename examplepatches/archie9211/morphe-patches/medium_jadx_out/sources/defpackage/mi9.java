package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.ImageView;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.donkey.post.PostPageFragment2;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mi9 implements oi9 {
    public final /* synthetic */ PostPageFragment2 a;

    public mi9(PostPageFragment2 postPageFragment2) {
        this.a = postPageFragment2;
    }

    @Override // defpackage.oi9
    public final void E(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).j0(postPageFragment2.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void F(String str, String str2) {
        str.getClass();
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).Q(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void G(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        b09.K(postPageFragment2.Z(), postPageFragment2.S(), new EditPostReference.ExistingPost(str), str2);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void H(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        b09.K(postPageFragment2.Z(), postPageFragment2.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void I(String str, SourceParameter sourceParameter) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).y(postPageFragment2.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.oi9
    public final void J(ResponsesReference.Post post, String str) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).E(postPageFragment2.S(), post, str, false);
    }

    @Override // defpackage.oi9
    public final void K(String str, String str2, String str3) throws PendingIntent.CanceledException {
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).p0(postPageFragment2.S(), str, str2, str3);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void L(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).i0(postPageFragment2.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void M(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).u0(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void N(String str, EntityType entityType, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).j(postPageFragment2.S(), str, entityType, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void O(PostShareData postShareData, String str, String str2, String str3) throws PendingIntent.CanceledException {
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).t0(postPageFragment2.S(), postShareData, str, str2, str3);
    }

    @Override // defpackage.oi9
    public final void P(String str, g08 g08Var) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        b09.W(postPageFragment2.Z(), postPageFragment2.S(), str, g08Var, null, 24);
    }

    @Override // defpackage.oi9
    public final void Q(String str, String str2, g08 g08Var) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        b09.W(postPageFragment2.Z(), postPageFragment2.S(), str, g08Var, str2, 16);
    }

    @Override // defpackage.oi9
    public final void R(String str) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).Y(postPageFragment2.S(), str);
    }

    @Override // defpackage.oi9
    public final void S(SourceParameter sourceParameter, String str, String str2, String str3, String str4) throws PendingIntent.CanceledException {
        ho2.P(sourceParameter, str, str2, str3);
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).k0(postPageFragment2.S(), str, str2, str3, str4, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void T(String str, String str2) {
        str.getClass();
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).c(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void U(Uri uri, String str) {
        uri.getClass();
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        py2 py2Var = postPageFragment2.u0;
        if (py2Var != null) {
            py2Var.a(postPageFragment2.S(), uri, str, null);
        } else {
            g76.g0("deepLinkHandler");
            throw null;
        }
    }

    @Override // defpackage.oi9
    public final void V(CatalogItemType catalogItemType, String str, String str2) throws PendingIntent.CanceledException {
        catalogItemType.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).m0(postPageFragment2.S(), catalogItemType, str, str2);
    }

    @Override // defpackage.oi9
    public final void W(String str) throws PendingIntent.CanceledException {
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).e(postPageFragment2.S(), str);
    }

    @Override // defpackage.oi9
    public final void X(UpsellInfo upsellInfo, String str) throws PendingIntent.CanceledException {
        upsellInfo.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).J(postPageFragment2.S(), upsellInfo, str, null);
    }

    @Override // defpackage.oi9
    public final void Y(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).x(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void Z(String str) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        s sVarZ = postPageFragment2.Z();
        Context contextS = postPageFragment2.S();
        if (postPageFragment2.v0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).g(contextS, Uri.parse(i03.v), str);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void a() {
        this.a.Q().getOnBackPressedDispatcher().d();
    }

    @Override // defpackage.oi9
    public final void a0(HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).l0(postPageFragment2.S(), highlightReference, sourceParameter, str, str2);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str, str2);
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).j0(postPageFragment2.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void b0() {
        PostPageFragment2 postPageFragment2 = this.a;
        postPageFragment2.Z();
        Context contextS = postPageFragment2.S();
        Intent intent = new Intent();
        intent.setAction("com.android.settings.TTS_SETTINGS");
        contextS.startActivity(intent);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str, str2);
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).j0(postPageFragment2.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void c0(String str, String str2) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).N(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void d(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).h0(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void d0(String str, String str2, String str3) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).n0(postPageFragment2.S(), str, str2, str3);
    }

    @Override // defpackage.oi9
    public final void e0(String str, String str2, String str3, ReadingContext readingContext) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        b09.O(postPageFragment2.Z(), postPageFragment2.S(), str, str2, str3, null, readingContext, 80);
    }

    @Override // defpackage.oi9
    public final void f(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).w0(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void f0(String str, String str2) {
        str.getClass();
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).y(postPageFragment2.S(), new PublicationReference.Id(str), str2, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void g(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        g08Var.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).t0(postPageFragment2.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    @Override // defpackage.oi9
    public final void g0(String str, String str2) throws PendingIntent.CanceledException {
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).k(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void h(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).r(postPageFragment2.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void h0(String str, g08 g08Var) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        b09.W(postPageFragment2.Z(), postPageFragment2.S(), str, g08Var, null, 8);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void i(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).p0(postPageFragment2.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.oi9
    public final void i0(String str, String str2) throws PendingIntent.CanceledException {
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).P(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void j(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).q(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void j0(String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).n(postPageFragment2.S(), str, str2, str3, num, num2, str4, imageView, cx7Var);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void k(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).m0(postPageFragment2.S(), CatalogItemType.POST, str, str2);
    }

    @Override // defpackage.oi9
    public final void k0(String str, String str2, String str3, String str4, boolean z) throws PendingIntent.CanceledException {
        b09.I(str, str2, str3);
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).q0(postPageFragment2.S(), str, str2, str3, z, str4);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void l(String str, String str2) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).E(postPageFragment2.S(), new ResponsesReference.Post(str, null, null, null, null, 30, null), str2, false);
    }

    @Override // defpackage.oi9
    public final void l0(String str, EntityType entityType, String str2, String str3, String str4) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        str2.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).v0(postPageFragment2.S(), str, entityType, str2, str3, str4);
    }

    @Override // defpackage.oi9
    public final void m0(String str) {
        PostPageFragment2 postPageFragment2 = this.a;
        postPageFragment2.Z();
        m4.i(postPageFragment2.S()).b.m(R.id.homeFragment, false);
    }

    @Override // defpackage.oi9
    public final void n0(String str, String str2) {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).y(postPageFragment2.S(), new PublicationReference.Id(str), str2, PublicationTab.Newsletter.INSTANCE);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void o(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).s(postPageFragment2.S(), str, str2);
    }

    @Override // defpackage.oi9
    public final void o0() {
        PostPageFragment2 postPageFragment2 = this.a;
        ((p13) postPageFragment2.Z()).b0(postPageFragment2.S());
    }
}
