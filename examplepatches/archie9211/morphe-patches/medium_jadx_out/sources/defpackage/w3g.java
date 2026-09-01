package defpackage;

import android.app.Application;
import com.google.android.recaptcha.internal.zzfx;
import com.squareup.wire.internal.MathMethodsKt;
import j$.util.Optional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w3g extends iwf {
    public final Application b;
    public final nec c;
    public sv0 d;
    public final HashMap e = new HashMap();
    public List f;
    public o33 g;
    public jrf h;
    public final ms i;
    public final l5g j;
    public final e4g k;
    public final uz5 l;

    public w3g(Application application, uz5 uz5Var, tz7 tz7Var, e4g e4gVar, nec necVar, l5g l5gVar) {
        this.b = application;
        this.l = uz5Var;
        this.k = e4gVar;
        this.c = necVar;
        this.j = l5gVar;
        k92 k92Var = (k92) uz5Var.c;
        wjc wjcVar = new wjc(10);
        ms msVar = new ms();
        msVar.b = application;
        msVar.c = k92Var;
        msVar.d = wjcVar;
        application.registerActivityLifecycleCallbacks(new jvf(wjcVar));
        this.i = msVar;
    }

    public static final dsf h(String str, ysf ysfVar) {
        zrf zrfVarV = dsf.v();
        zrfVarV.h(str);
        urf urfVarV = vrf.v();
        urfVarV.c();
        ((vrf) urfVarV.b).w(ysfVar);
        zrfVarV.c();
        ((dsf) zrfVarV.b).B((vrf) urfVarV.e());
        return (dsf) zrfVarV.e();
    }

    public static final void i(w3g w3gVar, trf trfVar) {
        try {
            sv0 sv0Var = (sv0) w3gVar.c.b;
            w3gVar.d = sv0Var;
            byte[] bArrE = trfVar.v().E();
            ((iuf) sv0Var.c).c.b = mpg.e(bArrE);
            sv0 sv0Var2 = w3gVar.d;
            if (sv0Var2 == null) {
                sv0Var2 = null;
            }
            sv0Var2.l();
        } catch (Exception e) {
            throw new zzfx(d87.T0, d87.y0, e.getMessage(), e);
        }
    }

    @Override // defpackage.iwf
    public final ycg a(jrf jrfVar) {
        return new ycg(new ezf(this, jrfVar, (n92) null, 5));
    }

    @Override // defpackage.iwf
    public final ycg b(String str, arf arfVar) {
        return new ycg(new ezf(this, str, (n92) null, 4));
    }

    @Override // defpackage.iwf
    public final Object c(String str) {
        wsf wsfVarY = ysf.y();
        wsfVarY.c();
        ((ysf) wsfVarY.b).z(str);
        return h(str, (ysf) wsfVarY.e());
    }

    @Override // defpackage.iwf
    public final int d() {
        return 43;
    }

    @Override // defpackage.iwf
    public final int e() {
        return 44;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r8) {
        /*
            r7 = this;
            d87 r0 = defpackage.d87.z0
            d87 r1 = defpackage.d87.T0
            boolean r2 = r8 instanceof defpackage.i3g
            if (r2 == 0) goto L17
            r2 = r8
            i3g r2 = (defpackage.i3g) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            i3g r2 = new i3g
            r2.<init>(r7, r8)
        L1c:
            java.lang.Object r8 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 0
            r6 = 1
            if (r4 == 0) goto L34
            if (r4 != r6) goto L2e
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L2c
            goto L48
        L2c:
            r7 = move-exception
            goto L69
        L2e:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L34:
            defpackage.br7.v(r8)
            j$.util.Optional r8 = j$.util.Optional.empty()     // Catch: java.lang.Exception -> L2c
            o33 r7 = r7.j(r5, r8)     // Catch: java.lang.Exception -> L2c
            r2.d = r6     // Catch: java.lang.Exception -> L2c
            java.lang.Object r8 = r7.i(r2)     // Catch: java.lang.Exception -> L2c
            if (r8 != r3) goto L48
            return r3
        L48:
            bjb r8 = (defpackage.bjb) r8     // Catch: java.lang.Exception -> L2c
            java.lang.Object r7 = r8.a     // Catch: java.lang.Exception -> L2c
            defpackage.br7.v(r7)     // Catch: java.lang.Exception -> L2c
            boolean r8 = r7 instanceof java.util.List     // Catch: java.lang.Exception -> L2c
            if (r8 == 0) goto L56
            java.util.List r7 = (java.util.List) r7     // Catch: java.lang.Exception -> L2c
            goto L57
        L56:
            r7 = r5
        L57:
            if (r7 == 0) goto L61
            int r8 = r7.size()
            r2 = 2
            if (r8 < r2) goto L61
            return r7
        L61:
            com.google.android.recaptcha.internal.zzfx r7 = new com.google.android.recaptcha.internal.zzfx
            r8 = 12
            r7.<init>(r1, r0, r5, r8)
            throw r7
        L69:
            com.google.android.recaptcha.internal.zzfx r8 = new com.google.android.recaptcha.internal.zzfx
            java.lang.String r2 = r7.getMessage()
            r8.<init>(r1, r0, r2, r7)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w3g.f(p92):java.lang.Object");
    }

    public final void g(fdg fdgVar) {
        ArrayList arrayList;
        Object next;
        Object next2;
        Object obj = this.e.get(314);
        List list = obj instanceof List ? (List) obj : null;
        if (list != null) {
            arrayList = new ArrayList(cu1.k0(list, 10));
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                arrayList.add(ssf.y((byte[]) it2.next()));
            }
        } else {
            arrayList = null;
        }
        if (arrayList != null) {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Object obj2 : arrayList) {
                Long lValueOf = Long.valueOf(((ssf) obj2).v());
                Object arrayList2 = linkedHashMap.get(lValueOf);
                if (arrayList2 == null) {
                    arrayList2 = new ArrayList();
                    linkedHashMap.put(lValueOf, arrayList2);
                }
                ((List) arrayList2).add(obj2);
            }
            for (List list2 : linkedHashMap.values()) {
                Iterator it3 = list2.iterator();
                while (true) {
                    if (it3.hasNext()) {
                        next = it3.next();
                        if (((ssf) next).z() == 3) {
                            break;
                        }
                    } else {
                        next = null;
                        break;
                    }
                }
                ssf ssfVar = (ssf) next;
                Iterator it4 = list2.iterator();
                while (true) {
                    if (it4.hasNext()) {
                        next2 = it4.next();
                        if (((ssf) next2).z() == 4) {
                            break;
                        }
                    } else {
                        next2 = null;
                        break;
                    }
                }
                ssf ssfVar2 = (ssf) next2;
                if (ssfVar != null && ssfVar2 != null) {
                    int iA = ssfVar.A() - 2;
                    int i = iA != 1 ? iA != 2 ? 2 : 46 : 47;
                    jqf jqfVarZ = kqf.z();
                    long jX = ssfVar2.x() - ssfVar.x();
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).L(i);
                    String str = kbg.d;
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).B(str);
                    String str2 = fdgVar.d;
                    adg adgVar = fdgVar.c;
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).D(str2);
                    String str3 = adgVar.d;
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).C(str3);
                    int i2 = adgVar.e;
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).M(i2);
                    int iW = ssfVar.w();
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).J(iW);
                    int iB = ssfVar2.B() - 2;
                    int i3 = iB != 1 ? iB != 2 ? 2 : 4 : 3;
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).w(i3);
                    long jX2 = ssfVar.x();
                    dpf dpfVarB = opf.b((int) (jX2 % MathMethodsKt.NANOS_PER_SECOND), jX2 / MathMethodsKt.NANOS_PER_SECOND);
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).H(dpfVarB);
                    zmf zmfVarC = npf.c((int) (jX % MathMethodsKt.NANOS_PER_SECOND), jX / MathMethodsKt.NANOS_PER_SECOND);
                    jqfVarZ.c();
                    ((kqf) jqfVarZ.b).E(zmfVarC);
                    fdgVar.b(jqfVarZ, null);
                }
            }
        }
    }

    public final o33 j(Long l, Optional optional) {
        return vx0.G((k92) this.l.e, null, new lm1(l, this, optional, null, 15), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x00d7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void k(defpackage.adg r9) {
        /*
            Method dump skipped, instruction units count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w3g.k(adg):void");
    }
}
