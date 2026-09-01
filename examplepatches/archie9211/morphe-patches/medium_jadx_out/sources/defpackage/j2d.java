package defpackage;

import com.medium.refinerecommendations.RefineRecommendationsFilter;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lj2d;", "Lque;", "ls2", "e2d", "y1d", "refinerecommendations_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class j2d extends que {
    public final String b;
    public final vob c;
    public final kc5 d;
    public final ot1 e;
    public final nec f;
    public final kne g;
    public final n0c h;
    public final mya i;
    public final kbe j;
    public final ax2 k;
    public final ax2 l;
    public final s26 m;
    public final ax2 n;
    public final String o;
    public final SourceParameter p;
    public final String q;
    public boolean r;
    public final LinkedHashSet s;
    public final LinkedHashSet t;
    public final LinkedHashSet u;
    public final wua v;
    public final r6c w;
    public final uua x;

    public j2d(RefineRecommendationsFilter refineRecommendationsFilter, String str, vob vobVar, kc5 kc5Var, ot1 ot1Var, nec necVar, kne kneVar, n0c n0cVar, mya myaVar, kbe kbeVar, ax2 ax2Var, ax2 ax2Var2, s26 s26Var, ax2 ax2Var3, kb2 kb2Var) {
        d2d d2dVar;
        str.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = vobVar;
        this.d = kc5Var;
        this.e = ot1Var;
        this.f = necVar;
        this.g = kneVar;
        this.h = n0cVar;
        this.i = myaVar;
        this.j = kbeVar;
        this.k = ax2Var;
        this.l = ax2Var2;
        this.m = s26Var;
        this.n = ax2Var3;
        this.o = "customize_suggestions";
        SourceParameter sourceParameter = new SourceParameter("customize_suggestions", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.p = sourceParameter;
        String strU = gp7.u(sourceParameter);
        this.q = strU;
        this.s = new LinkedHashSet();
        this.t = new LinkedHashSet();
        this.u = new LinkedHashSet();
        int i = refineRecommendationsFilter == null ? -1 : f2d.a[refineRecommendationsFilter.ordinal()];
        n92 n92Var = null;
        if (i == -1 || i == 1) {
            d2dVar = d2d.ALL;
        } else if (i == 2) {
            d2dVar = d2d.WRITERS;
        } else if (i == 3) {
            d2dVar = d2d.PUBLICATIONS;
        } else if (i == 4) {
            d2dVar = d2d.TAGS;
        } else {
            if (i != 5) {
                ygf.a();
                throw null;
            }
            d2dVar = d2d.FRIENDS;
        }
        wua wuaVarC = vobVar.c("selectedFilter", d2dVar);
        this.v = bo.e0(w2g.r(new sp4(wuaVarC, new u50(12, new jc5(kc5Var, new u1d(this, 0), new u1d(this, 1), new u1d(this, 2), new u1d(this, 3), null)), new rl2(this, n92Var, 8), 0), kb2Var), f76.F(this), l7c.b, new e2d(false, d2d.getEntries(), (d2d) wuaVarC.a.getValue(), b2d.a, strU));
        r6c r6cVarX = k40.x(0, 7, null);
        this.w = r6cVarX;
        this.x = bo.z(r6cVarX);
    }

    public static f17 e(boolean z) {
        f17 f17VarB = d46.B();
        f17VarB.add(d2d.ALL);
        f17VarB.add(d2d.WRITERS);
        f17VarB.add(d2d.PUBLICATIONS);
        f17VarB.add(d2d.TAGS);
        if (z) {
            f17VarB.add(d2d.FRIENDS);
        }
        return d46.w(f17VarB);
    }
}
