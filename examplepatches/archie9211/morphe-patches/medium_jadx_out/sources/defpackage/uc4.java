package defpackage;

import com.medium.android.graphql.type.Sort;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Luc4;", "Lque;", "xp2", "nc4", "ec4", "publicationadmin_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class uc4 extends que {
    public final String b;
    public final String c;
    public final hx4 d;
    public final cba e;
    public final xo9 f;
    public final ax2 g;
    public final vob h;
    public final String i;
    public final SourceParameter j;
    public final wua k;
    public final bc4 l;
    public final wua m;
    public final bc4 n;
    public final wua o;
    public final wua p;

    public uc4(String str, String str2, hx4 hx4Var, eo2 eo2Var, cba cbaVar, xo9 xo9Var, ax2 ax2Var, vob vobVar, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        eo2Var.getClass();
        cbaVar.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = hx4Var;
        this.e = cbaVar;
        this.f = xo9Var;
        this.g = ax2Var;
        this.h = vobVar;
        vx0.c0(f76.F(this), null, null, new dc4(this, null, 0), 3);
        this.i = "pub_admin_featured_posts";
        this.j = new SourceParameter("pub_admin_featured_posts", null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
        wua wuaVarC = vobVar.c("selected_sort", ec4.LATEST);
        this.k = wuaVarC;
        bc4 bc4Var = (bc4) eo2Var.get();
        this.l = bc4Var;
        Sort sort = Sort.DESC;
        n92 n92Var = null;
        qc4 qc4Var = new qc4(this, null);
        sort.getClass();
        zh zhVar = new zh(bc4Var.b.Q(new ac4(bc4Var, str, sort, qc4Var, null, 0)), 7);
        gp1 gp1VarF = f76.F(this);
        ync yncVar = new ync(5000L, Long.MAX_VALUE);
        pz8 pz8Var = pz8.a;
        this.m = bo.e0(zhVar, gp1VarF, yncVar, pz8Var);
        bc4 bc4Var2 = (bc4) eo2Var.get();
        this.n = bc4Var2;
        Sort sort2 = Sort.ASC;
        rc4 rc4Var = new rc4(this, null);
        sort2.getClass();
        zh zhVar2 = new zh(bc4Var2.b.Q(new ac4(bc4Var2, str, sort2, rc4Var, null, 0)), 8);
        gp1 gp1VarF2 = f76.F(this);
        u3b u3bVar = l7c.b;
        this.o = bo.e0(zhVar2, gp1VarF2, u3bVar, pz8Var);
        this.p = bo.e0(w2g.r(k40.T(new u50(12, new ku2(this, n92Var, 15)), wuaVarC, ip4.b(wuaVarC, new yk(5, n92Var, this)), new xk(4, 1, n92Var)), kb2Var), f76.F(this), u3bVar, mc4.a);
    }
}
