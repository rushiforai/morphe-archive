package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.Iterator;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fdg {
    public final kbg a;
    public final y3b b;
    public final adg c;
    public final String d = UUID.randomUUID().toString();

    public fdg(kbg kbgVar, y3b y3bVar, adg adgVar) {
        this.a = kbgVar;
        this.b = y3bVar;
        this.c = adgVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.wcg r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.ddg
            if (r0 == 0) goto L13
            r0 = r7
            ddg r0 = (defpackage.ddg) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ddg r0 = new ddg
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            c1e r3 = defpackage.c1e.a
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L29
            defpackage.br7.v(r7)     // Catch: java.lang.Exception -> L3c
            return r3
        L29:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L30:
            defpackage.br7.v(r7)
            r0.d = r4     // Catch: java.lang.Exception -> L3c
            java.lang.Object r5 = r6.a(r5, r0)     // Catch: java.lang.Exception -> L3c
            if (r5 != r1) goto L3c
            return r1
        L3c:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fdg.a(wcg, p92):java.lang.Object");
    }

    public final void b(jqf jqfVar, dqf dqfVar) {
        String str = this.c.c;
        if (dqfVar != null) {
            jqfVar.c();
            ((kqf) jqfVar.b).F(dqfVar);
        }
        kbg kbgVar = this.a;
        Iterator it2 = kbgVar.c.a.iterator();
        while (it2.hasNext()) {
            if (it2.next() != null) {
                rd6.m();
                return;
            } else {
                jqfVar.c();
                ((kqf) jqfVar.b).I(0);
            }
        }
        n92 n92Var = null;
        if (((kqf) jqfVar.b).x()) {
            ConcurrentHashMap concurrentHashMap = v4g.a;
            v4g.a(((kqf) jqfVar.b).y() + 20000, npf.b(((kqf) jqfVar.b).v()) * 1000);
        } else {
            ConcurrentHashMap concurrentHashMap2 = v4g.a;
            int iK = ((kqf) jqfVar.b).K();
            long jB = npf.b(((kqf) jqfVar.b).v()) * 1000;
            if (iK == 1) {
                tnf.a();
                throw null;
            }
            v4g.a(iK + 9998, jB);
        }
        qqf qqfVarA = kbgVar.b.a(str);
        jqfVar.c();
        ((kqf) jqfVar.b).G(qqfVarA);
        rtf rtfVarY = stf.y();
        rtfVarY.c();
        ((stf) rtfVarY.b).z((kqf) jqfVar.e());
        stf stfVar = (stf) rtfVarY.e();
        tag tagVar = kbgVar.a;
        vx0.c0((k92) ((uz5) tagVar.c).c, null, null, new iie(tagVar, stfVar, n92Var, 13), 3);
    }
}
