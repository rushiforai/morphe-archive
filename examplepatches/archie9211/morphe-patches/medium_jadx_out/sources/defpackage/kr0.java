package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.medium.android.core.models.BillingPeriod;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kr0 {
    public static final pj2 a = ao3.a;

    public static final void a(int i, x12 x12Var, x45 x45Var, aw7 aw7Var, r28 r28Var, BillingPeriod billingPeriod, String str) {
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(573708104);
        int i2 = i | (p65Var.d(billingPeriod.ordinal()) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | (p65Var.d(aw7Var == null ? -1 : aw7Var.ordinal()) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(x45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            r28 r28VarD = jfc.d(w2g.C(bgf.N(r28Var, "billing_period_switch"), 1.0f), 1.0f);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 0);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM6;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, 0);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, 0);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarD, false, (x45) objM8), pxf.E(1200550679, new ir0(l78Var3, z52Var, m45Var, billingPeriod, aw7Var, x45Var, str), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(billingPeriod, str, r28Var, aw7Var, x45Var, i, 6);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v2, types: [int] */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r24v1, types: [x12] */
    /* JADX WARN: Type inference failed for: r6v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r6v24 */
    /* JADX WARN: Type inference failed for: r6v25 */
    /* JADX WARN: Type inference failed for: r6v26 */
    /* JADX WARN: Type inference failed for: r6v27 */
    /* JADX WARN: Type inference failed for: r6v5, types: [p65] */
    /* JADX WARN: Type inference failed for: r6v7, types: [p65] */
    public static final void b(int i, x12 x12Var, x45 x45Var, aw7 aw7Var, r28 r28Var, BillingPeriod billingPeriod, String str) {
        int i2;
        ?? r6;
        int i3;
        int i4;
        String strQ;
        boolean z;
        ?? r0;
        o28 o28Var;
        ?? r62;
        String str2;
        long j;
        long j2;
        billingPeriod.getClass();
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2055788593);
        if ((i & 48) == 0) {
            i2 = i | (p65Var.f(str) ? 32 : 16);
        } else {
            i2 = i;
        }
        int i5 = i2 | (p65Var.d(aw7Var == null ? -1 : aw7Var.ordinal()) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(x45Var) ? 16384 : 8192);
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            int i6 = jr0.a[billingPeriod.ordinal()];
            if (i6 == 1) {
                i3 = -72109022;
                i4 = R.string.subscription_pay_monthly;
            } else {
                if (i6 != 2) {
                    throw ho2.L(p65Var, -72110731, false);
                }
                i3 = -72106335;
                i4 = R.string.subscription_pay_yearly;
            }
            String strW = km4.w(p65Var, i3, i4, p65Var, false);
            if (str == null) {
                p65Var.Y(2059759572);
                p65Var.p(false);
                strQ = null;
            } else {
                p65Var.Y(2059759573);
                strQ = vo7.Q(R.string.subscription_save_up_to, new Object[]{str}, p65Var);
                p65Var.p(false);
            }
            r28 r28VarF = w2g.F(jfc.f(r28Var, 70.0f, 0.0f, 2), 24.0f, 12.0f, 24.0f, 10.0f);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var);
            }
            m68 m68Var = (m68) objM;
            vkb vkbVar = new vkb(2);
            boolean z2 = (i5 & 57344) == 16384;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new n(x45Var, 19, billingPeriod);
                p65Var.j0(objM2);
            }
            r28 r28VarP = hlg.p(r28VarF, m68Var, null, false, vkbVar, (m45) objM2, 12);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarP);
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
            Integer numValueOf = Integer.valueOf(i7);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var2 = o28.b;
            if (strQ != null) {
                p65Var.Y(2126188453);
                int i8 = aw7Var == null ? -1 : jr0.b[aw7Var.ordinal()];
                if (i8 == -1) {
                    str2 = strQ;
                    p65Var.Y(899875743);
                    j = ((zo7) p65Var.j(kt7.b)).n;
                    p65Var.p(false);
                } else {
                    if (i8 != 1) {
                        throw ho2.L(p65Var, 899870704, false);
                    }
                    p65Var.Y(899873349);
                    if (yi2.N(p65Var)) {
                        p65Var.Y(1091114609);
                        str2 = strQ;
                        j = ((zo7) p65Var.j(kt7.b)).p;
                        p65Var.p(false);
                    } else {
                        str2 = strQ;
                        p65Var.Y(1091176082);
                        j = ((zo7) p65Var.j(kt7.b)).n;
                        p65Var.p(false);
                    }
                    p65Var.p(false);
                }
                long j4 = j;
                int i9 = aw7Var == null ? -1 : jr0.b[aw7Var.ordinal()];
                if (i9 == -1) {
                    j2 = uu1.g;
                } else {
                    if (i9 != 1) {
                        ygf.a();
                        return;
                    }
                    j2 = xo7.B;
                }
                r28 r28VarF2 = jfc.f(w2g.C(flb.a0(o28Var2, j2, bmb.a(4.0f)), 4.0f), 16.0f, 0.0f, 2);
                zk7 zk7VarC = dy0.c(z46.d, false);
                long j5 = p65Var.T;
                int i10 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarF2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR2);
                z = true;
                o28Var = o28Var2;
                r0 = 0;
                jjd.b(str2, bgf.N(iy0.a.a(o28Var2, z46.h), "billing_period_switch_item_save_up_to"), 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).o, j4, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 109564);
                p65 p65Var2 = p65Var;
                p65Var2.p(true);
                r62 = p65Var2;
            } else {
                p65 p65Var3 = p65Var;
                z = true;
                r0 = 0;
                o28Var = o28Var2;
                p65Var3.Y(2118859867);
                r62 = p65Var3;
            }
            r62.p(r0);
            mkd mkdVar = ((bu7) r62.j(jt7.c)).l;
            float f = iz6.b;
            lz6 lz6Var = mkdVar.b.f;
            ?? r24 = r62;
            jjd.b(strW, jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 1, 0, null, mkd.a(mkdVar, 0L, 0L, null, null, null, 0L, 0L, null, 0, 0L, new bb9((boolean) r0), new lz6(f, r0, lz6Var != null ? lz6Var.c : r0), 15204351), r24, 48, 24960, 109564);
            ?? r63 = r24;
            r63.p(z);
            r6 = r63;
        } else {
            p65 p65Var4 = p65Var;
            p65Var4.S();
            r6 = p65Var4;
        }
        mwa mwaVarS = r6.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob((Object) billingPeriod, (Object) str, (Object) aw7Var, r28Var, (Object) x45Var, i, 1);
        }
    }

    public static final void c(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        long j3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1095126816);
        int i2 = i | (p65Var.f(r28Var) ? 4 : 2) | 16;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                j3 = j;
            }
            p65Var.q();
            amb ambVarA = bmb.a(4.0f);
            r28 r28VarA0 = flb.a0(bo.B(jfc.d(w2g.C(bgf.N(r28Var, "billing_period_switch_skeleton"), 1.0f), 1.0f), 1.0f, j3, ambVarA), j3, ambVarA);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j4 = p65Var.T;
            int i3 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1775116649);
            for (int i4 = 0; i4 < 2; i4++) {
                r28 r28VarF = w2g.F(jfc.f(new sq6(1.0f, true), 70.0f, 0.0f, 2), 24.0f, 12.0f, 24.0f, 10.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j5 = p65Var.T;
                int i5 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarF);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, zk7VarC);
                tp7.B(p65Var, q12.e, i89VarL2);
                tp7.B(p65Var, q12.g, Integer.valueOf(i5));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR2);
                ok7.r(72.0f, 48, 12, 0L, p65Var, null, ((bu7) p65Var.j(jt7.c)).l);
                p65Var.p(true);
            }
            p65Var.p(false);
            p65Var.p(true);
            j2 = j3;
        } else {
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j2, i, 2);
        }
    }
}
