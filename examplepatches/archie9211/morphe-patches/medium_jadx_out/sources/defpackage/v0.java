package defpackage;

import java.util.concurrent.RejectedExecutionException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class v0 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ v0(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0362  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0446  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x038e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:290:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r0v111, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v113, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [java.lang.String] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final void a() {
        /*
            Method dump skipped, instruction units count: 1576
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v0.a():void");
    }

    private final void b() {
        ma6 ma6Var = (ma6) this.b;
        synchronized (ma6Var.c) {
            try {
                if (ma6Var.d) {
                    return;
                }
                Runnable runnable = (Runnable) ma6Var.c.pollFirst();
                ma6Var.d = runnable != null;
                while (runnable != null) {
                    try {
                        runnable.run();
                        synchronized (ma6Var.c) {
                            runnable = (Runnable) ma6Var.c.pollFirst();
                            ma6Var.d = runnable != null;
                        }
                    } catch (Throwable th) {
                        synchronized (ma6Var.c) {
                            ma6Var.d = false;
                            try {
                                ma6Var.a.execute(ma6Var.b);
                            } catch (RejectedExecutionException unused) {
                            }
                            throw th;
                        }
                    }
                }
            } finally {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:276:0x04d1, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:278:0x04d5, code lost:
    
        throw r0;
     */
    /* JADX WARN: Removed duplicated region for block: B:178:0x0285  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x028d  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x048e  */
    /* JADX WARN: Removed duplicated region for block: B:375:0x03c1 A[SYNTHETIC] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void run() {
        /*
            Method dump skipped, instruction units count: 1524
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v0.run():void");
    }
}
