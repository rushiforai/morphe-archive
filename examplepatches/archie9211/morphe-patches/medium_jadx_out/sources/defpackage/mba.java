package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.publication.ui.archive.PublicationArchiveFragment;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mba implements sh9 {
    public final /* synthetic */ olb a;
    public final /* synthetic */ lca b;

    public mba(olb olbVar, lca lcaVar) {
        this.a = olbVar;
        this.b = lcaVar;
    }

    @Override // defpackage.sh9
    public final /* bridge */ void A(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.a(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void B(String str, PostClientVisibilityState postClientVisibilityState, SourceParameter sourceParameter) {
        postClientVisibilityState.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        if (lcaVar.v.add(str)) {
            b09.Y(lcaVar.k, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, lcaVar.d, gp7.u(sourceParameter), lcaVar.t, false, 448);
        }
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new eca(lcaVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void D(SourceParameter sourceParameter, String str, String str2, String str3) {
        b09.c(sourceParameter, str, str2, str3);
        throw null;
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        throw new UnsupportedOperationException("Don't show publications on post previews in publication archive screen");
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new qa((que) lcaVar, str, true, sourceParameter, (n92) null, 9), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        b09.e(sourceParameter, str, str2, str3, str4);
        throw null;
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new jca(lcaVar, true, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new jca(lcaVar, false, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        ((p13) publicationArchiveFragment.Z()).p0(publicationArchiveFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final /* bridge */ void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.k(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new jca(lcaVar, true, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void M(lj3 lj3Var, SourceParameter sourceParameter) {
        b09.d(sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new zo5(lcaVar, str2, str, sourceParameter, null, 22), 3);
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new eca(lcaVar, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        b09.j(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        lca lcaVar = this.b;
        lcaVar.j.s(sourceParameter, str, str2, lcaVar.d, lcaVar.t);
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        s sVarZ = publicationArchiveFragment.Z();
        ((p13) sVarZ).j0(publicationArchiveFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        lca lcaVar = this.b;
        lcaVar.j.r(sourceParameter, str, str2, lcaVar.d, lcaVar.t);
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        s sVarZ = publicationArchiveFragment.Z();
        ((p13) sVarZ).j0(publicationArchiveFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new eca(lcaVar, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        ((p13) publicationArchiveFragment.Z()).Q(publicationArchiveFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        ((p13) publicationArchiveFragment.Z()).u0(publicationArchiveFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new qa((que) lcaVar, str, false, sourceParameter, (n92) null, 9), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void p(String str, SourceParameter sourceParameter) {
        b09.f(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final /* bridge */ void q(String str, SourceParameter sourceParameter) {
        b09.g(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final /* bridge */ void r(String str, SourceParameter sourceParameter) {
        b09.b(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void s(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        ((p13) publicationArchiveFragment.Z()).m0(publicationArchiveFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final /* bridge */ void t(String str, SourceParameter sourceParameter) {
        b09.h(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void u(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        postShareData.getClass();
        g08Var.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        ((p13) publicationArchiveFragment.Z()).t0(publicationArchiveFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    @Override // defpackage.sh9
    public final void v(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
    }

    @Override // defpackage.sh9
    public final void w(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        EntityType entityType = EntityType.AUTHOR;
        entityType.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        ((p13) publicationArchiveFragment.Z()).j(publicationArchiveFragment.S(), str, entityType, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new jca(lcaVar, false, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        lca lcaVar = this.b;
        vx0.c0(f76.F(lcaVar), null, null, new eca(lcaVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this.a.b;
        b09.O(publicationArchiveFragment.Z(), publicationArchiveFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }
}
