package defpackage;

import android.os.Bundle;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.proto.event.SignUpSignInRememberMeSignInButtonClicked;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lyd0;", "Lque;", "hp2", "kd0", "od0", "cd0", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class yd0 extends que {
    public final vob b;
    public final String c;
    public SusiDestination d;
    public SusiOperation e;
    public final j3b f;
    public final oo1 g;
    public final a13 h;
    public final dm4 i;
    public final no3 j;
    public final hac k;
    public final hac l;
    public final azb m;
    public final hy2 n;
    public boolean o;
    public final r6c p;
    public final uua q;
    public final r6c r;
    public final wua s;

    public yd0(vob vobVar, String str, SusiDestination susiDestination, SusiOperation susiOperation, j3b j3bVar, oo1 oo1Var, a13 a13Var, dm4 dm4Var, no3 no3Var, hac hacVar, hac hacVar2, azb azbVar, hy2 hy2Var, kb2 kb2Var) {
        vobVar.getClass();
        str.getClass();
        susiOperation.getClass();
        dm4Var.getClass();
        hy2Var.getClass();
        this.b = vobVar;
        this.c = str;
        this.d = susiDestination;
        this.e = susiOperation;
        this.f = j3bVar;
        this.g = oo1Var;
        this.h = a13Var;
        this.i = dm4Var;
        this.j = no3Var;
        this.k = hacVar;
        this.l = hacVar2;
        this.m = azbVar;
        this.n = hy2Var;
        r6c r6cVarX = k40.x(0, 7, null);
        this.p = r6cVarX;
        this.q = bo.z(r6cVarX);
        this.r = k40.x(0, 7, null);
        this.s = bo.e0(w2g.r(new u50(12, new j0(this, null, 24)), kb2Var), f76.F(this), l7c.b, nd0.a);
    }

    public final md0 e(boolean z) {
        SusiOperation susiOperation = this.e;
        SusiDestination susiDestination = this.d;
        nl4 nl4Var = nl4.DISABLE_LOGIN_APPLE;
        dm4 dm4Var = this.i;
        return new md0(susiOperation, susiDestination, !dm4Var.b(nl4Var), !dm4Var.b(nl4.DISABLE_LOGIN_EMAIL), !dm4Var.b(nl4.DISABLE_LOGIN_FACEBOOK), !dm4Var.b(nl4.DISABLE_LOGIN_GOOGLE), !dm4Var.b(nl4.DISABLE_LOGIN_X), i(), z);
    }

    public final void f(w3 w3Var) {
        ff5 ff5Var = new ff5(w3Var, "me", null, null, new a4(3, new lt(w3Var, 1, this)));
        Bundle bundle = new Bundle();
        bundle.putString("fields", "name");
        ff5Var.d = bundle;
        ff5Var.d();
    }

    public final String g() {
        return this.e == SusiOperation.REGISTER ? "sign_up" : "sign_in";
    }

    public final boolean h() {
        Boolean bool = (Boolean) this.b.a("remember_me");
        if (bool != null) {
            return bool.booleanValue();
        }
        return true;
    }

    public final String i() {
        return gp7.u(new SourceParameter(g(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
    }

    public final String j() {
        Boolean bool = (Boolean) this.b.a("remember_me_account_hint_sign_in");
        return ((bool != null ? bool.booleanValue() : false) && this.e == SusiOperation.LOGIN) ? "remember_me" : "default";
    }

    public final void k(l3d l3dVar) {
        l3dVar.getClass();
        String strG = g();
        String strI = i();
        a13 a13Var = this.h;
        a13Var.getClass();
        String str = this.c;
        str.getClass();
        rqd.a(a13Var.a, new SignUpSignInRememberMeSignInButtonClicked(null, "app", a13Var.b.p(), l3dVar.getValue(), null, 17, null), str, strI, false, null, strG, 24);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0059, code lost:
    
        if (r5.r.a(r6, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.sd0
            if (r0 == 0) goto L13
            r0 = r6
            sd0 r0 = (defpackage.sd0) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            sd0 r0 = new sd0
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L35
            if (r2 == r4) goto L31
            if (r2 != r3) goto L2a
            defpackage.br7.v(r6)
            goto L5c
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L31:
            defpackage.br7.v(r6)
            goto L4b
        L35:
            defpackage.br7.v(r6)
            hd0 r6 = new hd0
            r2 = 2132018790(0x7f140666, float:1.9675897E38)
            r6.<init>(r2)
            r0.d = r4
            r6c r2 = r5.p
            java.lang.Object r6 = r2.a(r6, r0)
            if (r6 != r1) goto L4b
            goto L5b
        L4b:
            zc0 r6 = new zc0
            r2 = 0
            r6.<init>(r2)
            r0.d = r3
            r6c r5 = r5.r
            java.lang.Object r5 = r5.a(r6, r0)
            if (r5 != r1) goto L5c
        L5b:
            return r1
        L5c:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yd0.l(p92):java.lang.Object");
    }

    public final void n(Exception exc) {
        vx0.c0(f76.F(this), null, null, new l0(this, exc, null, 16), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object o(defpackage.n4 r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 216
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yd0.o(n4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00e6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object p(com.medium.android.common.api.Medium2Error r24, defpackage.l3d r25, defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 231
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yd0.p(com.medium.android.common.api.Medium2Error, l3d, p92):java.lang.Object");
    }

    public final void q(ctg ctgVar) {
        ctgVar.getClass();
        lxf lxfVar = ctgVar.c;
        if (lxfVar == null) {
            lxfVar = null;
        }
        if (lxfVar == null) {
            ay0.e("X OAuthCredential is null");
            return;
        }
        String str = lxfVar.c;
        if (str == null) {
            ay0.e("X AccessToken is null");
            return;
        }
        String str2 = lxfVar.f;
        if (str2 == null) {
            ay0.e("X Secret is null");
            return;
        }
        npg npgVar = ctgVar.b;
        String strA = npgVar != null ? npgVar.a() : null;
        if (strA != null) {
            s(new vg2(str, str2, strA));
        } else {
            ay0.e("X username is null");
        }
    }

    public final void r(boolean z) {
        this.b.d("remember_me_account_hint_sign_in", Boolean.valueOf(z));
    }

    public final void s(q62 q62Var) {
        vx0.c0(f76.F(this), null, null, new qd0(this, q62Var, null, 1), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x00f6, code lost:
    
        if (r12.r.a(r13, r0) == r1) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(com.medium.android.common.api.Medium2Error r13, defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 268
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yd0.m(com.medium.android.common.api.Medium2Error, p92):java.lang.Object");
    }
}
