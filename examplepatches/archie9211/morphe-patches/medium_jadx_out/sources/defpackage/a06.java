package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a06 extends co6 implements b55 {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ Highlight d;
    public final /* synthetic */ int e;
    public final /* synthetic */ String f;
    public final /* synthetic */ String g;
    public final /* synthetic */ long h;
    public final /* synthetic */ long i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a06(l78 l78Var, z52 z52Var, m45 m45Var, Highlight highlight, int i, String str, String str2, long j, long j2) {
        super(2);
        this.a = l78Var;
        this.b = z52Var;
        this.c = m45Var;
        this.d = highlight;
        this.e = i;
        this.f = str;
        this.g = str2;
        this.h = j;
        this.i = j2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        i52 i52Var;
        z52 z52Var;
        int i;
        c1e c1eVar;
        i52 i52Var2;
        o28 o28Var;
        uob uobVar;
        boolean z;
        i52 i52Var3;
        i52 i52Var4;
        i52 i52Var5;
        long j;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue() & 3;
        c1e c1eVar2 = c1e.a;
        if (iIntValue == 2) {
            p65 p65Var = (p65) x12Var;
            if (p65Var.B()) {
                p65Var.S();
                return c1eVar2;
            }
        }
        this.a.setValue(c1eVar2);
        z52 z52Var2 = this.b;
        int i2 = z52Var2.b;
        z52Var2.f();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(1725922490);
        z52 z52Var3 = (z52) z52Var2.e().b;
        i52 i52VarD = z52Var3.d();
        i52 i52VarD2 = z52Var3.d();
        i52 i52VarD3 = z52Var3.d();
        i52 i52VarD4 = z52Var3.d();
        i52 i52VarD5 = z52Var3.d();
        o28 o28Var2 = o28.b;
        uob uobVar2 = w12.a;
        Highlight highlight = this.d;
        if (highlight != null) {
            p65Var2.Y(1725929960);
            mx mxVarY = w2g.y(highlight.getStartOffset(), highlight.getEndOffset(), this.e, p65Var2, highlight.getParagraphText(), highlight.getParagraphMarkups());
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).t;
            r28 r28VarN = bgf.N(o28Var2, "annotated_text");
            Object objM = p65Var2.M();
            if (objM == uobVar2) {
                objM = xx.E;
                p65Var2.j0(objM);
            }
            i52Var = i52VarD5;
            o28Var = o28Var2;
            i = i2;
            uobVar = uobVar2;
            i52Var3 = i52VarD;
            i52Var5 = i52VarD3;
            c1eVar = c1eVar2;
            i52Var4 = i52VarD2;
            z52Var = z52Var2;
            i52Var2 = i52VarD4;
            jjd.c(mxVarY, z52.b(r28VarN, i52VarD, (x45) objM), 0L, 0L, 0L, new jgd(5), 0L, 2, false, 0, 0, null, null, mkdVar, p65Var2, 0, 384, 257020);
            p65Var2 = p65Var2;
            z = false;
        } else {
            i52Var = i52VarD5;
            z52Var = z52Var2;
            i = i2;
            c1eVar = c1eVar2;
            i52Var2 = i52VarD4;
            o28Var = o28Var2;
            uobVar = uobVar2;
            z = false;
            i52Var3 = i52VarD;
            i52Var4 = i52VarD2;
            i52Var5 = i52VarD3;
            p65Var2.Y(1723545285);
        }
        p65Var2.p(z);
        mkd mkdVar2 = rz5.D(p65Var2).n;
        r28 r28VarN2 = bgf.N(o28Var, "post_title");
        boolean zF = p65Var2.f(i52Var2) | p65Var2.f(i52Var3);
        Object objM2 = p65Var2.M();
        if (zF || objM2 == uobVar) {
            objM2 = new it0(i52Var2, i52Var3, 3);
            p65Var2.j0(objM2);
        }
        boolean z2 = z;
        p65 p65Var3 = p65Var2;
        jjd.b(this.f, z52.b(r28VarN2, i52Var4, (x45) objM2), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVar2, p65Var3, 0, 24960, 110588);
        mkd mkdVarA = mkd.a(rz5.D(p65Var3).n, rz5.A(p65Var3).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
        r28 r28VarN3 = bgf.N(o28Var, "user_name");
        boolean zF2 = p65Var3.f(i52Var2) | p65Var3.f(i52Var4);
        Object objM3 = p65Var3.M();
        if (zF2 || objM3 == uobVar) {
            objM3 = new it0(i52Var2, i52Var4, 4);
            p65Var3.j0(objM3);
        }
        jjd.b(this.g, z52.b(r28VarN3, i52Var5, (x45) objM3), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var3, 0, 24960, 110588);
        zi5 zi5Var = qb8.e;
        zq0 zq0Var = z46.n;
        i52 i52Var6 = i52Var;
        boolean zF3 = p65Var3.f(i52Var6) | p65Var3.f(i52Var4);
        long j2 = this.h;
        boolean zE = zF3 | p65Var3.e(j2);
        Object objM4 = p65Var3.M();
        if (zE || objM4 == uobVar) {
            b06 b06Var = new b06(i52Var6, i52Var4, j2, 0);
            j = j2;
            p65Var3.j0(b06Var);
            objM4 = b06Var;
        } else {
            j = j2;
        }
        r28 r28VarB = z52.b(o28Var, i52Var2, (x45) objM4);
        omb ombVarA = nmb.a(zi5Var, zq0Var, p65Var3, 54);
        long j3 = p65Var3.T;
        int i3 = (int) (j3 ^ (j3 >>> 32));
        i89 i89VarL = p65Var3.l();
        r28 r28VarR = gx1.R(p65Var3, r28VarB);
        r12.W.getClass();
        ot2 ot2Var = q12.b;
        p65Var3.c0();
        if (p65Var3.S) {
            p65Var3.k(ot2Var);
        } else {
            p65Var3.m0();
        }
        cu cuVar = q12.f;
        tp7.B(p65Var3, cuVar, ombVarA);
        cu cuVar2 = q12.e;
        tp7.B(p65Var3, cuVar2, i89VarL);
        Integer numValueOf = Integer.valueOf(i3);
        cu cuVar3 = q12.g;
        tp7.B(p65Var3, cuVar3, numValueOf);
        fn fnVar = q12.h;
        tp7.y(p65Var3, fnVar);
        cu cuVar4 = q12.d;
        tp7.B(p65Var3, cuVar4, r28VarR);
        uob uobVar3 = uobVar;
        w2g.e(vn7.J(R.drawable.ic_clap_filled_16, z2 ? 1 : 0, p65Var3), vo7.R(p65Var3, R.string.common_clap), jfc.l(o28Var, 16.0f), null, null, 0.0f, new bs0(5, rz5.A(p65Var3).n), p65Var3, 392, 56);
        hp7.t(p65Var3, jfc.p(o28Var, 4.0f));
        jjd.b(dq1.g(Long.valueOf(j)), bgf.N(o28Var, "claps_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(rz5.D(p65Var3).n, rz5.A(p65Var3).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 48, 0, 131068);
        p65Var3.p(true);
        boolean zF4 = p65Var3.f(i52Var4);
        long j4 = this.i;
        boolean zE2 = zF4 | p65Var3.e(j4);
        Object objM5 = p65Var3.M();
        if (zE2 || objM5 == uobVar3) {
            objM5 = new c06(i52Var4, j4, 0);
            p65Var3.j0(objM5);
        }
        r28 r28VarB2 = z52.b(o28Var, i52Var6, (x45) objM5);
        omb ombVarA2 = nmb.a(zi5Var, zq0Var, p65Var3, 54);
        long j5 = p65Var3.T;
        int i4 = (int) (j5 ^ (j5 >>> 32));
        i89 i89VarL2 = p65Var3.l();
        r28 r28VarR2 = gx1.R(p65Var3, r28VarB2);
        p65Var3.c0();
        if (p65Var3.S) {
            p65Var3.k(ot2Var);
        } else {
            p65Var3.m0();
        }
        tp7.B(p65Var3, cuVar, ombVarA2);
        tp7.B(p65Var3, cuVar2, i89VarL2);
        ka1.z(i4, p65Var3, cuVar3, p65Var3, fnVar);
        tp7.B(p65Var3, cuVar4, r28VarR2);
        w2g.e(vn7.J(R.drawable.ic_respond_filled_16, 0, p65Var3), vo7.R(p65Var3, R.string.common_clap), jfc.l(o28Var, 16.0f), null, null, 0.0f, new bs0(5, rz5.A(p65Var3).n), p65Var3, 392, 56);
        hp7.t(p65Var3, jfc.p(o28Var, 4.0f));
        jjd.b(dq1.g(Long.valueOf(j4)), bgf.N(o28Var, "responses_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(rz5.D(p65Var3).n, rz5.A(p65Var3).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 48, 0, 131068);
        p65Var3.p(true);
        p65Var3.p(false);
        if (z52Var.b != i) {
            kyd.v(this.c, p65Var3);
        }
        return c1eVar;
    }
}
