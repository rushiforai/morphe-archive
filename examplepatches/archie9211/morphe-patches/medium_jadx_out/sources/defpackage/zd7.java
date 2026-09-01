package defpackage;

import com.medium.android.common.api.Medium2Error;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.susi.domain.usecase.TokenAlreadyUsedException;
import com.medium.android.susi.domain.usecase.TokenIncorrectOrAlreadyUsedException;
import com.medium.android.susi.domain.usecase.TokenRevokedException;
import com.medium.reader.R;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lzd7;", "Lque;", "nq2", "wd7", "qd7", "td7", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class zd7 extends que {
    public final String b;
    public final String c;
    public final SusiDestination d;
    public final SusiOperation e;
    public final hac f;
    public final hac g;
    public final ax2 h;
    public final String i;
    public final String j;
    public boolean k;
    public final r6c l;
    public final uua m;
    public final wua n;

    public zd7(String str, String str2, SusiDestination susiDestination, SusiOperation susiOperation, hac hacVar, hac hacVar2, ax2 ax2Var, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        this.b = str;
        this.c = str2;
        this.d = susiDestination;
        this.e = susiOperation;
        this.f = hacVar;
        this.g = hacVar2;
        this.h = ax2Var;
        this.i = "susi_magic_link_sent";
        this.j = gp7.u(new SourceParameter("susi_magic_link_sent", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        r6c r6cVarX = k40.x(0, 7, null);
        this.l = r6cVarX;
        this.m = bo.z(r6cVarX);
        this.n = bo.e0(w2g.r(new u50(12, new mo5(this, null, 8)), kb2Var), f76.F(this), l7c.b, vd7.a);
    }

    public final Object e(Throwable th, b55 b55Var, p92 p92Var) {
        if ((th instanceof TokenAlreadyUsedException) || (th instanceof TokenIncorrectOrAlreadyUsedException)) {
            Object objInvoke = b55Var.invoke(new ud7(new rd7(R.string.sign_in_failure_auth_token_already_used)), p92Var);
            if (objInvoke == tb2.COROUTINE_SUSPENDED) {
                return objInvoke;
            }
        } else if (th instanceof TokenRevokedException) {
            Object objInvoke2 = b55Var.invoke(new ud7(new rd7(R.string.sign_in_failure_auth_token_expired)), p92Var);
            if (objInvoke2 == tb2.COROUTINE_SUSPENDED) {
                return objInvoke2;
            }
        } else if (th instanceof Medium2Error) {
            Medium2Error medium2Error = (Medium2Error) th;
            l14 l14Var = medium2Error.c;
            Integer num = null;
            a14 code = l14Var != null ? l14Var.getCode() : null;
            switch (code == null ? -1 : xd7.a[code.ordinal()]) {
                case 1:
                    num = new Integer(R.string.sign_in_failure_username_unavailable);
                    break;
                case 2:
                    num = new Integer(R.string.sign_in_failure_email_blocked);
                    break;
                case 3:
                    num = new Integer(R.string.sign_in_failure_email_unavailable);
                    break;
                case 4:
                    num = new Integer(R.string.sign_in_failure_rate_limited);
                    break;
                case 5:
                    num = new Integer(R.string.sign_in_failure_auth_token_expired);
                    break;
                case 6:
                    num = new Integer(R.string.sign_in_failure_auth_token_not_found);
                    break;
            }
            String str = medium2Error.b;
            if (num != null) {
                Object objInvoke3 = b55Var.invoke(new ud7(new rd7(num.intValue())), p92Var);
                if (objInvoke3 == tb2.COROUTINE_SUSPENDED) {
                    return objInvoke3;
                }
            } else if (medium2Error.a == 401) {
                Object objG = g(medium2Error, b55Var, p92Var);
                if (objG == tb2.COROUTINE_SUSPENDED) {
                    return objG;
                }
            } else if (str != null) {
                Object objInvoke4 = b55Var.invoke(new ud7(new sd7(str)), p92Var);
                if (objInvoke4 == tb2.COROUTINE_SUSPENDED) {
                    return objInvoke4;
                }
            } else {
                Object objInvoke5 = b55Var.invoke(new ud7(new rd7(R.string.sign_in_failure_generic)), p92Var);
                if (objInvoke5 == tb2.COROUTINE_SUSPENDED) {
                    return objInvoke5;
                }
            }
        } else {
            Object objInvoke6 = b55Var.invoke(new ud7(new rd7(R.string.sign_in_failure_generic)), p92Var);
            if (objInvoke6 == tb2.COROUTINE_SUSPENDED) {
                return objInvoke6;
            }
        }
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(gen.model.AuthInfo r3, com.medium.android.core.susi.SusiOperation r4, defpackage.p92 r5) {
        /*
            r2 = this;
            java.lang.String r3 = r3.redirect
            if (r3 == 0) goto Lf
            com.medium.android.core.susi.a r0 = com.medium.android.core.susi.SusiDestination.Companion
            r0.getClass()
            com.medium.android.core.susi.SusiDestination r3 = com.medium.android.core.susi.a.a(r3)
            if (r3 != 0) goto L11
        Lf:
            com.medium.android.core.susi.SusiDestination r3 = r2.d
        L11:
            com.medium.android.core.susi.SusiOperation r0 = com.medium.android.core.susi.SusiOperation.REGISTER
            r6c r1 = r2.l
            java.lang.String r2 = r2.j
            if (r4 != r0) goto L27
            nd7 r4 = new nd7
            r4.<init>(r2, r3)
            java.lang.Object r2 = r1.a(r4, r5)
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r2 != r3) goto L45
            return r2
        L27:
            if (r3 == 0) goto L37
            pd7 r4 = new pd7
            r4.<init>(r2, r3)
            java.lang.Object r2 = r1.a(r4, r5)
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r2 != r3) goto L45
            return r2
        L37:
            md7 r3 = new md7
            r3.<init>(r2)
            java.lang.Object r2 = r1.a(r3, r5)
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r2 != r3) goto L45
            return r2
        L45:
            c1e r2 = defpackage.c1e.a
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zd7.f(gen.model.AuthInfo, com.medium.android.core.susi.SusiOperation, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(com.medium.android.common.api.Medium2Error r31, defpackage.b55 r32, defpackage.p92 r33) {
        /*
            Method dump skipped, instruction units count: 307
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zd7.g(com.medium.android.common.api.Medium2Error, b55, p92):java.lang.Object");
    }
}
