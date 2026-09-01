package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zs7 extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ z52 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zs7(l78 l78Var, z52 z52Var, m45 m45Var, Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        super(2);
        this.a = i;
        this.b = l78Var;
        this.c = z52Var;
        this.d = m45Var;
        this.i = obj;
        this.e = obj2;
        this.f = obj3;
        this.g = obj4;
        this.h = obj5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v20 */
    /* JADX WARN: Type inference failed for: r15v21, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r15v23 */
    /* JADX WARN: Type inference failed for: r6v82 */
    /* JADX WARN: Type inference failed for: r6v83, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r6v89 */
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        c1e c1eVar;
        m45 m45Var;
        sn3 sn3Var;
        long j;
        kx kxVarW;
        int iH;
        sn3 sn3Var2;
        long j2;
        upc upcVar;
        mx mxVar;
        ?? r15;
        sn3 sn3Var3;
        long j3;
        l78 l78Var;
        ?? r6;
        long j4;
        l78 l78Var2;
        int i;
        int i2 = this.a;
        z52 z52Var = this.c;
        m45 m45Var2 = this.d;
        Object obj3 = this.h;
        Object obj4 = this.g;
        Object obj5 = this.e;
        Object obj6 = w12.a;
        l78 l78Var3 = this.b;
        Object obj7 = this.i;
        c1e c1eVar2 = c1e.a;
        Object obj8 = this.f;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj;
                Integer num = (Integer) obj4;
                mx mxVar2 = (mx) obj5;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var = (p65) x12Var;
                    if (p65Var.B()) {
                        p65Var.S();
                        return c1eVar2;
                    }
                }
                l78Var3.setValue(c1eVar2);
                int i3 = z52Var.b;
                z52Var.f();
                p65 p65Var2 = (p65) x12Var;
                p65Var2.Y(1805925383);
                z52 z52Var2 = (z52) z52Var.e().b;
                i52 i52VarD = z52Var2.d();
                i52 i52VarD2 = z52Var2.d();
                int i4 = bt7.a[((gt7) obj7).ordinal()];
                if (i4 == 1) {
                    c1eVar = c1eVar2;
                    m45Var = m45Var2;
                    p65Var2.Y(-1465759952);
                    sn3Var = kt7.b;
                    j = ((zo7) p65Var2.j(sn3Var)).n;
                    p65Var2.p(false);
                } else if (i4 == 2) {
                    c1eVar = c1eVar2;
                    m45Var = m45Var2;
                    p65Var2.Y(-1465756914);
                    sn3Var = kt7.b;
                    j = ((zo7) p65Var2.j(sn3Var)).u;
                    p65Var2.p(false);
                } else {
                    if (i4 != 3) {
                        throw ho2.L(p65Var2, -1465762443, false);
                    }
                    p65Var2.Y(-1465753905);
                    sn3Var = kt7.b;
                    m45Var = m45Var2;
                    j = ((zo7) p65Var2.j(sn3Var)).r;
                    c1eVar = c1eVar2;
                    p65Var2.p(false);
                }
                upc upcVarA = wec.a(j, null, "Supporting text color", p65Var2, 384, 10);
                mx mxVar3 = mxVar2 != null ? mxVar2 : new mx("");
                mkd mkdVarA = mkd.a((mkd) obj8, ((uu1) upcVarA.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                boolean zF = p65Var2.f(i52VarD2) | p65Var2.f(mxVar2);
                Object objM = p65Var2.M();
                if (zF || objM == obj6) {
                    objM = new xs7(i52VarD2, mxVar2, 0);
                    p65Var2.j0(objM);
                }
                jjd.c(mxVar3, bgf.N(new y52(i52VarD, (x45) objM), "supporting_text"), 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, mkdVarA, p65Var2, 0, 24960, 241660);
                kxVarW = ho2.w(p65Var2, -1465721678);
                iH = kxVarW.h(new skc(((zo7) p65Var2.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
                try {
                    kxVarW.d(String.valueOf(((uid) obj3).a.b.length()));
                    kxVarW.f(iH);
                    kxVarW.d("/" + num);
                    mx mxVarI = kxVarW.i();
                    p65Var2.p(false);
                    mkd mkdVarA2 = mkd.a((mkd) obj8, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    boolean zF2 = p65Var2.f(num);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == obj6) {
                        objM2 = new ys7(num, 0);
                        p65Var2.j0(objM2);
                    }
                    jjd.c(mxVarI, bgf.N(new y52(i52VarD2, (x45) objM2), "counter"), 0L, 0L, 0L, new jgd(6), 0L, 0, false, 1, 0, null, null, mkdVarA2, p65Var2, 0, 24576, 244732);
                    p65Var2.p(false);
                    if (z52Var.b == i3) {
                        return c1eVar;
                    }
                    kyd.v(m45Var, p65Var2);
                    return c1eVar;
                } finally {
                }
            case 1:
                mkd mkdVar = (mkd) obj8;
                x12 x12Var2 = (x12) obj;
                Integer num2 = (Integer) obj4;
                mx mxVar4 = (mx) obj5;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.B()) {
                        p65Var3.S();
                        return c1eVar2;
                    }
                }
                l78Var3.setValue(c1eVar2);
                int i5 = z52Var.b;
                z52Var.f();
                p65 p65Var4 = (p65) x12Var2;
                p65Var4.Y(1307917609);
                z52 z52Var3 = (z52) z52Var.e().b;
                i52 i52VarD3 = z52Var3.d();
                i52 i52VarD4 = z52Var3.d();
                int i6 = ft7.a[((ht7) obj7).ordinal()];
                if (i6 == 1) {
                    p65Var4.Y(-511993421);
                    sn3 sn3Var4 = kt7.b;
                    sn3Var2 = sn3Var4;
                    j2 = ((zo7) p65Var4.j(sn3Var4)).n;
                    p65Var4.p(false);
                } else if (i6 == 2) {
                    p65Var4.Y(-511990415);
                    sn3 sn3Var5 = kt7.b;
                    sn3Var2 = sn3Var5;
                    j2 = ((zo7) p65Var4.j(sn3Var5)).u;
                    p65Var4.p(false);
                } else {
                    if (i6 != 3) {
                        throw ho2.L(p65Var4, -511995883, false);
                    }
                    p65Var4.Y(-511987438);
                    sn3 sn3Var6 = kt7.b;
                    j2 = ((zo7) p65Var4.j(sn3Var6)).r;
                    sn3Var2 = sn3Var6;
                    p65Var4.p(false);
                }
                sn3 sn3Var7 = sn3Var2;
                upc upcVarA2 = wec.a(j2, null, "Supporting text color", p65Var4, 384, 10);
                if (mxVar4 != null) {
                    upcVar = upcVarA2;
                    mxVar = mxVar4;
                } else {
                    upcVar = upcVarA2;
                    mxVar = new mx("");
                }
                mkd mkdVarA3 = mkd.a(mkdVar, ((uu1) upcVar.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                boolean zF3 = p65Var4.f(i52VarD4) | p65Var4.f(mxVar4);
                Object objM3 = p65Var4.M();
                if (zF3 || objM3 == obj6) {
                    objM3 = new xs7(i52VarD4, mxVar4, 1);
                    p65Var4.j0(objM3);
                }
                kjd.c(mxVar, bgf.N(new y52(i52VarD3, (x45) objM3), "supporting_text"), 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, mkdVarA3, p65Var4, 0, 3120, 120828);
                kxVarW = ho2.w(p65Var4, -511955212);
                iH = kxVarW.h(new skc(((zo7) p65Var4.j(sn3Var7)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
                try {
                    kxVarW.d(String.valueOf(((uid) obj3).a.b.length()));
                    kxVarW.f(iH);
                    kxVarW.d("/" + num2);
                    mx mxVarI2 = kxVarW.i();
                    p65Var4.p(false);
                    mkd mkdVarA4 = mkd.a(mkdVar, ((zo7) p65Var4.j(sn3Var7)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    boolean zF4 = p65Var4.f(num2);
                    Object objM4 = p65Var4.M();
                    if (zF4 || objM4 == obj6) {
                        objM4 = new ys7(num2, 1);
                        p65Var4.j0(objM4);
                    }
                    kjd.c(mxVarI2, bgf.N(new y52(i52VarD4, (x45) objM4), "counter"), 0L, 0L, 0L, new jgd(6), 0L, 0, false, 1, 0, null, null, mkdVarA4, p65Var4, 0, 3072, 122364);
                    p65Var4.p(false);
                    if (z52Var.b == i5) {
                        return c1eVar2;
                    }
                    kyd.v(m45Var2, p65Var4);
                    return c1eVar2;
                } finally {
                }
            default:
                x12 x12Var3 = (x12) obj;
                tj9 tj9Var = (tj9) obj7;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var5 = (p65) x12Var3;
                    if (p65Var5.B()) {
                        p65Var5.S();
                        return c1eVar2;
                    }
                }
                l78Var3.setValue(c1eVar2);
                z52 z52Var4 = this.c;
                int i7 = z52Var4.b;
                z52Var4.f();
                p65 p65Var6 = (p65) x12Var3;
                p65Var6.Y(-1008053800);
                z52 z52Var5 = (z52) z52Var4.e().b;
                i52 i52VarD5 = z52Var5.d();
                i52 i52VarD6 = z52Var5.d();
                i52 i52VarD7 = z52Var5.d();
                i52 i52VarD8 = z52Var5.d();
                i52 i52VarD9 = z52Var5.d();
                String str = tj9Var.a;
                String str2 = tj9Var.b;
                String str3 = tj9Var.c;
                Object objM5 = p65Var6.M();
                if (objM5 == obj6) {
                    objM5 = p79.e;
                    p65Var6.j0(objM5);
                }
                mq7.b(str, str2, str3, new y52(i52VarD5, (x45) objM5), p65Var6, 0);
                akc akcVar = (akc) p65Var6.j(z22.r);
                lr4 lr4Var = (lr4) p65Var6.j(z22.i);
                Object objM6 = p65Var6.M();
                if (objM6 == obj6) {
                    objM6 = ka1.g(p65Var6);
                }
                sr4 sr4Var = (sr4) objM6;
                Object objM7 = p65Var6.M();
                if (objM7 == obj6) {
                    objM7 = ka1.g(p65Var6);
                }
                sr4 sr4Var2 = (sr4) objM7;
                sn3 sn3Var8 = d82.a;
                long jB = uu1.b(((Number) p65Var6.j(w72.a)).floatValue(), ((uu1) p65Var6.j(sn3Var8)).a);
                long j5 = ((uu1) p65Var6.j(sn3Var8)).a;
                sn3 sn3Var9 = tv1.a;
                if (((sv1) p65Var6.j(sn3Var9)).f()) {
                    op8.f0(j5);
                } else {
                    op8.f0(j5);
                }
                uu1.b(0.38f, jB);
                uu1.b(0.12f, ((sv1) p65Var6.j(sn3Var9)).c());
                long jD = ((sv1) p65Var6.j(sn3Var9)).d();
                ((sv1) p65Var6.j(sn3Var9)).b();
                long jD2 = ((sv1) p65Var6.j(sn3Var9)).d();
                long j6 = ((uu1) p65Var6.j(sn3Var8)).a;
                uu1.b((!((sv1) p65Var6.j(sn3Var9)).f() ? ((double) op8.f0(j6)) < 0.5d : ((double) op8.f0(j6)) > 0.5d) ? 0.87f : 1.0f, jD2);
                long jB2 = uu1.b(0.42f, ((sv1) p65Var6.j(sn3Var9)).c());
                long j7 = ((uu1) p65Var6.j(sn3Var8)).a;
                if (((sv1) p65Var6.j(sn3Var9)).f()) {
                    op8.f0(j7);
                } else {
                    op8.f0(j7);
                }
                uu1.b(0.38f, jB2);
                ((sv1) p65Var6.j(sn3Var9)).b();
                long jB3 = uu1.b(0.54f, ((sv1) p65Var6.j(sn3Var9)).c());
                long j8 = ((uu1) p65Var6.j(sn3Var8)).a;
                if (((sv1) p65Var6.j(sn3Var9)).f()) {
                    op8.f0(j8);
                } else {
                    op8.f0(j8);
                }
                uu1.b(0.38f, jB3);
                long jB4 = uu1.b(0.54f, ((sv1) p65Var6.j(sn3Var9)).c());
                long j9 = ((uu1) p65Var6.j(sn3Var8)).a;
                if (((sv1) p65Var6.j(sn3Var9)).f()) {
                    op8.f0(j9);
                } else {
                    op8.f0(j9);
                }
                uu1.b(0.38f, jB4);
                ((sv1) p65Var6.j(sn3Var9)).b();
                long jD3 = ((sv1) p65Var6.j(sn3Var9)).d();
                long j10 = ((uu1) p65Var6.j(sn3Var8)).a;
                uu1.b((!((sv1) p65Var6.j(sn3Var9)).f() ? ((double) op8.f0(j10)) < 0.5d : ((double) op8.f0(j10)) > 0.5d) ? 0.87f : 1.0f, jD3);
                long jC = ((sv1) p65Var6.j(sn3Var9)).c();
                long j11 = ((uu1) p65Var6.j(sn3Var8)).a;
                long jB5 = uu1.b((!((sv1) p65Var6.j(sn3Var9)).f() ? ((double) op8.f0(j11)) < 0.5d : ((double) op8.f0(j11)) > 0.5d) ? 0.6f : 0.74f, jC);
                long j12 = ((uu1) p65Var6.j(sn3Var8)).a;
                if (((sv1) p65Var6.j(sn3Var9)).f()) {
                    op8.f0(j12);
                } else {
                    op8.f0(j12);
                }
                uu1.b(0.38f, jB5);
                ((sv1) p65Var6.j(sn3Var9)).b();
                long jC2 = ((sv1) p65Var6.j(sn3Var9)).c();
                long j13 = ((uu1) p65Var6.j(sn3Var8)).a;
                long jB6 = uu1.b((!((sv1) p65Var6.j(sn3Var9)).f() ? ((double) op8.f0(j13)) < 0.5d : ((double) op8.f0(j13)) > 0.5d) ? 0.6f : 0.74f, jC2);
                long j14 = ((uu1) p65Var6.j(sn3Var8)).a;
                if (((sv1) p65Var6.j(sn3Var9)).f()) {
                    op8.f0(j14);
                } else {
                    op8.f0(j14);
                }
                uu1.b(0.38f, jB6);
                p65Var6.Y(-1446422485);
                l78 l78VarY = qo7.y(new uu1(jD), p65Var6);
                p65Var6.p(false);
                long j15 = ((uu1) l78VarY.getValue()).a;
                Object objM8 = p65Var6.M();
                if (objM8 == obj6) {
                    objM8 = qo7.u(Boolean.FALSE);
                    p65Var6.j0(objM8);
                }
                l78 l78Var4 = (l78) objM8;
                Object objM9 = p65Var6.M();
                if (objM9 == obj6) {
                    objM9 = qo7.u(Boolean.FALSE);
                    p65Var6.j0(objM9);
                }
                l78 l78Var5 = (l78) objM9;
                if (((Boolean) l78Var4.getValue()).booleanValue()) {
                    p65Var6.Y(-448125376);
                    sn3Var3 = kt7.b;
                    j3 = ((zo7) p65Var6.j(sn3Var3)).b;
                    r15 = 0;
                } else {
                    r15 = 0;
                    p65Var6.Y(-448123746);
                    sn3Var3 = kt7.b;
                    j3 = ((zo7) p65Var6.j(sn3Var3)).a;
                }
                p65Var6.p(r15);
                upc upcVarA3 = wec.a(j3, f76.Q(250, r15, null, 6), null, p65Var6, 48, 12);
                boolean zF5 = p65Var6.f(tj9Var.d);
                Object objM10 = p65Var6.M();
                if (zF5 || objM10 == obj6) {
                    objM10 = bjc.b(new dea(tj9Var, 1));
                    p65Var6.j0(objM10);
                }
                upc upcVar2 = (upc) objM10;
                String str4 = (String) upcVar2.getValue();
                String str5 = str4 == null ? "" : str4;
                sn3 sn3Var10 = kt7.c;
                mkd mkdVarM = dl7.m(((eu7) p65Var6.j(sn3Var10)).e);
                dkc dkcVar = new dkc(j15);
                boolean zF6 = p65Var6.f(i52VarD8) | p65Var6.f(i52VarD5);
                Object objM11 = p65Var6.M();
                if (zF6 || objM11 == obj6) {
                    l78Var = l78Var5;
                    objM11 = new it0(i52VarD8, i52VarD5, 10);
                    p65Var6.j0(objM11);
                } else {
                    l78Var = l78Var5;
                }
                y52 y52Var = new y52(i52VarD6, (x45) objM11);
                long j16 = ((uu1) upcVarA3.getValue()).a;
                nr5 nr5Var = rv8.r;
                r28 r28VarA0 = k50.a0(w2g.D(flb.a0(y52Var, j16, nr5Var), 4.0f, 4.0f), true, null);
                Object objM12 = p65Var6.M();
                if (objM12 == obj6) {
                    objM12 = new ts7(l78Var4, 2);
                    p65Var6.j0(objM12);
                }
                r28 r28VarF = t40.F(r40.J(r28VarA0, (x45) objM12), sr4Var);
                sk6 sk6Var = sk6.f;
                sk6 sk6VarA = sk6.a(3, 0, 6, 118);
                Object objM13 = p65Var6.M();
                if (objM13 == obj6) {
                    objM13 = new z(27, sr4Var2);
                    p65Var6.j0(objM13);
                }
                yo0.b(str5, (x45) obj5, r28VarF, false, mkdVarM, sk6VarA, new pk6(null, (x45) objM13, null, 59), 3, 0, null, null, dkcVar, pxf.E(1340179785, new cea(upcVar2, 0), p65Var6), p65Var6, 805306368, 196608, 15640);
                if (((Boolean) l78Var.getValue()).booleanValue()) {
                    p65Var6.Y(-448044416);
                    j4 = ((zo7) p65Var6.j(sn3Var3)).b;
                    r6 = 0;
                } else {
                    r6 = 0;
                    p65Var6.Y(-448042786);
                    j4 = ((zo7) p65Var6.j(sn3Var3)).a;
                }
                p65Var6.p(r6);
                upc upcVarA4 = wec.a(j4, f76.Q(250, r6, null, 6), null, p65Var6, 48, 12);
                boolean zF7 = p65Var6.f(tj9Var.e);
                Object objM14 = p65Var6.M();
                if (zF7 || objM14 == obj6) {
                    objM14 = bjc.b(new dea(tj9Var, 0));
                    p65Var6.j0(objM14);
                }
                upc upcVar3 = (upc) objM14;
                String str6 = (String) upcVar3.getValue();
                String str7 = str6 == null ? "" : str6;
                mkd mkdVarM2 = dl7.m(((eu7) p65Var6.j(sn3Var10)).n);
                dkc dkcVar2 = new dkc(j15);
                boolean zF8 = p65Var6.f(i52VarD8) | p65Var6.f(i52VarD6);
                Object objM15 = p65Var6.M();
                if (zF8 || objM15 == obj6) {
                    objM15 = new it0(i52VarD8, i52VarD6, 11);
                    p65Var6.j0(objM15);
                }
                r28 r28VarA02 = k50.a0(w2g.D(flb.a0(new y52(i52VarD7, (x45) objM15), ((uu1) upcVarA4.getValue()).a, nr5Var), 4.0f, 4.0f), true, null);
                Object objM16 = p65Var6.M();
                if (objM16 == obj6) {
                    l78Var2 = l78Var;
                    i = 3;
                    objM16 = new ts7(l78Var2, 3);
                    p65Var6.j0(objM16);
                } else {
                    l78Var2 = l78Var;
                    i = 3;
                }
                r28 r28VarF2 = t40.F(r40.J(r28VarA02, (x45) objM16), sr4Var2);
                sk6 sk6VarA2 = sk6.a(i, 0, 7, 118);
                boolean zF9 = p65Var6.f(akcVar);
                Object objM17 = p65Var6.M();
                if (zF9 || objM17 == obj6) {
                    objM17 = new z(28, akcVar);
                    p65Var6.j0(objM17);
                }
                yo0.b(str7, (x45) obj8, r28VarF2, false, mkdVarM2, sk6VarA2, new pk6((x45) objM17, null, null, 62), 3, 0, null, null, dkcVar2, pxf.E(1694287730, new cea(upcVar3, 1), p65Var6), p65Var6, 805306368, 196608, 15640);
                sw5 sw5Var = tj9Var.f;
                boolean zF10 = p65Var6.f(i52VarD6) | p65Var6.f(tj9Var);
                Object objM18 = p65Var6.M();
                if (zF10 || objM18 == obj6) {
                    objM18 = new dy4(i52VarD6, 26, tj9Var);
                    p65Var6.j0(objM18);
                }
                ur7.a(sw5Var, null, hlg.r(new y52(i52VarD8, (x45) objM18), false, null, null, (m45) obj4, 15), null, v82.g, 0.0f, null, 0, p65Var6, 1572912, 1976);
                k40.c(h56.a.a(Boolean.FALSE), pxf.E(-363908570, new bea(lr4Var, akcVar, (m45) obj3, z52Var4, i52VarD9, i52VarD8, sr4Var, l78Var4, l78Var2), p65Var6), p65Var6, 56);
                p65Var6.p(false);
                if (z52Var4.b == i7) {
                    return c1eVar2;
                }
                kyd.v(m45Var2, p65Var6);
                return c1eVar2;
        }
    }
}
