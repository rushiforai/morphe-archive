package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wta implements sh9 {
    public final /* synthetic */ pta a;
    public final /* synthetic */ nua b;

    public wta(pta ptaVar, nua nuaVar) {
        this.a = ptaVar;
        this.b = nuaVar;
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
        nua nuaVar = this.b;
        if (nuaVar.p.add(str)) {
            b09.Y(nuaVar.f, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, nuaVar.b, gp7.u(sourceParameter), nuaVar.i, false, 448);
        }
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new jua(nuaVar, str, sourceParameter, null, 4), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void D(SourceParameter sourceParameter, String str, String str2, String str3) {
        b09.c(sourceParameter, str, str2, str3);
        throw null;
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        this.a.j(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new qa((que) nuaVar, str, true, sourceParameter, (n92) null, 12), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        b09.e(sourceParameter, str, str2, str3, str4);
        throw null;
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new mua(nuaVar, true, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new mua(nuaVar, false, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        this.a.K(str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final /* bridge */ void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.k(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new mua(nuaVar, true, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void M(lj3 lj3Var, SourceParameter sourceParameter) {
        b09.d(sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new rna(nuaVar, str2, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new jua(nuaVar, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        b09.j(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) {
        sourceParameter.getClass();
        nua nuaVar = this.b;
        nuaVar.e.s(sourceParameter, str, str2, nuaVar.b, nuaVar.i);
        this.a.g(str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) {
        sourceParameter.getClass();
        nua nuaVar = this.b;
        nuaVar.e.r(sourceParameter, str, str2, nuaVar.b, nuaVar.i);
        this.a.g(str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new jua(nuaVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.b(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a.M(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new qa((que) nuaVar, str, false, sourceParameter, (n92) null, 12), 3);
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
    public final void s(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a.e(CatalogItemType.POST, str, gp7.u(sourceParameter));
    }

    @Override // defpackage.sh9
    public final /* bridge */ void t(String str, SourceParameter sourceParameter) {
        b09.h(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void u(PostShareData postShareData, g08 g08Var) {
        postShareData.getClass();
        g08Var.getClass();
        this.a.O(postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    @Override // defpackage.sh9
    public final void v(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new jua(nuaVar, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void w(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.a.N(str, EntityType.AUTHOR, sourceParameter);
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new mua(nuaVar, false, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        nua nuaVar = this.b;
        vx0.c0(f76.F(nuaVar), null, null, new jua(nuaVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.c(str, gp7.u(sourceParameter));
    }
}
