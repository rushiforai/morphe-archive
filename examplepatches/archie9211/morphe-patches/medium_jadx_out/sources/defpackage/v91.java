package defpackage;

import android.app.PendingIntent;
import com.drew.metadata.avi.AviDirectory;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v91 implements sh9 {
    public final /* synthetic */ z81 a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ id1 c;

    public v91(z81 z81Var, l78 l78Var, id1 id1Var) {
        this.a = z81Var;
        this.b = l78Var;
        this.c = id1Var;
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
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new zc1(id1Var, str, null, 1), 3);
        vob vobVar = id1Var.z;
        Set set = (Set) no7.s(vobVar, "posts_presented", ny3.a);
        if (set.contains(str)) {
            return;
        }
        vobVar.d("posts_presented", qo7.w(set, str));
        b09.Y(id1Var.g, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, id1Var.c, gp7.u(sourceParameter), id1Var.g(), id1Var.F, AviDirectory.TAG_DATETIME_ORIGINAL);
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new mc1(id1Var, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.sh9
    public final void D(SourceParameter sourceParameter, String str, String str2, String str3) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str, str2);
        ((w81) this.a).a(null, str, str2, str3, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).y(catalogDetailFragment.S(), new PublicationReference.Id(str), strU, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new qa((que) id1Var, str, true, sourceParameter, (n92) null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str2, str3);
        ((w81) this.a).a(str, str2, str3, str4, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new bd1(id1Var, true, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new bd1(id1Var, false, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).p0(catalogDetailFragment.S(), str, str2, strU);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.k(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new bd1(id1Var, true, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void M(lj3 lj3Var, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new l0(id1Var, sourceParameter, lj3Var, null, 20), 3);
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new nc1(id1Var, str2, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new mc1(id1Var, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        b09.j(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        id1 id1Var = this.c;
        id1Var.C.s(sourceParameter, str, str2, id1Var.c, id1Var.g());
        String strU = gp7.u(sourceParameter);
        CatalogDetailFragment catalogDetailFragment = ((w81) this.a).a;
        ((p13) catalogDetailFragment.Z()).j0(catalogDetailFragment.S(), str, str2, strU);
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        id1 id1Var = this.c;
        id1Var.C.r(sourceParameter, str, str2, id1Var.c, id1Var.g());
        String strU = gp7.u(sourceParameter);
        CatalogDetailFragment catalogDetailFragment = ((w81) this.a).a;
        ((p13) catalogDetailFragment.Z()).j0(catalogDetailFragment.S(), str, str2, strU);
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new mc1(id1Var, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).Q(catalogDetailFragment.S(), str, strU);
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).u0(catalogDetailFragment.S(), str, strU);
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new qa((que) id1Var, str, false, sourceParameter, (n92) null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void p(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new rc0(id1Var, str, null, 2), 3);
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
        CatalogItemType catalogItemType = CatalogItemType.POST;
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        catalogItemType.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).m0(catalogDetailFragment.S(), catalogItemType, str, strU);
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
        String str = g08Var.a;
        String str2 = g08Var.d;
        String str3 = g08Var.c;
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        str.getClass();
        str3.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).t0(catalogDetailFragment.S(), postShareData, str, str2, str3);
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
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        entityType.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).j(catalogDetailFragment.S(), str, entityType, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new bd1(id1Var, false, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        id1 id1Var = this.c;
        vx0.c0(f76.F(id1Var), null, null, new mc1(id1Var, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        String str2 = (String) this.b.getValue();
        if (str2 == null) {
            ay0.e("Navigating to the post page should only be possible when the catalog detail is visible.");
            return;
        }
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.a;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        b09.O(catalogDetailFragment.Z(), catalogDetailFragment.S(), str, strU, null, null, new ReadingContext.Catalog(str2), 88);
    }
}
