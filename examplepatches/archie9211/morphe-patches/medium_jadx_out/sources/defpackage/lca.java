package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Llca;", "Lque;", "cr2", "dca", "tba", "uba", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class lca extends que {
    public static final rba w = rba.LATEST;
    public final PublicationReference b;
    public final Integer c;
    public final String d;
    public final hba e;
    public final jb5 f;
    public final fb5 g;
    public final rz2 h;
    public final fr9 i;
    public final tl j;
    public final ty2 k;
    public final ax2 l;
    public final vob m;
    public final r6c n;
    public final uua o;
    public String p;
    public final wua q;
    public final wua r;
    public final String s;
    public final String t;
    public boolean u;
    public final LinkedHashSet v;

    public lca(PublicationReference publicationReference, Integer num, String str, rba rbaVar, String str2, hba hbaVar, jb5 jb5Var, fb5 fb5Var, rz2 rz2Var, fr9 fr9Var, tl tlVar, ty2 ty2Var, ax2 ax2Var, kb2 kb2Var, vob vobVar) {
        publicationReference.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = publicationReference;
        this.c = num;
        this.d = str2;
        this.e = hbaVar;
        this.f = jb5Var;
        this.g = fb5Var;
        this.h = rz2Var;
        this.i = fr9Var;
        this.j = tlVar;
        this.k = ty2Var;
        this.l = ax2Var;
        this.m = vobVar;
        int i = 0;
        n92 n92Var = null;
        r6c r6cVarX = k40.x(0, 7, null);
        this.n = r6cVarX;
        this.o = bo.z(r6cVarX);
        wua wuaVarC = vobVar.c("selected_year", num);
        wua wuaVarC2 = vobVar.c("selected_sort", rbaVar == null ? w : rbaVar);
        wua wuaVarC3 = vobVar.c("selected_tag", str);
        this.q = wuaVarC3;
        sp4 sp4Var = new sp4(wuaVarC2, wuaVarC3, new m14(3, 5, n92Var), i);
        u50 u50Var = new u50(12, new gca(this, null));
        gp1 gp1VarF = f76.F(this);
        opg opgVarH = bo.H(u50Var);
        int i2 = 1;
        r6c r6cVarW = k40.w(1, opgVarH.a, (nz0) opgVarH.c);
        ib2 ib2Var = (ib2) opgVarH.d;
        bo4 bo4Var = (bo4) opgVarH.b;
        d1g d1gVar = k40.l;
        wz7 wz7Var = l7c.a;
        u3b u3bVar = l7c.b;
        uua uuaVar = new uua(r6cVarW, vx0.b0(gp1VarF, ib2Var, u3bVar != wz7Var ? wb2.UNDISPATCHED : wb2.DEFAULT, new fl2(u3bVar, bo4Var, r6cVarW, d1gVar, (n92) null)));
        this.r = bo.e0(w2g.r(kyd.J(ip4.b(uuaVar, new hca(n92Var, this, 2)), wuaVarC, sp4Var, new u50(11, ip4.b(k40.S(uuaVar, wuaVarC, sp4Var, wuaVarC3, new fca(5, null)), new hca(n92Var, this, i2))), wuaVarC3, ip4.b(uuaVar, new hca(n92Var, this, i)), new kca(null)), kb2Var), f76.F(this), u3bVar, cca.a);
        this.s = "pub_entity/archive";
        this.t = "pub_entity/archive";
        this.v = new LinkedHashSet();
    }

    public final SourceParameter e() {
        return new SourceParameter(this.s, null, null, null, this.p, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
    }
}
