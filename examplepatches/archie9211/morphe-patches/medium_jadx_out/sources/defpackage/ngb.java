package defpackage;

import com.medium.android.core.navigation.ResponsesReference;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ngb implements veb {
    public final /* synthetic */ nib a;
    public final /* synthetic */ xfb b;
    public final /* synthetic */ upc c;

    public ngb(l78 l78Var, xfb xfbVar, nib nibVar) {
        this.a = nibVar;
        this.b = xfbVar;
        this.c = l78Var;
    }

    @Override // defpackage.veb
    public final void B(String str, String str2, boolean z) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new co9(nibVar, str, z, str2, null, 1), 3);
    }

    @Override // defpackage.veb
    public final void D(String str, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new eib(nibVar, str, str2, null, 4), 3);
    }

    @Override // defpackage.veb
    public final void F(String str, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new do9(nibVar, str, str2, null, 1), 3);
    }

    @Override // defpackage.veb
    public final void I(String str, String str2) {
        str.getClass();
        this.b.F(str, str2);
    }

    @Override // defpackage.veb
    public final void J(String str, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vob vobVar = nibVar.A;
        Set set = (Set) no7.s(vobVar, "displayed", ny3.a);
        if (set.contains(str)) {
            return;
        }
        vobVar.d("displayed", qo7.w(set, str));
        b09.Y(nibVar.x, str, PostClientVisibilityState.PUBLIC, PostDensity.POST_DENSITY_SMALL_PREVIEW, nibVar.b, str2, nibVar.J, false, 448);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.veb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object K(java.lang.String r5, int r6, java.lang.String r7, defpackage.n92 r8) {
        /*
            r4 = this;
            boolean r0 = r8 instanceof defpackage.mgb
            if (r0 == 0) goto L13
            r0 = r8
            mgb r0 = (defpackage.mgb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            mgb r0 = new mgb
            p92 r8 = (defpackage.p92) r8
            r0.<init>(r4, r8)
        L1a:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r4 = r8.a
            return r4
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r8)
            r0.d = r3
            nib r4 = r4.a
            java.lang.Object r4 = r4.i(r5, r6, r7, r0)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ngb.K(java.lang.String, int, java.lang.String, n92):java.lang.Object");
    }

    @Override // defpackage.veb
    public final void O(String str, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new eib(nibVar, str, str2, null, 0), 3);
    }

    @Override // defpackage.veb
    public final void S(String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        aib aibVar = (aib) this.c.getValue();
        aibVar.getClass();
        zhb zhbVar = (zhb) aibVar;
        boolean z = zhbVar.k;
        String str4 = zhbVar.o;
        xfb xfbVar = this.b;
        if (z) {
            xfbVar.f(str, str2, str4, str3, zhbVar.h);
        } else {
            xfbVar.h(str, str2, str4, str3, zhbVar.h);
        }
    }

    @Override // defpackage.veb
    public final void b(String str, String str2) {
        this.b.b(str, str2);
    }

    @Override // defpackage.veb
    public final void g(String str, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new nx9(nibVar, str, null, 25), 3);
    }

    @Override // defpackage.veb
    public final void h(String str, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new eib(nibVar, str, str2, null, 3), 3);
    }

    @Override // defpackage.veb
    public final void m(String str, String str2) {
        str.getClass();
        this.b.J(new ResponsesReference.Post(str, null, null, ResponsesReference.ResponseViewType.Replies, null, 22, null), str2);
    }

    @Override // defpackage.veb
    public final void q(String str, String str2, boolean z) {
        str.getClass();
        if (z) {
            this.b.J(new ResponsesReference.Post(str, null, null, ResponsesReference.ResponseViewType.Replies, new ResponsesReference.WriteState.Reply(str), 6, null), str2);
        } else {
            nib nibVar = this.a;
            vx0.c0(f76.F(nibVar), null, null, new eib(nibVar, str, str2, null, 1), 3);
        }
    }

    @Override // defpackage.veb
    public final void t(String str, String str2) {
        str.getClass();
        this.b.c(str, str2);
    }

    @Override // defpackage.veb
    public final void u(String str, String str2) {
        str.getClass();
        this.b.G(str, str2);
    }

    @Override // defpackage.veb
    public final void x(String str, int i, String str2) {
        str.getClass();
        nib nibVar = this.a;
        vx0.c0(f76.F(nibVar), null, null, new qd0(nibVar, str, i, str2, null, 5), 3);
    }
}
