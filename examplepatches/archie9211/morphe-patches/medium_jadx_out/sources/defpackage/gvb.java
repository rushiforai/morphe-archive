package defpackage;

import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lgvb;", "Lque;", "avb", "zr2", "search_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class gvb extends que {
    public final String b;
    public final bub c;
    public final cx2 d;
    public final ax2 e;
    public final vob f;
    public final xpc g;
    public final xpc h;
    public boolean i;
    public final zz j;
    public final wua k;
    public final String l;
    public final SourceParameter m;
    public boolean n;
    public final LinkedHashSet o;

    public gvb(String str, bub bubVar, yb5 yb5Var, cx2 cx2Var, ax2 ax2Var, vob vobVar) {
        str.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = bubVar;
        this.d = cx2Var;
        this.e = ax2Var;
        this.f = vobVar;
        String str2 = (String) vobVar.a("search");
        str2 = str2 == null ? "" : str2;
        int length = str2.length();
        xpc xpcVarJ = vv2.j(new uid(str2, 4, lk7.q(length, length)));
        this.g = xpcVarJ;
        xpc xpcVarJ2 = vv2.j(Boolean.TRUE);
        this.h = xpcVarJ2;
        this.j = new zz(m40.J(sgg.J(new b0b(xpcVarJ, 1), 600L)), 16);
        pu7 pu7Var = bubVar.b;
        pu7Var.getClass();
        this.k = bo.e0(k40.R(xpcVarJ, xpcVarJ2, new u50(13, new zz(p2.H(pu7Var, ek6.SEARCH_HISTORY, pu7.j, null, 4, null), 10)), new pja(new zh(((o2b) yb5Var.b.a).p(new xb5(yb5Var, null)), 18), this, 1), vobVar.c("current_tab", iub.POSTS), new fvb(this, null)), f76.F(this), l7c.b, new avb(new atb(new uid((String) null, 7, 0L), false, false), new xub(kgc.b, uub.a)));
        this.l = "search";
        this.m = new SourceParameter("search", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.o = new LinkedHashSet();
    }

    public final void e() {
        Boolean bool = Boolean.FALSE;
        xpc xpcVar = this.h;
        xpcVar.getClass();
        xpcVar.m(null, bool);
    }
}
