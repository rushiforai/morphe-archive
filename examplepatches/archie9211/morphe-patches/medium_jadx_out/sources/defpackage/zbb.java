package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zbb {
    public long a;
    public int b;

    public final synchronized long a(int i) {
        if (i != 429 && (i < 500 || i >= 600)) {
            return 86400000L;
        }
        return (long) Math.min(Math.pow(2.0d, this.b) + ((long) (Math.random() * 1000.0d)), 1800000.0d);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized boolean b() {
        /*
            r4 = this;
            monitor-enter(r4)
            int r0 = r4.b     // Catch: java.lang.Throwable -> L12
            if (r0 == 0) goto L14
            long r0 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L12
            long r2 = r4.a     // Catch: java.lang.Throwable -> L12
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 <= 0) goto L10
            goto L14
        L10:
            r0 = 0
            goto L15
        L12:
            r0 = move-exception
            goto L17
        L14:
            r0 = 1
        L15:
            monitor-exit(r4)
            return r0
        L17:
            monitor-exit(r4)     // Catch: java.lang.Throwable -> L12
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zbb.b():boolean");
    }

    public final synchronized void c() {
        this.b = 0;
    }

    public final synchronized void d(int i) {
        if ((i >= 200 && i < 300) || i == 401 || i == 404) {
            c();
            return;
        }
        this.b++;
        this.a = System.currentTimeMillis() + a(i);
    }
}
