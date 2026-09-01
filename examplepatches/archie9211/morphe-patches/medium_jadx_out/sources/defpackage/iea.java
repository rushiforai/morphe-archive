package defpackage;

import com.medium.android.postpublishing.ui.TopicData;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class iea implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rea b;
    public final /* synthetic */ eb8 c;

    public /* synthetic */ iea(rea reaVar, eb8 eb8Var, int i) {
        this.a = i;
        this.b = reaVar;
        this.c = eb8Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        eb8 eb8Var = this.c;
        rea reaVar = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    Iterator it2 = reaVar.a.iterator();
                    while (it2.hasNext()) {
                        fp7.b((TopicData) it2.next(), eb8Var, p65Var, 0);
                    }
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    m40.p(w2g.E(w2g.G(jfc.d(o28Var, 1.0f), 0.0f, 32.0f, 0.0f, 20.0f, 5), 24.0f, 0.0f, 2), new h70(8.0f, true, new f70(0, z46.p)), new h70(8.0f, false, new f70(1, z46.m)), null, 0, 0, pxf.E(640440448, new iea(reaVar, eb8Var, i2), p65Var2), p65Var2, 1573302, 56);
                    p65Var2.p(true);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
