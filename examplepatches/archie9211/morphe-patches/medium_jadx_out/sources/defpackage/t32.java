package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t32 extends uz0 {
    public final nz0 q;

    public t32(int i, nz0 nz0Var) {
        super(i);
        this.q = nz0Var;
        if (nz0Var == nz0.SUSPEND) {
            rd6.v("This implementation does not support suspension for senders, use ", n1b.a.b(uz0.class).j(), " instead");
            throw null;
        }
        if (i >= 1) {
            return;
        }
        ywb.g(ev6.w("Buffered channel capacity must be at least 1, but ", i, " was specified"));
        throw null;
    }

    @Override // defpackage.uz0
    public final boolean B() {
        return this.q == nz0.DROP_OLDEST;
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x00b2, code lost:
    
        return r8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object P(java.lang.Object r16, boolean r17) {
        /*
            r15 = this;
            nz0 r1 = r15.q
            nz0 r2 = defpackage.nz0.DROP_LATEST
            c1e r8 = defpackage.c1e.a
            if (r1 != r2) goto L17
            java.lang.Object r0 = super.e(r16)
            boolean r1 = r0 instanceof defpackage.jk1
            if (r1 == 0) goto L16
            boolean r1 = r0 instanceof defpackage.ik1
            if (r1 == 0) goto L15
            goto L16
        L15:
            return r8
        L16:
            return r0
        L17:
            d1g r6 = defpackage.wz0.d
            java.util.concurrent.atomic.AtomicReferenceFieldUpdater r1 = defpackage.uz0.f
            java.lang.Object r1 = r1.get(r15)
            lk1 r1 = (defpackage.lk1) r1
        L21:
            java.util.concurrent.atomic.AtomicLongFieldUpdater r2 = defpackage.uz0.b
            long r2 = r2.getAndIncrement(r15)
            r4 = 1152921504606846975(0xfffffffffffffff, double:1.2882297539194265E-231)
            long r4 = r4 & r2
            r7 = 0
            boolean r7 = r15.y(r2, r7)
            int r9 = defpackage.wz0.b
            long r10 = (long) r9
            long r2 = r4 / r10
            long r12 = r4 % r10
            int r12 = (int) r12
            long r13 = r1.d
            int r13 = (r13 > r2 ? 1 : (r13 == r2 ? 0 : -1))
            if (r13 == 0) goto L53
            lk1 r2 = r15.k(r2, r1)
            if (r2 != 0) goto L52
            if (r7 == 0) goto L21
            java.lang.Throwable r0 = r15.u()
            ik1 r1 = new ik1
            r1.<init>(r0)
            return r1
        L52:
            r1 = r2
        L53:
            r0 = r15
            r3 = r16
            r2 = r12
            int r12 = r0.M(r1, r2, r3, r4, r6, r7)
            if (r12 == 0) goto Lb3
            r3 = 1
            if (r12 == r3) goto Lb2
            r3 = 2
            r13 = 0
            if (r12 == r3) goto L8d
            r2 = 3
            if (r12 == r2) goto L87
            r2 = 4
            if (r12 == r2) goto L72
            r2 = 5
            if (r12 == r2) goto L6e
            goto L21
        L6e:
            r1.a()
            goto L21
        L72:
            long r2 = r15.t()
            int r2 = (r4 > r2 ? 1 : (r4 == r2 ? 0 : -1))
            if (r2 >= 0) goto L7d
            r1.a()
        L7d:
            java.lang.Throwable r0 = r15.u()
            ik1 r1 = new ik1
            r1.<init>(r0)
            return r1
        L87:
            java.lang.String r0 = "unexpected"
            defpackage.ygf.f(r0)
            return r13
        L8d:
            if (r7 == 0) goto L9c
            r1.i()
            java.lang.Throwable r0 = r15.u()
            ik1 r1 = new ik1
            r1.<init>(r0)
            return r1
        L9c:
            boolean r3 = r6 instanceof defpackage.xwe
            if (r3 == 0) goto La3
            r13 = r6
            xwe r13 = (defpackage.xwe) r13
        La3:
            if (r13 == 0) goto Laa
            int r12 = r2 + r9
            r13.a(r1, r12)
        Laa:
            long r3 = r1.d
            long r3 = r3 * r10
            long r1 = (long) r2
            long r3 = r3 + r1
            r15.h(r3)
        Lb2:
            return r8
        Lb3:
            r1.a()
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t32.P(java.lang.Object, boolean):java.lang.Object");
    }

    @Override // defpackage.uz0, defpackage.xyb
    public final Object b(n92 n92Var, Object obj) throws Throwable {
        if (P(obj, true) instanceof ik1) {
            throw u();
        }
        return c1e.a;
    }

    @Override // defpackage.uz0, defpackage.xyb
    public final Object e(Object obj) {
        return P(obj, false);
    }
}
