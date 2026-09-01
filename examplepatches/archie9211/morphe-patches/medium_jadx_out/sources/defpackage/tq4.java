package defpackage;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tq4 extends AtomicInteger implements uq4, rxc {
    public final ywc a;
    public rxc b;
    public volatile boolean c;
    public Throwable d;
    public volatile boolean e;
    public final AtomicLong f = new AtomicLong();
    public final AtomicReference g = new AtomicReference();

    public tq4(ywc ywcVar) {
        this.a = ywcVar;
    }

    @Override // defpackage.ywc
    public final void a(rxc rxcVar) {
        if (yxc.validate(this.b, rxcVar)) {
            this.b = rxcVar;
            this.a.a(this);
            rxcVar.request(Long.MAX_VALUE);
        }
    }

    public final boolean b(boolean z, boolean z2, ywc ywcVar, AtomicReference atomicReference) {
        if (this.e) {
            atomicReference.lazySet(null);
            return true;
        }
        if (!z) {
            return false;
        }
        Throwable th = this.d;
        if (th != null) {
            atomicReference.lazySet(null);
            ywcVar.onError(th);
            return true;
        }
        if (!z2) {
            return false;
        }
        ywcVar.onComplete();
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x003e, code lost:
    
        if (r7 != r1.get()) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0040, code lost:
    
        r9 = r13.c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0046, code lost:
    
        if (r2.get() != null) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0048, code lost:
    
        r10 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x004d, code lost:
    
        if (b(r9, r10, r0, r2) == false) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0052, code lost:
    
        if (r7 == 0) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0054, code lost:
    
        defpackage.qb8.Q(r1, r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0057, code lost:
    
        r4 = addAndGet(-r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:?, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c() {
        /*
            r13 = this;
            int r0 = r13.getAndIncrement()
            if (r0 == 0) goto L7
            goto L5e
        L7:
            ywc r0 = r13.a
            java.util.concurrent.atomic.AtomicLong r1 = r13.f
            java.util.concurrent.atomic.AtomicReference r2 = r13.g
            r3 = 1
            r4 = r3
        Lf:
            r5 = 0
            r7 = r5
        L12:
            long r9 = r1.get()
            int r9 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            r10 = 0
            if (r9 == 0) goto L38
            boolean r9 = r13.c
            r11 = 0
            java.lang.Object r11 = r2.getAndSet(r11)
            if (r11 != 0) goto L26
            r12 = r3
            goto L27
        L26:
            r12 = r10
        L27:
            boolean r9 = r13.b(r9, r12, r0, r2)
            if (r9 == 0) goto L2e
            goto L5e
        L2e:
            if (r12 == 0) goto L31
            goto L38
        L31:
            r0.onNext(r11)
            r9 = 1
            long r7 = r7 + r9
            goto L12
        L38:
            long r11 = r1.get()
            int r9 = (r7 > r11 ? 1 : (r7 == r11 ? 0 : -1))
            if (r9 != 0) goto L50
            boolean r9 = r13.c
            java.lang.Object r11 = r2.get()
            if (r11 != 0) goto L49
            r10 = r3
        L49:
            boolean r9 = r13.b(r9, r10, r0, r2)
            if (r9 == 0) goto L50
            goto L5e
        L50:
            int r5 = (r7 > r5 ? 1 : (r7 == r5 ? 0 : -1))
            if (r5 == 0) goto L57
            defpackage.qb8.Q(r1, r7)
        L57:
            int r4 = -r4
            int r4 = r13.addAndGet(r4)
            if (r4 != 0) goto Lf
        L5e:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tq4.c():void");
    }

    @Override // defpackage.rxc
    public final void cancel() {
        if (this.e) {
            return;
        }
        this.e = true;
        this.b.cancel();
        if (getAndIncrement() == 0) {
            this.g.lazySet(null);
        }
    }

    @Override // defpackage.ywc
    public final void onComplete() {
        this.c = true;
        c();
    }

    @Override // defpackage.ywc
    public final void onError(Throwable th) {
        this.d = th;
        this.c = true;
        c();
    }

    @Override // defpackage.ywc
    public final void onNext(Object obj) {
        this.g.lazySet(obj);
        c();
    }

    @Override // defpackage.rxc
    public final void request(long j) {
        if (yxc.validate(j)) {
            qb8.y(this.f, j);
            c();
        }
    }
}
