package defpackage;

import com.medium.android.graphql.type.PostType;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0001\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lkbf;", "Lque;", "zo2", "vaf", "uaf", "oaf", "paf", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class kbf extends que {
    public final String b;
    public final tl c;
    public final fr9 d;
    public final ty2 e;
    public final r6c f;
    public final uua g;
    public final xpc h;
    public final xpc i;
    public final w5d j;
    public final w5d k;
    public final w5d l;
    public final w5d m;
    public final wua n;
    public final wua o;
    public final wua p;
    public final wua q;
    public final wua r;
    public final LinkedHashSet s;
    public final String t;
    public final SourceParameter u;

    public kbf(String str, paf pafVar, eo2 eo2Var, eo2 eo2Var2, eo2 eo2Var3, qlb qlbVar, tl tlVar, fr9 fr9Var, ty2 ty2Var, ax2 ax2Var, kb2 kb2Var) {
        pafVar.getClass();
        eo2Var.getClass();
        eo2Var2.getClass();
        eo2Var3.getClass();
        this.b = str;
        this.c = tlVar;
        this.d = fr9Var;
        this.e = ty2Var;
        n92 n92Var = null;
        vx0.c0(f76.F(this), null, null, new kaf(qlbVar, this, n92Var, 1), 3);
        r6c r6cVarX = k40.x(0, 7, null);
        this.f = r6cVarX;
        this.g = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(pafVar);
        this.h = xpcVarJ;
        this.i = vv2.j(null);
        Class<g8a> cls = g8a.class;
        w5d w5dVar = new w5d(new iaf(0, eo2Var2, cls, "get", "get()Ljava/lang/Object;", 0, 4));
        this.j = w5dVar;
        int i = 0;
        int i2 = 0;
        w5d w5dVar2 = new w5d(new iaf(i2, eo2Var, cls, "get", "get()Ljava/lang/Object;", i, 3));
        this.k = w5dVar2;
        w5d w5dVar3 = new w5d(new iaf(i2, eo2Var, cls, "get", "get()Ljava/lang/Object;", i, 6));
        this.l = w5dVar3;
        w5d w5dVar4 = new w5d(new iaf(i2, eo2Var3, cls, "get", "get()Ljava/lang/Object;", i, 5));
        this.m = w5dVar4;
        zj2 zj2Var = (zj2) w5dVar2.getValue();
        PostType postType = PostType.POST_TYPE_DRAFT;
        int i3 = 4;
        f8f f8fVar = new f8f(i3);
        xaf xafVar = new xaf(this, null);
        zj2Var.getClass();
        postType.getClass();
        n92 n92Var2 = null;
        int i4 = 15;
        bo4 bo4VarR = w2g.r(new vh1(new u50(12, new b9(zj2Var, postType, f8fVar, xafVar, n92Var2, i4)), 3), kb2Var);
        gp1 gp1VarF = f76.F(this);
        u3b u3bVar = l7c.b;
        pz8 pz8Var = pz8.a;
        this.n = bo.e0(bo4VarR, gp1VarF, u3bVar, pz8Var);
        ek2 ek2Var = (ek2) w5dVar.getValue();
        yaf yafVar = new yaf(this, null);
        ek2Var.getClass();
        this.o = bo.e0(w2g.r(new vh1(new u50(12, new l0(ek2Var, yafVar, n92Var, 27)), i3), kb2Var), f76.F(this), u3bVar, pz8Var);
        zj2 zj2Var2 = (zj2) w5dVar3.getValue();
        PostType postType2 = PostType.POST_TYPE_UNLISTED;
        int i5 = 5;
        f8f f8fVar2 = new f8f(i5);
        abf abfVar = new abf(this, null);
        zj2Var2.getClass();
        postType2.getClass();
        this.p = bo.e0(w2g.r(new vh1(new u50(12, new b9(zj2Var2, postType2, f8fVar2, abfVar, n92Var2, i4)), i5), kb2Var), f76.F(this), u3bVar, pz8Var);
        gl2 gl2Var = (gl2) w5dVar4.getValue();
        zaf zafVar = new zaf(this, null);
        gl2Var.getClass();
        this.q = bo.e0(w2g.r(new vh1(new u50(12, new l0(gl2Var, zafVar, n92Var, 28)), 6), kb2Var), f76.F(this), u3bVar, pz8Var);
        this.r = bo.e0(w2g.r(ip4.b(xpcVarJ, new yk(22, n92Var, this)), kb2Var), f76.F(this), u3bVar, new vaf((paf) xpcVarJ.getValue(), raf.a));
        this.s = new LinkedHashSet();
        this.t = "you_tab";
        this.u = new SourceParameter("you_tab", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
    }
}
