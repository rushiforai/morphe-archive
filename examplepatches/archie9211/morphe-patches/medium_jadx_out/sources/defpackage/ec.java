package defpackage;

import android.os.Build;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ec implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ec(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        o28 o28Var;
        yq0 yq0Var;
        float f;
        ls0 ls0Var = (ls0) this.b;
        ms0 ms0Var = (ms0) this.c;
        xv1 xv1Var = (xv1) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        xv1Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(xv1Var) ? 4 : 2;
        }
        int i = 1;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            String strR = vo7.R(p65Var, R.string.block_reposter_confirmation_title);
            o28 o28Var2 = o28.b;
            r28 r28VarG = w2g.G(o28Var2, 40.0f, 0.0f, 40.0f, 0.0f, 10);
            yq0 yq0Var2 = z46.q;
            r28 r28VarN = bgf.N(xv1.a(yq0Var2, r28VarG), "title");
            jgd jgdVar = new jgd(3);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, r28VarN, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).i, p65Var, 0, 0, 130044);
            kx kxVarW = ho2.w(p65Var, 28389392);
            kxVarW.d(vo7.R(p65Var, R.string.block_reposter_confirmation_description));
            kxVarW.d("\n\n");
            p65Var.Y(28394338);
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            boolean zF = p65Var.f(ls0Var) | p65Var.f(ms0Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new bf0(ls0Var, i, ms0Var);
                p65Var.j0(objM);
            }
            int iV = ho2.v("learn_more_blocking", wjdVar, (e07) objM, kxVarW);
            try {
                kxVarW.d(vo7.R(p65Var, R.string.block_reposter_confirmation_learn_more));
                kxVarW.f(iV);
                p65Var.p(false);
                mx mxVarI = kxVarW.i();
                p65Var.p(false);
                jjd.c(mxVarI, bgf.N(xv1.a(yq0Var2, w2g.G(o28Var2, 40.0f, 8.0f, 40.0f, 0.0f, 8)), "description"), 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 261116);
                hp7.t(p65Var, jfc.l(o28Var2, 21.0f));
                boolean zF2 = p65Var.f(ls0Var) | p65Var.f(ms0Var);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    objM2 = new n(ls0Var, 20, ms0Var);
                    p65Var.j0(objM2);
                }
                String strR2 = vo7.R(p65Var, R.string.block_reposter_confirmation_block);
                xn7 xn7Var = xn7.L;
                fo7.l((m45) objM2, strR2, xn7Var, bgf.N(xv1.a(yq0Var2, jfc.d(w2g.G(o28Var2, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f)), "primary_action"), false, p65Var, 384, 16);
                hp7.t(p65Var, jfc.l(o28Var2, 6.0f));
                boolean zF3 = p65Var.f(ls0Var);
                Object objM3 = p65Var.M();
                if (zF3 || objM3 == uobVar) {
                    o28Var = o28Var2;
                    yq0Var = yq0Var2;
                    f = 1.0f;
                    sc0 sc0Var = new sc0(0, ls0Var, js0.class, "onDismissed", "onDismissed()V", 0, 4);
                    p65Var.j0(sc0Var);
                    objM3 = sc0Var;
                } else {
                    o28Var = o28Var2;
                    yq0Var = yq0Var2;
                    f = 1.0f;
                }
                fo7.j((m45) ((qh6) objM3), vo7.R(p65Var, R.string.common_cancel), xn7Var, bgf.N(xv1.a(yq0Var, jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), f)), "secondary_action"), false, null, p65Var, 384, 48);
                hp7.t(p65Var, jfc.l(o28Var, 21.0f));
            } catch (Throwable th) {
                kxVarW.f(iV);
                throw th;
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        gc1 gc1Var = (gc1) this.b;
        jt4 jt4Var = (jt4) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            y91.a(gc1Var, jt4Var, null, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        ga1 ga1Var = (ga1) this.b;
        y81 y81Var = (y81) this.c;
        pmb pmbVar = (pmb) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        pmbVar.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(pmbVar) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            t40.a(pmbVar, ga1Var, y81Var, p65Var, iIntValue & 14);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        String strR;
        boolean z;
        long j;
        p65 p65Var;
        boolean z2;
        Integer num = (Integer) this.b;
        l78 l78Var = (l78) this.c;
        b55 b55Var = (b55) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ar0 ar0Var = z46.h;
        b55Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).h(b55Var) ? 4 : 2;
        }
        p65 p65Var2 = (p65) x12Var;
        if (p65Var2.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.q(o28Var, 0.0f, 320.0f, 1), 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j3 = p65Var2.T;
            int i2 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i2, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD3 = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.f, z46.m, p65Var2, 6);
            long j4 = p65Var2.T;
            int i3 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD3);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            int length = ((uid) l78Var.getValue()).a.b.length();
            p65Var2.Y(-840344366);
            int i4 = 0;
            while (true) {
                strR = null;
                chValueOf = null;
                Character chValueOf = null;
                if (i4 >= 6) {
                    break;
                }
                String str = ((uid) l78Var.getValue()).a.b;
                str.getClass();
                if (i4 >= 0 && i4 < str.length()) {
                    chValueOf = Character.valueOf(str.charAt(i4));
                }
                sn3 sn3Var = kt7.b;
                r28 r28VarE = jfc.e(jfc.p(flb.a0(o28Var, ((zo7) p65Var2.j(sn3Var)).b, rv8.r), 40.0f), 54.0f);
                if (num != null) {
                    p65Var2.Y(711363956);
                    j = ((zo7) p65Var2.j(sn3Var)).D;
                    z = false;
                    p65Var2.p(false);
                } else {
                    z = false;
                    if (i4 == length) {
                        p65Var2.Y(711367320);
                        j = ((zo7) p65Var2.j(sn3Var)).y;
                        p65Var2.p(false);
                    } else {
                        p65Var2.Y(711370359);
                        j = ((zo7) p65Var2.j(sn3Var)).z;
                        p65Var2.p(false);
                    }
                }
                r28 r28VarB = bo.B(r28VarE, 1.0f, j, bmb.a(4.0f));
                zk7 zk7VarC2 = dy0.c(ar0Var, z);
                long j5 = p65Var2.T;
                int i5 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL4 = p65Var2.l();
                r28 r28VarR4 = gx1.R(p65Var2, r28VarB);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var2);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, q12.f, zk7VarC2);
                tp7.B(p65Var2, q12.e, i89VarL4);
                tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
                tp7.y(p65Var2, q12.h);
                tp7.B(p65Var2, q12.d, r28VarR4);
                if (chValueOf != null) {
                    p65Var2.Y(-1199968810);
                    p65 p65Var3 = p65Var2;
                    jjd.b(String.valueOf(chValueOf.charValue()), bgf.N(o28Var, "code_text_" + i4), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).i, p65Var3, 0, 0, 130044);
                    p65Var = p65Var3;
                    z2 = false;
                } else {
                    p65Var = p65Var2;
                    z2 = false;
                    p65Var.Y(-1204289466);
                }
                p65Var.p(z2);
                p65Var.p(true);
                i4++;
                p65Var2 = p65Var;
            }
            p65 p65Var4 = p65Var2;
            p65Var4.p(false);
            p65Var4.p(true);
            b55Var.invoke(p65Var4, Integer.valueOf(iIntValue & 14));
            p65Var4.p(true);
            if (num == null) {
                p65Var4.Y(-1548717289);
            } else {
                p65Var4.Y(-1548717288);
                strR = vo7.R(p65Var4, num.intValue());
            }
            p65Var4.p(false);
            if (strR == null) {
                strR = "";
            }
            jjd.b(strR, bgf.N(w2g.i(w2g.G(jfc.d(o28Var, 1.0f), 0.0f, 8.0f, 0.0f, 0.0f, 13), num != null ? 1.0f : 0.0f), "code_error"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var4.j(jt7.c)).m, ((zo7) p65Var4.j(kt7.b)).u, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var4, 0, 0, 131068);
            p65Var4.p(true);
        } else {
            p65Var2.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        x45 x45Var = (x45) this.b;
        f92 f92Var = (f92) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new g92();
                p65Var.j0(objM);
            }
            g92 g92Var = (g92) objM;
            g92Var.a.clear();
            x45Var.invoke(g92Var);
            g92Var.a(f92Var, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        u43 u43Var = (u43) this.b;
        h53 h53Var = (h53) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, 21.0f));
            boolean zF = p65Var.f(u43Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                gu1 gu1Var = new gu1(0, u43Var, u43.class, "delete", "delete()V", 0, 9);
                p65Var.j0(gu1Var);
                objM = gu1Var;
            }
            fo7.l((m45) ((qh6) objM), vo7.R(p65Var, R.string.common_delete), xn7.L, bgf.N(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "delete_button"), h53Var.b, p65Var, 3456, 0);
            hp7.t(p65Var, jfc.l(o28Var, 21.0f));
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        float f;
        u53 u53Var = (u53) this.b;
        v53 v53Var = (v53) this.c;
        xv1 xv1Var = (xv1) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        xv1Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(xv1Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            String strR = vo7.R(p65Var, R.string.delete_repost_confirmation_title);
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 40.0f, 0.0f, 40.0f, 0.0f, 10);
            yq0 yq0Var = z46.q;
            r28 r28VarN = bgf.N(xv1.a(yq0Var, r28VarG), "title");
            jgd jgdVar = new jgd(3);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, r28VarN, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).i, p65Var, 0, 0, 130044);
            jjd.b(vo7.R(p65Var, R.string.delete_repost_confirmation_description), bgf.N(xv1.a(yq0Var, w2g.G(o28Var, 40.0f, 8.0f, 40.0f, 0.0f, 8)), "description"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 130044);
            hp7.t(p65Var, jfc.l(o28Var, 21.0f));
            boolean zF = p65Var.f(u53Var) | p65Var.f(v53Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new gf2(u53Var, 26, v53Var);
                p65Var.j0(objM);
            }
            String strR2 = vo7.R(p65Var, R.string.common_delete);
            xn7 xn7Var = xn7.L;
            fo7.l((m45) objM, strR2, xn7Var, bgf.N(xv1.a(yq0Var, jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f)), "primary_action"), false, p65Var, 384, 16);
            hp7.t(p65Var, jfc.l(o28Var, 6.0f));
            boolean zF2 = p65Var.f(u53Var);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                f = 1.0f;
                gu1 gu1Var = new gu1(0, u53Var, t53.class, "onDismissed", "onDismissed()V", 0, 11);
                p65Var.j0(gu1Var);
                objM2 = gu1Var;
            } else {
                f = 1.0f;
            }
            fo7.j((m45) ((qh6) objM2), vo7.R(p65Var, R.string.common_cancel), xn7Var, bgf.N(xv1.a(yq0Var, jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), f)), "secondary_action"), false, null, p65Var, 384, 48);
            hp7.t(p65Var, jfc.l(o28Var, 21.0f));
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        uc3 uc3Var = (uc3) this.b;
        nc3 nc3Var = (nc3) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            p65Var.S();
        } else if (uc3Var instanceof rc3) {
            p65Var.Y(-1630996628);
            rx0.j((rc3) uc3Var, nc3Var, null, p65Var, 0);
            p65Var.p(false);
        } else if (uc3Var instanceof sc3) {
            p65Var.Y(-1630989417);
            rx0.k((sc3) uc3Var, null, p65Var, 0);
            p65Var.p(false);
        } else {
            if (!g76.L(uc3Var, tc3.a)) {
                throw ho2.L(p65Var, -1630998929, false);
            }
            p65Var.Y(-1630984931);
            rx0.l(null, p65Var, 0);
            p65Var.p(false);
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3) {
        qc3 qc3Var = (qc3) this.b;
        nc3 nc3Var = (nc3) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(nc3Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                k0 k0Var = new k0(1, nc3Var, nc3.class, "onDigestSelected", "onDigestSelected(Ljava/lang/String;)V", 0, 11);
                p65Var.j0(k0Var);
                objM = k0Var;
            }
            k50.t(qc3Var, (x45) ((qh6) objM), null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        sf3 sf3Var = (sf3) this.b;
        nf3 nf3Var = (nf3) this.c;
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
            if (sf3Var instanceof rf3) {
                p65Var.Y(1402510067);
                xz5.i(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (sf3Var instanceof pf3) {
                p65Var.Y(1402513604);
                xz5.g((pf3) sf3Var, nf3Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(sf3Var instanceof qf3)) {
                    throw ho2.L(p65Var, 1402508001, false);
                }
                p65Var.Y(1402520546);
                xz5.h((qf3) sf3Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        ah3 ah3Var = (ah3) this.b;
        upc upcVar = (upc) this.c;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            rv8.j((lh3) upcVar.getValue(), ah3Var, p65Var, 0);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            rv8.i((lh3) upcVar.getValue(), ah3Var, p65Var, 0);
            if (Build.VERSION.SDK_INT >= 29) {
                p65Var.Y(846599182);
                tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                rv8.b((lh3) upcVar.getValue(), ah3Var, p65Var, 0);
            } else {
                p65Var.Y(844028817);
            }
            p65Var.p(false);
            Boolean bool = ((lh3) upcVar.getValue()).f;
            if (bool != null) {
                p65Var.Y(846898332);
                tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                rv8.k(bool.booleanValue(), ah3Var, null, p65Var, 0);
            } else {
                p65Var.Y(844028817);
            }
            p65Var.p(false);
            hp7.t(p65Var, jfc.l(o28.b, 24.0f));
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        oj3 oj3Var = (oj3) this.b;
        upc upcVar = (upc) this.c;
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
            gsa.l((sj3) upcVar.getValue(), oj3Var, null, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean z;
        int i = this.a;
        uob uobVar = w12.a;
        int i2 = 16;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.c;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                lc lcVar = (lc) obj5;
                gc gcVar = (gc) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    o28 o28Var2 = o28.b;
                    r28 r28VarB = w2g.B(o28Var2, hy8Var);
                    rh4 rh4Var = jfc.c;
                    r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), wgf.R(r28VarB.b(rh4Var), wgf.K(p65Var), false, 14), 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
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
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
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
                    ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    k50.d(lcVar, gcVar, rh4Var, p65Var, 384);
                    p65Var.p(true);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                oe1 oe1Var = (oe1) obj5;
                az5 az5Var = (az5) obj4;
                jy0 jy0Var = (jy0) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                jy0Var.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(jy0Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    long j3 = jy0Var.b;
                    if (f72.d(j3) && f72.c(j3)) {
                        rh4 rh4Var2 = jfc.c;
                        omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
                        long j4 = p65Var2.T;
                        int i5 = (int) (j4 ^ (j4 >>> 32));
                        i89 i89VarL3 = p65Var2.l();
                        r28 r28VarR3 = gx1.R(p65Var2, rh4Var2);
                        r12.W.getClass();
                        ot2 ot2Var2 = q12.b;
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var2);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, q12.f, ombVarA);
                        tp7.B(p65Var2, q12.e, i89VarL3);
                        tp7.B(p65Var2, q12.g, Integer.valueOf(i5));
                        tp7.y(p65Var2, q12.h);
                        tp7.B(p65Var2, q12.d, r28VarR3);
                        g01.o(j3, oe1Var, az5Var, 0, p65Var2, 3072);
                        g01.o(j3, oe1Var, az5Var, 1, p65Var2, 3072);
                        g01.o(j3, oe1Var, az5Var, 2, p65Var2, 3072);
                        p65Var2.p(true);
                    }
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                fu3 fu3Var = (fu3) obj5;
                nt3 nt3Var = (nt3) obj4;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    p65Var3.S();
                    return c1eVar;
                }
                o28 o28Var3 = o28.b;
                r28 r28VarX2 = ho2.x((jp7) p65Var3.j(kt7.a), w2g.B(o28Var3, hy8Var2), 3, 1.0f);
                ar0 ar0Var = z46.h;
                zk7 zk7VarC3 = dy0.c(ar0Var, false);
                long j5 = p65Var3.T;
                int i6 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL4 = p65Var3.l();
                r28 r28VarR4 = gx1.R(p65Var3, r28VarX2);
                r12.W.getClass();
                ot2 ot2Var3 = q12.b;
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var3);
                } else {
                    p65Var3.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var3, cuVar5, zk7VarC3);
                cu cuVar6 = q12.e;
                tp7.B(p65Var3, cuVar6, i89VarL4);
                Integer numValueOf2 = Integer.valueOf(i6);
                cu cuVar7 = q12.g;
                tp7.B(p65Var3, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var3, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var3, cuVar8, r28VarR4);
                r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                ar0 ar0Var2 = z46.d;
                zk7 zk7VarC4 = dy0.c(ar0Var2, false);
                long j6 = p65Var3.T;
                int i7 = (int) (j6 ^ (j6 >>> 32));
                i89 i89VarL5 = p65Var3.l();
                r28 r28VarR5 = gx1.R(p65Var3, r28VarD2);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var3);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar5, zk7VarC4);
                tp7.B(p65Var3, cuVar6, i89VarL5);
                ka1.z(i7, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR5);
                boolean z2 = fu3Var instanceof cu3;
                iy0 iy0Var = iy0.a;
                if (z2) {
                    p65Var3.Y(-522038324);
                    rh4 rh4Var3 = jfc.c;
                    zk7 zk7VarC5 = dy0.c(ar0Var2, false);
                    long j7 = p65Var3.T;
                    int i8 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL6 = p65Var3.l();
                    r28 r28VarR6 = gx1.R(p65Var3, rh4Var3);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar5, zk7VarC5);
                    tp7.B(p65Var3, cuVar6, i89VarL6);
                    ka1.z(i8, p65Var3, cuVar7, p65Var3, fnVar2);
                    tp7.B(p65Var3, cuVar8, r28VarR6);
                    iq7.b(iy0Var.a(o28Var3, ar0Var), null, null, null, null, null, null, p65Var3, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                    p65Var3.p(true);
                    p65Var3.p(false);
                    z = true;
                } else if (fu3Var instanceof du3) {
                    p65Var3.Y(-522032107);
                    rh4 rh4Var4 = jfc.c;
                    zk7 zk7VarC6 = dy0.c(ar0Var2, false);
                    long j8 = p65Var3.T;
                    int i9 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL7 = p65Var3.l();
                    r28 r28VarR7 = gx1.R(p65Var3, rh4Var4);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar5, zk7VarC6);
                    tp7.B(p65Var3, cuVar6, i89VarL7);
                    ka1.z(i9, p65Var3, cuVar7, p65Var3, fnVar2);
                    tp7.B(p65Var3, cuVar8, r28VarR7);
                    xz5.o(iy0Var.a(o28Var3, ar0Var), null, 0.0f, 0L, 0L, 0, p65Var3, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                    z = true;
                    p65Var3.p(true);
                    p65Var3.p(false);
                } else {
                    z = true;
                    if (!(fu3Var instanceof eu3)) {
                        throw ho2.L(p65Var3, -522040519, false);
                    }
                    p65Var3.Y(-522024944);
                    vx0.v((eu3) fu3Var, nt3Var, null, p65Var3, 0);
                    p65Var3.p(false);
                }
                p65Var3.p(z);
                p65Var3.p(z);
                return c1eVar;
            case 3:
                v64 v64Var = (v64) obj5;
                l64 l64Var = (l64) obj4;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var4, 3, 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j9 = p65Var4.T;
                    int i10 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL8 = p65Var4.l();
                    r28 r28VarR8 = gx1.R(p65Var4, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var4, cuVar9, zk7VarC7);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var4, cuVar10, i89VarL8);
                    Integer numValueOf3 = Integer.valueOf(i10);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var4, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var4, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var4, cuVar12, r28VarR8);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j10 = p65Var4.T;
                    int i11 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL9 = p65Var4.l();
                    r28 r28VarR9 = gx1.R(p65Var4, r28VarD3);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar9, zk7VarC8);
                    tp7.B(p65Var4, cuVar10, i89VarL9);
                    ka1.z(i11, p65Var4, cuVar11, p65Var4, fnVar3);
                    tp7.B(p65Var4, cuVar12, r28VarR9);
                    b24 b24Var = v64Var.a;
                    rh4 rh4Var5 = jfc.c;
                    boolean zH = p65Var4.h(l64Var);
                    Object objM = p65Var4.M();
                    if (zH || objM == uobVar) {
                        objM = new hq3(0, l64Var, l64.class, "onRefresh", "onRefresh()V", 0, 17);
                        p65Var4.j0(objM);
                    }
                    iq7.a(b24Var, rh4Var5, null, null, null, null, (m45) ((qh6) objM), null, p65Var4, 48, 188);
                    p65Var4.p(true);
                    p65Var4.p(true);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                tm4 tm4Var = (tm4) obj5;
                lm4 lm4Var = (lm4) obj4;
                hy8 hy8Var3 = (hy8) obj;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                hy8Var3.getClass();
                if ((iIntValue5 & 6) == 0) {
                    iIntValue5 |= ((p65) x12Var5).f(hy8Var3) ? 4 : 2;
                }
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 19) != 18)) {
                    o28 o28Var5 = o28.b;
                    r28 r28VarB2 = w2g.B(o28Var5, hy8Var3);
                    rh4 rh4Var6 = jfc.c;
                    r28 r28VarX3 = ho2.x((jp7) p65Var5.j(kt7.a), wgf.R(r28VarB2.b(rh4Var6), wgf.K(p65Var5), false, 14), 3, 1.0f);
                    zk7 zk7VarC9 = dy0.c(z46.h, false);
                    long j11 = p65Var5.T;
                    int i12 = (int) (j11 ^ (j11 >>> 32));
                    i89 i89VarL10 = p65Var5.l();
                    r28 r28VarR10 = gx1.R(p65Var5, r28VarX3);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var5);
                    } else {
                        p65Var5.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var5, cuVar13, zk7VarC9);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var5, cuVar14, i89VarL10);
                    Integer numValueOf4 = Integer.valueOf(i12);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var5, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var5, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var5, cuVar16, r28VarR10);
                    r28 r28VarD4 = jfc.d(jfc.o(o28Var5, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC10 = dy0.c(z46.d, false);
                    long j12 = p65Var5.T;
                    int i13 = (int) (j12 ^ (j12 >>> 32));
                    i89 i89VarL11 = p65Var5.l();
                    r28 r28VarR11 = gx1.R(p65Var5, r28VarD4);
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var5);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, cuVar13, zk7VarC10);
                    tp7.B(p65Var5, cuVar14, i89VarL11);
                    ka1.z(i13, p65Var5, cuVar15, p65Var5, fnVar4);
                    tp7.B(p65Var5, cuVar16, r28VarR11);
                    k40.j(tm4Var, lm4Var, rh4Var6, p65Var5, 384);
                    p65Var5.p(true);
                    p65Var5.p(true);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                upc upcVar = (upc) obj5;
                d2c d2cVar = (d2c) obj4;
                hy8 hy8Var4 = (hy8) obj;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                hy8Var4.getClass();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((p65) x12Var6).f(hy8Var4) ? 4 : 2;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 19) != 18)) {
                    o28 o28Var6 = o28.b;
                    r28 r28VarB3 = w2g.B(o28Var6, hy8Var4);
                    rh4 rh4Var7 = jfc.c;
                    r28 r28VarX4 = ho2.x((jp7) p65Var6.j(kt7.a), wgf.R(r28VarB3.b(rh4Var7), wgf.K(p65Var6), ((b3c) upcVar.getValue()) instanceof a3c, 12), 3, 1.0f);
                    zk7 zk7VarC11 = dy0.c(z46.h, false);
                    long j13 = p65Var6.T;
                    int i14 = (int) (j13 ^ (j13 >>> 32));
                    i89 i89VarL12 = p65Var6.l();
                    r28 r28VarR12 = gx1.R(p65Var6, r28VarX4);
                    r12.W.getClass();
                    ot2 ot2Var6 = q12.b;
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var6);
                    } else {
                        p65Var6.m0();
                    }
                    cu cuVar17 = q12.f;
                    tp7.B(p65Var6, cuVar17, zk7VarC11);
                    cu cuVar18 = q12.e;
                    tp7.B(p65Var6, cuVar18, i89VarL12);
                    Integer numValueOf5 = Integer.valueOf(i14);
                    cu cuVar19 = q12.g;
                    tp7.B(p65Var6, cuVar19, numValueOf5);
                    fn fnVar5 = q12.h;
                    tp7.y(p65Var6, fnVar5);
                    cu cuVar20 = q12.d;
                    tp7.B(p65Var6, cuVar20, r28VarR12);
                    r28 r28VarD5 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC12 = dy0.c(z46.d, false);
                    long j14 = p65Var6.T;
                    int i15 = (int) (j14 ^ (j14 >>> 32));
                    i89 i89VarL13 = p65Var6.l();
                    r28 r28VarR13 = gx1.R(p65Var6, r28VarD5);
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var6);
                    } else {
                        p65Var6.m0();
                    }
                    tp7.B(p65Var6, cuVar17, zk7VarC12);
                    tp7.B(p65Var6, cuVar18, i89VarL13);
                    ka1.z(i15, p65Var6, cuVar19, p65Var6, fnVar5);
                    tp7.B(p65Var6, cuVar20, r28VarR13);
                    dm2.m((b3c) upcVar.getValue(), d2cVar, rh4Var7, p65Var6, 384);
                    p65Var6.p(true);
                    p65Var6.p(true);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                wmc wmcVar = (wmc) obj5;
                omc omcVar = (omc) obj4;
                hy8 hy8Var5 = (hy8) obj;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                hy8Var5.getClass();
                if ((iIntValue7 & 6) == 0) {
                    iIntValue7 |= ((p65) x12Var7).f(hy8Var5) ? 4 : 2;
                }
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 19) != 18)) {
                    rh4 rh4Var8 = jfc.c;
                    r28 r28VarX5 = ho2.x((jp7) p65Var7.j(kt7.a), w2g.B(rh4Var8, hy8Var5), 3, 1.0f);
                    zk7 zk7VarC13 = dy0.c(z46.h, false);
                    long j15 = p65Var7.T;
                    int i16 = (int) (j15 ^ (j15 >>> 32));
                    i89 i89VarL14 = p65Var7.l();
                    r28 r28VarR14 = gx1.R(p65Var7, r28VarX5);
                    r12.W.getClass();
                    ot2 ot2Var7 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var7);
                    } else {
                        p65Var7.m0();
                    }
                    cu cuVar21 = q12.f;
                    tp7.B(p65Var7, cuVar21, zk7VarC13);
                    cu cuVar22 = q12.e;
                    tp7.B(p65Var7, cuVar22, i89VarL14);
                    Integer numValueOf6 = Integer.valueOf(i16);
                    cu cuVar23 = q12.g;
                    tp7.B(p65Var7, cuVar23, numValueOf6);
                    fn fnVar6 = q12.h;
                    tp7.y(p65Var7, fnVar6);
                    cu cuVar24 = q12.d;
                    tp7.B(p65Var7, cuVar24, r28VarR14);
                    r28 r28VarD6 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC14 = dy0.c(z46.d, false);
                    long j16 = p65Var7.T;
                    int i17 = (int) (j16 ^ (j16 >>> 32));
                    i89 i89VarL15 = p65Var7.l();
                    r28 r28VarR15 = gx1.R(p65Var7, r28VarD6);
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var7);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, cuVar21, zk7VarC14);
                    tp7.B(p65Var7, cuVar22, i89VarL15);
                    ka1.z(i17, p65Var7, cuVar23, p65Var7, fnVar6);
                    tp7.B(p65Var7, cuVar24, r28VarR15);
                    iq7.o(wmcVar, omcVar, rh4Var8, p65Var7, 384);
                    p65Var7.p(true);
                    p65Var7.p(true);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                hpc hpcVar = (hpc) obj5;
                cpc cpcVar = (cpc) obj4;
                hy8 hy8Var6 = (hy8) obj;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                hy8Var6.getClass();
                if ((iIntValue8 & 6) == 0) {
                    iIntValue8 |= ((p65) x12Var8).f(hy8Var6) ? 4 : 2;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 19) != 18)) {
                    ht2.T(hpcVar, cpcVar, w2g.B(jfc.c, hy8Var6), p65Var8, 0);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                epc epcVar = (epc) obj5;
                cpc cpcVar2 = (cpc) obj4;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    rh4 rh4Var9 = jfc.c;
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var9, 0);
                    long j17 = p65Var9.T;
                    int i18 = (int) (j17 ^ (j17 >>> 32));
                    i89 i89VarL16 = p65Var9.l();
                    r28 r28VarR16 = gx1.R(p65Var9, rh4Var9);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var8);
                    } else {
                        p65Var9.m0();
                    }
                    tp7.B(p65Var9, q12.f, wv1VarA);
                    tp7.B(p65Var9, q12.e, i89VarL16);
                    tp7.B(p65Var9, q12.g, Integer.valueOf(i18));
                    tp7.y(p65Var9, q12.h);
                    tp7.B(p65Var9, q12.d, r28VarR16);
                    r28 r28VarN = bgf.N(jfc.d(o28Var, 1.0f).b(new sq6(1.0f, true)), "starter_packs_content");
                    yq0 yq0Var = z46.q;
                    boolean zF = p65Var9.f(epcVar) | p65Var9.f(cpcVar2);
                    Object objM2 = p65Var9.M();
                    if (zF || objM2 == uobVar) {
                        objM2 = new pda(epcVar, i2, cpcVar2);
                        p65Var9.j0(objM2);
                    }
                    k40.t(r28VarN, null, null, null, yq0Var, null, false, null, (x45) objM2, p65Var9, 196608, 478);
                    ht2.z(epcVar, cpcVar2, null, p65Var9, 0);
                    p65Var9.p(true);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                i4d i4dVar = (i4d) obj5;
                e4d e4dVar = (e4d) obj4;
                hy8 hy8Var7 = (hy8) obj;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                hy8Var7.getClass();
                if ((iIntValue10 & 6) == 0) {
                    iIntValue10 |= ((p65) x12Var10).f(hy8Var7) ? 4 : 2;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 19) != 18)) {
                    p65Var10.S();
                } else if (g76.L(i4dVar, h4d.a)) {
                    p65Var10.Y(-1779846342);
                    op8.F(w2g.B(o28Var, hy8Var7).b(jfc.c), p65Var10, 0);
                    p65Var10.p(false);
                } else {
                    if (!g76.L(i4dVar, g4d.a)) {
                        throw ho2.L(p65Var10, -1779848449, false);
                    }
                    p65Var10.Y(-1779838946);
                    op8.E(e4dVar, w2g.B(o28Var, hy8Var7).b(jfc.c), p65Var10, 0);
                    p65Var10.p(false);
                }
                return c1eVar;
            case 10:
                cqd cqdVar = (cqd) obj5;
                mpd mpdVar = (mpd) obj4;
                hy8 hy8Var8 = (hy8) obj;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                hy8Var8.getClass();
                if ((iIntValue11 & 6) == 0) {
                    iIntValue11 |= ((p65) x12Var11).f(hy8Var8) ? 4 : 2;
                }
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 19) != 18)) {
                    bo.x(cqdVar, mpdVar, w2g.B(jfc.c, hy8Var8), p65Var11, 0);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                zpd zpdVar = (zpd) obj5;
                mpd mpdVar2 = (mpd) obj4;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    rh4 rh4Var10 = jfc.c;
                    wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, p65Var12, 0);
                    long j18 = p65Var12.T;
                    int i19 = (int) (j18 ^ (j18 >>> 32));
                    i89 i89VarL17 = p65Var12.l();
                    r28 r28VarR17 = gx1.R(p65Var12, rh4Var10);
                    r12.W.getClass();
                    ot2 ot2Var9 = q12.b;
                    p65Var12.c0();
                    if (p65Var12.S) {
                        p65Var12.k(ot2Var9);
                    } else {
                        p65Var12.m0();
                    }
                    tp7.B(p65Var12, q12.f, wv1VarA2);
                    tp7.B(p65Var12, q12.e, i89VarL17);
                    tp7.B(p65Var12, q12.g, Integer.valueOf(i19));
                    tp7.y(p65Var12, q12.h);
                    tp7.B(p65Var12, q12.d, r28VarR17);
                    r28 r28VarN2 = bgf.N(jfc.d(o28Var, 1.0f).b(new sq6(1.0f, true)), "topics_content");
                    yq0 yq0Var2 = z46.q;
                    boolean zF2 = p65Var12.f(zpdVar) | p65Var12.f(mpdVar2);
                    Object objM3 = p65Var12.M();
                    if (zF2 || objM3 == uobVar) {
                        objM3 = new pda(zpdVar, 29, mpdVar2);
                        p65Var12.j0(objM3);
                    }
                    k40.t(r28VarN2, null, null, null, yq0Var2, null, false, null, (x45) objM3, p65Var12, 196608, 478);
                    bo.k(zpdVar, mpdVar2, null, p65Var12, 0);
                    p65Var12.p(true);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                s2f s2fVar = (s2f) obj5;
                o2f o2fVar = (o2f) obj4;
                hy8 hy8Var9 = (hy8) obj;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                hy8Var9.getClass();
                if ((iIntValue13 & 6) == 0) {
                    iIntValue13 |= ((p65) x12Var13).f(hy8Var9) ? 4 : 2;
                }
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 19) != 18)) {
                    nk7.e0(s2fVar, o2fVar, w2g.B(o28Var, hy8Var9).b(jfc.c), p65Var13, 0);
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 13:
                l9 l9Var = (l9) obj5;
                c9 c9Var = (c9) obj4;
                hy8 hy8Var10 = (hy8) obj;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                hy8Var10.getClass();
                if ((iIntValue14 & 6) == 0) {
                    iIntValue14 |= ((p65) x12Var14).f(hy8Var10) ? 4 : 2;
                }
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 19) != 18)) {
                    r28 r28VarB4 = w2g.B(o28Var, hy8Var10);
                    if (l9Var == null) {
                        throw ho2.L(p65Var14, -330810275, false);
                    }
                    p65Var14.Y(-330808053);
                    m40.a(l9Var, c9Var, r28VarB4, p65Var14, 0);
                    p65Var14.p(false);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 14:
                jb0 jb0Var = (jb0) obj5;
                cb0 cb0Var = (cb0) obj4;
                x12 x12Var15 = (x12) obj2;
                int iIntValue15 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var15 = (p65) x12Var15;
                if (p65Var15.P(iIntValue15 & 1, (iIntValue15 & 17) != 16)) {
                    r28 r28VarG = w2g.G(o28.b, 24.0f, 32.0f, 24.0f, 0.0f, 8);
                    if (jb0Var instanceof ib0) {
                        p65Var15.Y(-207581214);
                        f49.e(0, 0L, p65Var15, r28VarG);
                        p65Var15.p(false);
                    } else if (jb0Var instanceof gb0) {
                        p65Var15.Y(-207576786);
                        f49.c((gb0) jb0Var, cb0Var, r28VarG, p65Var15, 0);
                        p65Var15.p(false);
                    } else {
                        if (!(jb0Var instanceof hb0)) {
                            throw ho2.L(p65Var15, -207583047, false);
                        }
                        p65Var15.Y(-2139704810);
                        f49.d((hb0) jb0Var, cb0Var, r28VarG, p65Var15, 0);
                        p65Var15.p(false);
                    }
                } else {
                    p65Var15.S();
                }
                return c1eVar;
            case 15:
                cb0 cb0Var2 = (cb0) obj5;
                upc upcVar2 = (upc) obj4;
                hy8 hy8Var11 = (hy8) obj;
                x12 x12Var16 = (x12) obj2;
                int iIntValue16 = ((Integer) obj3).intValue();
                hy8Var11.getClass();
                if ((iIntValue16 & 6) == 0) {
                    iIntValue16 |= ((p65) x12Var16).f(hy8Var11) ? 4 : 2;
                }
                p65 p65Var16 = (p65) x12Var16;
                if (p65Var16.P(iIntValue16 & 1, (iIntValue16 & 19) != 18)) {
                    f49.a((jb0) upcVar2.getValue(), cb0Var2, w2g.B(o28Var, hy8Var11), p65Var16, 0);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
            case 16:
                od0 od0Var = (od0) obj5;
                wc0 wc0Var = (wc0) obj4;
                hy8 hy8Var12 = (hy8) obj;
                x12 x12Var17 = (x12) obj2;
                int iIntValue17 = ((Integer) obj3).intValue();
                hy8Var12.getClass();
                if ((iIntValue17 & 6) == 0) {
                    iIntValue17 |= ((p65) x12Var17).f(hy8Var12) ? 4 : 2;
                }
                p65 p65Var17 = (p65) x12Var17;
                if (p65Var17.P(iIntValue17 & 1, (iIntValue17 & 19) != 18)) {
                    gsa.f(od0Var, wc0Var, w2g.B(o28Var, hy8Var12), p65Var17, 0);
                } else {
                    p65Var17.S();
                }
                return c1eVar;
            case 17:
                return a(obj, obj2, obj3);
            case 18:
                return d(obj, obj2, obj3);
            case 19:
                return g(obj, obj2, obj3);
            case 20:
                return h(obj, obj2, obj3);
            case 21:
                return i(obj, obj2, obj3);
            case 22:
                return j(obj, obj2, obj3);
            case 23:
                return l(obj, obj2, obj3);
            case 24:
                return n(obj, obj2, obj3);
            case 25:
                return o(obj, obj2, obj3);
            case 26:
                return r(obj, obj2, obj3);
            case 27:
                return t(obj, obj2, obj3);
            case 28:
                return u(obj, obj2, obj3);
            default:
                x45 x45Var = (x45) obj5;
                l78 l78Var = (l78) obj4;
                x12 x12Var18 = (x12) obj2;
                int iIntValue18 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var18 = (p65) x12Var18;
                if (p65Var18.P(iIntValue18 & 1, (iIntValue18 & 17) != 16)) {
                    for (y5d y5dVar : y5d.getEntries()) {
                        bq7 bq7Var = new bq7(s42.P(y5dVar, p65Var18), false, null, null, 30);
                        boolean zF3 = p65Var18.f(x45Var) | p65Var18.d(y5dVar.ordinal());
                        Object objM4 = p65Var18.M();
                        if (zF3 || objM4 == uobVar) {
                            objM4 = new le0(x45Var, y5dVar, l78Var, 19);
                            p65Var18.j0(objM4);
                        }
                        aq7.b(bq7Var, (m45) objM4, null, 0L, 0L, p65Var18, 0, 28);
                    }
                } else {
                    p65Var18.S();
                }
                return c1eVar;
        }
    }
}
