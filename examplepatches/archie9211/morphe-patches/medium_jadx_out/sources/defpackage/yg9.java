package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.core.share.PostShareData;
import com.medium.android.donkey.post.PostFragment;
import com.medium.android.graphql.type.CatalogItemType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yg9 implements pu0 {
    public final /* synthetic */ PostFragment a;

    public yg9(PostFragment postFragment) {
        this.a = postFragment;
    }

    @Override // defpackage.pu0
    public final void g(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        g08Var.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).t0(postFragment.S(), postShareData, postFragment.j1().getReferrerSource(), postFragment.k1().F0, postFragment.k1().D0);
    }

    @Override // defpackage.pu0
    public final void j(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).q(postFragment.S(), str, str2);
    }

    @Override // defpackage.pu0
    public final void k(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).m0(postFragment.S(), CatalogItemType.POST, str, str2);
    }

    @Override // defpackage.pu0
    public final void l(String str, String str2) {
        str.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).E(postFragment.S(), new ResponsesReference.Post(str, null, null, null, null, 30, null), str2, false);
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
            boolean r0 = r6 instanceof defpackage.xg9
            if (r0 == 0) goto L13
            r0 = r6
            xg9 r0 = (defpackage.xg9) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            xg9 r0 = new xg9
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
            com.medium.android.donkey.post.PostFragment r4 = r4.a
            sw9 r4 = r4.k1()
            r0.d = r3
            java.lang.Object r4 = r4.q(r5, r0)
            if (r4 != r1) goto L46
            return r1
        L46:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yg9.m(int, n92):java.lang.Object");
    }

    @Override // defpackage.pu0
    public final void o(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).s(postFragment.S(), str, str2);
    }

    @Override // defpackage.pu0
    public final void s() {
        sw9 sw9VarK1 = this.a.k1();
        vx0.c0(f76.F(sw9VarK1), null, null, new nr9(9, null, sw9VarK1), 3);
    }

    @Override // defpackage.pu0
    public final void v(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().r(sourceParameter, str, str2, z);
    }

    @Override // defpackage.pu0
    public final void y() {
        sw9 sw9VarK1 = this.a.k1();
        vx0.c0(f76.F(sw9VarK1), null, null, new nr9(2, null, sw9VarK1), 3);
    }

    @Override // defpackage.pu0
    public final void z() {
        sw9 sw9VarK1 = this.a.k1();
        vx0.c0(f76.F(sw9VarK1), null, null, new nr9(7, null, sw9VarK1), 3);
    }
}
