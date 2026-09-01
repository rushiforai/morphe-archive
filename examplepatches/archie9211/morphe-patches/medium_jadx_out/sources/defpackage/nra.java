package defpackage;

import android.content.Context;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.medium.reader.R;
import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nra implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ nra(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        b3e b3eVar = (b3e) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((pmb) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(b3eVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                ibd ibdVar = new ibd(0, b3eVar, b3e.class, "onSearchButtonPressed", "onSearchButtonPressed()V", 0, 17);
                p65Var.j0(ibdVar);
                objM = ibdVar;
            }
            f49.l((m45) ((qh6) objM), bgf.N(o28.b, "action_icon_button"), false, null, null, pxf.y, p65Var, 1572912, 60);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        oae oaeVar = (oae) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((gq4) obj).getClass();
        byte b = 0;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            for (String str : oaeVar.a) {
                Object objM = p65Var.M();
                if (objM == w12.a) {
                    objM = new tkc(14);
                    p65Var.j0(objM);
                }
                wl1.a((m45) objM, pxf.E(324334264, new pb(str, 7, b), p65Var), null, false, null, null, null, null, p65Var, 3126);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        nje njeVar = (nje) this.b;
        x12 x12Var = (x12) obj2;
        ((Integer) obj3).getClass();
        ((lw) obj).getClass();
        String strW = ((jje) njeVar).e;
        if (strW == null) {
            p65 p65Var = (p65) x12Var;
            strW = km4.w(p65Var, 2021705081, R.string.common_unknown_user, p65Var, false);
        } else {
            p65 p65Var2 = (p65) x12Var;
            p65Var2.Y(2021704399);
            p65Var2.p(false);
        }
        String str = strW;
        jjd.b(str, bgf.N(o28.b, "title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) ((p65) x12Var).j(jt7.c)).j, x12Var, 48, 0, 131068);
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean z;
        boolean z2;
        String strW;
        f09 f09Var;
        int i;
        int i2;
        int i3 = this.a;
        String strQ = "";
        uob uobVar = w12.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.b;
        switch (i3) {
            case 0:
                mra mraVar = (mra) obj4;
                r28 r28Var = (r28) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                r28Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(r28Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    jjd.c(pxf.x(mraVar.h, mraVar.i, 16, p65Var, mraVar.g, mraVar.j), w2g.G(r28Var, 0.0f, 4.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, new jgd(5), 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 0, 261116);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                vta vtaVar = (vta) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i4 = (int) (j ^ (j >>> 32));
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
                    Integer numValueOf = Integer.valueOf(i4);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i5 = (int) (j2 ^ (j2 >>> 32));
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
                    ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    op8.h(vtaVar, p65Var2, 0);
                    p65Var2.p(true);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                mdb mdbVar = (mdb) obj4;
                r28 r28Var2 = (r28) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                r28Var2.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(r28Var2) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
                    long j3 = p65Var3.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR3 = gx1.R(p65Var3, r28Var2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var3, cuVar5, wv1VarA);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var3, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i6);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var3, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var3, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var3, cuVar8, r28VarR3);
                    String strT = vo7.T((Context) p65Var3.j(eo.b), mdbVar.b);
                    sn3 sn3Var = jt7.c;
                    mkd mkdVar = ((bu7) p65Var3.j(sn3Var)).o;
                    sn3 sn3Var2 = kt7.b;
                    jjd.b(strT, w2g.G(r28Var2, 0.0f, 4.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, new jgd(5), 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var3.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 0, 130044);
                    if (mdbVar.i != null) {
                        p65Var3.Y(688836880);
                        hp7.t(p65Var3, jfc.l(o28Var, 16.0f));
                        r28 r28VarP = pwd.P(o28Var, a76.Min);
                        omb ombVarA = nmb.a(qb8.a, z46.m, p65Var3, 0);
                        long j4 = p65Var3.T;
                        int i7 = (int) (j4 ^ (j4 >>> 32));
                        i89 i89VarL4 = p65Var3.l();
                        r28 r28VarR4 = gx1.R(p65Var3, r28VarP);
                        p65Var3.c0();
                        if (p65Var3.S) {
                            p65Var3.k(ot2Var2);
                        } else {
                            p65Var3.m0();
                        }
                        tp7.B(p65Var3, cuVar5, ombVarA);
                        tp7.B(p65Var3, cuVar6, i89VarL4);
                        ka1.z(i7, p65Var3, cuVar7, p65Var3, fnVar2);
                        tp7.B(p65Var3, cuVar8, r28VarR4);
                        tp7.e(2.0f, 390, 0, ((zo7) p65Var3.j(sn3Var2)).z, p65Var3, jfc.c(o28Var, 1.0f));
                        hp7.t(p65Var3, jfc.l(o28Var, 16.0f));
                        jjd.c(mdbVar.i, null, 0L, 0L, 0L, new jgd(5), 0L, 2, false, 2, 0, null, null, mkd.a(((bu7) p65Var3.j(sn3Var)).n, ((zo7) p65Var3.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 0, 24960, 240638);
                        z2 = true;
                        p65Var3.p(true);
                        z = false;
                    } else {
                        z = false;
                        z2 = true;
                        p65Var3.Y(685192861);
                    }
                    p65Var3.p(z);
                    p65Var3.p(z2);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                pdb pdbVar = (pdb) obj4;
                r28 r28Var3 = (r28) obj;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                r28Var3.getClass();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p65) x12Var4).f(r28Var3) ? 4 : 2;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    p65Var4.S();
                } else if (pdbVar.g != null) {
                    r28 r28VarP2 = pwd.P(w2g.G(r28Var3, 0.0f, 16.0f, 0.0f, 0.0f, 13), a76.Min);
                    omb ombVarA2 = nmb.a(qb8.a, z46.m, p65Var4, 0);
                    long j5 = p65Var4.T;
                    int i8 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var4.l();
                    r28 r28VarR5 = gx1.R(p65Var4, r28VarP2);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, q12.f, ombVarA2);
                    tp7.B(p65Var4, q12.e, i89VarL5);
                    tp7.B(p65Var4, q12.g, Integer.valueOf(i8));
                    tp7.y(p65Var4, q12.h);
                    tp7.B(p65Var4, q12.d, r28VarR5);
                    sn3 sn3Var3 = kt7.b;
                    tp7.e(2.0f, 390, 0, ((zo7) p65Var4.j(sn3Var3)).z, p65Var4, jfc.c(o28Var, 1.0f));
                    hp7.t(p65Var4, jfc.l(o28Var, 16.0f));
                    jjd.c(pdbVar.g, null, 0L, 0L, 0L, new jgd(5), 0L, 2, false, 2, 0, null, null, mkd.a(((bu7) p65Var4.j(jt7.c)).n, ((zo7) p65Var4.j(sn3Var3)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var4, 0, 24960, 240638);
                    p65Var4.p(true);
                }
                return c1eVar;
            case 4:
                ((nyb) obj4).c();
                return c1eVar;
            case 5:
                bgc bgcVar = (bgc) obj4;
                bl7 bl7Var = (bl7) obj;
                t99 t99VarS = ((tk7) obj2).s(((f72) obj3).a);
                int iI0 = vj3.b(Float.NaN, Float.NaN) ? bgcVar.l == hw8.Vertical ? t99VarS.a / 2 : t99VarS.b / 2 : bl7Var.i0(Float.NaN);
                int i9 = t99VarS.a;
                int i10 = t99VarS.b;
                Map mapSingletonMap = Collections.singletonMap(agc.f, Integer.valueOf(iI0));
                mapSingletonMap.getClass();
                return bl7Var.q0(i9, i10, mapSingletonMap, new y0(t99VarS, 12));
            case 6:
                jxc jxcVar = (jxc) obj4;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var5, 0);
                    long j6 = p65Var5.T;
                    int i11 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var5.l();
                    r28 r28VarR6 = gx1.R(p65Var5, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var4);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, q12.f, wv1VarA2);
                    tp7.B(p65Var5, q12.e, i89VarL6);
                    tp7.B(p65Var5, q12.g, Integer.valueOf(i11));
                    tp7.y(p65Var5, q12.h);
                    tp7.B(p65Var5, q12.d, r28VarR6);
                    int i12 = jxcVar.b;
                    Long l = jxcVar.c;
                    Integer num = jxcVar.d;
                    String strD = vo7.D(R.plurals.subscribers_list_count, i12, new Object[]{dq1.g(Integer.valueOf(i12))}, p65Var5);
                    sn3 sn3Var4 = jt7.c;
                    jjd.b(strD, bgf.N(o28Var, "subscribers_list_count"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var5.j(sn3Var4)).h, p65Var5, 48, 0, 131068);
                    hp7.t(p65Var5, jfc.l(o28Var, 8.0f));
                    if (l != null) {
                        p65Var5.Y(981456561);
                        strW = vo7.Q(R.string.stats_from_to_utc_updated_daily, new Object[]{vo7.v(l.longValue(), p65Var5), vo7.R(p65Var5, R.string.common_today)}, p65Var5);
                        p65Var5.p(false);
                    } else {
                        strW = km4.w(p65Var5, 981823353, R.string.stats_updated_daily, p65Var5, false);
                    }
                    String str = strW;
                    mkd mkdVar2 = ((bu7) p65Var5.j(sn3Var4)).n;
                    sn3 sn3Var5 = kt7.b;
                    jjd.b(str, bgf.N(o28Var, "subscribers_list_from"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar2, ((zo7) p65Var5.j(sn3Var5)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 48, 0, 131068);
                    hp7.t(p65Var5, jfc.l(o28Var, 8.0f));
                    if (num != null) {
                        p65Var5.Y(982420940);
                        int iSignum = Integer.signum(num.intValue());
                        if (iSignum == -1) {
                            p65Var5.Y(31697709);
                            f09Var = new f09("", new uu1(((zo7) p65Var5.j(sn3Var5)).u));
                            p65Var5.p(false);
                        } else if (iSignum != 1) {
                            p65Var5.Y(31700687);
                            f09Var = new f09("", new uu1(((zo7) p65Var5.j(sn3Var5)).n));
                            p65Var5.p(false);
                        } else {
                            p65Var5.Y(31694735);
                            f09 f09Var2 = new f09("+", new uu1(((zo7) p65Var5.j(sn3Var5)).r));
                            p65Var5.p(false);
                            f09Var = f09Var2;
                        }
                        jjd.b(vo7.Q(R.string.subscribers_list_from_last_month, new Object[]{((String) f09Var.a) + num}, p65Var5), bgf.N(o28Var, "subscribers_list_previous_month"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var5.j(sn3Var4)).n, ((uu1) f09Var.b).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 48, 0, 131068);
                    } else {
                        p65Var5.Y(971459557);
                    }
                    p65Var5.p(false);
                    if (num != null) {
                        km4.F(32.0f, 983447753, p65Var5, p65Var5, o28Var);
                    } else {
                        p65Var5.Y(971459557);
                    }
                    p65Var5.p(false);
                    p65Var5.p(true);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 7:
                lyc lycVar = (lyc) obj4;
                xv1 xv1Var = (xv1) obj;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                xv1Var.getClass();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((p65) x12Var6).f(xv1Var) ? 4 : 2;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 19) != 18)) {
                    jjd.b(vo7.R(p65Var6, R.string.subscription_error_description), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(jt7.c)).m, p65Var6, 0, 0, 131070);
                    y30.y(o28Var, 1.0f, 24.0f, p65Var6);
                    xn7 xn7Var = xn7.L;
                    r28 r28VarI0 = nk7.i0(xv1.a(z46.q, o28Var), p65Var6);
                    String strR = vo7.R(p65Var6, R.string.common_try_again);
                    boolean zF = p65Var6.f(lycVar);
                    Object objM = p65Var6.M();
                    if (zF || objM == uobVar) {
                        objM = new joc(0, lycVar, lyc.class, "refresh", "refresh()V", 0, 16);
                        p65Var6.j0(objM);
                    }
                    fo7.i((m45) ((qh6) objM), strR, xn7Var, r28VarI0, false, p65Var6, 384, 16);
                    y30.y(o28Var, 1.0f, 12.0f, p65Var6);
                    String strR2 = vo7.R(p65Var6, R.string.common_get_help);
                    boolean zF2 = p65Var6.f(lycVar);
                    Object objM2 = p65Var6.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new ayc(lycVar, 4);
                        p65Var6.j0(objM2);
                    }
                    fo7.j((m45) objM2, strR2, xn7Var, r28VarI0, false, null, p65Var6, 384, 48);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 8:
                r28 r28Var4 = (r28) obj4;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 17) != 16)) {
                    o28 o28Var3 = o28.b;
                    r28 r28VarV = m40.V(jfc.d(o28Var3, 1.0f), p65Var7, 6);
                    wv1 wv1VarA3 = uv1.a(qb8.c, z46.p, p65Var7, 0);
                    long j7 = p65Var7.T;
                    int i13 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var7.l();
                    r28 r28VarR7 = gx1.R(p65Var7, r28VarV);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var5);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, q12.f, wv1VarA3);
                    tp7.B(p65Var7, q12.e, i89VarL7);
                    tp7.B(p65Var7, q12.g, Integer.valueOf(i13));
                    tp7.y(p65Var7, q12.h);
                    tp7.B(p65Var7, q12.d, r28VarR7);
                    mkd mkdVar3 = ((bu7) p65Var7.j(jt7.c)).h;
                    r28 r28VarD2 = jfc.d(w2g.G(r28Var4, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f);
                    sn3 sn3Var6 = kt7.b;
                    jjd.b(" ", flb.a0(r28VarD2, ((zo7) p65Var7.j(sn3Var6)).c, rv8.r), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar3, p65Var7, 6, 0, 131068);
                    tp7.c(0.0f, 6, 4, ((zo7) p65Var7.j(sn3Var6)).x, p65Var7, jfc.d(w2g.G(o28Var3, 0.0f, 24.0f, 0.0f, 0.0f, 13), 1.0f));
                    p65Var7.p(true);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 9:
                ip7 ip7Var = (ip7) obj4;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 17) != 16)) {
                    r28 r28VarV2 = m40.V(jfc.d(o28Var, 1.0f), p65Var8, 6);
                    wv1 wv1VarA4 = uv1.a(qb8.e, z46.p, p65Var8, 6);
                    long j8 = p65Var8.T;
                    int i14 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var8.l();
                    r28 r28VarR8 = gx1.R(p65Var8, r28VarV2);
                    r12.W.getClass();
                    ot2 ot2Var6 = q12.b;
                    p65Var8.c0();
                    if (p65Var8.S) {
                        p65Var8.k(ot2Var6);
                    } else {
                        p65Var8.m0();
                    }
                    tp7.B(p65Var8, q12.f, wv1VarA4);
                    tp7.B(p65Var8, q12.e, i89VarL8);
                    tp7.B(p65Var8, q12.g, Integer.valueOf(i14));
                    tp7.y(p65Var8, q12.h);
                    tp7.B(p65Var8, q12.d, r28VarR8);
                    y30.y(o28Var, 1.0f, 40.0f, p65Var8);
                    dy0.a(flb.a0(jfc.m(w2g.E(o28Var, 24.0f, 0.0f, 2), 200.0f, 24.0f), guc.T(p65Var8), rv8.r), p65Var8, 0);
                    y30.y(o28Var, 1.0f, 8.0f, p65Var8);
                    if (ip7Var == ip7.COMPACT) {
                        p65Var8.Y(-1972754583);
                        for (int i15 = 0; i15 < 8; i15++) {
                            nk7.r(null, guc.T(p65Var8), false, p65Var8, 0, 5);
                        }
                        p65Var8.p(false);
                    } else {
                        p65Var8.Y(-1972610619);
                        for (int iR = 0; iR < 4; iR = wgd.r(p65Var8, false, true, iR, 1)) {
                            r28 r28VarD3 = jfc.d(o28Var, 1.0f);
                            omb ombVarA3 = nmb.a(qb8.a, z46.m, p65Var8, 0);
                            long j9 = p65Var8.T;
                            int i16 = (int) (j9 ^ (j9 >>> 32));
                            i89 i89VarL9 = p65Var8.l();
                            r28 r28VarR9 = gx1.R(p65Var8, r28VarD3);
                            r12.W.getClass();
                            ot2 ot2Var7 = q12.b;
                            p65Var8.c0();
                            if (p65Var8.S) {
                                p65Var8.k(ot2Var7);
                            } else {
                                p65Var8.m0();
                            }
                            tp7.B(p65Var8, q12.f, ombVarA3);
                            tp7.B(p65Var8, q12.e, i89VarL9);
                            tp7.B(p65Var8, q12.g, Integer.valueOf(i16));
                            tp7.y(p65Var8, q12.h);
                            tp7.B(p65Var8, q12.d, r28VarR9);
                            p65Var8.Y(-831735186);
                            for (int i17 = 0; i17 < 2; i17++) {
                                nk7.r(new sq6(1.0f, true), guc.T(p65Var8), false, p65Var8, 0, 4);
                            }
                        }
                        p65Var8.p(false);
                    }
                    p65Var8.p(true);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 10:
                xx7 xx7Var = (xx7) obj4;
                ((Integer) obj3).getClass();
                p65 p65Var9 = (p65) ((x12) obj2);
                p65Var9.Y(-102778667);
                Object objM3 = p65Var9.M();
                Object obj5 = objM3;
                if (objM3 == uobVar) {
                    sb2 sb2VarM = kyd.M(p65Var9);
                    p65Var9.j0(sb2VarM);
                    obj5 = sb2VarM;
                }
                sb2 sb2Var = (sb2) obj5;
                Object objM4 = p65Var9.M();
                Object obj6 = objM4;
                if (objM4 == uobVar) {
                    k49 k49VarU = qo7.u(null);
                    p65Var9.j0(k49VarU);
                    obj6 = k49VarU;
                }
                l78 l78Var = (l78) obj6;
                l78 l78VarY = qo7.y(xx7Var, p65Var9);
                boolean zF3 = p65Var9.f(null);
                Object objM5 = p65Var9.M();
                Object obj7 = objM5;
                if (zF3 || objM5 == uobVar) {
                    ws wsVar = new ws(l78Var, 27);
                    p65Var9.j0(wsVar);
                    obj7 = wsVar;
                }
                kyd.h(null, (x45) obj7, p65Var9);
                boolean zH = p65Var9.h(sb2Var) | p65Var9.f(null) | p65Var9.f(l78VarY);
                Object objM6 = p65Var9.M();
                Object obj8 = objM6;
                if (zH || objM6 == uobVar) {
                    aid aidVar = new aid(sb2Var, l78Var, l78VarY);
                    p65Var9.j0(aidVar);
                    obj8 = aidVar;
                }
                q4d q4dVar = new q4d(null, null, (PointerInputEventHandler) obj8, 6);
                p65Var9.p(false);
                return q4dVar;
            case 11:
                lid lidVar = (lid) obj4;
                r28 r28Var5 = (r28) obj;
                ((Integer) obj3).getClass();
                p65 p65Var10 = (p65) ((x12) obj2);
                p65Var10.Y(1980580247);
                m73 m73Var = (m73) p65Var10.j(z22.h);
                Object objM7 = p65Var10.M();
                Object obj9 = objM7;
                if (objM7 == uobVar) {
                    k49 k49VarU2 = qo7.u(new s46(0L));
                    p65Var10.j0(k49VarU2);
                    obj9 = k49VarU2;
                }
                l78 l78Var2 = (l78) obj9;
                boolean zH2 = p65Var10.h(lidVar);
                Object objM8 = p65Var10.M();
                Object obj10 = objM8;
                if (zH2 || objM8 == uobVar) {
                    nbb nbbVar = new nbb(lidVar, 19, l78Var2);
                    p65Var10.j0(nbbVar);
                    obj10 = nbbVar;
                }
                m45 m45Var = (m45) obj10;
                boolean zF4 = p65Var10.f(m73Var);
                Object objM9 = p65Var10.M();
                Object obj11 = objM9;
                if (zF4 || objM9 == uobVar) {
                    oid oidVar = new oid(m73Var, l78Var2, false ? 1 : 0);
                    p65Var10.j0(oidVar);
                    obj11 = oidVar;
                }
                ax axVar = jxb.a;
                r28 r28VarE = gx1.E(r28Var5, new qg9(m45Var, 20, (x45) obj11));
                p65Var10.p(false);
                return r28VarE;
            case 12:
                x12 x12Var9 = (x12) obj2;
                ((Integer) obj3).getClass();
                ((lw) obj).getClass();
                wpd wpdVar = ((zpd) obj4).d;
                if (wpdVar instanceof upd) {
                    p65 p65Var11 = (p65) x12Var9;
                    p65Var11.Y(-507189448);
                    int i18 = ((upd) wpdVar).a;
                    strQ = vo7.D(R.plurals.onboarding_topics_add_more, i18, new Object[]{Integer.valueOf(i18)}, p65Var11);
                    p65Var11.p(false);
                } else if (wpdVar instanceof vpd) {
                    p65 p65Var12 = (p65) x12Var9;
                    p65Var12.Y(-507181028);
                    strQ = vo7.Q(R.string.onboarding_topics_pro_tip, new Object[]{6}, p65Var12);
                    p65Var12.p(false);
                } else {
                    if (wpdVar != null) {
                        throw ho2.L((p65) x12Var9, -507192727, false);
                    }
                    p65 p65Var13 = (p65) x12Var9;
                    p65Var13.Y(1457422639);
                    p65Var13.p(false);
                }
                String str2 = strQ;
                p65 p65Var14 = (p65) x12Var9;
                Object objM10 = p65Var14.M();
                if (objM10 == uobVar) {
                    objM10 = new tjd(4);
                    p65Var14.j0(objM10);
                }
                ht2.l(str2, null, (x45) objM10, null, null, null, p65Var14, 1573248);
                return c1eVar;
            case 13:
                return a(obj, obj2, obj3);
            case 14:
                return d(obj, obj2, obj3);
            case 15:
                return g(obj, obj2, obj3);
            default:
                vaf vafVar = (vaf) obj4;
                x12 x12Var10 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var15 = (p65) x12Var10;
                if (p65Var15.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    jp7 jp7Var2 = (jp7) p65Var15.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var4, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j10 = p65Var15.T;
                    int i19 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL10 = p65Var15.l();
                    r28 r28VarR10 = gx1.R(p65Var15, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var15.c0();
                    if (p65Var15.S) {
                        p65Var15.k(ot2Var8);
                    } else {
                        p65Var15.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var15, cuVar9, zk7VarC3);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var15, cuVar10, i89VarL10);
                    Integer numValueOf3 = Integer.valueOf(i19);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var15, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var15, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var15, cuVar12, r28VarR10);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j11 = p65Var15.T;
                    int i20 = (int) (j11 ^ (j11 >>> 32));
                    i89 i89VarL11 = p65Var15.l();
                    r28 r28VarR11 = gx1.R(p65Var15, r28VarD4);
                    p65Var15.c0();
                    if (p65Var15.S) {
                        p65Var15.k(ot2Var8);
                    } else {
                        p65Var15.m0();
                    }
                    tp7.B(p65Var15, cuVar9, zk7VarC4);
                    tp7.B(p65Var15, cuVar10, i89VarL11);
                    ka1.z(i20, p65Var15, cuVar11, p65Var15, fnVar3);
                    tp7.B(p65Var15, cuVar12, r28VarR11);
                    int i21 = haf.a[vafVar.a.ordinal()];
                    if (i21 == 1) {
                        i = -1794742380;
                        i2 = R.string.you_posts_no_public_posts;
                    } else if (i21 == 2) {
                        i = -1794739338;
                        i2 = R.string.you_posts_no_unlisted_posts;
                    } else if (i21 == 3) {
                        i = -1794736333;
                        i2 = R.string.you_posts_no_draft_posts;
                    } else {
                        if (i21 != 4) {
                            throw ho2.L(p65Var15, -1794744483, false);
                        }
                        i = -1794733229;
                        i2 = R.string.you_posts_no_submissions;
                    }
                    gq7.a(null, null, km4.w(p65Var15, i, i2, p65Var15, false), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var15, 0, 0, 2043);
                    p65Var15.p(true);
                    p65Var15.p(true);
                } else {
                    p65Var15.S();
                }
                return c1eVar;
        }
    }
}
