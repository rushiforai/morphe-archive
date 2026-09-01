package defpackage;

import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hle implements sh9 {
    public final /* synthetic */ dle a;
    public final /* synthetic */ ime b;

    public hle(dle dleVar, ime imeVar) {
        this.a = dleVar;
        this.b = imeVar;
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
        ime imeVar = this.b;
        g08 g08Var = imeVar.r;
        if (imeVar.t.add(str)) {
            b09.Y(imeVar.i, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, g08Var.a, gp7.u(sourceParameter), g08Var.c, false, 448);
        }
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 5), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void D(SourceParameter sourceParameter, String str, String str2, String str3) {
        b09.c(sourceParameter, str, str2, str3);
        throw null;
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        this.a.i(str, sourceParameter);
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new qa((que) imeVar, str, true, sourceParameter, (n92) null, 22), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        b09.e(sourceParameter, str, str2, str3, str4);
        throw null;
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new hme(imeVar, true, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new hme(imeVar, false, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        this.a.l(sourceParameter, str, str2);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        b09.k(sourceParameter, str, str2);
        throw null;
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new hme(imeVar, true, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void M(lj3 lj3Var, SourceParameter sourceParameter) {
        b09.d(sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new gbd(imeVar, str2, str, sourceParameter, null, 17), 3);
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        b09.j(str, sourceParameter);
        throw null;
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) {
        sourceParameter.getClass();
        ime imeVar = this.b;
        tl tlVar = imeVar.e;
        g08 g08Var = imeVar.r;
        tlVar.s(sourceParameter, str, str2, g08Var.a, g08Var.c);
        this.a.z(sourceParameter, str, str2);
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) {
        sourceParameter.getClass();
        ime imeVar = this.b;
        tl tlVar = imeVar.e;
        g08 g08Var = imeVar.r;
        tlVar.r(sourceParameter, str, str2, g08Var.a, g08Var.c);
        this.a.z(sourceParameter, str, str2);
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 4), 3);
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.u(str, sourceParameter);
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a.m(str, sourceParameter);
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new qa((que) imeVar, str, false, sourceParameter, (n92) null, 22), 3);
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
        this.a.c(CatalogItemType.POST, str, sourceParameter);
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
        this.a.e(postShareData, g08Var);
    }

    @Override // defpackage.sh9
    public final void v(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
    }

    @Override // defpackage.sh9
    public final void w(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k(str, sourceParameter);
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new hme(imeVar, false, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.b;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 6), 3);
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.r(sourceParameter, str, null);
    }
}
