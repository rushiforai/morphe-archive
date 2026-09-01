package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nh4 extends ug4 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.Object r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.mh4
            if (r0 == 0) goto L13
            r0 = r8
            mh4 r0 = (defpackage.mh4) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            mh4 r0 = new mh4
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            c1e r3 = defpackage.c1e.a
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L36
            if (r2 != r4) goto L30
            java.io.FileOutputStream r6 = r0.c
            java.io.FileOutputStream r7 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L2e
            goto L5d
        L2e:
            r6 = move-exception
            goto L6a
        L30:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L36:
            defpackage.br7.v(r8)
            java.util.concurrent.atomic.AtomicBoolean r8 = r6.c
            boolean r8 = r8.get()
            if (r8 != 0) goto L70
            java.io.FileOutputStream r8 = new java.io.FileOutputStream
            java.io.File r2 = r6.a
            r8.<init>(r2)
            i0c r6 = r6.b     // Catch: java.lang.Throwable -> L68
            jz0 r2 = new jz0     // Catch: java.lang.Throwable -> L68
            r2.<init>(r8)     // Catch: java.lang.Throwable -> L68
            r0.b = r8     // Catch: java.lang.Throwable -> L68
            r0.c = r8     // Catch: java.lang.Throwable -> L68
            r0.f = r4     // Catch: java.lang.Throwable -> L68
            r6.y(r7, r2)     // Catch: java.lang.Throwable -> L68
            if (r3 != r1) goto L5b
            return r1
        L5b:
            r6 = r8
            r7 = r6
        L5d:
            java.io.FileDescriptor r6 = r6.getFD()     // Catch: java.lang.Throwable -> L2e
            r6.sync()     // Catch: java.lang.Throwable -> L2e
            defpackage.k50.X(r7, r5)
            return r3
        L68:
            r6 = move-exception
            r7 = r8
        L6a:
            throw r6     // Catch: java.lang.Throwable -> L6b
        L6b:
            r8 = move-exception
            defpackage.k50.X(r7, r6)
            throw r8
        L70:
            java.lang.String r6 = "This scope has already been closed."
            defpackage.ygf.f(r6)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nh4.b(java.lang.Object, p92):java.lang.Object");
    }
}
