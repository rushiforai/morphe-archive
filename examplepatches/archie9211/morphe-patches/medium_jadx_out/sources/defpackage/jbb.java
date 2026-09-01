package defpackage;

import com.android.billingclient.api.BillingClient;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Ljbb;", "Lque;", "xr2", BillingClient.FeatureType.IN_APP_MESSAGING, "xab", "pab", "reposters_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class jbb extends que {
    public final String b;
    public final String c;
    public final lb5 d;
    public final md5 e;
    public final f88 f;
    public final lb5 g;
    public final pye h;
    public final kbe i;
    public final eab j;
    public final s26 k;
    public final ax2 l;
    public final r6c m;
    public final uua n;
    public final xpc o;
    public final wua p;
    public final xpc q;
    public final wua r;
    public final String s;
    public final SourceParameter t;
    public boolean u;
    public final LinkedHashSet v;

    public jbb(String str, String str2, lb5 lb5Var, md5 md5Var, f88 f88Var, lb5 lb5Var2, pye pyeVar, kbe kbeVar, eab eabVar, s26 s26Var, ax2 ax2Var, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        this.b = str;
        this.c = str2;
        this.d = lb5Var;
        this.e = md5Var;
        this.f = f88Var;
        this.g = lb5Var2;
        this.h = pyeVar;
        this.i = kbeVar;
        this.j = eabVar;
        this.k = s26Var;
        this.l = ax2Var;
        int i = 0;
        n92 n92Var = null;
        r6c r6cVarX = k40.x(0, 7, null);
        this.m = r6cVarX;
        this.n = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(null);
        this.o = xpcVarJ;
        this.p = bo.A(xpcVarJ);
        xpc xpcVarJ2 = vv2.j(0);
        this.q = xpcVarJ2;
        this.r = bo.e0(w2g.r(new sp4(pyeVar.b.Q(new yj2(pyeVar, str, new hbb(this, null), n92Var, 19)), ip4.b(xpcVarJ2, new yk(13, n92Var, this)), new ibb(3, i, n92Var), i), kb2Var), f76.F(this), l7c.b, zab.a);
        this.s = "post_reposters";
        this.t = new SourceParameter("post_reposters", null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null);
        this.v = new LinkedHashSet();
    }

    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new ebb(this, str, sourceParameter, null, 0), 3);
    }
}
