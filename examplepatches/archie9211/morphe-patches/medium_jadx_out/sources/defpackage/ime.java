package defpackage;

import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lime;", "Lque;", "cme", "xle", "ple", "to2", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ime extends que {
    public final String b;
    public final kle c;
    public final cle d;
    public final tl e;
    public final pkf f;
    public final a1a g;
    public final y8b h;
    public final ty2 i;
    public final ax2 j;
    public final boolean k;
    public final r6c l;
    public final uua m;
    public final xpc n;
    public final wua o;
    public final o33 p;
    public final wua q;
    public final g08 r;
    public boolean s;
    public final LinkedHashSet t;

    public ime(String str, String str2, md5 md5Var, kle kleVar, sc5 sc5Var, cxe cxeVar, cle cleVar, tl tlVar, pkf pkfVar, a1a a1aVar, y8b y8bVar, ty2 ty2Var, ax2 ax2Var, kb2 kb2Var) {
        str.getClass();
        this.b = str;
        this.c = kleVar;
        this.d = cleVar;
        this.e = tlVar;
        this.f = pkfVar;
        this.g = a1aVar;
        this.h = y8bVar;
        this.i = ty2Var;
        this.j = ax2Var;
        boolean zEquals = str.equals(((zk2) md5Var.b).m());
        this.k = zEquals;
        n92 n92Var = null;
        if (zEquals) {
            vx0.c0(f76.F(this), null, null, new cfd(cxeVar, this, n92Var, 16), 3);
        }
        r6c r6cVarX = k40.x(0, 7, null);
        this.l = r6cVarX;
        this.m = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(null);
        this.n = xpcVarJ;
        this.o = bo.A(xpcVarJ);
        this.p = vx0.F(f76.F(this), kb2Var, wb2.LAZY, new cfd(sc5Var, this, n92Var, 17));
        this.q = bo.e0(w2g.r(new pja(new u50(12, new oz(zEquals, kleVar, new tjd(25), str, new xnc(this, n92Var, 2), null, 5)), this, 8), kb2Var), f76.F(this), l7c.b, ame.a);
        this.r = new g08(new SourceParameter("user_reposts", null, null, null, null, null, null, null, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null), str2, "user_reposts");
        this.t = new LinkedHashSet();
    }
}
