package defpackage;

import java.util.concurrent.locks.ReentrantReadWriteLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zw2 implements m00 {
    public final y3b b;
    public final cd7 c;
    public final r6c d;
    public final uua e;
    public final w5d f;
    public final my6 g;

    public zw2(wz7 wz7Var, y3b y3bVar, cd7 cd7Var) {
        this.b = y3bVar;
        this.c = cd7Var;
        r6c r6cVarX = k40.x(64, 1, nz0.SUSPEND);
        this.d = r6cVarX;
        this.e = bo.z(r6cVarX);
        this.f = new w5d(new n7(wz7Var));
        this.g = new my6(1, false);
    }

    public final vv8 a() {
        return (vv8) this.f.getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0010  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.util.Set r2, defpackage.p92 r3) {
        /*
            r1 = this;
            boolean r0 = r2.isEmpty()
            if (r0 == 0) goto L10
            tz7 r0 = defpackage.m00.a
            r0.getClass()
            l00 r0 = defpackage.tz7.e
            if (r2 == r0) goto L10
            goto L1b
        L10:
            r6c r1 = r1.d
            java.lang.Object r1 = r1.a(r2, r3)
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r1 != r2) goto L1b
            return r1
        L1b:
            c1e r1 = defpackage.c1e.a
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zw2.b(java.util.Set, p92):java.lang.Object");
    }

    public final g15 c(i15 i15Var, i31 i31Var, yl2 yl2Var, f31 f31Var) {
        yl2Var.getClass();
        f31Var.getClass();
        l44 l44VarL = o7f.L(i15Var, yl2Var);
        ReentrantReadWriteLock.ReadLock lock = ((ReentrantReadWriteLock) this.g.a).readLock();
        lock.lock();
        try {
            vv8 vv8VarA = a();
            cd7 cd7Var = this.c;
            vv8VarA.getClass();
            y21 y21VarV = kp7.v(i15Var, i31Var, vv8VarA, cd7Var, f31Var, l44VarL);
            lock.unlock();
            return (g15) kp7.E(y21VarV, i15Var.adapter(), yl2Var, l44VarL);
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    public final du8 d(hv8 hv8Var, yl2 yl2Var, f31 f31Var) {
        yl2Var.getClass();
        f31Var.getClass();
        l44 l44VarL = o7f.L(hv8Var, yl2Var);
        ReentrantReadWriteLock.ReadLock lock = ((ReentrantReadWriteLock) this.g.a).readLock();
        lock.lock();
        try {
            vv8 vv8VarA = a();
            cd7 cd7Var = this.c;
            vv8VarA.getClass();
            y21 y21VarV = kp7.v(hv8Var, i31.b, vv8VarA, cd7Var, f31Var, l44VarL);
            lock.unlock();
            return (du8) kp7.E(y21VarV, hv8Var.adapter(), yl2Var, l44VarL);
        } catch (Throwable th) {
            lock.unlock();
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.util.UUID r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.vw2
            if (r0 == 0) goto L13
            r0 = r6
            vw2 r0 = (defpackage.vw2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            vw2 r0 = new vw2
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            int r0 = r0.d
            if (r0 == 0) goto L2c
            r4 = 0
            r5 = 1
            if (r0 != r5) goto L26
            defpackage.br7.v(r6)
            return r4
        L26:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L2c:
            defpackage.br7.v(r6)
            r5.getClass()
            gf2 r6 = new gf2
            r0 = 20
            r6.<init>(r4, r0, r5)
            my6 r4 = r4.g
            java.lang.Object r4 = r4.N(r6)
            java.util.Set r4 = (java.util.Set) r4
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zw2.e(java.util.UUID, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.i15 r5, defpackage.i31 r6, defpackage.g15 r7, defpackage.yl2 r8, defpackage.f31 r9, boolean r10, defpackage.p92 r11) {
        /*
            r4 = this;
            boolean r0 = r11 instanceof defpackage.ww2
            if (r0 == 0) goto L13
            r0 = r11
            ww2 r0 = (defpackage.ww2) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            ww2 r0 = new ww2
            r0.<init>(r4, r11)
        L18:
            java.lang.Object r11 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            java.util.Set r4 = r0.b
            java.util.Set r4 = (java.util.Set) r4
            defpackage.br7.v(r11)
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r11)
            r5.getClass()
            r6.getClass()
            r7.getClass()
            r8.getClass()
            r9.getClass()
            y3b r11 = r4.b
            java.lang.String r6 = r6.a
            java.util.LinkedHashMap r5 = defpackage.kp7.o(r5, r7, r8, r11, r6)
            java.util.Collection r5 = r5.values()
            uw2 r6 = new uw2
            r6.<init>(r4, r5, r9, r3)
            my6 r5 = r4.g
            java.lang.Object r5 = r5.N(r6)
            java.util.Set r5 = (java.util.Set) r5
            if (r10 == 0) goto L6d
            r6 = r5
            java.util.Set r6 = (java.util.Set) r6
            r0.b = r6
            r0.e = r3
            java.lang.Object r4 = r4.b(r5, r0)
            if (r4 != r1) goto L6d
            return r1
        L6d:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zw2.f(i15, i31, g15, yl2, f31, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.hv8 r5, defpackage.du8 r6, defpackage.yl2 r7, defpackage.f31 r8, boolean r9, defpackage.p92 r10) {
        /*
            r4 = this;
            boolean r0 = r10 instanceof defpackage.xw2
            if (r0 == 0) goto L13
            r0 = r10
            xw2 r0 = (defpackage.xw2) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            xw2 r0 = new xw2
            r0.<init>(r4, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            java.util.Set r4 = r0.b
            java.util.Set r4 = (java.util.Set) r4
            defpackage.br7.v(r10)
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r10)
            r5.getClass()
            r6.getClass()
            r7.getClass()
            r8.getClass()
            y3b r10 = r4.b
            java.util.LinkedHashMap r5 = defpackage.kp7.p(r5, r6, r7, r10)
            java.util.Collection r5 = r5.values()
            uw2 r6 = new uw2
            r7 = 0
            r6.<init>(r4, r5, r8, r7)
            my6 r5 = r4.g
            java.lang.Object r5 = r5.N(r6)
            java.util.Set r5 = (java.util.Set) r5
            if (r9 == 0) goto L69
            r6 = r5
            java.util.Set r6 = (java.util.Set) r6
            r0.b = r6
            r0.e = r3
            java.lang.Object r4 = r4.b(r5, r0)
            if (r4 != r1) goto L69
            return r1
        L69:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zw2.g(hv8, du8, yl2, f31, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(defpackage.hv8 r5, defpackage.u78 r6, java.util.UUID r7, defpackage.yl2 r8, boolean r9, defpackage.p92 r10) {
        /*
            r4 = this;
            boolean r0 = r10 instanceof defpackage.yw2
            if (r0 == 0) goto L13
            r0 = r10
            yw2 r0 = (defpackage.yw2) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            yw2 r0 = new yw2
            r0.<init>(r4, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            java.util.Set r4 = r0.b
            java.util.Set r4 = (java.util.Set) r4
            defpackage.br7.v(r10)
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r10)
            r5.getClass()
            r6.getClass()
            r7.getClass()
            r8.getClass()
            y3b r10 = r4.b
            java.util.LinkedHashMap r5 = defpackage.kp7.p(r5, r6, r8, r10)
            java.util.Collection r5 = r5.values()
            java.lang.Iterable r5 = (java.lang.Iterable) r5
            java.util.ArrayList r6 = new java.util.ArrayList
            r8 = 10
            int r8 = defpackage.cu1.k0(r5, r8)
            r6.<init>(r8)
            java.util.Iterator r5 = r5.iterator()
        L5c:
            boolean r8 = r5.hasNext()
            if (r8 == 0) goto L75
            java.lang.Object r8 = r5.next()
            twa r8 = (defpackage.twa) r8
            twa r10 = new twa
            java.lang.String r2 = r8.a
            java.util.Map r8 = r8.b
            r10.<init>(r2, r8, r7)
            r6.add(r10)
            goto L5c
        L75:
            gf2 r5 = new gf2
            r7 = 21
            r5.<init>(r4, r7, r6)
            my6 r6 = r4.g
            java.lang.Object r5 = r6.N(r5)
            java.util.Set r5 = (java.util.Set) r5
            if (r9 == 0) goto L94
            r6 = r5
            java.util.Set r6 = (java.util.Set) r6
            r0.b = r6
            r0.e = r3
            java.lang.Object r4 = r4.b(r5, r0)
            if (r4 != r1) goto L94
            return r1
        L94:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zw2.h(hv8, u78, java.util.UUID, yl2, boolean, p92):java.lang.Object");
    }
}
