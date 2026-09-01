package defpackage;

import android.graphics.ImageDecoder;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jqc implements lw2 {
    public final ImageDecoder.Source a;
    public final AutoCloseable b;
    public final ew8 c;
    public final oyb d;

    public jqc(ImageDecoder.Source source, AutoCloseable autoCloseable, ew8 ew8Var, oyb oybVar) {
        this.a = source;
        this.b = autoCloseable;
        this.c = ew8Var;
        this.d = oybVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.lw2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.n92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.iqc
            if (r0 == 0) goto L13
            r0 = r7
            iqc r0 = (defpackage.iqc) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            iqc r0 = new iqc
            p92 r7 = (defpackage.p92) r7
            r0.<init>(r6, r7)
        L1a:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            oyb r0 = r0.b
            defpackage.br7.v(r7)
            goto L43
        L2c:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L32:
            defpackage.br7.v(r7)
            oyb r7 = r6.d
            r0.b = r7
            r0.e = r4
            java.lang.Object r0 = r7.a(r0)
            if (r0 != r1) goto L42
            return r1
        L42:
            r0 = r7
        L43:
            java.lang.AutoCloseable r7 = r6.b     // Catch: java.lang.Throwable -> L68
            nya r1 = new nya     // Catch: java.lang.Throwable -> L6a
            r1.<init>()     // Catch: java.lang.Throwable -> L6a
            android.graphics.ImageDecoder$Source r2 = r6.a     // Catch: java.lang.Throwable -> L6a
            sv r5 = new sv     // Catch: java.lang.Throwable -> L6a
            r5.<init>(r6, r1, r4)     // Catch: java.lang.Throwable -> L6a
            android.graphics.Bitmap r6 = android.graphics.ImageDecoder.decodeBitmap(r2, r5)     // Catch: java.lang.Throwable -> L6a
            gw2 r2 = new gw2     // Catch: java.lang.Throwable -> L6a
            yr0 r4 = new yr0     // Catch: java.lang.Throwable -> L6a
            r4.<init>(r6)     // Catch: java.lang.Throwable -> L6a
            boolean r6 = r1.a     // Catch: java.lang.Throwable -> L6a
            r2.<init>(r4, r6)     // Catch: java.lang.Throwable -> L6a
            defpackage.xz5.F(r7, r3)     // Catch: java.lang.Throwable -> L68
            r0.c()
            return r2
        L68:
            r6 = move-exception
            goto L71
        L6a:
            r6 = move-exception
            throw r6     // Catch: java.lang.Throwable -> L6c
        L6c:
            r1 = move-exception
            defpackage.xz5.F(r7, r6)     // Catch: java.lang.Throwable -> L68
            throw r1     // Catch: java.lang.Throwable -> L68
        L71:
            r0.c()
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jqc.a(n92):java.lang.Object");
    }
}
