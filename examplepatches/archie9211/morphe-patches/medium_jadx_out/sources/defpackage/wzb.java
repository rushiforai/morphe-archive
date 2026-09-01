package defpackage;

import java.util.ArrayDeque;
import java.util.concurrent.Executor;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wzb implements Executor {
    public static final Logger f = Logger.getLogger(wzb.class.getName());
    public final Executor a;
    public final ArrayDeque b = new ArrayDeque();
    public vzb c = vzb.IDLE;
    public long d = 0;
    public final p0g e = new p0g(this);

    public wzb(Executor executor) {
        vp7.p(executor);
        this.a = executor;
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0062  */
    @Override // java.util.concurrent.Executor
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void execute(java.lang.Runnable r8) {
        /*
            r7 = this;
            defpackage.vp7.p(r8)
            java.util.ArrayDeque r0 = r7.b
            monitor-enter(r0)
            vzb r1 = r7.c     // Catch: java.lang.Throwable -> L6e
            vzb r2 = defpackage.vzb.RUNNING     // Catch: java.lang.Throwable -> L6e
            if (r1 == r2) goto L70
            vzb r2 = defpackage.vzb.QUEUED     // Catch: java.lang.Throwable -> L6e
            if (r1 != r2) goto L11
            goto L70
        L11:
            long r3 = r7.d     // Catch: java.lang.Throwable -> L6e
            t86 r1 = new t86     // Catch: java.lang.Throwable -> L6e
            r5 = 2
            r1.<init>(r5, r8)     // Catch: java.lang.Throwable -> L6e
            java.util.ArrayDeque r8 = r7.b     // Catch: java.lang.Throwable -> L6e
            r8.add(r1)     // Catch: java.lang.Throwable -> L6e
            vzb r8 = defpackage.vzb.QUEUING     // Catch: java.lang.Throwable -> L6e
            r7.c = r8     // Catch: java.lang.Throwable -> L6e
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L6e
            java.util.concurrent.Executor r0 = r7.a     // Catch: java.lang.Error -> L45 java.lang.RuntimeException -> L47
            p0g r5 = r7.e     // Catch: java.lang.Error -> L45 java.lang.RuntimeException -> L47
            r0.execute(r5)     // Catch: java.lang.Error -> L45 java.lang.RuntimeException -> L47
            vzb r0 = r7.c
            if (r0 == r8) goto L2f
            goto L6a
        L2f:
            java.util.ArrayDeque r0 = r7.b
            monitor-enter(r0)
            long r5 = r7.d     // Catch: java.lang.Throwable -> L3f
            int r1 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1))
            if (r1 != 0) goto L41
            vzb r1 = r7.c     // Catch: java.lang.Throwable -> L3f
            if (r1 != r8) goto L41
            r7.c = r2     // Catch: java.lang.Throwable -> L3f
            goto L41
        L3f:
            r7 = move-exception
            goto L43
        L41:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L3f
            return
        L43:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L3f
            throw r7
        L45:
            r8 = move-exception
            goto L48
        L47:
            r8 = move-exception
        L48:
            java.util.ArrayDeque r2 = r7.b
            monitor-enter(r2)
            vzb r0 = r7.c     // Catch: java.lang.Throwable -> L56
            vzb r3 = defpackage.vzb.IDLE     // Catch: java.lang.Throwable -> L56
            if (r0 == r3) goto L58
            vzb r3 = defpackage.vzb.QUEUING     // Catch: java.lang.Throwable -> L56
            if (r0 != r3) goto L62
            goto L58
        L56:
            r7 = move-exception
            goto L6c
        L58:
            java.util.ArrayDeque r7 = r7.b     // Catch: java.lang.Throwable -> L56
            boolean r7 = r7.removeLastOccurrence(r1)     // Catch: java.lang.Throwable -> L56
            if (r7 == 0) goto L62
            r7 = 1
            goto L63
        L62:
            r7 = 0
        L63:
            boolean r0 = r8 instanceof java.util.concurrent.RejectedExecutionException     // Catch: java.lang.Throwable -> L56
            if (r0 == 0) goto L6b
            if (r7 != 0) goto L6b
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L56
        L6a:
            return
        L6b:
            throw r8     // Catch: java.lang.Throwable -> L56
        L6c:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L56
            throw r7
        L6e:
            r7 = move-exception
            goto L77
        L70:
            java.util.ArrayDeque r7 = r7.b     // Catch: java.lang.Throwable -> L6e
            r7.add(r8)     // Catch: java.lang.Throwable -> L6e
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L6e
            return
        L77:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L6e
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wzb.execute(java.lang.Runnable):void");
    }

    public final String toString() {
        return "SequentialExecutor@" + System.identityHashCode(this) + "{" + this.a + "}";
    }
}
