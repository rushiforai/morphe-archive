package defpackage;

import android.content.res.Resources;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.models.BillingPeriod;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hyc extends co6 implements b55 {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ szc d;
    public final /* synthetic */ String e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ lyc g;
    public final /* synthetic */ String h;
    public final /* synthetic */ String i;
    public final /* synthetic */ bw7 j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hyc(l78 l78Var, z52 z52Var, m45 m45Var, szc szcVar, String str, boolean z, lyc lycVar, String str2, String str3, bw7 bw7Var) {
        super(2);
        this.a = l78Var;
        this.b = z52Var;
        this.c = m45Var;
        this.d = szcVar;
        this.e = str;
        this.f = z;
        this.g = lycVar;
        this.h = str2;
        this.i = str3;
        this.j = bw7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        String strW;
        boolean z;
        String strQ;
        String str;
        Object obj3;
        skc skcVar;
        boolean z2;
        boolean z3;
        String strQ2;
        boolean z4;
        p65 p65Var;
        c1e c1eVar;
        boolean z5;
        boolean z6;
        mkd mkdVar;
        boolean z7;
        int iH;
        boolean z8;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue() & 3;
        c1e c1eVar2 = c1e.a;
        if (iIntValue == 2) {
            p65 p65Var2 = (p65) x12Var;
            if (p65Var2.B()) {
                p65Var2.S();
                return c1eVar2;
            }
        }
        this.a.setValue(c1eVar2);
        z52 z52Var = this.b;
        int i = z52Var.b;
        z52Var.f();
        p65 p65Var3 = (p65) x12Var;
        p65Var3.Y(-1143065130);
        z52 z52Var2 = (z52) z52Var.e().b;
        i52 i52VarD = z52Var2.d();
        i52 i52VarD2 = z52Var2.d();
        i52 i52VarD3 = z52Var2.d();
        i52 i52VarD4 = z52Var2.d();
        i52 i52VarD5 = z52Var2.d();
        i52 i52VarD6 = z52Var2.d();
        i52 i52VarD7 = z52Var2.d();
        szc szcVar = this.d;
        zw7 zw7Var = szcVar.e;
        String str2 = szcVar.g;
        BillingPeriod billingPeriod = szcVar.d;
        boolean z9 = szcVar.i;
        String str3 = szcVar.h;
        rzc rzcVar = szcVar.j;
        hl0 hl0Var = hl0.XL;
        o28 o28Var = o28.b;
        r28 r28VarN = bgf.N(o28Var, "avatar");
        Object objM = p65Var3.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = zkc.h;
            p65Var3.j0(objM);
        }
        c1e c1eVar3 = c1eVar2;
        d46.a(this.e, hl0Var, z52.b(r28VarN, i52VarD, (x45) objM), zw7Var, null, null, null, 0.0f, 0, null, null, p65Var3, 48, 0, 4080);
        int[] iArr = myc.a;
        int i2 = iArr[zw7Var.ordinal()];
        String strR = "";
        if (i2 == 1) {
            strW = km4.w(p65Var3, 1902799178, R.string.subscription_offer_premium_title, p65Var3, false);
        } else if (i2 == 2) {
            strW = km4.w(p65Var3, 1902795850, R.string.subscription_offer_regular_title, p65Var3, false);
        } else {
            if (i2 != 3) {
                throw ho2.L(p65Var3, 1902793701, false);
            }
            p65Var3.Y(-1142661203);
            p65Var3.p(false);
            strW = "";
        }
        mkd mkdVar2 = rz5.D(p65Var3).i;
        r28 r28VarN2 = bgf.N(o28Var, "membership_type");
        boolean zF = p65Var3.f(i52VarD);
        Object objM2 = p65Var3.M();
        if (zF || objM2 == uobVar) {
            objM2 = new et0(i52VarD, 28);
            p65Var3.j0(objM2);
        }
        jjd.b(strW, z52.b(r28VarN2, i52VarD2, (x45) objM2), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVar2, p65Var3, 0, 0, 130044);
        boolean z10 = rzcVar instanceof qzc;
        if (z10) {
            p65Var3.Y(-1141932391);
            int i3 = myc.c[billingPeriod.ordinal()];
            if (i3 == 1) {
                z = false;
                p65Var3.Y(1902828288);
                strQ = vo7.Q(R.string.subscription_introductory_price_then_yearly, new Object[]{((qzc) rzcVar).c}, p65Var3);
                p65Var3.p(false);
            } else {
                if (i3 != 2) {
                    throw ho2.L(p65Var3, 1902826121, false);
                }
                p65Var3.Y(1902835585);
                z = false;
                strQ = vo7.Q(R.string.subscription_introductory_price_then_monthly, new Object[]{((qzc) rzcVar).c}, p65Var3);
                p65Var3.p(false);
            }
            p65Var3.p(z);
        } else {
            z = false;
            p65Var3.Y(-1141422132);
            p65Var3.p(false);
            strQ = null;
        }
        if (strQ == null) {
            p65Var3.Y(-1141305169);
            p65Var3.p(z);
            str = strQ;
            skcVar = null;
            obj3 = null;
        } else {
            p65Var3.Y(-1141305168);
            mkd mkdVar3 = rz5.D(p65Var3).n;
            long j = rz5.A(p65Var3).o;
            skc skcVar2 = mkdVar3.a;
            str = strQ;
            obj3 = null;
            skc skcVar3 = new skc(j, skcVar2.b, skcVar2.c, (zz4) null, (a05) null, skcVar2.f, (String) null, skcVar2.h, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65368);
            p65Var3.p(false);
            skcVar = skcVar3;
        }
        kx kxVarW = ho2.w(p65Var3, 1902864011);
        if (str3 != null) {
            p65Var3.Y(-268057840);
            iH = kxVarW.h(new skc(rz5.A(p65Var3).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.d, (i3c) null, 61438));
            try {
                kxVarW.d(str3);
                kxVarW.f(iH);
                kxVarW.d(" ");
                z2 = false;
            } finally {
            }
        } else {
            z2 = false;
            p65Var3.Y(-312808913);
        }
        p65Var3.p(z2);
        if (z10) {
            p65Var3.Y(1238299669);
            qzc qzcVar = (qzc) rzcVar;
            String str4 = qzcVar.a;
            int i4 = qzcVar.b;
            billingPeriod.getClass();
            Resources resources = (Resources) p65Var3.j(eo.c);
            resources.getClass();
            f09 f09VarC = huc.c(str4);
            int iIntValue2 = ((Number) f09VarC.a).intValue();
            String str5 = (String) f09VarC.b;
            if (i4 < 1) {
                i4 = 1;
            }
            int i5 = iIntValue2 * i4;
            int i6 = p76.a[billingPeriod.ordinal()];
            if (i6 != 1) {
                if (i6 != 2) {
                    ygf.a();
                    return obj3;
                }
                if (!g76.L(str5, "M")) {
                    ay0.e(ev6.x("Unsupported introductory period ", str4, " for monthly subscription"));
                    return obj3;
                }
                if (i5 == 1) {
                    strQ2 = resources.getString(R.string.subscription_introductory_price_first_month, str2);
                    strQ2.getClass();
                    z8 = false;
                } else {
                    strQ2 = resources.getQuantityString(R.plurals.subscription_introductory_price_per_month_for_months, i5, str2, Integer.valueOf(i5));
                    strQ2.getClass();
                    z8 = false;
                }
            } else {
                if (!g76.L(str5, "Y")) {
                    ay0.e(ev6.x("Unsupported introductory period ", str4, " for yearly subscription"));
                    return obj3;
                }
                if (i5 == 1) {
                    z8 = false;
                    strQ2 = resources.getString(R.string.subscription_introductory_price_first_year, str2);
                    strQ2.getClass();
                } else {
                    z8 = false;
                    strQ2 = resources.getQuantityString(R.plurals.subscription_introductory_price_first_years, i5, str2, Integer.valueOf(i5));
                    strQ2.getClass();
                }
            }
            p65Var3.p(z8);
        } else if (rzcVar instanceof pzc) {
            p65Var3.Y(-266926557);
            int i7 = myc.c[billingPeriod.ordinal()];
            if (i7 == 1) {
                z4 = false;
                p65Var3.Y(1238328352);
                strQ2 = vo7.Q(R.string.subscription_offer_price_yearly_free_trial, new Object[]{str2, huc.e(((pzc) rzcVar).a, p65Var3)}, p65Var3);
                p65Var3.p(false);
            } else {
                if (i7 != 2) {
                    throw ho2.L(p65Var3, 1238315455, false);
                }
                p65Var3.Y(1238317793);
                z4 = false;
                strQ2 = vo7.Q(R.string.subscription_offer_price_monthly_free_trial, new Object[]{str2, huc.e(((pzc) rzcVar).a, p65Var3)}, p65Var3);
                p65Var3.p(false);
            }
            p65Var3.p(z4);
        } else {
            if (rzcVar != null) {
                throw ho2.L(p65Var3, 1238295836, false);
            }
            p65Var3.Y(-266192911);
            int i8 = myc.c[billingPeriod.ordinal()];
            if (i8 == 1) {
                z3 = false;
                p65Var3.Y(1238347775);
                strQ2 = vo7.Q(R.string.subscription_offer_price_yearly_control, new Object[]{str2}, p65Var3);
                p65Var3.p(false);
            } else {
                if (i8 != 2) {
                    throw ho2.L(p65Var3, 1238339121, false);
                }
                p65Var3.Y(1238342496);
                z3 = false;
                strQ2 = vo7.Q(R.string.subscription_offer_price_monthly_control, new Object[]{str2}, p65Var3);
                p65Var3.p(false);
            }
            p65Var3.p(z3);
        }
        if (!z10 || z9) {
            kxVarW.d(strQ2);
        } else {
            bw7 bw7Var = this.j;
            iH = kxVarW.h(new skc(bw7Var.c, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, bw7Var.d, (ohd) null, (i3c) null, 63486));
            try {
                kxVarW.d(strQ2);
            } finally {
            }
        }
        if (str != null && skcVar != null) {
            iH = kxVarW.h(skcVar);
            try {
                kxVarW.d("\n");
                kxVarW.d(str);
            } finally {
            }
        }
        mx mxVarI = kxVarW.i();
        p65Var3.p(false);
        mkd mkdVar4 = rz5.D(p65Var3).l;
        r28 r28VarN3 = bgf.N(o28Var, "price");
        boolean zF2 = p65Var3.f(i52VarD2);
        Object objM3 = p65Var3.M();
        if (zF2 || objM3 == uobVar) {
            objM3 = new et0(i52VarD2, 29);
            p65Var3.j0(objM3);
        }
        jjd.c(mxVarI, z52.b(r28VarN3, i52VarD3, (x45) objM3), 0L, 0L, 0L, new jgd(3), 0L, 0, false, 0, 0, null, null, mkdVar4, p65Var3, 0, 0, 261116);
        int i9 = iArr[zw7Var.ordinal()];
        boolean z11 = this.f;
        if (i9 == 1) {
            p65Var3.Y(1902998821);
            strR = vo7.R(p65Var3, z11 ? R.string.subscription_offer_premium_description_onboarding : R.string.subscription_offer_premium_description);
            p65Var3.p(false);
        } else if (i9 == 2) {
            p65Var3.Y(1902987429);
            strR = vo7.R(p65Var3, z11 ? R.string.subscription_offer_regular_description_onboarding : R.string.subscription_offer_regular_description);
            p65Var3.p(false);
        } else {
            if (i9 != 3) {
                throw ho2.L(p65Var3, 1902985533, false);
            }
            p65Var3.Y(-1136230067);
            p65Var3.p(false);
        }
        mkd mkdVarA = mkd.a(rz5.D(p65Var3).n, rz5.A(p65Var3).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
        r28 r28VarN4 = bgf.N(o28Var, "description");
        boolean zF3 = p65Var3.f(i52VarD3);
        Object objM4 = p65Var3.M();
        if (zF3 || objM4 == uobVar) {
            objM4 = new fyc(i52VarD3, 0);
            p65Var3.j0(objM4);
        }
        jjd.b(strR, z52.b(r28VarN4, i52VarD4, (x45) objM4), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVarA, p65Var3, 0, 0, 130044);
        xn7 xn7Var = xn7.L;
        r28 r28VarG = w2g.G(bgf.N(o28Var, "cta"), 0.0f, 16.0f, 0.0f, 0.0f, 13);
        boolean zF4 = p65Var3.f(i52VarD4);
        Object objM5 = p65Var3.M();
        if (zF4 || objM5 == uobVar) {
            objM5 = new fyc(i52VarD4, 3);
            p65Var3.j0(objM5);
        }
        r28 r28VarB = z52.b(r28VarG, i52VarD5, (x45) objM5);
        if (z9) {
            p65Var3.Y(-1135178049);
            String strR2 = vo7.R(p65Var3, R.string.subscription_offer_cta_current_plan);
            Object objM6 = p65Var3.M();
            if (objM6 == uobVar) {
                objM6 = qk0.m;
                p65Var3.j0(objM6);
            }
            fo7.j((m45) objM6, strR2, xn7Var, r28VarB, false, null, p65Var3, 24966, 32);
            p65Var = p65Var3;
            p65Var.p(false);
        } else {
            p65Var3.Y(-1134775173);
            String strR3 = vo7.R(p65Var3, rzcVar instanceof pzc ? R.string.subscription_offer_cta_free_trial : R.string.subscription_offer_cta_control);
            lyc lycVar = this.g;
            boolean zF5 = p65Var3.f(lycVar) | p65Var3.f(szcVar);
            String str6 = this.h;
            boolean zF6 = zF5 | p65Var3.f(str6);
            String str7 = this.i;
            boolean zF7 = zF6 | p65Var3.f(str7);
            Object objM7 = p65Var3.M();
            if (zF7 || objM7 == uobVar) {
                objM7 = new gyc(lycVar, szcVar, str6, str7);
                p65Var3.j0(objM7);
            }
            fo7.r((m45) objM7, strR3, xn7Var, r28VarB, false, p65Var3, 384, 16);
            p65Var = p65Var3;
            p65Var.p(false);
        }
        r28 r28VarN5 = bgf.N(o28Var, "divider");
        boolean zF8 = p65Var.f(i52VarD5);
        Object objM8 = p65Var.M();
        if (zF8 || objM8 == uobVar) {
            objM8 = new fyc(i52VarD5, 1);
            p65Var.j0(objM8);
        }
        p65 p65Var4 = p65Var;
        tp7.c(0.0f, 0, 6, 0L, p65Var4, z52.b(r28VarN5, i52VarD6, (x45) objM8));
        p65 p65Var5 = p65Var4;
        r28 r28VarN6 = bgf.N(o28Var, "features");
        boolean zF9 = p65Var5.f(i52VarD6);
        Object objM9 = p65Var5.M();
        if (zF9 || objM9 == uobVar) {
            objM9 = new fyc(i52VarD6, 2);
            p65Var5.j0(objM9);
        }
        r28 r28VarB2 = z52.b(r28VarN6, i52VarD7, (x45) objM9);
        wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var5, 0);
        long j2 = p65Var5.T;
        int i10 = (int) (j2 ^ (j2 >>> 32));
        i89 i89VarL = p65Var5.l();
        r28 r28VarR = gx1.R(p65Var5, r28VarB2);
        r12.W.getClass();
        ot2 ot2Var = q12.b;
        p65Var5.c0();
        if (p65Var5.S) {
            p65Var5.k(ot2Var);
        } else {
            p65Var5.m0();
        }
        cu cuVar = q12.f;
        tp7.B(p65Var5, cuVar, wv1VarA);
        cu cuVar2 = q12.e;
        tp7.B(p65Var5, cuVar2, i89VarL);
        Integer numValueOf = Integer.valueOf(i10);
        cu cuVar3 = q12.g;
        tp7.B(p65Var5, cuVar3, numValueOf);
        fn fnVar = q12.h;
        tp7.y(p65Var5, fnVar);
        cu cuVar4 = q12.d;
        tp7.B(p65Var5, cuVar4, r28VarR);
        int i11 = iArr[zw7Var.ordinal()];
        if (i11 != 1) {
            if (i11 != 2) {
                p65Var5.Y(2020976863);
                p65Var5.p(false);
            } else {
                p65Var5.Y(-1779195303);
                String[] stringArray = ((Resources) p65Var5.j(eo.c)).getStringArray(z11 ? R.array.subscription_regular_plan_features_onboarding : R.array.subscription_regular_plan_features);
                int length = stringArray.length;
                int length2 = stringArray.length;
                int i12 = 0;
                int i13 = 0;
                while (i12 < length2) {
                    String str8 = stringArray[i12];
                    int i14 = i13 + 1;
                    if (i13 != 0) {
                        p65Var5.Y(1084033024);
                        hp7.t(p65Var5, jfc.e(jfc.d(o28Var, 1.0f), 8.0f));
                    } else {
                        p65Var5.Y(1030577957);
                    }
                    p65Var5.p(false);
                    nk7.C(str8, null, null, p65Var5, 0, 6);
                    if (i13 != length - 1) {
                        p65Var5.Y(1084411968);
                        hp7.t(p65Var5, jfc.e(jfc.d(o28Var, 1.0f), 8.0f));
                    } else {
                        p65Var5.Y(1030577957);
                    }
                    p65Var5.p(false);
                    i12++;
                    i13 = i14;
                }
                p65Var5.p(false);
            }
            z5 = false;
        } else {
            p65Var5.Y(-1777849748);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var5, 0);
            long j3 = p65Var5.T;
            int i15 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var5.l();
            r28 r28VarR2 = gx1.R(p65Var5, o28Var);
            p65Var5.c0();
            if (p65Var5.S) {
                p65Var5.k(ot2Var);
            } else {
                p65Var5.m0();
            }
            tp7.B(p65Var5, cuVar, ombVarA);
            tp7.B(p65Var5, cuVar2, i89VarL2);
            ka1.z(i15, p65Var5, cuVar3, p65Var5, fnVar);
            tp7.B(p65Var5, cuVar4, r28VarR2);
            w2g.e(vn7.J(R.drawable.ic_member_16, 0, p65Var5), vo7.R(p65Var5, R.string.cd_member), null, null, null, 0.0f, null, p65Var5, 8, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            jjd.b(y30.n(8.0f, R.string.subscription_premium_plan_header, p65Var5, p65Var5, o28Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var5).m, p65Var5, 0, 0, 131070);
            p65Var5 = p65Var5;
            p65Var5.p(true);
            r28 r28VarD = jfc.d(w2g.E(o28Var, 0.0f, 16.0f, 1), 1.0f);
            p65Var5.Y(-1003410150);
            p65Var5.Y(212064437);
            p65Var5.p(false);
            m73 m73Var = (m73) p65Var5.j(z22.h);
            Object objM10 = p65Var5.M();
            if (objM10 == uobVar) {
                objM10 = b09.t(m73Var, p65Var5);
            }
            hl7 hl7Var = (hl7) objM10;
            Object objM11 = p65Var5.M();
            if (objM11 == uobVar) {
                objM11 = b09.r(p65Var5);
            }
            z52 z52Var3 = (z52) objM11;
            Object objM12 = p65Var5.M();
            if (objM12 == uobVar) {
                objM12 = qo7.u(Boolean.FALSE);
                p65Var5.j0(objM12);
            }
            l78 l78Var = (l78) objM12;
            Object objM13 = p65Var5.M();
            if (objM13 == uobVar) {
                objM13 = b09.s(z52Var3, p65Var5);
            }
            m62 m62Var = (m62) objM13;
            Object objM14 = p65Var5.M();
            if (objM14 == uobVar) {
                c1eVar = c1eVar3;
                objM14 = b09.v(c1eVar, y3b.h, p65Var5);
            } else {
                c1eVar = c1eVar3;
            }
            l78 l78Var2 = (l78) objM14;
            boolean zH = p65Var5.h(hl7Var) | p65Var5.d(257);
            Object objM15 = p65Var5.M();
            if (zH || objM15 == uobVar) {
                objM15 = new ftc(l78Var2, hl7Var, m62Var, l78Var, 3);
                p65Var5.j0(objM15);
            }
            zk7 zk7Var = (zk7) objM15;
            Object objM16 = p65Var5.M();
            if (objM16 == uobVar) {
                objM16 = new gtc(l78Var, m62Var, 3);
                p65Var5.j0(objM16);
            }
            m45 m45Var = (m45) objM16;
            boolean zH2 = p65Var5.h(hl7Var);
            Object objM17 = p65Var5.M();
            if (zH2 || objM17 == uobVar) {
                objM17 = new htc(hl7Var, 3);
                p65Var5.j0(objM17);
            }
            hlg.j(wxb.a(r28VarD, false, (x45) objM17), pxf.E(1200550679, new y22(l78Var2, z52Var3, m45Var, 2), p65Var5), zk7Var, p65Var5, 48);
            p65Var5.p(false);
            String[] stringArray2 = ((Resources) p65Var5.j(eo.c)).getStringArray(z11 ? R.array.subscription_premium_plan_features_onboarding : R.array.subscription_premium_plan_features);
            int length3 = stringArray2.length;
            int length4 = stringArray2.length;
            int i16 = 0;
            int i17 = 0;
            while (i16 < length4) {
                String str9 = stringArray2[i16];
                int i18 = i17 + 1;
                if (i17 != 0) {
                    p65Var5.Y(-1998085335);
                    hp7.t(p65Var5, jfc.e(jfc.d(o28Var, 1.0f), 8.0f));
                    z6 = false;
                } else {
                    z6 = false;
                    p65Var5.Y(-2055097714);
                }
                p65Var5.p(z6);
                if (i17 == 0) {
                    p65Var5.Y(-1449913699);
                    mkdVar = ((bu7) p65Var5.j(jt7.c)).j;
                } else {
                    p65Var5.Y(-1449912453);
                    mkdVar = ((bu7) p65Var5.j(jt7.c)).m;
                }
                p65Var5.p(z6);
                c1e c1eVar4 = c1eVar;
                nk7.C(str9, null, mkdVar, p65Var5, 0, 2);
                if (i17 != length3 - 1) {
                    p65Var5.Y(-1997506999);
                    hp7.t(p65Var5, jfc.e(jfc.d(o28Var, 1.0f), 8.0f));
                    z7 = false;
                } else {
                    z7 = false;
                    p65Var5.Y(-2055097714);
                }
                p65Var5.p(z7);
                i16++;
                i17 = i18;
                c1eVar = c1eVar4;
            }
            c1eVar3 = c1eVar;
            z5 = false;
            p65Var5.p(false);
        }
        p65Var5.p(true);
        p65Var5.p(z5);
        if (z52Var.b != i) {
            kyd.v(this.c, p65Var5);
        }
        return c1eVar3;
    }
}
