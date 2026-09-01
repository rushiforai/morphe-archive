package defpackage;

import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hn8 {
    public final long[] b;
    public final boolean[] c;
    public volatile boolean d;
    public volatile boolean f;
    public final ReentrantLock a = new ReentrantLock();
    public final ReentrantLock e = new ReentrantLock();

    public hn8(int i) {
        this.b = new long[i];
        this.c = new boolean[i];
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean a(int[] r13) {
        /*
            r12 = this;
            java.util.concurrent.locks.ReentrantLock r0 = r12.a
            r0.lock()
            int r1 = r13.length     // Catch: java.lang.Throwable -> L21
            r2 = 0
            r3 = r2
            r4 = r3
        L9:
            r5 = 1
            if (r3 >= r1) goto L26
            r6 = r13[r3]     // Catch: java.lang.Throwable -> L21
            long[] r7 = r12.b     // Catch: java.lang.Throwable -> L21
            r8 = r7[r6]     // Catch: java.lang.Throwable -> L21
            r10 = 1
            long r10 = r10 + r8
            r7[r6] = r10     // Catch: java.lang.Throwable -> L21
            r6 = 0
            int r6 = (r8 > r6 ? 1 : (r8 == r6 ? 0 : -1))
            if (r6 != 0) goto L23
            r12.d = r5     // Catch: java.lang.Throwable -> L21
            r4 = r5
            goto L23
        L21:
            r12 = move-exception
            goto L35
        L23:
            int r3 = r3 + 1
            goto L9
        L26:
            if (r4 != 0) goto L30
            boolean r13 = r12.d     // Catch: java.lang.Throwable -> L21
            if (r13 != 0) goto L30
            boolean r12 = r12.f     // Catch: java.lang.Throwable -> L21
            if (r12 == 0) goto L31
        L30:
            r2 = r5
        L31:
            r0.unlock()
            return r2
        L35:
            r0.unlock()
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hn8.a(int[]):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0032  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean b(int[] r15) {
        /*
            r14 = this;
            r15.getClass()
            java.util.concurrent.locks.ReentrantLock r0 = r14.a
            r0.lock()
            int r1 = r15.length     // Catch: java.lang.Throwable -> L23
            r2 = 0
            r3 = r2
            r4 = r3
        Lc:
            r5 = 1
            if (r3 >= r1) goto L28
            r6 = r15[r3]     // Catch: java.lang.Throwable -> L23
            long[] r7 = r14.b     // Catch: java.lang.Throwable -> L23
            r8 = r7[r6]     // Catch: java.lang.Throwable -> L23
            r10 = 1
            long r12 = r8 - r10
            r7[r6] = r12     // Catch: java.lang.Throwable -> L23
            int r6 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r6 != 0) goto L25
            r14.d = r5     // Catch: java.lang.Throwable -> L23
            r4 = r5
            goto L25
        L23:
            r14 = move-exception
            goto L37
        L25:
            int r3 = r3 + 1
            goto Lc
        L28:
            if (r4 != 0) goto L32
            boolean r15 = r14.d     // Catch: java.lang.Throwable -> L23
            if (r15 != 0) goto L32
            boolean r14 = r14.f     // Catch: java.lang.Throwable -> L23
            if (r14 == 0) goto L33
        L32:
            r2 = r5
        L33:
            r0.unlock()
            return r2
        L37:
            r0.unlock()
            throw r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hn8.b(int[]):boolean");
    }
}
