package defpackage;

import java.util.ArrayList;
import java.util.TimeZone;
import java.util.concurrent.RejectedExecutionException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bgd {
    public final cgd a;
    public final String b;
    public boolean c;
    public ufd d;
    public final ArrayList e = new ArrayList();
    public boolean f;

    public bgd(cgd cgdVar, String str) {
        this.a = cgdVar;
        this.b = str;
    }

    public static void c(bgd bgdVar, String str, long j, m45 m45Var, int i) {
        if ((i & 2) != 0) {
            j = 0;
        }
        boolean z = (i & 4) != 0;
        bgdVar.getClass();
        str.getClass();
        m45Var.getClass();
        bgdVar.d(new agd(str, z, m45Var), j);
    }

    public final void a() {
        cgd cgdVar = this.a;
        TimeZone timeZone = ggf.a;
        synchronized (cgdVar) {
            if (b()) {
                this.a.c(this);
            }
        }
    }

    public final boolean b() {
        ufd ufdVar = this.d;
        if (ufdVar != null && ufdVar.b) {
            this.f = true;
        }
        ArrayList arrayList = this.e;
        boolean z = false;
        for (int size = arrayList.size() - 1; -1 < size; size--) {
            if (((ufd) arrayList.get(size)).b) {
                Logger logger = this.a.b;
                ufd ufdVar2 = (ufd) arrayList.get(size);
                if (logger.isLoggable(Level.FINE)) {
                    kp7.n(logger, ufdVar2, this, "canceled");
                }
                arrayList.remove(size);
                z = true;
            }
        }
        return z;
    }

    public final void d(ufd ufdVar, long j) {
        ufdVar.getClass();
        synchronized (this.a) {
            if (!this.c) {
                if (f(ufdVar, j, false)) {
                    this.a.c(this);
                }
                return;
            }
            boolean z = ufdVar.b;
            Logger logger = this.a.b;
            if (z) {
                if (logger.isLoggable(Level.FINE)) {
                    kp7.n(logger, ufdVar, this, "schedule canceled (queue is shutdown)");
                }
            } else {
                if (logger.isLoggable(Level.FINE)) {
                    kp7.n(logger, ufdVar, this, "schedule failed (queue is shutdown)");
                }
                throw new RejectedExecutionException();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0085 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0079 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean f(defpackage.ufd r12, long r13, boolean r15) {
        /*
            r11 = this;
            cgd r0 = r11.a
            java.util.logging.Logger r0 = r0.b
            r12.getClass()
            bgd r1 = r12.c
            r2 = 0
            if (r1 != r11) goto Ld
            goto L11
        Ld:
            if (r1 != 0) goto L88
            r12.c = r11
        L11:
            long r3 = java.lang.System.nanoTime()
            long r5 = r3 + r13
            java.util.ArrayList r1 = r11.e
            int r7 = r1.indexOf(r12)
            r8 = -1
            if (r7 == r8) goto L37
            long r9 = r12.d
            int r9 = (r9 > r5 ? 1 : (r9 == r5 ? 0 : -1))
            if (r9 > 0) goto L34
            java.util.logging.Level r13 = java.util.logging.Level.FINE
            boolean r13 = r0.isLoggable(r13)
            if (r13 == 0) goto L87
            java.lang.String r13 = "already scheduled"
            defpackage.kp7.n(r0, r12, r11, r13)
            return r2
        L34:
            r1.remove(r7)
        L37:
            r12.d = r5
            java.util.logging.Level r7 = java.util.logging.Level.FINE
            boolean r7 = r0.isLoggable(r7)
            if (r7 == 0) goto L5d
            if (r15 == 0) goto L4f
            long r5 = r5 - r3
            java.lang.String r15 = defpackage.kp7.m(r5)
            java.lang.String r5 = "run again after "
            java.lang.String r15 = r5.concat(r15)
            goto L5a
        L4f:
            long r5 = r5 - r3
            java.lang.String r15 = defpackage.kp7.m(r5)
            java.lang.String r5 = "scheduled after "
            java.lang.String r15 = r5.concat(r15)
        L5a:
            defpackage.kp7.n(r0, r12, r11, r15)
        L5d:
            java.util.Iterator r11 = r1.iterator()
            r15 = r2
        L62:
            boolean r0 = r11.hasNext()
            if (r0 == 0) goto L79
            java.lang.Object r0 = r11.next()
            ufd r0 = (defpackage.ufd) r0
            long r5 = r0.d
            long r5 = r5 - r3
            int r0 = (r5 > r13 ? 1 : (r5 == r13 ? 0 : -1))
            if (r0 <= 0) goto L76
            goto L7a
        L76:
            int r15 = r15 + 1
            goto L62
        L79:
            r15 = r8
        L7a:
            if (r15 != r8) goto L80
            int r15 = r1.size()
        L80:
            r1.add(r15, r12)
            if (r15 != 0) goto L87
            r11 = 1
            return r11
        L87:
            return r2
        L88:
            java.lang.String r11 = "task is in multiple queues"
            defpackage.ygf.f(r11)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bgd.f(ufd, long, boolean):boolean");
    }

    public final void g() {
        cgd cgdVar = this.a;
        TimeZone timeZone = ggf.a;
        synchronized (cgdVar) {
            this.c = true;
            if (b()) {
                this.a.c(this);
            }
        }
    }

    public final String toString() {
        return this.b;
    }
}
