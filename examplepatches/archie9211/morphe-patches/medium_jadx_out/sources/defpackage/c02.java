package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c02 implements c55 {
    public final /* synthetic */ int a;

    public /* synthetic */ c02(int i) {
        this.a = i;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((pmb) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jjd.b(vo7.R(p65Var, R.string.common_post_limited_state_alert_proceed), null, 0L, 0L, 0L, null, new jgd(6), 0L, 0, false, 0, 0, null, null, p65Var, 0, 0, 261118);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((pmb) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jjd.b(vo7.R(p65Var, R.string.common_post_limited_state_alert_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 0, 0, 262142);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        uob uobVar = w12.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    r28 r28VarE = jfc.e(jfc.d(o28Var, 1.0f), 56.0f);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarE);
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
                    tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    jjd.b("Inside", w2g.C(o28Var, 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 54, 0, 262140);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    r28 r28VarE2 = jfc.e(jfc.d(o28Var, 1.0f), 56.0f);
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarE2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA2);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    kjd.b("Inside", w2g.C(o28Var, 16.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 54, 0, 131068);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                hy8 hy8Var = (hy8) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    Object objM = p65Var3.M();
                    if (objM == uobVar) {
                        objM = new h49(0);
                        p65Var3.j0(objM);
                    }
                    h49 h49Var = (h49) objM;
                    o28 o28Var2 = o28.b;
                    r28 r28VarD = jfc.d(w2g.B(o28Var2, hy8Var), 1.0f);
                    wv1 wv1VarA3 = uv1.a(qb8.c, z46.p, p65Var3, 0);
                    long j3 = p65Var3.T;
                    int i4 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR3 = gx1.R(p65Var3, r28VarD);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, wv1VarA3);
                    tp7.B(p65Var3, q12.e, i89VarL3);
                    tp7.B(p65Var3, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var3, q12.h);
                    tp7.B(p65Var3, q12.d, r28VarR3);
                    g04 entries = k73.getEntries();
                    ArrayList arrayList = new ArrayList(cu1.k0(entries, 10));
                    Iterator<E> it2 = entries.iterator();
                    while (it2.hasNext()) {
                        arrayList.add(((k73) it2.next()).getTabTitle());
                    }
                    int iG = h49Var.g();
                    Object objM2 = p65Var3.M();
                    if (objM2 == uobVar) {
                        objM2 = new d02(h49Var, 0);
                        p65Var3.j0(objM2);
                    }
                    ns7.a(0.0f, iG, 3456, 496, 0L, 0L, p65Var3, (x45) objM2, null, o28Var2, null, arrayList);
                    ((k73) ((i04) k73.getEntries()).get(h49Var.g())).Demo(p65Var3, 0);
                    p65Var3.p(true);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((hy8) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    Object objM3 = p65Var4.M();
                    if (objM3 == uobVar) {
                        objM3 = new h49(0);
                        p65Var4.j0(objM3);
                    }
                    h49 h49Var2 = (h49) objM3;
                    o28 o28Var3 = o28.b;
                    r28 r28VarD2 = jfc.d(o28Var3, 1.0f);
                    wv1 wv1VarA4 = uv1.a(qb8.c, z46.p, p65Var4, 0);
                    long j4 = p65Var4.T;
                    int i5 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var4.l();
                    r28 r28VarR4 = gx1.R(p65Var4, r28VarD2);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, q12.f, wv1VarA4);
                    tp7.B(p65Var4, q12.e, i89VarL4);
                    tp7.B(p65Var4, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var4, q12.h);
                    tp7.B(p65Var4, q12.d, r28VarR4);
                    g04 entries2 = l73.getEntries();
                    ArrayList arrayList2 = new ArrayList(cu1.k0(entries2, 10));
                    Iterator<E> it3 = entries2.iterator();
                    while (it3.hasNext()) {
                        arrayList2.add(((l73) it3.next()).getTabTitle());
                    }
                    int iG2 = h49Var2.g();
                    Object objM4 = p65Var4.M();
                    if (objM4 == uobVar) {
                        objM4 = new d02(h49Var2, 1);
                        p65Var4.j0(objM4);
                    }
                    qs7.b(arrayList2, o28Var3, iG2, (x45) objM4, p65Var4, 3120, 16);
                    ((l73) ((i04) l73.getEntries()).get(h49Var2.g())).Demo(p65Var4, 0);
                    p65Var4.p(true);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    Object objM5 = p65Var5.M();
                    if (objM5 == uobVar) {
                        objM5 = new n7(18);
                        p65Var5.j0(objM5);
                    }
                    m45 m45Var = (m45) objM5;
                    Object objM6 = p65Var5.M();
                    if (objM6 == uobVar) {
                        objM6 = new n7(19);
                        p65Var5.j0(objM6);
                    }
                    m45 m45Var2 = (m45) objM6;
                    Object objM7 = p65Var5.M();
                    if (objM7 == uobVar) {
                        objM7 = new n7(20);
                        p65Var5.j0(objM7);
                    }
                    vv2.s("Friend Link", m45Var, null, "Share free access to this member-only story with a friend. Available to everyone with a Friend membership and story authors.", "Upgrade membership", m45Var2, "Learn more", (m45) objM7, p65Var5, 14380086, 4);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                ohc ohcVar = (ohc) obj;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ohcVar.getClass();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((p65) x12Var6).f(ohcVar) ? 4 : 2;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 19) != 18)) {
                    er7.s(ohcVar, null, 0.0f, null, p65Var6, iIntValue6 & 14);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                xv1 xv1Var = (xv1) obj;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                xv1Var.getClass();
                if ((iIntValue7 & 6) == 0) {
                    iIntValue7 |= ((p65) x12Var7).f(xv1Var) ? 4 : 2;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 19) != 18)) {
                    jjd.b("Content", new dr5(z46.q), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var7.j(jt7.c)).s, p65Var7, 6, 0, 131068);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                if (!p65Var8.P(iIntValue8 & 1, (iIntValue8 & 17) != 16)) {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var9 = (p65) x12Var9;
                if (!p65Var9.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 17) != 16)) {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var11 = (p65) x12Var11;
                if (!p65Var11.P(iIntValue11 & 1, (iIntValue11 & 17) != 16)) {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var12 = (p65) x12Var12;
                if (!p65Var12.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var13 = (p65) x12Var13;
                if (!p65Var13.P(iIntValue13 & 1, (iIntValue13 & 17) != 16)) {
                    p65Var13.S();
                }
                return c1eVar;
            case 13:
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var14 = (p65) x12Var14;
                if (!p65Var14.P(iIntValue14 & 1, (iIntValue14 & 17) != 16)) {
                    p65Var14.S();
                }
                return c1eVar;
            case 14:
                x12 x12Var15 = (x12) obj2;
                int iIntValue15 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var15 = (p65) x12Var15;
                if (!p65Var15.P(iIntValue15 & 1, (iIntValue15 & 17) != 16)) {
                    p65Var15.S();
                }
                return c1eVar;
            case 15:
                xv1 xv1Var2 = (xv1) obj;
                x12 x12Var16 = (x12) obj2;
                int iIntValue16 = ((Integer) obj3).intValue();
                xv1Var2.getClass();
                if ((iIntValue16 & 6) == 0) {
                    iIntValue16 |= ((p65) x12Var16).f(xv1Var2) ? 4 : 2;
                }
                p65 p65Var16 = (p65) x12Var16;
                if (p65Var16.P(iIntValue16 & 1, (iIntValue16 & 19) != 18)) {
                    xz5.o(w2g.F(new dr5(z46.q), 24.0f, 24.0f, 24.0f, 24.0f), null, 0.0f, 0L, 0L, 0, p65Var16, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
            case 16:
                x12 x12Var17 = (x12) obj2;
                int iIntValue17 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var17 = (p65) x12Var17;
                if (p65Var17.P(iIntValue17 & 1, (iIntValue17 & 17) != 16)) {
                    hp7.t(p65Var17, jfc.l(o28Var, 24.0f));
                } else {
                    p65Var17.S();
                }
                return c1eVar;
            case 17:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                x12 x12Var18 = (x12) obj2;
                int iIntValue18 = ((Integer) obj3).intValue();
                if ((iIntValue18 & 6) == 0) {
                    iIntValue18 |= ((p65) x12Var18).g(zBooleanValue) ? 4 : 2;
                }
                p65 p65Var18 = (p65) x12Var18;
                if (p65Var18.P(iIntValue18 & 1, (iIntValue18 & 19) != 18)) {
                    qv5.b(vn7.J(zBooleanValue ? R.drawable.ic_play : R.drawable.ic_pause, 0, p65Var18), vo7.R(p65Var18, zBooleanValue ? R.string.play : R.string.pause), null, ((zo7) p65Var18.j(kt7.b)).n, p65Var18, 8, 4);
                } else {
                    p65Var18.S();
                }
                return c1eVar;
            case 18:
                x12 x12Var19 = (x12) obj2;
                ((Integer) obj3).getClass();
                ((lw) obj).getClass();
                g3d.a(jfc.l(w2g.C(m40.V(o28Var, x12Var19, 6), 12.0f), 40.0f), null, ((zo7) ((p65) x12Var19).j(kt7.b)).b, 0L, 0.0f, 0.0f, null, rv8.k, x12Var19, 12582912, 122);
                return c1eVar;
            case 19:
                ((Integer) obj3).intValue();
                ((lw) obj).getClass();
                iq7.e((x12) obj2, 0);
                return c1eVar;
            case 20:
                x12 x12Var20 = (x12) obj2;
                int iIntValue19 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var19 = (p65) x12Var20;
                if (p65Var19.P(iIntValue19 & 1, (iIntValue19 & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var19.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var4, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j5 = p65Var19.T;
                    int i6 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var19.l();
                    r28 r28VarR5 = gx1.R(p65Var19, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var19.c0();
                    if (p65Var19.S) {
                        p65Var19.k(ot2Var5);
                    } else {
                        p65Var19.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var19, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var19, cuVar2, i89VarL5);
                    Integer numValueOf = Integer.valueOf(i6);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var19, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var19, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var19, cuVar4, r28VarR5);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j6 = p65Var19.T;
                    int i7 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var19.l();
                    r28 r28VarR6 = gx1.R(p65Var19, r28VarD3);
                    p65Var19.c0();
                    if (p65Var19.S) {
                        p65Var19.k(ot2Var5);
                    } else {
                        p65Var19.m0();
                    }
                    tp7.B(p65Var19, cuVar, zk7VarC2);
                    tp7.B(p65Var19, cuVar2, i89VarL6);
                    ka1.z(i7, p65Var19, cuVar3, p65Var19, fnVar);
                    tp7.B(p65Var19, cuVar4, r28VarR6);
                    tr7.g(0, 1, p65Var19, null);
                    p65Var19.p(true);
                    p65Var19.p(true);
                } else {
                    p65Var19.S();
                }
                return c1eVar;
            case 21:
                x12 x12Var21 = (x12) obj2;
                int iIntValue20 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var20 = (p65) x12Var21;
                if (p65Var20.P(iIntValue20 & 1, (iIntValue20 & 17) != 16)) {
                    jp7 jp7Var2 = (jp7) p65Var20.j(kt7.a);
                    o28 o28Var5 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var5, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j7 = p65Var20.T;
                    int i8 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var20.l();
                    r28 r28VarR7 = gx1.R(p65Var20, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var6 = q12.b;
                    p65Var20.c0();
                    if (p65Var20.S) {
                        p65Var20.k(ot2Var6);
                    } else {
                        p65Var20.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var20, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var20, cuVar6, i89VarL7);
                    Integer numValueOf2 = Integer.valueOf(i8);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var20, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var20, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var20, cuVar8, r28VarR7);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j8 = p65Var20.T;
                    int i9 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var20.l();
                    r28 r28VarR8 = gx1.R(p65Var20, r28VarD4);
                    p65Var20.c0();
                    if (p65Var20.S) {
                        p65Var20.k(ot2Var6);
                    } else {
                        p65Var20.m0();
                    }
                    tp7.B(p65Var20, cuVar5, zk7VarC4);
                    tp7.B(p65Var20, cuVar6, i89VarL8);
                    ka1.z(i9, p65Var20, cuVar7, p65Var20, fnVar2);
                    tp7.B(p65Var20, cuVar8, r28VarR8);
                    gq7.a(null, null, vo7.R(p65Var20, R.string.refine_recommendations_muted_empty_title), vo7.R(p65Var20, R.string.refine_recommendations_muted_empty_content), 0L, null, null, null, null, 0.0f, 0.0f, p65Var20, 0, 0, 2035);
                    p65Var20.p(true);
                    p65Var20.p(true);
                } else {
                    p65Var20.S();
                }
                return c1eVar;
            case 22:
                x12 x12Var22 = (x12) obj2;
                int iIntValue21 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var21 = (p65) x12Var22;
                if (p65Var21.P(iIntValue21 & 1, (iIntValue21 & 17) != 16)) {
                    jp7 jp7Var3 = (jp7) p65Var21.j(kt7.a);
                    o28 o28Var6 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var6, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j9 = p65Var21.T;
                    int i10 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var21.l();
                    r28 r28VarR9 = gx1.R(p65Var21, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var7 = q12.b;
                    p65Var21.c0();
                    if (p65Var21.S) {
                        p65Var21.k(ot2Var7);
                    } else {
                        p65Var21.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var21, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var21, cuVar10, i89VarL9);
                    Integer numValueOf3 = Integer.valueOf(i10);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var21, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var21, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var21, cuVar12, r28VarR9);
                    r28 r28VarD5 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j10 = p65Var21.T;
                    int i11 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL10 = p65Var21.l();
                    r28 r28VarR10 = gx1.R(p65Var21, r28VarD5);
                    p65Var21.c0();
                    if (p65Var21.S) {
                        p65Var21.k(ot2Var7);
                    } else {
                        p65Var21.m0();
                    }
                    tp7.B(p65Var21, cuVar9, zk7VarC6);
                    tp7.B(p65Var21, cuVar10, i89VarL10);
                    ka1.z(i11, p65Var21, cuVar11, p65Var21, fnVar3);
                    tp7.B(p65Var21, cuVar12, r28VarR10);
                    gq7.a(null, null, vo7.R(p65Var21, R.string.refine_recommendations_muted_empty_title_writer), vo7.R(p65Var21, R.string.refine_recommendations_muted_empty_content_writer), 0L, null, null, null, null, 0.0f, 0.0f, p65Var21, 0, 0, 2035);
                    p65Var21.p(true);
                    p65Var21.p(true);
                } else {
                    p65Var21.S();
                }
                return c1eVar;
            case 23:
                x12 x12Var23 = (x12) obj2;
                int iIntValue22 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var22 = (p65) x12Var23;
                if (p65Var22.P(iIntValue22 & 1, (iIntValue22 & 17) != 16)) {
                    hp7.t(p65Var22, jfc.l(o28Var, 20.0f));
                } else {
                    p65Var22.S();
                }
                return c1eVar;
            case 24:
                x12 x12Var24 = (x12) obj2;
                int iIntValue23 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var23 = (p65) x12Var24;
                if (p65Var23.P(iIntValue23 & 1, (iIntValue23 & 17) != 16)) {
                    jp7 jp7Var4 = (jp7) p65Var23.j(kt7.a);
                    o28 o28Var7 = o28.b;
                    r28 r28VarJ4 = ka1.j(jp7Var4, o28Var7, 3, 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j11 = p65Var23.T;
                    int i12 = (int) (j11 ^ (j11 >>> 32));
                    i89 i89VarL11 = p65Var23.l();
                    r28 r28VarR11 = gx1.R(p65Var23, r28VarJ4);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var23.c0();
                    if (p65Var23.S) {
                        p65Var23.k(ot2Var8);
                    } else {
                        p65Var23.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var23, cuVar13, zk7VarC7);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var23, cuVar14, i89VarL11);
                    Integer numValueOf4 = Integer.valueOf(i12);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var23, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var23, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var23, cuVar16, r28VarR11);
                    r28 r28VarD6 = jfc.d(jfc.o(o28Var7, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j12 = p65Var23.T;
                    int i13 = (int) (j12 ^ (j12 >>> 32));
                    i89 i89VarL12 = p65Var23.l();
                    r28 r28VarR12 = gx1.R(p65Var23, r28VarD6);
                    p65Var23.c0();
                    if (p65Var23.S) {
                        p65Var23.k(ot2Var8);
                    } else {
                        p65Var23.m0();
                    }
                    tp7.B(p65Var23, cuVar13, zk7VarC8);
                    tp7.B(p65Var23, cuVar14, i89VarL12);
                    ka1.z(i13, p65Var23, cuVar15, p65Var23, fnVar4);
                    tp7.B(p65Var23, cuVar16, r28VarR12);
                    tp7.c(0.0f, 0, 6, 0L, p65Var23, w2g.G(o28Var7, 24.0f, 32.0f, 24.0f, 0.0f, 8));
                    p65Var23.p(true);
                    p65Var23.p(true);
                } else {
                    p65Var23.S();
                }
                return c1eVar;
            case 25:
                x12 x12Var25 = (x12) obj2;
                int iIntValue24 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var24 = (p65) x12Var25;
                if (p65Var24.P(iIntValue24 & 1, (iIntValue24 & 17) != 16)) {
                    jp7 jp7Var5 = (jp7) p65Var24.j(kt7.a);
                    o28 o28Var8 = o28.b;
                    r28 r28VarJ5 = ka1.j(jp7Var5, o28Var8, 3, 1.0f);
                    zk7 zk7VarC9 = dy0.c(z46.h, false);
                    long j13 = p65Var24.T;
                    int i14 = (int) (j13 ^ (j13 >>> 32));
                    i89 i89VarL13 = p65Var24.l();
                    r28 r28VarR13 = gx1.R(p65Var24, r28VarJ5);
                    r12.W.getClass();
                    ot2 ot2Var9 = q12.b;
                    p65Var24.c0();
                    if (p65Var24.S) {
                        p65Var24.k(ot2Var9);
                    } else {
                        p65Var24.m0();
                    }
                    cu cuVar17 = q12.f;
                    tp7.B(p65Var24, cuVar17, zk7VarC9);
                    cu cuVar18 = q12.e;
                    tp7.B(p65Var24, cuVar18, i89VarL13);
                    Integer numValueOf5 = Integer.valueOf(i14);
                    cu cuVar19 = q12.g;
                    tp7.B(p65Var24, cuVar19, numValueOf5);
                    fn fnVar5 = q12.h;
                    tp7.y(p65Var24, fnVar5);
                    cu cuVar20 = q12.d;
                    tp7.B(p65Var24, cuVar20, r28VarR13);
                    r28 r28VarD7 = jfc.d(jfc.o(o28Var8, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC10 = dy0.c(z46.d, false);
                    long j14 = p65Var24.T;
                    int i15 = (int) (j14 ^ (j14 >>> 32));
                    i89 i89VarL14 = p65Var24.l();
                    r28 r28VarR14 = gx1.R(p65Var24, r28VarD7);
                    p65Var24.c0();
                    if (p65Var24.S) {
                        p65Var24.k(ot2Var9);
                    } else {
                        p65Var24.m0();
                    }
                    tp7.B(p65Var24, cuVar17, zk7VarC10);
                    tp7.B(p65Var24, cuVar18, i89VarL14);
                    ka1.z(i15, p65Var24, cuVar19, p65Var24, fnVar5);
                    tp7.B(p65Var24, cuVar20, r28VarR14);
                    gq7.a(null, null, vo7.R(p65Var24, R.string.refine_recommendations_muted_empty_title_publication), vo7.R(p65Var24, R.string.refine_recommendations_muted_empty_content_publication), 0L, null, null, null, null, 0.0f, 0.0f, p65Var24, 0, 0, 2035);
                    p65Var24.p(true);
                    p65Var24.p(true);
                } else {
                    p65Var24.S();
                }
                return c1eVar;
            case 26:
                x12 x12Var26 = (x12) obj2;
                int iIntValue25 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var25 = (p65) x12Var26;
                if (p65Var25.P(iIntValue25 & 1, (iIntValue25 & 17) != 16)) {
                    hp7.t(p65Var25, jfc.l(o28Var, 20.0f));
                } else {
                    p65Var25.S();
                }
                return c1eVar;
            case 27:
                return a(obj, obj2, obj3);
            case 28:
                return d(obj, obj2, obj3);
            default:
                x12 x12Var27 = (x12) obj2;
                int iIntValue26 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var26 = (p65) x12Var27;
                if (p65Var26.P(iIntValue26 & 1, (iIntValue26 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var26, R.string.common_post_limited_state_alert_proceed), null, 0L, 0L, 0L, null, new jgd(6), 0L, 0, false, 0, 0, null, null, p65Var26, 0, 0, 261118);
                } else {
                    p65Var26.S();
                }
                return c1eVar;
        }
    }
}
