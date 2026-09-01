package defpackage;

import com.medium.android.graphql.type.PagingOptions;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lqf;", "Lque;", "jf", "nf", "fr2", "refinerecommendations_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class qf extends que {
    public final String b;
    public final vob c;
    public final hf d;
    public final nec e;
    public final mya f;
    public final ax2 g;
    public final ax2 h;
    public boolean i;
    public final wua j;
    public final String k;
    public final SourceParameter l;
    public final r6c m;
    public final uua n;
    public final wua o;

    public qf(String str, int i, vob vobVar, hf hfVar, nec necVar, mya myaVar, ax2 ax2Var, ax2 ax2Var2, kb2 kb2Var) {
        str.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = vobVar;
        this.d = hfVar;
        this.e = necVar;
        this.f = myaVar;
        this.g = ax2Var;
        this.h = ax2Var2;
        wua wuaVarC = vobVar.c("total", Integer.valueOf(i));
        this.j = wuaVarC;
        this.k = "customize_following_see_more";
        this.l = new SourceParameter("customize_following_see_more", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        r6c r6cVarX = k40.x(0, 7, null);
        this.m = r6cVarX;
        this.n = bo.z(r6cVarX);
        pf pfVar = new pf(this, null);
        n0c n0cVar = new n0c((yd4) null, new PagingOptions(null, null, new yv8(20), null, null, null, null, null, 251, null), 3);
        hfVar.b = n0cVar;
        this.o = bo.e0(w2g.r(new sp4(wuaVarC, n0cVar.Q(new gf(hfVar, pfVar, null)), new ye(3, 1, null), 0), kb2Var), f76.F(this), l7c.b, new mf(0));
    }
}
