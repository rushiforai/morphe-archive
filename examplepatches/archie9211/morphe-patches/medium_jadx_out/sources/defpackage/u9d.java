package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.tag.recommendedposts.TagRecommendedPostsFragment;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u9d implements sh9 {
    public final /* synthetic */ o9d a;
    public final /* synthetic */ had b;

    public u9d(o9d o9dVar, had hadVar) {
        this.a = o9dVar;
        this.b = hadVar;
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
        had hadVar = this.b;
        if (hadVar.s.add(str)) {
            b09.Y(hadVar.h, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, hadVar.c, gp7.u(sourceParameter), hadVar.o, false, 448);
        }
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new ead(hadVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void D(SourceParameter sourceParameter, String str, String str2, String str3) {
        b09.c(sourceParameter, str, str2, str3);
        throw null;
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).y(tagRecommendedPostsFragment.S(), new PublicationReference.Id(str), strU, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new qa((que) hadVar, str, true, sourceParameter, (n92) null, 18), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        b09.e(sourceParameter, str, str2, str3, str4);
        throw null;
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new fad(hadVar, true, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new fad(hadVar, false, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).p0(tagRecommendedPostsFragment.S(), str, str2, strU);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.k(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new fad(hadVar, true, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void M(lj3 lj3Var, SourceParameter sourceParameter) {
        b09.d(sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new rna(hadVar, str2, str, sourceParameter, null, 27), 3);
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new ead(hadVar, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        b09.j(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        had hadVar = this.b;
        hadVar.f.s(sourceParameter, str, str2, hadVar.c, hadVar.o);
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).j0(tagRecommendedPostsFragment.S(), str, str2, strU);
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        had hadVar = this.b;
        hadVar.f.r(sourceParameter, str, str2, hadVar.c, hadVar.o);
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).j0(tagRecommendedPostsFragment.S(), str, str2, strU);
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new ead(hadVar, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).Q(tagRecommendedPostsFragment.S(), str, strU);
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).u0(tagRecommendedPostsFragment.S(), str, strU);
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new qa((que) hadVar, str, false, sourceParameter, (n92) null, 18), 3);
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
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).m0(tagRecommendedPostsFragment.S(), CatalogItemType.POST, str, strU);
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
        str.getClass();
        str3.getClass();
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).t0(tagRecommendedPostsFragment.S(), postShareData, str, str2, str3);
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
        String strU = gp7.u(sourceParameter);
        entityType.getClass();
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        ((p13) tagRecommendedPostsFragment.Z()).j(tagRecommendedPostsFragment.S(), str, entityType, strU);
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new fad(hadVar, false, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        had hadVar = this.b;
        vx0.c0(f76.F(hadVar), null, null, new ead(hadVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.a.a;
        b09.O(tagRecommendedPostsFragment.Z(), tagRecommendedPostsFragment.S(), str, strU, null, null, null, 120);
    }
}
