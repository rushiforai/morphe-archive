package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.core.models.BillingPeriod;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iyc extends co6 implements b55 {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ tzc d;
    public final /* synthetic */ bw7 e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ ip7 g;
    public final /* synthetic */ lyc h;
    public final /* synthetic */ hu7 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iyc(l78 l78Var, z52 z52Var, m45 m45Var, tzc tzcVar, bw7 bw7Var, boolean z, ip7 ip7Var, lyc lycVar, hu7 hu7Var) {
        super(2);
        this.a = l78Var;
        this.b = z52Var;
        this.c = m45Var;
        this.d = tzcVar;
        this.e = bw7Var;
        this.f = z;
        this.g = ip7Var;
        this.h = lycVar;
        this.i = hu7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        c1e c1eVar;
        String strW;
        String str;
        boolean z;
        String str2;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue() & 3;
        c1e c1eVar2 = c1e.a;
        if (iIntValue == 2) {
            p65 p65Var = (p65) x12Var;
            if (p65Var.B()) {
                p65Var.S();
                return c1eVar2;
            }
        }
        this.a.setValue(c1eVar2);
        z52 z52Var = this.b;
        int i = z52Var.b;
        z52Var.f();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-398770087);
        z52 z52Var2 = (z52) z52Var.e().b;
        i52 i52VarD = z52Var2.d();
        i52 i52VarD2 = z52Var2.d();
        i52 i52VarD3 = z52Var2.d();
        i52 i52VarD4 = z52Var2.d();
        i52 i52VarD5 = z52Var2.d();
        i52 i52VarD6 = z52Var2.d();
        i52 i52VarD7 = z52Var2.d();
        i52 i52VarD8 = z52Var2.d();
        tzc tzcVar = this.d;
        ozc ozcVar = tzcVar.e;
        UpsellInfo upsellInfo = tzcVar.d;
        if (ozcVar == null || (str2 = ozcVar.e) == null) {
            if (g76.L(upsellInfo.getDimension(), "post_audio_button")) {
                c1eVar = c1eVar2;
                strW = km4.w(p65Var2, 1372612619, R.string.subscription_title_audio_control, p65Var2, false);
            } else {
                c1eVar = c1eVar2;
                strW = g76.L(upsellInfo.getDimension(), "list_download") ? km4.w(p65Var2, 1372616853, R.string.subscription_title_offline_reading_control, p65Var2, false) : g76.L(upsellInfo.getDimension(), "post_friend_link") ? km4.w(p65Var2, 1372621489, R.string.subscription_title_member_friend_links, p65Var2, false) : upsellInfo.getReferrer() == UpsellReferrer.ONBOARDING ? km4.w(p65Var2, 1372625904, R.string.subscription_title_control_onboarding, p65Var2, false) : km4.w(p65Var2, 1372628549, R.string.subscription_title_control, p65Var2, false);
            }
            str = strW;
        } else {
            c1eVar = c1eVar2;
            str = str2;
        }
        String str3 = ozcVar != null ? ozcVar.b : null;
        if (str3 == null) {
            str3 = "";
        }
        sn3 sn3Var = jt7.c;
        String str4 = str;
        mkd mkdVar = ((bu7) p65Var2.j(sn3Var)).n;
        bw7 bw7Var = this.e;
        String str5 = str3;
        mkd mkdVarA = mkd.a(mkdVar, bw7Var.b, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
        o28 o28Var = o28.b;
        r28 r28VarF = w2g.F(flb.a0(bgf.N(o28Var, "intro_offer_pill"), bw7Var.a, bmb.a(8.0f)), 8.0f, 4.0f, 8.0f, 4.0f);
        boolean zF = p65Var2.f(tzcVar);
        Object objM = p65Var2.M();
        uob uobVar = w12.a;
        if (zF || objM == uobVar) {
            objM = new k0b(3, tzcVar);
            p65Var2.j0(objM);
        }
        jjd.b(str5, z52.b(r28VarF, i52VarD, (x45) objM), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 0, 0, 131068);
        mkd mkdVar2 = ((bu7) p65Var2.j(sn3Var)).E;
        r28 r28VarN = bgf.N(o28Var, "title");
        boolean zF2 = p65Var2.f(i52VarD);
        Object objM2 = p65Var2.M();
        if (zF2 || objM2 == uobVar) {
            objM2 = new fyc(i52VarD, 4);
            p65Var2.j0(objM2);
        }
        jjd.b(str4, z52.b(r28VarN, i52VarD2, (x45) objM2), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVar2, p65Var2, 0, 0, 130044);
        String str6 = ozcVar != null ? ozcVar.g : null;
        if (str6 == null) {
            str6 = "";
        }
        mkd mkdVar3 = ((bu7) p65Var2.j(sn3Var)).G;
        r28 r28VarN2 = bgf.N(o28Var, "subtitle");
        boolean zF3 = p65Var2.f(tzcVar) | p65Var2.f(i52VarD2);
        Object objM3 = p65Var2.M();
        if (zF3 || objM3 == uobVar) {
            objM3 = new vja(tzcVar, 14, i52VarD2);
            p65Var2.j0(objM3);
        }
        jjd.b(str6, z52.b(r28VarN2, i52VarD3, (x45) objM3), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVar3, p65Var2, 0, 0, 130044);
        String strR = vo7.R(p65Var2, R.string.subscription_header_billing_period);
        mkd mkdVar4 = ((bu7) p65Var2.j(sn3Var)).n;
        sn3 sn3Var2 = kt7.b;
        mkd mkdVarA2 = mkd.a(mkdVar4, ((zo7) p65Var2.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
        r28 r28VarN3 = bgf.N(o28Var, "header_billing_period");
        boolean zF4 = p65Var2.f(i52VarD3);
        boolean z2 = this.f;
        boolean zG = zF4 | p65Var2.g(z2);
        Object objM4 = p65Var2.M();
        if (zG || objM4 == uobVar) {
            z = false;
            objM4 = new jyc(i52VarD3, z2, 0);
            p65Var2.j0(objM4);
        } else {
            z = false;
        }
        jjd.b(strR, z52.b(r28VarN3, i52VarD4, (x45) objM4), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA2, p65Var2, 0, 0, 131068);
        BillingPeriod billingPeriod = tzcVar.f;
        String str7 = tzcVar.j;
        aw7 aw7Var = ozcVar != null ? ozcVar.c : null;
        ip7 ip7Var = this.g;
        boolean zD = p65Var2.d(ip7Var.ordinal()) | p65Var2.f(i52VarD4);
        Object objM5 = p65Var2.M();
        if (zD || objM5 == uobVar) {
            objM5 = new vja(ip7Var, 15, i52VarD4);
            p65Var2.j0(objM5);
        }
        r28 r28VarB = z52.b(o28Var, i52VarD6, (x45) objM5);
        lyc lycVar = this.h;
        boolean zF5 = p65Var2.f(lycVar);
        Object objM6 = p65Var2.M();
        if (zF5 || objM6 == uobVar) {
            objM6 = new k0b(4, lycVar);
            p65Var2.j0(objM6);
        }
        kr0.a(0, p65Var2, (x45) objM6, aw7Var, r28VarB, billingPeriod, str7);
        String strR2 = vo7.R(p65Var2, R.string.subscription_header_membership_plan);
        mkd mkdVarA3 = mkd.a(((bu7) p65Var2.j(sn3Var)).n, ((zo7) p65Var2.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
        r28 r28VarN4 = bgf.N(o28Var, "header_membership_plan");
        boolean zF6 = p65Var2.f(i52VarD6) | p65Var2.g(z2);
        Object objM7 = p65Var2.M();
        if (zF6 || objM7 == uobVar) {
            objM7 = new jyc(i52VarD6, z2, 1);
            p65Var2.j0(objM7);
        }
        jjd.b(strR2, z52.b(r28VarN4, i52VarD5, (x45) objM7), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA3, p65Var2, 0, 0, 131068);
        r28 r28VarN5 = bgf.N(o28Var, "plans");
        boolean zF7 = p65Var2.f(i52VarD5);
        Object objM8 = p65Var2.M();
        if (zF7 || objM8 == uobVar) {
            objM8 = new fyc(i52VarD5, 5);
            p65Var2.j0(objM8);
        }
        nk7.D(tzcVar, this.h, this.g, z52.b(r28VarN5, i52VarD7, (x45) objM8), p65Var2, 0);
        nzc nzcVar = tzcVar.g;
        boolean zF8 = p65Var2.f(i52VarD7);
        Object objM9 = p65Var2.M();
        if (zF8 || objM9 == uobVar) {
            objM9 = new fyc(i52VarD7, 6);
            p65Var2.j0(objM9);
        }
        aq7.g(nzcVar, this.i, this.h, z52.b(o28Var, i52VarD8, (x45) objM9), p65Var2, 0);
        p65Var2.p(false);
        if (z52Var.b != i) {
            kyd.v(this.c, p65Var2);
        }
        return c1eVar;
    }
}
