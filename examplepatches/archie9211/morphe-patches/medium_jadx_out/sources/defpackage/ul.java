package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ul {
    public final k49 c;
    public final k49 d;
    public final g49 g;
    public final k49 h;
    public final k49 i;
    public final pl j;
    public final b5 a = new b5(28);
    public final z78 b = new z78();
    public final j83 e = bjc.b(new fl(this, 0));
    public final g49 f = new g49(Float.NaN);

    public ul(j45 j45Var) {
        this.c = qo7.u(j45Var);
        this.d = qo7.u(j45Var);
        new x90(0);
        uic.h().g();
        om8.a.getClass();
        this.g = new g49(0.0f);
        this.h = qo7.u(null);
        this.i = qo7.u(new ry2(ey3.a, new float[0]));
        this.j = new pl(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r12, defpackage.s78 r13, defpackage.d55 r14, defpackage.p92 r15) {
        /*
            r11 = this;
            boolean r0 = r15 instanceof defpackage.ll
            if (r0 == 0) goto L13
            r0 = r15
            ll r0 = (defpackage.ll) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ll r0 = new ll
            r0.<init>(r11, r15)
        L18:
            java.lang.Object r15 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            k49 r3 = r11.h
            r4 = 1
            r9 = 0
            if (r2 == 0) goto L34
            if (r2 != r4) goto L2d
            defpackage.br7.v(r15)     // Catch: java.lang.Throwable -> L2a
            goto L65
        L2a:
            r0 = move-exception
            r11 = r0
            goto L69
        L2d:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L34:
            defpackage.br7.v(r15)
            ry2 r15 = r11.b()
            java.util.List r15 = r15.a
            int r15 = r15.indexOf(r12)
            r2 = -1
            if (r15 == r2) goto L6d
            z78 r15 = r11.b     // Catch: java.lang.Throwable -> L2a
            ml r5 = new ml     // Catch: java.lang.Throwable -> L2a
            r10 = 2
            r6 = r11
            r7 = r12
            r8 = r14
            r5.<init>(r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L2a
            r0.d = r4     // Catch: java.lang.Throwable -> L2a
            r15.getClass()     // Catch: java.lang.Throwable -> L2a
            r8 = r5
            nz r5 = new nz     // Catch: java.lang.Throwable -> L2a
            r10 = 10
            r6 = r13
            r7 = r15
            r5.<init>(r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L2a
            java.lang.Object r11 = defpackage.o7f.s(r5, r0)     // Catch: java.lang.Throwable -> L2a
            if (r11 != r1) goto L65
            return r1
        L65:
            r3.setValue(r9)
            goto L79
        L69:
            r3.setValue(r9)
            throw r11
        L6d:
            r6 = r11
            r7 = r12
            k49 r11 = r6.d
            r11.setValue(r7)
            k49 r11 = r6.c
            r11.setValue(r7)
        L79:
            c1e r11 = defpackage.c1e.a
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ul.a(java.lang.Object, s78, d55, p92):java.lang.Object");
    }

    public final ry2 b() {
        return (ry2) this.i.getValue();
    }

    public final float c(float f) {
        float fMin;
        g49 g49Var = this.f;
        float fG = (Float.isNaN(g49Var.g()) ? 0.0f : g49Var.g()) + f;
        float[] fArr = b().b;
        float fMax = Float.NaN;
        int i = 1;
        if (fArr.length == 0) {
            fMin = Float.NaN;
        } else {
            fMin = fArr[0];
            int length = fArr.length - 1;
            if (1 <= length) {
                int i2 = 1;
                while (true) {
                    fMin = Math.min(fMin, fArr[i2]);
                    if (i2 == length) {
                        break;
                    }
                    i2++;
                }
            }
        }
        float[] fArr2 = b().b;
        if (fArr2.length != 0) {
            fMax = fArr2[0];
            int length2 = fArr2.length - 1;
            if (1 <= length2) {
                while (true) {
                    fMax = Math.max(fMax, fArr2[i]);
                    if (i == length2) {
                        break;
                    }
                    i++;
                }
            }
        }
        return iq7.u(fG, fMin, fMax);
    }
}
