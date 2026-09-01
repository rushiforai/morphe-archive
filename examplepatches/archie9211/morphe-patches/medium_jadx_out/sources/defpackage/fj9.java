package defpackage;

import android.net.Uri;
import android.widget.ImageView;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fj9 implements oi9, iq9, pu0 {
    public final /* synthetic */ oi9 a;
    public final /* synthetic */ oi9 b;
    public final /* synthetic */ sw9 c;
    public final /* synthetic */ ug7 d;
    public final /* synthetic */ m45 e;
    public final /* synthetic */ l78 f;
    public final /* synthetic */ upc g;

    public fj9(oi9 oi9Var, sw9 sw9Var, ug7 ug7Var, m45 m45Var, l78 l78Var, l78 l78Var2) {
        this.b = oi9Var;
        this.c = sw9Var;
        this.d = ug7Var;
        this.e = m45Var;
        this.f = l78Var;
        this.g = l78Var2;
        this.a = oi9Var;
    }

    @Override // defpackage.iq9
    public final void A(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.c.w(sourceParameter, str2, str, false);
    }

    @Override // defpackage.iq9
    public final void B(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.c.y(sourceParameter, str, false);
    }

    @Override // defpackage.iq9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.c.y(sourceParameter, str, true);
    }

    @Override // defpackage.iq9
    public final void D(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.c.k(str, sourceParameter);
    }

    @Override // defpackage.oi9
    public final void E(SourceParameter sourceParameter, String str, String str2) {
        sourceParameter.getClass();
        this.a.E(sourceParameter, str, str2);
    }

    @Override // defpackage.oi9
    public final void F(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a.F(str, str2);
    }

    @Override // defpackage.oi9
    public final void G(String str, String str2) {
        str.getClass();
        this.a.G(str, str2);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void H(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.b.H(str, sourceParameter);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void I(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.b.I(str, sourceParameter);
    }

    @Override // defpackage.oi9
    public final void J(ResponsesReference.Post post, String str) {
        str.getClass();
        this.a.J(post, str);
    }

    @Override // defpackage.oi9
    public final void K(String str, String str2, String str3) {
        str2.getClass();
        this.a.K(str, str2, str3);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void L(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.b.L(str, sourceParameter);
    }

    @Override // defpackage.oi9
    public final void M(String str, String str2) {
        str.getClass();
        this.a.M(str, str2);
    }

    @Override // defpackage.oi9
    public final void N(String str, EntityType entityType, SourceParameter sourceParameter) {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        this.a.N(str, entityType, sourceParameter);
    }

    @Override // defpackage.oi9
    public final void O(PostShareData postShareData, String str, String str2, String str3) {
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        this.a.O(postShareData, str, str2, str3);
    }

    @Override // defpackage.oi9
    public final void P(String str, g08 g08Var) {
        str.getClass();
        this.a.P(str, g08Var);
    }

    @Override // defpackage.oi9
    public final void Q(String str, String str2, g08 g08Var) {
        str.getClass();
        this.a.Q(str, str2, g08Var);
    }

    @Override // defpackage.oi9
    public final void R(String str) {
        str.getClass();
        this.a.R(str);
    }

    @Override // defpackage.oi9
    public final void S(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        ho2.P(sourceParameter, str, str2, str3);
        this.a.S(sourceParameter, str, str2, str3, str4);
    }

    @Override // defpackage.oi9
    public final void T(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a.T(str, str2);
    }

    @Override // defpackage.oi9
    public final void U(Uri uri, String str) {
        uri.getClass();
        str.getClass();
        this.a.U(uri, str);
    }

    @Override // defpackage.oi9
    public final void V(CatalogItemType catalogItemType, String str, String str2) {
        catalogItemType.getClass();
        this.a.V(catalogItemType, str, str2);
    }

    @Override // defpackage.oi9
    public final void W(String str) {
        this.a.W(str);
    }

    @Override // defpackage.oi9
    public final void X(UpsellInfo upsellInfo, String str) {
        upsellInfo.getClass();
        this.a.X(upsellInfo, str);
    }

    @Override // defpackage.oi9
    public final void Y(String str, String str2) {
        str.getClass();
        this.a.Y(str, str2);
    }

    @Override // defpackage.oi9
    public final void Z(String str) {
        str.getClass();
        this.a.Z(str);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void a() {
        this.e.invoke();
    }

    @Override // defpackage.oi9
    public final void a0(HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        this.a.a0(highlightReference, sourceParameter, str, str2);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void b(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        sw9 sw9Var = this.c;
        sw9Var.s.s(sourceParameter, str, str2, sw9Var.d, sw9Var.D0);
        this.b.b(sourceParameter, str, str2);
    }

    @Override // defpackage.oi9
    public final void b0() {
        this.a.b0();
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void c(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        sw9 sw9Var = this.c;
        sw9Var.s.r(sourceParameter, str, str2, sw9Var.d, sw9Var.D0);
        this.b.c(sourceParameter, str, str2);
    }

    @Override // defpackage.oi9
    public final void c0(String str, String str2) {
        str.getClass();
        this.a.c0(str, str2);
    }

    @Override // defpackage.oi9
    public final void d(String str, String str2) {
        str.getClass();
        this.a.d(str, str2);
    }

    @Override // defpackage.oi9
    public final void d0(String str, String str2, String str3) {
        str.getClass();
        this.a.d0(str, str2, str3);
    }

    @Override // defpackage.iq9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.c.D(str, sourceParameter);
    }

    @Override // defpackage.oi9
    public final void e0(String str, String str2, String str3, ReadingContext readingContext) {
        str.getClass();
        str2.getClass();
        this.a.e0(str, str2, str3, readingContext);
    }

    @Override // defpackage.oi9
    public final void f(String str, String str2) {
        str.getClass();
        this.a.f(str, str2);
    }

    @Override // defpackage.oi9
    public final void f0(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.a.f0(str, str2);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void g(PostShareData postShareData, g08 g08Var) {
        g08Var.getClass();
        this.b.g(postShareData, g08Var);
    }

    @Override // defpackage.oi9
    public final void g0(String str, String str2) {
        this.a.g0(str, str2);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void h(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.b.h(str, sourceParameter);
    }

    @Override // defpackage.oi9
    public final void h0(String str, g08 g08Var) {
        str.getClass();
        this.a.h0(str, g08Var);
    }

    @Override // defpackage.oi9, defpackage.iq9
    public final void i(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.b.i(sourceParameter, str, str2);
    }

    @Override // defpackage.oi9
    public final void i0(String str, String str2) {
        this.a.i0(str, str2);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void j(String str, String str2) {
        str.getClass();
        this.b.j(str, str2);
    }

    @Override // defpackage.oi9
    public final void j0(String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var) {
        str.getClass();
        str2.getClass();
        this.a.j0(str, str2, str3, num, num2, str4, imageView, cx7Var);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void k(String str, String str2) {
        str.getClass();
        this.b.k(str, str2);
    }

    @Override // defpackage.oi9
    public final void k0(String str, String str2, String str3, String str4, boolean z) {
        b09.I(str, str2, str3);
        this.a.k0(str, str2, str3, str4, z);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void l(String str, String str2) {
        str.getClass();
        this.b.l(str, str2);
    }

    @Override // defpackage.oi9
    public final void l0(String str, EntityType entityType, String str2, String str3, String str4) {
        str.getClass();
        entityType.getClass();
        str2.getClass();
        this.a.l0(str, entityType, str2, str3, str4);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.pu0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(int r5, defpackage.n92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.ej9
            if (r0 == 0) goto L13
            r0 = r6
            ej9 r0 = (defpackage.ej9) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            ej9 r0 = new ej9
            p92 r6 = (defpackage.p92) r6
            r0.<init>(r4, r6)
        L1a:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r4 = r6.a
            return r4
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r6)
            r0.d = r3
            sw9 r4 = r4.c
            java.lang.Object r4 = r4.q(r5, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fj9.m(int, n92):java.lang.Object");
    }

    @Override // defpackage.oi9
    public final void m0(String str) {
        this.a.m0(str);
    }

    @Override // defpackage.iq9
    public final void n(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        sw9 sw9Var = this.c;
        vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 17), 3);
    }

    @Override // defpackage.oi9
    public final void n0(String str, String str2) {
        str.getClass();
        this.a.n0(str, str2);
    }

    @Override // defpackage.oi9, defpackage.pu0
    public final void o(String str, String str2) {
        str.getClass();
        this.b.o(str, str2);
    }

    @Override // defpackage.oi9
    public final void o0() {
        this.b.o0();
    }

    @Override // defpackage.iq9
    public final void p(int i) {
        this.c.B(i);
    }

    public final void p0(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.c.j(str, str2);
    }

    @Override // defpackage.iq9
    public final void q(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        this.c.x(sourceParameter, str2, str, false);
    }

    public final void q0(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.c.E(str, str2);
    }

    @Override // defpackage.iq9
    public final void r(String str, String str2) {
        str.getClass();
        str2.getClass();
        tu9 tu9Var = (tu9) this.g.getValue();
        su9 su9Var = tu9Var instanceof su9 ? (su9) tu9Var : null;
        if (su9Var != null) {
            this.f.setValue(new q53(su9Var.f.s, str, str2));
        }
    }

    @Override // defpackage.pu0
    public final void s() {
        sw9 sw9Var = this.c;
        vx0.c0(f76.F(sw9Var), null, null, new nr9(9, null, sw9Var), 3);
    }

    @Override // defpackage.iq9
    public final void t(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.c.w(sourceParameter, str2, str, true);
    }

    @Override // defpackage.iq9
    public final void u(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        this.c.x(sourceParameter, str2, str, true);
    }

    @Override // defpackage.pu0
    public final void v(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        this.c.r(sourceParameter, str, str2, z);
    }

    @Override // defpackage.iq9
    public final void w(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.c.F(str, sourceParameter);
    }

    @Override // defpackage.iq9
    public final void x() {
        this.c.z();
    }

    @Override // defpackage.pu0
    public final void y() {
        sw9 sw9Var = this.c;
        vx0.c0(f76.F(sw9Var), null, null, new nr9(2, null, sw9Var), 3);
    }

    @Override // defpackage.pu0
    public final void z() {
        sw9 sw9Var = this.c;
        vx0.c0(f76.F(sw9Var), null, null, new nr9(7, null, sw9Var), 3);
    }
}
