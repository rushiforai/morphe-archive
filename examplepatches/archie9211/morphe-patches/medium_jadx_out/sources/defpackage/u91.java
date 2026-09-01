package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.upvoters.ui.UpVotersFragment;
import com.medium.android.upvoters.ui.UpVotersReference;
import com.medium.proto.event.ListViewed;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u91 implements y81 {
    public final /* synthetic */ id1 a;
    public final /* synthetic */ z81 b;

    public u91(id1 id1Var, z81 z81Var) {
        this.a = id1Var;
        this.b = z81Var;
    }

    @Override // defpackage.y81
    public final void A() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new lc1(3, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void B() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(12, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void C() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(11, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void D(String str) {
        str.getClass();
        this.a.l(str);
    }

    @Override // defpackage.y81
    public final void E() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new lc1(2, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void F(boolean z) {
        this.a.n(z);
    }

    @Override // defpackage.y81
    public final void G() {
        CatalogDetailFragment catalogDetailFragment = ((w81) this.b).a;
        ((p13) catalogDetailFragment.Z()).d0(catalogDetailFragment.S());
    }

    @Override // defpackage.y81
    public final void H(SourceParameter sourceParameter, String str, String str2, String str3, String str4) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str2, str3);
        ((w81) this.b).a(str, str2, str3, str4, gp7.u(sourceParameter));
    }

    @Override // defpackage.y81
    public final void I() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(0, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void J() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(1, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void a() {
        k40.X(((w81) this.b).a).b.m(R.id.catalogDetailFragment, true);
    }

    @Override // defpackage.y81
    public final void edit() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(2, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void h() {
        id1 id1Var = this.a;
        String str = id1Var.c;
        if (id1Var.W) {
            return;
        }
        id1Var.W = true;
        id1Var.D.j(str, gp7.u(id1Var.j()), id1Var.g());
        ax2 ax2Var = id1Var.f;
        CatalogDetailData catalogDetailData = id1Var.E;
        if (catalogDetailData == null) {
            g76.g0("catalogDetailData");
            throw null;
        }
        String id = catalogDetailData.getId();
        String strI = id1Var.i();
        String strG = id1Var.g();
        boolean z = id1Var.F;
        ax2Var.getClass();
        id.getClass();
        strG.getClass();
        rqd.a(ax2Var.b, new ListViewed(null, id, z, null, 9, null), str, strI, false, null, strG, 24);
    }

    @Override // defpackage.y81
    public final void i(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.b;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).Q(catalogDetailFragment.S(), str, strU);
    }

    @Override // defpackage.y81
    public final void j() {
        yd4 yd4Var = yd4.NetworkOnly;
        id1 id1Var = this.a;
        n92 n92Var = null;
        vx0.c0(f76.F(id1Var), null, null, new qd0(id1Var, yd4Var, n92Var, 2), 3);
        vx0.c0(f76.F(id1Var), null, null, new kc1(9, id1Var, n92Var), 3);
    }

    @Override // defpackage.y81
    public final void k() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(6, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void l() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new lc1(1, id1Var, null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.y81
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(int r5, defpackage.n92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.t91
            if (r0 == 0) goto L13
            r0 = r6
            t91 r0 = (defpackage.t91) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            t91 r0 = new t91
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
            id1 r4 = r4.a
            java.lang.Object r4 = r4.k(r5, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u91.m(int, n92):java.lang.Object");
    }

    @Override // defpackage.y81
    public final void n() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(8, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void o() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new xc1(0, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void p(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.b;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        catalogDetailFragment.Z();
        Context contextS = catalogDetailFragment.S();
        UpVotersReference.Catalog catalog = new UpVotersReference.Catalog(str);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UpVotersFragment.BundleInfo(catalog, strU));
        m4.w(contextS, R.id.upVotersFragment, bundle, null, 12);
    }

    @Override // defpackage.y81
    public final void q() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(7, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void r() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(10, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void s(int i) {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new cd1(i, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void t(ResponsesReference.Catalog catalog, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        String strU = gp7.u(sourceParameter);
        w81 w81Var = (w81) this.b;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).E(catalogDetailFragment.S(), catalog, strU, false);
    }

    @Override // defpackage.y81
    public final void u(SourceParameter sourceParameter) {
        w81 w81Var = (w81) this.b;
        w81Var.getClass();
        CatalogDetailFragment catalogDetailFragment = w81Var.a;
        ((p13) catalogDetailFragment.Z()).m(catalogDetailFragment.S(), gp7.u(sourceParameter), false);
    }

    @Override // defpackage.y81
    public final void v() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(5, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void w(int i, int i2) {
        vob vobVar = this.a.z;
        if (((Integer) vobVar.a("reorder_last_from_index")) == null) {
            vobVar.d("reorder_last_from_index", Integer.valueOf(i));
        }
        vobVar.d("reorder_last_to_index", Integer.valueOf(i2));
    }

    @Override // defpackage.y81
    public final void x(eg1 eg1Var) {
        eg1Var.getClass();
        String str = eg1Var.b;
        id1 id1Var = this.a;
        String strI = id1Var.i();
        str.getClass();
        id1Var.f.h(str, id1Var.c, strI, id1Var.g());
        w81 w81Var = (w81) this.b;
        w81Var.getClass();
        j7c.a(w81Var.a.S(), eg1Var);
    }

    @Override // defpackage.y81
    public final void y() {
        id1 id1Var = this.a;
        vx0.c0(f76.F(id1Var), null, null, new kc1(7, id1Var, null), 3);
    }

    @Override // defpackage.y81
    public final void z() {
        id1 id1Var = this.a;
        id1Var.K = null;
        vx0.c0(f76.F(id1Var), null, null, new kc1(13, id1Var, null), 3);
    }
}
