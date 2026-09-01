package defpackage;

import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lk3e;", "Lque;", "h3e", "ws2", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class k3e extends que {
    public final n57 b;
    public final n57 c;
    public final oqd d;
    public final l78 e;
    public final xpc f;
    public List g;
    public final wua h;

    public k3e(String str, vob vobVar, n57 n57Var, n57 n57Var2, oqd oqdVar) {
        str.getClass();
        vobVar.getClass();
        this.b = n57Var;
        this.c = n57Var2;
        this.d = oqdVar;
        this.e = to7.r(vobVar, "search_bar_state", atb.d, new tkc(13));
        xpc xpcVarJ = vv2.j(e());
        this.f = xpcVarJ;
        this.g = ey3.a;
        b0b b0bVar = new b0b(xpcVarJ, 2);
        int i = in3.d;
        n92 n92Var = null;
        this.h = bo.e0(new sp4(xpcVarJ, ip4.b(m40.J(sgg.J(b0bVar, gsa.p0(hlg.T(600, mn3.MILLISECONDS)))), new yk(18, n92Var, this)), new rl2(this, n92Var, 11), 0), f76.F(this), new ync(5000L, Long.MAX_VALUE), g3e.a);
    }

    public final atb e() {
        return (atb) this.e.getValue();
    }
}
