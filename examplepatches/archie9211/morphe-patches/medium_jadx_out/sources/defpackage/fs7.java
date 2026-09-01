package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fs7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ float c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;

    public /* synthetic */ fs7(float f, kta ktaVar, lvc lvcVar, mz1 mz1Var, int i) {
        this.a = 6;
        this.c = f;
        this.d = ktaVar;
        this.f = lvcVar;
        this.b = mz1Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        fy3 fy3Var = fy3.a;
        o28 o28Var = o28.b;
        float f = this.c;
        int i2 = this.e;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.d;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                final osb osbVar = (osb) obj3;
                final mz1 mz1Var = (mz1) obj4;
                final lvc lvcVar = (lvc) obj;
                lvcVar.getClass();
                int iI0 = lvcVar.i0(48.0f);
                final int iI02 = lvcVar.i0(f);
                long jA = f72.a(((f72) obj2).a, iI0, 0, 0, 0, 14);
                List listX = lvcVar.x((mz1) obj5, l7d.Tabs);
                final ArrayList arrayList = new ArrayList(listX.size());
                int size = listX.size();
                for (int iQ = 0; iQ < size; iQ = km4.q((tk7) listX.get(iQ), jA, arrayList, iQ, 1)) {
                }
                final pya pyaVar = new pya();
                pyaVar.a = iI02 * 2;
                final pya pyaVar2 = new pya();
                int size2 = arrayList.size();
                for (int i3 = 0; i3 < size2; i3++) {
                    t99 t99Var = (t99) arrayList.get(i3);
                    pyaVar.a += t99Var.a;
                    pyaVar2.a = Math.max(pyaVar2.a, t99Var.b);
                }
                int i4 = pyaVar.a;
                int i5 = pyaVar2.a;
                final int i6 = 0;
                final int i7 = this.e;
                break;
            case 1:
                mz1 mz1Var2 = (mz1) obj5;
                mz1 mz1Var3 = (mz1) obj4;
                mz1 mz1Var4 = (mz1) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    zk7 zk7VarC = dy0.c(z46.j, false);
                    long j = p65Var.T;
                    int i8 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i8));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    mz1Var2.invoke(p65Var, 0);
                    yrb yrbVarK = wgf.K(p65Var);
                    Object objM = p65Var.M();
                    uob uobVar = w12.a;
                    if (objM == uobVar) {
                        objM = kyd.M(p65Var);
                        p65Var.j0(objM);
                    }
                    sb2 sb2Var = (sb2) objM;
                    boolean zF = p65Var.f(yrbVarK) | p65Var.f(sb2Var);
                    Object objM2 = p65Var.M();
                    if (zF || objM2 == uobVar) {
                        objM2 = new psb(yrbVarK, sb2Var);
                        p65Var.j0(objM2);
                    }
                    psb psbVar = (psb) objM2;
                    r28 r28VarZ = r40.z(wxb.a(wgf.v(jfc.s(jfc.d(o28Var, 1.0f), z46.g, 2), yrbVarK), false, new dsb(3)));
                    float f2 = this.c;
                    boolean zC = p65Var.c(f2) | p65Var.f(mz1Var3) | p65Var.f(mz1Var4) | p65Var.h(psbVar);
                    int i9 = this.e;
                    boolean zD = zC | p65Var.d(i9);
                    Object objM3 = p65Var.M();
                    if (zD || objM3 == uobVar) {
                        objM3 = new fs7(f2, mz1Var3, psbVar, i9, mz1Var4, 2);
                        p65Var.j0(objM3);
                    }
                    f76.u(r28VarZ, (b55) objM3, p65Var, 0, 0);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                break;
            case 2:
                final psb psbVar2 = (psb) obj3;
                final mz1 mz1Var5 = (mz1) obj4;
                final lvc lvcVar2 = (lvc) obj;
                lvcVar2.getClass();
                int iI03 = lvcVar2.i0(48.0f);
                final int iI04 = lvcVar2.i0(f);
                long jA2 = f72.a(((f72) obj2).a, iI03, 0, 0, 0, 14);
                List listX2 = lvcVar2.x((mz1) obj5, m7d.Tabs);
                final ArrayList arrayList2 = new ArrayList(listX2.size());
                int size3 = listX2.size();
                for (int iQ2 = 0; iQ2 < size3; iQ2 = km4.q((tk7) listX2.get(iQ2), jA2, arrayList2, iQ2, 1)) {
                }
                final pya pyaVar3 = new pya();
                pyaVar3.a = iI04 * 2;
                final pya pyaVar4 = new pya();
                int size4 = arrayList2.size();
                for (int i10 = 0; i10 < size4; i10++) {
                    t99 t99Var2 = (t99) arrayList2.get(i10);
                    pyaVar3.a += t99Var2.a;
                    pyaVar4.a = Math.max(pyaVar4.a, t99Var2.b);
                }
                int i11 = pyaVar3.a;
                int i12 = pyaVar4.a;
                final int i13 = 1;
                final int i14 = this.e;
                break;
            case 3:
                ((Integer) obj2).getClass();
                hp7.j((n76) obj5, (pkf) obj4, this.c, (r28) obj3, (x12) obj, tr7.y(1 | i2));
                break;
            case 4:
                ((Integer) obj2).getClass();
                hp7.u((kqc) obj5, (pkf) obj4, this.c, (r28) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                hp7.g((rn3) obj5, (pkf) obj4, this.c, (r28) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            case 6:
                kta ktaVar = (kta) obj4;
                lvc lvcVar3 = (lvc) obj3;
                mz1 mz1Var6 = r40.c;
                mz1 mz1Var7 = (mz1) obj5;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    r28 r28VarD = jfc.d(o28Var, 1.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
                    long j2 = p65Var2.T;
                    int i15 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, ombVarA);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    Integer numValueOf = Integer.valueOf(i15);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    r28 r28VarP = jfc.p(o28Var, f);
                    zk7 zk7VarC2 = dy0.c(z46.i, false);
                    long j3 = p65Var2.T;
                    int i16 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarP);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    tp7.B(p65Var2, cuVar2, i89VarL3);
                    ka1.z(i16, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR3);
                    mz1Var7.f(ktaVar, p65Var2, 48);
                    p65Var2.p(true);
                    hp7.t(p65Var2, jfc.p(o28Var, 16.0f));
                    xz5.p(bgf.N(jfc.e(jfc.p(o28Var, lvcVar3.N(i2)), 18.0f), "progress_bar"), Float.valueOf(ktaVar.c), 0L, 0L, 0, -18.0f, null, p65Var2, 196608, 92);
                    hp7.t(p65Var2, jfc.p(o28Var, 24.0f));
                    mz1Var6.f(ktaVar, p65Var2, 48);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                break;
            case 7:
                ((Integer) obj2).getClass();
                s42.h((ffe) obj5, (nee) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(i2 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                er7.s((ohc) obj5, (r28) obj4, this.c, (c55) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fs7(float f, mz1 mz1Var, Object obj, int i, mz1 mz1Var2, int i2) {
        this.a = i2;
        this.c = f;
        this.b = mz1Var;
        this.f = obj;
        this.e = i;
        this.d = mz1Var2;
    }

    public /* synthetic */ fs7(mz1 mz1Var, float f, mz1 mz1Var2, mz1 mz1Var3, int i) {
        this.a = 1;
        this.b = mz1Var;
        this.c = f;
        this.d = mz1Var2;
        this.f = mz1Var3;
        this.e = i;
    }

    public /* synthetic */ fs7(ffe ffeVar, nee neeVar, r28 r28Var, float f, int i) {
        this.a = 7;
        this.b = ffeVar;
        this.d = neeVar;
        this.f = r28Var;
        this.c = f;
        this.e = i;
    }

    public /* synthetic */ fs7(Object obj, float f, Object obj2, Object obj3, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.d = obj2;
        this.c = f;
        this.f = obj3;
        this.e = i;
    }
}
