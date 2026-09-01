package defpackage;

import java.util.concurrent.atomic.AtomicReferenceArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lk1 extends jwb {
    public final uz0 g;
    public final /* synthetic */ AtomicReferenceArray h;

    public lk1(long j, lk1 lk1Var, uz0 uz0Var, int i) {
        super(j, lk1Var, i);
        this.g = uz0Var;
        this.h = new AtomicReferenceArray(wz0.b * 2);
    }

    @Override // defpackage.jwb
    public final int g() {
        return wz0.b;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0047, code lost:
    
        n(r5, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x004a, code lost:
    
        if (r0 == false) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x004c, code lost:
    
        r2.getClass();
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x004f, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:?, code lost:
    
        return;
     */
    @Override // defpackage.jwb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void h(int r5, defpackage.ib2 r6) {
        /*
            r4 = this;
            int r6 = defpackage.wz0.b
            if (r5 < r6) goto L6
            r0 = 1
            goto L7
        L6:
            r0 = 0
        L7:
            if (r0 == 0) goto La
            int r5 = r5 - r6
        La:
            int r6 = r5 * 2
            java.util.concurrent.atomic.AtomicReferenceArray r1 = r4.h
            r1.get(r6)
        L11:
            java.lang.Object r6 = r4.l(r5)
            boolean r1 = r6 instanceof defpackage.xwe
            uz0 r2 = r4.g
            r3 = 0
            if (r1 != 0) goto L50
            boolean r1 = r6 instanceof defpackage.ywe
            if (r1 == 0) goto L21
            goto L50
        L21:
            d1g r1 = defpackage.wz0.j
            if (r6 == r1) goto L47
            d1g r1 = defpackage.wz0.k
            if (r6 != r1) goto L2a
            goto L47
        L2a:
            d1g r1 = defpackage.wz0.g
            if (r6 == r1) goto L11
            d1g r1 = defpackage.wz0.f
            if (r6 != r1) goto L33
            goto L11
        L33:
            d1g r4 = defpackage.wz0.i
            if (r6 == r4) goto L6a
            d1g r4 = defpackage.wz0.d
            if (r6 != r4) goto L3c
            goto L6a
        L3c:
            d1g r4 = defpackage.wz0.l
            if (r6 != r4) goto L41
            goto L6a
        L41:
            java.lang.String r4 = "unexpected state: "
            defpackage.ik4.m(r4, r6)
            return
        L47:
            r4.n(r5, r3)
            if (r0 == 0) goto L6a
            r2.getClass()
            return
        L50:
            if (r0 == 0) goto L55
            d1g r1 = defpackage.wz0.j
            goto L57
        L55:
            d1g r1 = defpackage.wz0.k
        L57:
            boolean r6 = r4.k(r6, r5, r1)
            if (r6 == 0) goto L11
            r4.n(r5, r3)
            r6 = r0 ^ 1
            r4.m(r5, r6)
            if (r0 == 0) goto L6a
            r2.getClass()
        L6a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lk1.h(int, ib2):void");
    }

    public final boolean k(Object obj, int i, Object obj2) {
        AtomicReferenceArray atomicReferenceArray;
        int i2 = (i * 2) + 1;
        do {
            atomicReferenceArray = this.h;
            if (atomicReferenceArray.compareAndSet(i2, obj, obj2)) {
                return true;
            }
        } while (atomicReferenceArray.get(i2) == obj);
        return false;
    }

    public final Object l(int i) {
        return this.h.get((i * 2) + 1);
    }

    public final void m(int i, boolean z) {
        if (z) {
            uz0 uz0Var = this.g;
            uz0Var.getClass();
            uz0Var.O((this.d * ((long) wz0.b)) + ((long) i));
        }
        i();
    }

    public final void n(int i, Object obj) {
        this.h.set(i * 2, obj);
    }

    public final void o(int i, Object obj) {
        this.h.set((i * 2) + 1, obj);
    }
}
