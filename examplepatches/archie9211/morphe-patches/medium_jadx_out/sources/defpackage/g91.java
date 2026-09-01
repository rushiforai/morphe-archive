package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class g91 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ g91(wu4 wu4Var, jt4 jt4Var, l78 l78Var, l78 l78Var2, l78 l78Var3) {
        this.a = 12;
        this.b = wu4Var;
        this.f = jt4Var;
        this.c = l78Var;
        this.d = l78Var2;
        this.e = l78Var3;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        nf nfVar = (nf) this.b;
        m45 m45Var = (m45) this.c;
        m45 m45Var2 = (m45) this.d;
        m45 m45Var3 = (m45) this.e;
        e9d e9dVar = (e9d) this.f;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (nfVar instanceof kf) {
                p65Var.Y(1715602306);
                n01.i((kf) nfVar, m45Var, m45Var2, m45Var3, e9dVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (nfVar instanceof lf) {
                p65Var.Y(1715980010);
                n01.b((lf) nfVar, m45Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(nfVar instanceof mf)) {
                    throw ho2.L(p65Var, -1884323161, false);
                }
                p65Var.Y(1716241712);
                n01.c(r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        wu4 wu4Var = (wu4) this.b;
        jt4 jt4Var = (jt4) this.f;
        l78 l78Var = (l78) this.c;
        l78 l78Var2 = (l78) this.d;
        l78 l78Var3 = (l78) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            cg8 cg8Var = (cg8) l78Var.getValue();
            String str = wu4Var.a;
            String str2 = wu4Var.b;
            SourceParameter sourceParameter = wu4Var.f;
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new i84(l78Var2, l78Var3, 2);
                p65Var.j0(objM);
            }
            n01.y(str, str2, jt4Var, cg8Var, sourceParameter, (m45) objM, p65Var, 196608);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        vo5 vo5Var = (vo5) this.b;
        no5 no5Var = (no5) this.d;
        kv6 kv6Var = (kv6) this.c;
        bo4 bo4Var = (bo4) this.e;
        md3 md3Var = (md3) this.f;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (vo5Var instanceof so5) {
                p65Var.Y(1744703246);
                nk7.t((so5) vo5Var, no5Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (vo5Var instanceof to5) {
                p65Var.Y(1744977844);
                nk7.u(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (vo5Var instanceof ro5) {
                p65Var.Y(1745155660);
                nk7.s(((ro5) vo5Var).a, no5Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(vo5Var instanceof uo5)) {
                    throw ho2.L(p65Var, -1883383324, false);
                }
                p65Var.Y(1745440085);
                nk7.v((uo5) vo5Var, kv6Var, bo4Var, no5Var, md3Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        wp5 wp5Var = (wp5) this.b;
        kv6 kv6Var = (kv6) this.c;
        jp5 jp5Var = (jp5) this.d;
        md3 md3Var = (md3) this.e;
        k8b k8bVar = (k8b) this.f;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            qb8.j(wp5Var, kv6Var, jp5Var, md3Var, k8bVar, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        xp5 xp5Var = (xp5) this.b;
        jp5 jp5Var = (jp5) this.d;
        kv6 kv6Var = (kv6) this.c;
        md3 md3Var = (md3) this.e;
        k8b k8bVar = (k8b) this.f;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (xp5Var instanceof up5) {
                p65Var.Y(104141580);
                qb8.i((up5) xp5Var, jp5Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (xp5Var instanceof vp5) {
                p65Var.Y(104410288);
                qb8.k(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(xp5Var instanceof wp5)) {
                    throw ho2.L(p65Var, 280452402, false);
                }
                p65Var.Y(104590243);
                qb8.l((wp5) xp5Var, kv6Var, jp5Var, md3Var, k8bVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        sk8 sk8Var = (sk8) this.b;
        kv6 kv6Var = (kv6) this.c;
        ik8 ik8Var = (ik8) this.d;
        ek8 ek8Var = (ek8) this.e;
        obe obeVar = (obe) this.f;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.B(o28Var, hy8Var), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            gsa.u(sk8Var, kv6Var, ik8Var, ek8Var, obeVar, null, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        int i;
        gz8 gz8Var = (gz8) this.b;
        gl8 gl8Var = (gl8) this.c;
        vk8 vk8Var = (vk8) this.d;
        ek8 ek8Var = (ek8) this.e;
        obe obeVar = (obe) this.f;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarB = w2g.B(o28Var, hy8Var);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-617961681);
            g04<NotificationFilterType> entries = NotificationFilterType.getEntries();
            ArrayList arrayList = new ArrayList(cu1.k0(entries, 10));
            for (NotificationFilterType notificationFilterType : entries) {
                notificationFilterType.getClass();
                int i5 = aj8.a[notificationFilterType.ordinal()];
                if (i5 == 1) {
                    i = R.string.notifications_filter_all;
                } else {
                    if (i5 != 2) {
                        ygf.a();
                        return null;
                    }
                    i = R.string.notifications_filter_responses;
                }
                arrayList.add(vo7.R(p65Var, i));
            }
            p65Var.p(false);
            int iOrdinal = gl8Var.a.ordinal();
            r28 r28VarN = bgf.N(o28Var, "notifications_filter_tabs");
            boolean zF = p65Var.f(vk8Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new eb8(1, vk8Var);
                p65Var.j0(objM);
            }
            ns7.a(0.0f, iOrdinal, 3072, 496, 0L, 0L, p65Var, (x45) objM, null, r28VarN, null, arrayList);
            p65Var.p(true);
            p65Var.p(true);
            kk7.c(gz8Var, null, null, null, null, null, false, null, null, null, pxf.E(-1860231680, new vx4(gl8Var, vk8Var, ek8Var, obeVar, 6), p65Var), p65Var, 0, 16382);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        sb2 sb2Var = (sb2) this.b;
        v7c v7cVar = (v7c) this.c;
        m45 m45Var = (m45) this.d;
        m45 m45Var2 = (m45) this.e;
        m45 m45Var3 = (m45) this.f;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zH = p65Var.h(sb2Var) | p65Var.f(v7cVar) | p65Var.f(m45Var) | p65Var.f(m45Var2);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                z47 z47Var = new z47(m45Var2, sb2Var, v7cVar, m45Var, 1);
                p65Var.j0(z47Var);
                objM = z47Var;
            }
            m45 m45Var4 = (m45) objM;
            boolean zH2 = p65Var.h(sb2Var) | p65Var.f(v7cVar) | p65Var.f(m45Var) | p65Var.f(m45Var3);
            Object objM2 = p65Var.M();
            if (zH2 || objM2 == uobVar) {
                z47 z47Var2 = new z47(m45Var3, sb2Var, v7cVar, m45Var, 2);
                p65Var.j0(z47Var2);
                objM2 = z47Var2;
            }
            m45 m45Var5 = (m45) objM2;
            boolean zH3 = p65Var.h(sb2Var) | p65Var.f(v7cVar) | p65Var.f(m45Var);
            Object objM3 = p65Var.M();
            if (zH3 || objM3 == uobVar) {
                a57 a57Var = new a57(sb2Var, v7cVar, m45Var, 3, false);
                p65Var.j0(a57Var);
                objM3 = a57Var;
            }
            br7.e(m45Var4, m45Var5, (m45) objM3, null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.c;
        ija ijaVar = (ija) this.b;
        md3 md3Var = (md3) this.d;
        qia qiaVar = (qia) this.e;
        ip7 ip7Var = (ip7) this.f;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(ijaVar) | p65Var.f(md3Var) | p65Var.h(qiaVar) | p65Var.d(ip7Var.ordinal());
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                iu iuVar = new iu(ijaVar, md3Var, ip7Var, qiaVar, 20);
                p65Var.j0(iuVar);
                objM = iuVar;
            }
            k40.t(null, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 509);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        bbb bbbVar = (bbb) this.b;
        kv6 kv6Var = (kv6) this.c;
        mab mabVar = (mab) this.d;
        obe obeVar = (obe) this.e;
        nab nabVar = (nab) this.f;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (bbbVar instanceof zab) {
                p65Var.Y(1889288552);
                gsa.C(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (bbbVar instanceof abb) {
                p65Var.Y(1889291804);
                gsa.D((abb) bbbVar, kv6Var, mabVar, obeVar, nabVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(bbbVar instanceof yab)) {
                    throw ho2.L(p65Var, 1889286864, false);
                }
                p65Var.Y(1889303532);
                gsa.B((yab) bbbVar, mabVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        uob uobVar;
        Object qaVar;
        jhc jhcVar = (jhc) this.b;
        jhc jhcVar2 = (jhc) this.c;
        ArrayList arrayList = (ArrayList) this.d;
        m94 m94Var = (m94) this.e;
        String str = (String) this.f;
        b55 b55Var = (b55) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).h(b55Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            boolean zL = g76.L(jhcVar, jhcVar2);
            int i = zL ? 150 : 75;
            int i2 = (!zL || z27.a(arrayList).size() == 1) ? 0 : 75;
            cud cudVar = new cud(i, i2, ao3.d);
            boolean zH = p65Var.h(jhcVar) | p65Var.h(m94Var);
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (zH || objM == uobVar2) {
                objM = new nbb(jhcVar, 9, m94Var);
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar2) {
                objM2 = yi2.h(!zL ? 1.0f : 0.0f);
                p65Var.j0(objM2);
            }
            ou ouVar = (ou) objM2;
            Boolean boolValueOf = Boolean.valueOf(zL);
            boolean zH2 = p65Var.h(ouVar) | p65Var.g(zL) | p65Var.h(cudVar) | p65Var.f(m45Var);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar2) {
                uobVar = uobVar2;
                qaVar = new qa(ouVar, zL, cudVar, m45Var, (n92) null, 17);
                p65Var.j0(qaVar);
            } else {
                qaVar = objM3;
                uobVar = uobVar2;
            }
            kyd.k(p65Var, (b55) qaVar, boolValueOf);
            xw xwVar = ouVar.c;
            cud cudVar2 = new cud(i, i2, ao3.a);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = yi2.h(!zL ? 1.0f : 0.8f);
                p65Var.j0(objM4);
            }
            ou ouVar2 = (ou) objM4;
            Boolean boolValueOf2 = Boolean.valueOf(zL);
            boolean zH3 = p65Var.h(ouVar2) | p65Var.g(zL) | p65Var.h(cudVar2);
            Object objM5 = p65Var.M();
            if (zH3 || objM5 == uobVar) {
                lj1 lj1Var = new lj1(ouVar2, zL, cudVar2, (n92) null, 11);
                p65Var.j0(lj1Var);
                objM5 = lj1Var;
            }
            kyd.k(p65Var, (b55) objM5, boolValueOf2);
            xw xwVar2 = ouVar2.c;
            r28 r28VarX = xz5.X(o28.b, ((Number) xwVar2.b.getValue()).floatValue(), ((Number) xwVar2.b.getValue()).floatValue(), ((Number) xwVar.b.getValue()).floatValue(), 0.0f, null, 131064);
            boolean zG = p65Var.g(zL) | p65Var.f(str) | p65Var.h(jhcVar);
            Object objM6 = p65Var.M();
            if (zG || objM6 == uobVar) {
                objM6 = new rb(str, jhcVar, zL, 5);
                p65Var.j0(objM6);
            }
            r28 r28VarA = wxb.a(r28VarX, false, (x45) objM6);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA);
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
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            b55Var.invoke(p65Var, Integer.valueOf(iIntValue & 14));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        cme cmeVar = (cme) this.b;
        gle gleVar = (gle) this.d;
        kv6 kv6Var = (kv6) this.c;
        k8b k8bVar = (k8b) this.f;
        sh9 sh9Var = (sh9) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarB = w2g.B(rh4Var, hy8Var);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            if (cmeVar instanceof ame) {
                p65Var.Y(509288405);
                yi2.A(rh4Var, p65Var, 6);
                p65Var.p(false);
            } else if (cmeVar instanceof zle) {
                p65Var.Y(509291381);
                yi2.w((zle) cmeVar, gleVar, rh4Var, p65Var, 384);
                p65Var.p(false);
            } else if (cmeVar instanceof bme) {
                p65Var.Y(509298489);
                yi2.B((bme) cmeVar, gleVar, rh4Var, p65Var, 384);
                p65Var.p(false);
            } else {
                if (!(cmeVar instanceof yle)) {
                    throw ho2.L(p65Var, 509286757, false);
                }
                p65Var.Y(509305808);
                yi2.s((yle) cmeVar, kv6Var, gleVar, k8bVar, sh9Var, rh4Var, p65Var, 196608);
                p65Var.p(false);
            }
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:270:0x0879  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x087d  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x088b A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:295:0x0a11  */
    /* JADX WARN: Removed duplicated region for block: B:303:0x0a39  */
    /* JADX WARN: Removed duplicated region for block: B:304:0x0a3f  */
    /* JADX WARN: Removed duplicated region for block: B:308:0x0a4e  */
    /* JADX WARN: Removed duplicated region for block: B:310:0x0a52  */
    /* JADX WARN: Removed duplicated region for block: B:314:0x0a96  */
    /* JADX WARN: Removed duplicated region for block: B:315:0x0a9a  */
    /* JADX WARN: Removed duplicated region for block: B:318:0x0ada  */
    /* JADX WARN: Removed duplicated region for block: B:319:0x0ade  */
    @Override // defpackage.c55
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.Object r55, java.lang.Object r56, java.lang.Object r57) {
        /*
            Method dump skipped, instruction units count: 3610
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g91.f(java.lang.Object, java.lang.Object, java.lang.Object):java.lang.Object");
    }

    public /* synthetic */ g91(kv6 kv6Var, Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.c = kv6Var;
        this.b = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
    }

    public /* synthetic */ g91(aib aibVar, lgb lgbVar, ngb ngbVar, kv6 kv6Var, uid uidVar) {
        this.a = 4;
        this.b = aibVar;
        this.d = lgbVar;
        this.e = ngbVar;
        this.c = kv6Var;
        this.f = uidVar;
    }

    public /* synthetic */ g91(whe wheVar, sh9 sh9Var, khe kheVar, kv6 kv6Var, lhe lheVar) {
        this.a = 9;
        this.b = wheVar;
        this.e = sh9Var;
        this.d = kheVar;
        this.c = kv6Var;
        this.f = lheVar;
    }

    public /* synthetic */ g91(Object obj, Object obj2, kv6 kv6Var, Object obj3, sh9 sh9Var, int i) {
        this.a = i;
        this.b = obj;
        this.d = obj2;
        this.c = kv6Var;
        this.f = obj3;
        this.e = sh9Var;
    }

    public /* synthetic */ g91(Object obj, Object obj2, kv6 kv6Var, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.d = obj2;
        this.c = kv6Var;
        this.e = obj3;
        this.f = obj4;
    }

    public /* synthetic */ g91(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
    }
}
