package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o1c {
    public final g2c a;
    public final g2c b;

    public o1c(g2c g2cVar, g2c g2cVar2) {
        g2cVar.getClass();
        g2cVar2.getClass();
        this.a = g2cVar;
        this.b = g2cVar2;
    }

    public final double a() {
        Double d = this.a.d();
        if (d != null) {
            double dDoubleValue = d.doubleValue();
            if (0.0d <= dDoubleValue && dDoubleValue <= 1.0d) {
                return dDoubleValue;
            }
        }
        Double d2 = this.b.d();
        if (d2 != null) {
            double dDoubleValue2 = d2.doubleValue();
            if (0.0d <= dDoubleValue2 && dDoubleValue2 <= 1.0d) {
                return dDoubleValue2;
            }
        }
        return 1.0d;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004b, code lost:
    
        if (r5.b.b(r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.n1c
            if (r0 == 0) goto L13
            r0 = r6
            n1c r0 = (defpackage.n1c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            n1c r0 = new n1c
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L35
            if (r2 == r4) goto L31
            if (r2 != r3) goto L2a
            defpackage.br7.v(r6)
            goto L4e
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L31:
            defpackage.br7.v(r6)
            goto L43
        L35:
            defpackage.br7.v(r6)
            r0.d = r4
            g2c r6 = r5.a
            java.lang.Object r6 = r6.b(r0)
            if (r6 != r1) goto L43
            goto L4d
        L43:
            r0.d = r3
            g2c r5 = r5.b
            java.lang.Object r5 = r5.b(r0)
            if (r5 != r1) goto L4e
        L4d:
            return r1
        L4e:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o1c.b(p92):java.lang.Object");
    }
}
