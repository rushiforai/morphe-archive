package defpackage;

import android.app.Application;
import android.os.Build;
import com.google.android.recaptcha.internal.zzfx;
import java.util.Timer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iie extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ iie(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
        this.d = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new iie((x45) this.c, (upc) obj2, n92Var, 0);
            case 1:
                return new iie((gle) this.c, (yle) obj2, n92Var, 1);
            case 2:
                return new iie((coe) this.c, (upc) obj2, n92Var, 2);
            case 3:
                return new iie((ioe) this.c, (coe) obj2, n92Var, 3);
            case 4:
                return new iie((vaf) this.c, (laf) obj2, n92Var, 4);
            case 5:
                return new iie((jhf) this.c, (kbb) obj2, n92Var, 5);
            case 6:
                return new iie((xzf) this.c, (jrf) obj2, n92Var, 6);
            case 7:
                iie iieVar = new iie((k0g) obj2, n92Var, 7);
                iieVar.c = obj;
                return iieVar;
            case 8:
                return new iie((arf) this.c, (r0g) obj2, n92Var, 8);
            case 9:
                return new iie((orf) this.c, (r0g) obj2, n92Var, 9);
            case 10:
                iie iieVar2 = new iie((x2g) obj2, n92Var, 10);
                iieVar2.c = obj;
                return iieVar2;
            case 11:
                iie iieVar3 = new iie((e4g) obj2, n92Var, 11);
                iieVar3.c = obj;
                return iieVar3;
            case 12:
                return new iie((x7g) this.c, (String) obj2, n92Var, 12);
            default:
                return new iie((tag) this.c, (stf) obj2, n92Var, 13);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws zzfx {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 1:
                ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 2:
                ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 3:
                ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 4:
                ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 5:
                return ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((iie) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((iie) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((iie) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                ((iie) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 10:
                ((iie) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 11:
                ((iie) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 12:
                return ((iie) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                ((iie) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        bjb bjbVar;
        String strV;
        int i = 12;
        n92 n92Var = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        switch (this.b) {
            case 0:
                br7.v(obj);
                x45 x45Var = (x45) this.c;
                Boolean bool = (Boolean) ((upc) this.d).getValue();
                bool.booleanValue();
                x45Var.invoke(bool);
                return c1e.a;
            case 1:
                br7.v(obj);
                ((gle) this.c).b.b(((yle) this.d).c);
                return c1e.a;
            case 2:
                br7.v(obj);
                if (((Boolean) ((upc) this.d).getValue()).booleanValue()) {
                    ((coe) this.c).b.a.e();
                }
                return c1e.a;
            case 3:
                br7.v(obj);
                if (!(((ioe) this.c) instanceof foe)) {
                    ooe ooeVar = ((coe) this.d).a;
                    ooeVar.h.j(ooeVar.b, gp7.u(ooeVar.p), ooeVar.o);
                }
                return c1e.a;
            case 4:
                br7.v(obj);
                uaf uafVar = ((vaf) this.c).b;
                if (uafVar instanceof taf) {
                    ((laf) this.d).b.b(((taf) uafVar).d);
                }
                return c1e.a;
            case 5:
                br7.v(obj);
                up8 up8Var = ((jhf) this.c).b;
                kbb kbbVar = (kbb) this.d;
                up8Var.getClass();
                return new cva(up8Var, kbbVar, false).d();
            case 6:
                d87 d87Var = d87.T0;
                br7.v(obj);
                xzf xzfVar = (xzf) this.c;
                if (((l5g) xzfVar.e).c() == 3) {
                    jrf jrfVar = (jrf) this.d;
                    if (jrfVar.z() && jrfVar.A().v().m() != 0) {
                        r16 r16Var = new r16();
                        Application application = (Application) xzfVar.c;
                        application.getClass();
                        b66 b66Var = new b66(application, b66.p, sy.T, yd5.c);
                        wv0 wv0VarB = wv0.b();
                        wv0VarB.e = new da4[]{r40.i};
                        wv0VarB.d = new nec(15, r16Var);
                        wv0VarB.b = 34001;
                        jrg jrgVarB = b66Var.b(0, wv0VarB.a());
                        jrgVarB.getClass();
                        xzfVar.d = vo7.Z(jrgVarB);
                        return new bjb(c1e.a);
                    }
                    bjbVar = new bjb(new ajb(new zzfx(d87Var, d87.P, (String) (objArr2 == true ? 1 : 0), i)));
                } else {
                    bjbVar = new bjb(new ajb(new zzfx(d87Var, d87.F, (String) (objArr == true ? 1 : 0), i)));
                }
                return bjbVar;
            case 7:
                br7.v(obj);
                fdg fdgVar = (fdg) this.c;
                int i2 = Build.VERSION.SDK_INT;
                wqf wqfVarV = xqf.v();
                String str = fdgVar.c.c;
                wqfVarV.c();
                ((xqf) wqfVarV.b).w(str);
                k0g k0gVar = (k0g) this.d;
                String packageName = k0gVar.a.getPackageName();
                wqfVarV.c();
                ((xqf) wqfVarV.b).x(packageName);
                l5g l5gVar = k0gVar.b;
                i = l5gVar.c() + (-2) == 1 ? 3 : 4;
                wqfVarV.c();
                ((xqf) wqfVarV.b).F(i);
                wqfVarV.c();
                ((xqf) wqfVarV.b).y("18.9.1");
                String strValueOf = String.valueOf(i2);
                wqfVarV.c();
                ((xqf) wqfVarV.b).z(strValueOf);
                String str2 = fdgVar.c.d;
                wqfVarV.c();
                ((xqf) wqfVarV.b).A(str2);
                boolean z = l5gVar.c() == 3;
                wqfVarV.c();
                ((xqf) wqfVarV.b).B(z);
                boolean zA = l5gVar.a();
                wqfVarV.c();
                ((xqf) wqfVarV.b).C(zA);
                String strB = l5gVar.b();
                wqfVarV.c();
                ((xqf) wqfVarV.b).D(strB);
                String strJ = nec.j();
                wqfVarV.c();
                ((xqf) wqfVarV.b).E(strJ);
                byte[] bArrD = ((xqf) wqfVarV.e()).d();
                String strD = yig.d.d(bArrD.length, bArrD);
                etf etfVarW = ktf.w();
                gtf gtfVarV = itf.v();
                gtfVarV.h(strD);
                etfVarW.h(d46.Q((itf) gtfVarV.e()));
                return en7.Z(k0gVar, (ktf) etfVarW.e());
            case 8:
                br7.v(obj);
                arf arfVar = (arf) this.c;
                if (arfVar == null || (strV = arfVar.v()) == null) {
                    strV = "";
                }
                r0g r0gVar = (r0g) this.d;
                etf etfVarW2 = ktf.w();
                gtf gtfVarV2 = itf.v();
                gtfVarV2.h(strV);
                etfVarW2.h(d46.Q(gtfVarV2.e()));
                return en7.Z(r0gVar, (ktf) etfVarW2.e());
            case 9:
                br7.v(obj);
                if (((orf) this.c).w().length() != 0) {
                    return c1e.a;
                }
                ((r0g) this.d).a = false;
                throw new zzfx(d87.T0, d87.y, (String) (objArr3 == true ? 1 : 0), i);
            case 10:
                br7.v(obj);
                fdg fdgVar2 = (fdg) this.c;
                x2g x2gVar = (x2g) this.d;
                if (!x2gVar.e) {
                    new Timer().schedule(new p2g(x2gVar, fdgVar2), 28800000L, 28800000L);
                    x2gVar.e = true;
                }
                return c1e.a;
            case 11:
                br7.v(obj);
                fdg fdgVar3 = (fdg) this.c;
                e4g e4gVar = (e4g) this.d;
                synchronized (fdgVar3) {
                    try {
                        o33 o33Var = e4gVar.b;
                        if (o33Var == null || o33Var.P()) {
                            e4gVar.b = vx0.G((k92) e4gVar.d.c, null, new t1g(fdgVar3, e4gVar, objArr4 == true ? 1 : 0, 6), 3);
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return c1e.a;
            case 12:
                br7.v(obj);
                x7g x7gVar = (x7g) this.c;
                if (g76.L(x7gVar.b, (String) this.d)) {
                    return x7gVar;
                }
                throw new zzfx(d87.V0, d87.B, (String) (objArr5 == true ? 1 : 0), i);
            default:
                br7.v(obj);
                try {
                    tag tagVar = (tag) this.c;
                    hha hhaVar = (hha) tagVar.a;
                    byte[] bArrD2 = ((stf) this.d).d();
                    hhaVar.x(d46.Q(new tbg(yig.c.d(bArrD2.length, bArrD2), 0, System.currentTimeMillis())));
                    vx0.c0((k92) ((uz5) tagVar.c).f, null, null, new qu6(tagVar, 20, n92Var, i), 3);
                    break;
                } catch (Exception unused) {
                }
                return c1e.a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ iie(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }
}
