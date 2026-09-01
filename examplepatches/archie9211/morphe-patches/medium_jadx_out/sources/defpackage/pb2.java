package defpackage;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pb2 extends Thread {
    public static final /* synthetic */ AtomicIntegerFieldUpdater i = AtomicIntegerFieldUpdater.newUpdater(pb2.class, "workerCtl$volatile");
    public static final /* synthetic */ long j = m80.a.objectFieldOffset(pb2.class.getDeclaredField("workerCtl$volatile"));
    public final w7f a;
    public final rya b;
    public qb2 c;
    public long d;
    public long e;
    public int f;
    public boolean g;
    public final /* synthetic */ rb2 h;
    private volatile int indexInArray;
    private volatile Object nextParkedWorker;
    private volatile /* synthetic */ int workerCtl$volatile;

    public pb2(rb2 rb2Var, int i2) {
        this.h = rb2Var;
        setDaemon(true);
        setContextClassLoader(rb2.class.getClassLoader());
        this.a = new w7f();
        this.b = new rya();
        this.c = qb2.DORMANT;
        this.nextParkedWorker = rb2.k;
        int iNanoTime = (int) System.nanoTime();
        this.f = iNanoTime == 0 ? 42 : iNanoTime;
        f(i2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004c, code lost:
    
        r1 = r3.getIntVolatile(r12, defpackage.w7f.e);
        r2 = r3.getIntVolatile(r12, defpackage.w7f.g);
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0058, code lost:
    
        if (r1 == r2) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0062, code lost:
    
        if (defpackage.m80.a.getIntVolatile(r12, defpackage.w7f.d) != 0) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0065, code lost:
    
        r2 = r2 - 1;
        r3 = r12.d(r2, true);
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x006b, code lost:
    
        if (r3 == null) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x006d, code lost:
    
        r9 = r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.vfd a(boolean r18) {
        /*
            Method dump skipped, instruction units count: 213
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pb2.a(boolean):vfd");
    }

    public final int b() {
        return this.indexInArray;
    }

    public final Object c() {
        return this.nextParkedWorker;
    }

    public final int d(int i2) {
        int i3 = this.f;
        int i4 = i3 ^ (i3 << 13);
        int i5 = i4 ^ (i4 >> 17);
        int i6 = i5 ^ (i5 << 5);
        this.f = i6;
        int i7 = i2 - 1;
        return (i7 & i2) == 0 ? i7 & i6 : (Integer.MAX_VALUE & i6) % i2;
    }

    public final vfd e() {
        int iD = d(2);
        rb2 rb2Var = this.h;
        pd5 pd5Var = rb2Var.f;
        pd5 pd5Var2 = rb2Var.e;
        if (iD == 0) {
            vfd vfdVar = (vfd) pd5Var2.d();
            return vfdVar != null ? vfdVar : (vfd) pd5Var.d();
        }
        vfd vfdVar2 = (vfd) pd5Var.d();
        return vfdVar2 != null ? vfdVar2 : (vfd) pd5Var2.d();
    }

    public final void f(int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append(this.h.d);
        sb.append("-worker-");
        sb.append(i2 == 0 ? "TERMINATED" : String.valueOf(i2));
        setName(sb.toString());
        this.indexInArray = i2;
    }

    public final void g(Object obj) {
        this.nextParkedWorker = obj;
    }

    public final boolean h(qb2 qb2Var) {
        qb2 qb2Var2 = this.c;
        boolean z = qb2Var2 == qb2.CPU_ACQUIRED;
        if (z) {
            rb2.i.addAndGet(this.h, 4398046511104L);
        }
        if (qb2Var2 != qb2Var) {
            this.c = qb2Var;
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0072, code lost:
    
        r7 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00ab, code lost:
    
        r1 = -2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.vfd i(int r29) {
        /*
            Method dump skipped, instruction units count: 282
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pb2.i(int):vfd");
    }

    /* JADX WARN: Code restructure failed: missing block: B:122:0x0004, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x0004, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x0004, code lost:
    
        continue;
     */
    @Override // java.lang.Thread, java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void run() {
        /*
            Method dump skipped, instruction units count: 428
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pb2.run():void");
    }
}
