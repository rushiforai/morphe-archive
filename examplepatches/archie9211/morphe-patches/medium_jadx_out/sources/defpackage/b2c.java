package defpackage;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b2c {
    public final bmd a;
    public final tt2 b;
    public final AtomicReference c;

    public b2c(ib2 ib2Var, bmd bmdVar, tt2 tt2Var) {
        ib2Var.getClass();
        bmdVar.getClass();
        tt2Var.getClass();
        this.a = bmdVar;
        this.b = tt2Var;
        this.c = new AtomicReference();
        vx0.c0(o7f.c(ib2Var), null, null, new z1c(this, null, 0), 3);
    }

    public final q0c a() throws Throwable {
        AtomicReference atomicReference = this.c;
        if (atomicReference.get() == null) {
            Object objU = g01.U(zx3.a, new z1c(this, null, 1));
            while (!atomicReference.compareAndSet(null, objU) && atomicReference.get() == null) {
            }
        }
        Object obj = atomicReference.get();
        obj.getClass();
        return (q0c) obj;
    }

    public final boolean b() {
        Long l = a().e;
        Integer num = a().d;
        if (l == null || num == null) {
            return true;
        }
        this.a.getClass();
        return bmd.a().c - l.longValue() >= ((long) num.intValue());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.q0c r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.a2c
            if (r0 == 0) goto L13
            r0 = r7
            a2c r0 = (defpackage.a2c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            a2c r0 = new a2c
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)     // Catch: java.io.IOException -> L42
            goto L56
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            tt2 r5 = r5.b     // Catch: java.io.IOException -> L42
            obb r7 = new obb     // Catch: java.io.IOException -> L42
            r2 = 3
            r7.<init>(r6, r3, r2)     // Catch: java.io.IOException -> L42
            r0.d = r4     // Catch: java.io.IOException -> L42
            java.lang.Object r5 = r5.a(r7, r0)     // Catch: java.io.IOException -> L42
            if (r5 != r1) goto L56
            return r1
        L42:
            r5 = move-exception
            java.lang.StringBuilder r6 = new java.lang.StringBuilder
            java.lang.String r7 = "Failed to update config values: "
            r6.<init>(r7)
            r6.append(r5)
            java.lang.String r5 = r6.toString()
            java.lang.String r6 = "FirebaseSessions"
            android.util.Log.w(r6, r5)
        L56:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b2c.c(q0c, p92):java.lang.Object");
    }
}
