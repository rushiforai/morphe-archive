package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.susi.data.CreateAccountData;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lr9;", "Lque;", "np2", "l9", "k9", "g9", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class r9 extends que {
    public final String b;
    public final CreateAccountData c;
    public final SusiDestination d;
    public final vob e;
    public final a13 f;
    public final ax2 g;
    public final hac h;
    public final String i;
    public final String j;
    public final SusiOperation k;
    public boolean l;
    public final wua m;
    public final r6c n;
    public final uua o;
    public final r6c p;

    public r9(String str, CreateAccountData createAccountData, SusiDestination susiDestination, vob vobVar, a13 a13Var, ax2 ax2Var, hac hacVar, kb2 kb2Var) {
        str.getClass();
        createAccountData.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = createAccountData;
        this.d = susiDestination;
        this.e = vobVar;
        this.f = a13Var;
        this.g = ax2Var;
        this.h = hacVar;
        this.i = "susi_add_info";
        this.j = gp7.u(new SourceParameter("susi_add_info", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        this.k = SusiOperation.REGISTER;
        this.m = bo.e0(w2g.r(new u50(12, new j0(this, null, 2)), kb2Var), f76.F(this), l7c.b, new l9(f(), null, e(), null, true));
        r6c r6cVarX = k40.x(0, 7, null);
        this.n = r6cVarX;
        this.o = bo.z(r6cVarX);
        this.p = k40.x(0, 7, null);
    }

    public final String e() {
        String str = (String) this.e.a("email");
        if (str != null) {
            return str;
        }
        String defaultEmail = this.c.getDefaultEmail();
        return defaultEmail == null ? "" : defaultEmail;
    }

    public final String f() {
        String str = (String) this.e.a("full_name");
        if (str != null) {
            return str;
        }
        String name = this.c.getName();
        return name == null ? "" : name;
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x013d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.Throwable r8, defpackage.p92 r9) {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r9.g(java.lang.Throwable, p92):java.lang.Object");
    }
}
