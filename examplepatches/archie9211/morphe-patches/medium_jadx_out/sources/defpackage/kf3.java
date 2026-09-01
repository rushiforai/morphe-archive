package defpackage;

import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.proto.obv.post.BlockLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kf3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ kf3(m45 m45Var, r28 r28Var, gu6 gu6Var, xt6 xt6Var, int i) {
        this.a = 11;
        this.c = m45Var;
        this.b = r28Var;
        this.d = gu6Var;
        this.e = xt6Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.b;
        Object obj5 = this.d;
        Object obj6 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                xz5.k((String) obj6, (rz2) obj5, (r28) obj4, (uf3) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                s42.z((y5d) obj6, (y5d) obj5, (x45) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                n01.o((kc4) obj6, (xb4) obj5, (s26) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                gx1.t((String) obj6, (rz2) obj5, (r28) obj4, (fj4) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                gx1.p((ti4) obj6, (hi4) obj5, (obe) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                gx1.n((si4) obj5, (String) obj6, (hi4) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 6:
                ((Integer) obj2).getClass();
                k40.o((lig) obj5, (String) obj6, (r28) obj4, (xm4) obj3, (x12) obj, tr7.y(1));
                break;
            case 7:
                ((Integer) obj2).getClass();
                rx0.f((ov4) obj6, (kv6) obj5, (ye1) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                vx0.h((rw4) obj6, (lw4) obj5, (kv6) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                vc2.x((ub0) obj6, (i45) obj5, (x45) obj3, (r28) obj4, (x12) obj, tr7.y(3073));
                break;
            case 10:
                ((Integer) obj2).getClass();
                g76.o((yl5) obj6, (kv6) obj5, (sl5) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 11:
                ((Integer) obj2).getClass();
                yi2.y((m45) obj6, (r28) obj4, (gu6) obj5, (xt6) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                t40.m((j57) obj6, (m45) obj5, (b55) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                jk7.b((fv1) obj6, (w4c) obj5, (lyd) obj4, (mz1) obj3, (x12) obj, tr7.y(433));
                break;
            case 14:
                ((Integer) obj2).getClass();
                kk7.d((sv1) obj6, (myd) obj5, (x4c) obj4, (mz1) obj3, (x12) obj, tr7.y(433));
                break;
            case 15:
                ParagraphEditImageLayout paragraphEditImageLayout = (ParagraphEditImageLayout) obj6;
                Integer num = (Integer) obj5;
                y09 y09Var = (y09) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i2 = ParagraphEditImageLayout.p;
                boolean z = false;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    o28 o28Var = o28.b;
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
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    boolean zF = p65Var.f(paragraphEditImageLayout.getListener());
                    Object objM = p65Var.M();
                    if (zF || objM == w12.a) {
                        objM = new a19(paragraphEditImageLayout);
                        p65Var.j0(objM);
                    }
                    a19 a19Var = (a19) objM;
                    BlockLayout blockLayout = paragraphEditImageLayout.l.a.layout;
                    if (num != null && num.intValue() == 0) {
                        z = true;
                    }
                    bo.i(y09Var, blockLayout, z, ((Boolean) upcVar.getValue()).booleanValue(), a19Var, paragraphEditImageLayout.getUnsplashImageLoader(), iy0.a.a(o28Var, z46.h), p65Var, 0);
                    p65Var.p(true);
                }
                break;
            case 16:
                ((Integer) obj2).getClass();
                x69.b((v69) obj5, (String) obj6, (r28) obj4, (c79) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                ((Integer) obj2).getClass();
                rx0.A((jx9) obj6, (bo4) obj5, (ex9) obj4, (md3) obj3, (x12) obj, tr7.y(1));
                break;
            case 18:
                ((Integer) obj2).getClass();
                vx0.u((String) obj6, (my6) obj5, (r28) obj4, (q1a) obj3, (x12) obj, tr7.y(1));
                break;
            case 19:
                ((Integer) obj2).getClass();
                mk7.e((vpc) obj6, (bo4) obj5, (gg5) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 20:
                ((Integer) obj2).getClass();
                ht2.F((f9a) obj6, (kv6) obj5, (e9a) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                ht2.E((q9a) obj6, (kv6) obj5, (e9a) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 22:
                ((Integer) obj2).getClass();
                vo7.f((naa) obj6, (iaa) obj5, (a1a) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 23:
                ((Integer) obj2).getClass();
                pba.b((aca) obj6, (nba) obj5, (sh9) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 24:
                ((Integer) obj2).getClass();
                vv2.k((sca) obj6, (obe) obj5, (qca) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 25:
                ((Integer) obj2).getClass();
                iq7.h((uga) obj6, (eb8) obj5, (m45) obj4, (ui9) obj3, (x12) obj, tr7.y(1));
                break;
            case 26:
                ((Integer) obj2).getClass();
                mq7.b((String) obj6, (String) obj5, (String) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                f76.j((pha) obj6, (jha) obj5, (kv6) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            case 28:
                ((Integer) obj2).getClass();
                nk7.J((xna) obj6, (obe) obj5, (sna) obj3, (r28) obj4, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                qb8.s((String) obj6, (olb) obj5, (r28) obj4, (nqa) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ kf3(int i, int i2, Object obj, Object obj2, Object obj3, Object obj4) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = obj3;
        this.e = obj4;
    }

    public /* synthetic */ kf3(si4 si4Var, String str, hi4 hi4Var, r28 r28Var, int i) {
        this.a = 5;
        this.d = si4Var;
        this.c = str;
        this.e = hi4Var;
        this.b = r28Var;
    }

    public /* synthetic */ kf3(int i, int i2, r28 r28Var, Object obj, Object obj2, Object obj3) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.b = r28Var;
    }

    public /* synthetic */ kf3(ParagraphEditImageLayout paragraphEditImageLayout, Integer num, y09 y09Var, l78 l78Var) {
        this.a = 15;
        this.c = paragraphEditImageLayout;
        this.d = num;
        this.b = y09Var;
        this.e = l78Var;
    }

    public /* synthetic */ kf3(Object obj, String str, r28 r28Var, que queVar, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.c = str;
        this.b = r28Var;
        this.e = queVar;
    }
}
