package defpackage;

import android.content.Context;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rp7 {
    public final Context a;
    public final hha b;
    public final kb2 c;
    public final a98 d = new a98();
    public final ReentrantLock e = new ReentrantLock();
    public kg3 f;

    public rp7(Context context, hha hhaVar, kb2 kb2Var) {
        this.a = context;
        this.b = hhaVar;
        this.c = kb2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r11, java.lang.Class r12, defpackage.p92 r13) {
        /*
            r10 = this;
            boolean r0 = r13 instanceof defpackage.np7
            if (r0 == 0) goto L13
            r0 = r13
            np7 r0 = (defpackage.np7) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            np7 r0 = new np7
            r0.<init>(r10, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r13)
            goto L46
        L27:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2e:
            defpackage.br7.v(r13)
            uc0 r4 = new uc0
            r9 = 3
            r8 = 0
            r5 = r10
            r6 = r11
            r7 = r12
            r4.<init>(r5, r6, r7, r8, r9)
            r0.d = r3
            kb2 r10 = r5.c
            java.lang.Object r13 = defpackage.vx0.m0(r10, r4, r0)
            if (r13 != r1) goto L46
            return r1
        L46:
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r10 = r13.a
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rp7.a(java.lang.String, java.lang.Class, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r11, java.lang.Class r12, long r13, defpackage.p92 r15) {
        /*
            r10 = this;
            boolean r0 = r15 instanceof defpackage.op7
            if (r0 == 0) goto L13
            r0 = r15
            op7 r0 = (defpackage.op7) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            op7 r0 = new op7
            r0.<init>(r10, r15)
        L18:
            java.lang.Object r15 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L41
            if (r2 == r4) goto L35
            if (r2 != r3) goto L2f
            defpackage.br7.v(r15)     // Catch: java.lang.Throwable -> L7c
            bjb r15 = (defpackage.bjb) r15     // Catch: java.lang.Throwable -> L7c
            java.lang.Object r10 = r15.a     // Catch: java.lang.Throwable -> L7c
            return r5
        L2f:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r5
        L35:
            long r13 = r0.c
            java.lang.String r11 = r0.b
            defpackage.br7.v(r15)
            bjb r15 = (defpackage.bjb) r15
            java.lang.Object r12 = r15.a
            goto L51
        L41:
            defpackage.br7.v(r15)
            r0.b = r11
            r0.c = r13
            r0.f = r4
            java.lang.Object r12 = r10.a(r11, r12, r0)
            if (r12 != r1) goto L51
            goto L75
        L51:
            boolean r15 = r12 instanceof defpackage.ajb
            if (r15 != 0) goto L83
            lp7 r12 = (defpackage.lp7) r12     // Catch: java.lang.Throwable -> L7c
            if (r12 == 0) goto L76
            long r6 = r12.a     // Catch: java.lang.Throwable -> L7c
            long r6 = r6 + r13
            int r15 = (r6 > r13 ? 1 : (r6 == r13 ? 0 : -1))
            if (r15 >= 0) goto L61
            goto L76
        L61:
            long r8 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L7c
            int r15 = (r6 > r8 ? 1 : (r6 == r8 ? 0 : -1))
            if (r15 >= 0) goto L76
            r0.b = r5     // Catch: java.lang.Throwable -> L7c
            r0.c = r13     // Catch: java.lang.Throwable -> L7c
            r0.f = r3     // Catch: java.lang.Throwable -> L7c
            java.lang.Object r10 = r10.d(r11, r0)     // Catch: java.lang.Throwable -> L7c
            if (r10 != r1) goto L7b
        L75:
            return r1
        L76:
            if (r12 == 0) goto L7b
            java.lang.Object r10 = r12.b     // Catch: java.lang.Throwable -> L7c
            return r10
        L7b:
            return r5
        L7c:
            r10 = move-exception
            ajb r11 = new ajb
            r11.<init>(r10)
            return r11
        L83:
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rp7.b(java.lang.String, java.lang.Class, long, p92):java.lang.Object");
    }

    public final kg3 c() {
        ReentrantLock reentrantLock = this.e;
        reentrantLock.lock();
        try {
            kg3 kg3VarQ = this.f;
            if (kg3VarQ == null) {
                kg3VarQ = kp7.q(this.a);
                this.f = kg3VarQ;
            }
            return kg3VarQ;
        } finally {
            reentrantLock.unlock();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.pp7
            if (r0 == 0) goto L13
            r0 = r7
            pp7 r0 = (defpackage.pp7) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            pp7 r0 = new pp7
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)
            goto L43
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            yu r7 = new yu
            r2 = 10
            r7.<init>(r5, r6, r3, r2)
            r0.d = r4
            kb2 r5 = r5.c
            java.lang.Object r7 = defpackage.vx0.m0(r5, r7, r0)
            if (r7 != r1) goto L43
            return r1
        L43:
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rp7.d(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r11, defpackage.k08 r12, defpackage.p92 r13) {
        /*
            r10 = this;
            boolean r0 = r13 instanceof defpackage.qp7
            if (r0 == 0) goto L13
            r0 = r13
            qp7 r0 = (defpackage.qp7) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qp7 r0 = new qp7
            r0.<init>(r10, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r13)
            goto L46
        L27:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2e:
            defpackage.br7.v(r13)
            uc0 r4 = new uc0
            r9 = 4
            r8 = 0
            r5 = r10
            r6 = r11
            r7 = r12
            r4.<init>(r5, r6, r7, r8, r9)
            r0.d = r3
            kb2 r10 = r5.c
            java.lang.Object r13 = defpackage.vx0.m0(r10, r4, r0)
            if (r13 != r1) goto L46
            return r1
        L46:
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r10 = r13.a
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rp7.e(java.lang.String, k08, p92):java.lang.Object");
    }
}
