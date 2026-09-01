package defpackage;

import androidx.work.impl.yX.VrhD;
import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ir0 extends co6 implements b55 {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ BillingPeriod d;
    public final /* synthetic */ aw7 e;
    public final /* synthetic */ x45 f;
    public final /* synthetic */ String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ir0(l78 l78Var, z52 z52Var, m45 m45Var, BillingPeriod billingPeriod, aw7 aw7Var, x45 x45Var, String str) {
        super(2);
        this.a = l78Var;
        this.b = z52Var;
        this.c = m45Var;
        this.d = billingPeriod;
        this.e = aw7Var;
        this.f = x45Var;
        this.g = str;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue() & 3;
        c1e c1eVar = c1e.a;
        if (iIntValue == 2) {
            p65 p65Var = (p65) x12Var;
            if (p65Var.B()) {
                p65Var.S();
                return c1eVar;
            }
        }
        this.a.setValue(c1eVar);
        z52 z52Var = this.b;
        int i = z52Var.b;
        z52Var.f();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(1399613200);
        z52 z52Var2 = (z52) z52Var.e().b;
        i52 i52VarD = z52Var2.d();
        i52 i52VarD2 = z52Var2.d();
        BillingPeriod billingPeriod = BillingPeriod.ONE_YEAR;
        BillingPeriod billingPeriod2 = this.d;
        float f = billingPeriod2 == billingPeriod ? 1.0f : 0.0f;
        pj2 pj2Var = kr0.a;
        upc upcVarB = zu.b(f, f76.Q(200, 0, pj2Var, 2), VrhD.dqSDbCyWZn, p65Var2, 3120, 20);
        upc upcVarA = zu.a(billingPeriod2 == billingPeriod ? 4.0f : 0.0f, f76.Q(200, 0, pj2Var, 2), "Switch end corner size", p65Var2, 432, 8);
        upc upcVarA2 = zu.a(billingPeriod2 == billingPeriod ? 0.0f : 4.0f, f76.Q(200, 0, pj2Var, 2), "Switch start corner size", p65Var2, 432, 8);
        amb ambVarB = bmb.b(((vj3) upcVarA2.getValue()).a, ((vj3) upcVarA.getValue()).a, ((vj3) upcVarA.getValue()).a, ((vj3) upcVarA2.getValue()).a);
        amb ambVarA = bmb.a(4.0f);
        sn3 sn3Var = kt7.b;
        long j = ((zo7) p65Var2.j(sn3Var)).z;
        o28 o28Var = o28.b;
        r28 r28VarA0 = flb.a0(bo.B(o28Var, 1.0f, j, ambVarA), ((zo7) p65Var2.j(sn3Var)).c, ambVarA);
        Object objM = p65Var2.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = xx.c;
            p65Var2.j0(objM);
        }
        dy0.a(z52.b(r28VarA0, i52VarD, (x45) objM), p65Var2, 0);
        r28 r28VarA02 = flb.a0(bo.B(o28Var, 1.0f, ((zo7) p65Var2.j(sn3Var)).o, ambVarB), ((zo7) p65Var2.j(sn3Var)).a, ambVarB);
        boolean zF = p65Var2.f(upcVarB);
        Object objM2 = p65Var2.M();
        if (zF || objM2 == uobVar) {
            objM2 = new z(7, upcVarB);
            p65Var2.j0(objM2);
        }
        dy0.a(z52.b(r28VarA02, i52VarD2, (x45) objM2), p65Var2, 0);
        omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
        long j2 = p65Var2.T;
        int i2 = (int) (j2 ^ (j2 >>> 32));
        i89 i89VarL = p65Var2.l();
        r28 r28VarR = gx1.R(p65Var2, o28Var);
        r12.W.getClass();
        ot2 ot2Var = q12.b;
        p65Var2.c0();
        if (p65Var2.S) {
            p65Var2.k(ot2Var);
        } else {
            p65Var2.m0();
        }
        tp7.B(p65Var2, q12.f, ombVarA);
        tp7.B(p65Var2, q12.e, i89VarL);
        tp7.B(p65Var2, q12.g, Integer.valueOf(i2));
        tp7.y(p65Var2, q12.h);
        tp7.B(p65Var2, q12.d, r28VarR);
        BillingPeriod billingPeriod3 = BillingPeriod.ONE_MONTH;
        if (1.0f <= 0.0d) {
            z16.a("invalid weight; must be greater than zero");
        }
        kr0.b(54, p65Var2, this.f, this.e, bgf.N(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), "billing_period_switch_item_monthly"), billingPeriod3, null);
        if (1.0f <= 0.0d) {
            z16.a("invalid weight; must be greater than zero");
        }
        kr0.b(6, p65Var2, this.f, this.e, bgf.N(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), "billing_period_switch_item_yearly"), billingPeriod, this.g);
        p65Var2.p(true);
        p65Var2.p(false);
        if (z52Var.b != i) {
            kyd.v(this.c, p65Var2);
        }
        return c1eVar;
    }
}
