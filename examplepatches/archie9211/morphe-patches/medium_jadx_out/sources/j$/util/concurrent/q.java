package j$.util.concurrent;

import java.util.concurrent.locks.LockSupport;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class q extends l {
    public static final j$.sun.misc.a h;
    public static final long i;
    public r e;
    public volatile r f;
    public volatile Thread g;
    volatile int lockState;

    static {
        j$.sun.misc.a aVar = j$.sun.misc.a.b;
        h = aVar;
        i = aVar.a(q.class, "lockState");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x004b A[PHI: r7
      0x004b: PHI (r7v3 java.lang.Class<?>) = (r7v2 java.lang.Class<?>), (r7v4 java.lang.Class<?>) binds: [B:24:0x0049, B:16:0x0033] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public q(j$.util.concurrent.r r11) {
        /*
            r10 = this;
            r0 = -2
            r1 = 0
            r10.<init>(r0, r1, r1)
            r10.f = r11
            r0 = r1
        L8:
            if (r11 == 0) goto L6c
            j$.util.concurrent.l r2 = r11.d
            j$.util.concurrent.r r2 = (j$.util.concurrent.r) r2
            r11.g = r1
            r11.f = r1
            r3 = 0
            if (r0 != 0) goto L1b
            r11.e = r1
            r11.i = r3
        L19:
            r0 = r11
            goto L68
        L1b:
            java.lang.Object r4 = r11.b
            int r5 = r11.a
            r6 = r0
            r7 = r1
        L21:
            java.lang.Object r8 = r6.b
            int r9 = r6.a
            if (r9 <= r5) goto L29
            r8 = -1
            goto L51
        L29:
            if (r9 >= r5) goto L2d
            r8 = 1
            goto L51
        L2d:
            if (r7 != 0) goto L35
            java.lang.Class r7 = j$.util.concurrent.ConcurrentHashMap.c(r4)
            if (r7 == 0) goto L4b
        L35:
            int r9 = j$.util.concurrent.ConcurrentHashMap.g
            if (r8 == 0) goto L48
            java.lang.Class r9 = r8.getClass()
            if (r9 == r7) goto L40
            goto L48
        L40:
            r9 = r4
            java.lang.Comparable r9 = (java.lang.Comparable) r9
            int r9 = r9.compareTo(r8)
            goto L49
        L48:
            r9 = r3
        L49:
            if (r9 != 0) goto L50
        L4b:
            int r8 = i(r4, r8)
            goto L51
        L50:
            r8 = r9
        L51:
            if (r8 > 0) goto L56
            j$.util.concurrent.r r9 = r6.f
            goto L58
        L56:
            j$.util.concurrent.r r9 = r6.g
        L58:
            if (r9 != 0) goto L6a
            r11.e = r6
            if (r8 > 0) goto L61
            r6.f = r11
            goto L63
        L61:
            r6.g = r11
        L63:
            j$.util.concurrent.r r11 = c(r0, r11)
            goto L19
        L68:
            r11 = r2
            goto L8
        L6a:
            r6 = r9
            goto L21
        L6c:
            r10.e = r0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.q.<init>(j$.util.concurrent.r):void");
    }

    public static r b(r rVar, r rVar2) {
        while (rVar2 != null && rVar2 != rVar) {
            r rVar3 = rVar2.e;
            if (rVar3 == null) {
                rVar2.i = false;
                return rVar2;
            }
            if (rVar2.i) {
                rVar2.i = false;
                return rVar;
            }
            r rVar4 = rVar3.f;
            if (rVar4 == rVar2) {
                r rVar5 = rVar3.g;
                if (rVar5 != null && rVar5.i) {
                    rVar5.i = false;
                    rVar3.i = true;
                    rVar = g(rVar, rVar3);
                    rVar3 = rVar2.e;
                    rVar5 = rVar3 == null ? null : rVar3.g;
                }
                if (rVar5 != null) {
                    r rVar6 = rVar5.f;
                    r rVar7 = rVar5.g;
                    if ((rVar7 == null || !rVar7.i) && (rVar6 == null || !rVar6.i)) {
                        rVar5.i = true;
                    } else {
                        if (rVar7 == null || !rVar7.i) {
                            if (rVar6 != null) {
                                rVar6.i = false;
                            }
                            rVar5.i = true;
                            rVar = h(rVar, rVar5);
                            rVar3 = rVar2.e;
                            rVar5 = rVar3 != null ? rVar3.g : null;
                        }
                        if (rVar5 != null) {
                            rVar5.i = rVar3 == null ? false : rVar3.i;
                            r rVar8 = rVar5.g;
                            if (rVar8 != null) {
                                rVar8.i = false;
                            }
                        }
                        if (rVar3 != null) {
                            rVar3.i = false;
                            rVar = g(rVar, rVar3);
                        }
                        rVar2 = rVar;
                    }
                }
                rVar2 = rVar3;
            } else {
                if (rVar4 != null && rVar4.i) {
                    rVar4.i = false;
                    rVar3.i = true;
                    rVar = h(rVar, rVar3);
                    rVar3 = rVar2.e;
                    rVar4 = rVar3 == null ? null : rVar3.f;
                }
                if (rVar4 != null) {
                    r rVar9 = rVar4.f;
                    r rVar10 = rVar4.g;
                    if ((rVar9 == null || !rVar9.i) && (rVar10 == null || !rVar10.i)) {
                        rVar4.i = true;
                    } else {
                        if (rVar9 == null || !rVar9.i) {
                            if (rVar10 != null) {
                                rVar10.i = false;
                            }
                            rVar4.i = true;
                            rVar = g(rVar, rVar4);
                            rVar3 = rVar2.e;
                            rVar4 = rVar3 != null ? rVar3.f : null;
                        }
                        if (rVar4 != null) {
                            rVar4.i = rVar3 == null ? false : rVar3.i;
                            r rVar11 = rVar4.f;
                            if (rVar11 != null) {
                                rVar11.i = false;
                            }
                        }
                        if (rVar3 != null) {
                            rVar3.i = false;
                            rVar = h(rVar, rVar3);
                        }
                        rVar2 = rVar;
                    }
                }
                rVar2 = rVar3;
            }
        }
        return rVar;
    }

    public static r c(r rVar, r rVar2) {
        r rVar3;
        rVar2.i = true;
        while (true) {
            r rVar4 = rVar2.e;
            if (rVar4 == null) {
                rVar2.i = false;
                return rVar2;
            }
            if (!rVar4.i || (rVar3 = rVar4.e) == null) {
                break;
            }
            r rVar5 = rVar3.f;
            if (rVar4 == rVar5) {
                r rVar6 = rVar3.g;
                if (rVar6 == null || !rVar6.i) {
                    if (rVar2 == rVar4.g) {
                        rVar = g(rVar, rVar4);
                        r rVar7 = rVar4.e;
                        rVar3 = rVar7 == null ? null : rVar7.e;
                        rVar4 = rVar7;
                        rVar2 = rVar4;
                    }
                    if (rVar4 != null) {
                        rVar4.i = false;
                        if (rVar3 != null) {
                            rVar3.i = true;
                            rVar = h(rVar, rVar3);
                        }
                    }
                } else {
                    rVar6.i = false;
                    rVar4.i = false;
                    rVar3.i = true;
                    rVar2 = rVar3;
                }
            } else if (rVar5 == null || !rVar5.i) {
                if (rVar2 == rVar4.f) {
                    rVar = h(rVar, rVar4);
                    r rVar8 = rVar4.e;
                    rVar3 = rVar8 == null ? null : rVar8.e;
                    rVar4 = rVar8;
                    rVar2 = rVar4;
                }
                if (rVar4 != null) {
                    rVar4.i = false;
                    if (rVar3 != null) {
                        rVar3.i = true;
                        rVar = g(rVar, rVar3);
                    }
                }
            } else {
                rVar5.i = false;
                rVar4.i = false;
                rVar3.i = true;
                rVar2 = rVar3;
            }
        }
        return rVar;
    }

    public static r g(r rVar, r rVar2) {
        r rVar3;
        if (rVar2 != null && (rVar3 = rVar2.g) != null) {
            r rVar4 = rVar3.f;
            rVar2.g = rVar4;
            if (rVar4 != null) {
                rVar4.e = rVar2;
            }
            r rVar5 = rVar2.e;
            rVar3.e = rVar5;
            if (rVar5 == null) {
                rVar3.i = false;
                rVar = rVar3;
            } else if (rVar5.f == rVar2) {
                rVar5.f = rVar3;
            } else {
                rVar5.g = rVar3;
            }
            rVar3.f = rVar2;
            rVar2.e = rVar3;
        }
        return rVar;
    }

    public static r h(r rVar, r rVar2) {
        r rVar3;
        if (rVar2 != null && (rVar3 = rVar2.f) != null) {
            r rVar4 = rVar3.g;
            rVar2.f = rVar4;
            if (rVar4 != null) {
                rVar4.e = rVar2;
            }
            r rVar5 = rVar2.e;
            rVar3.e = rVar5;
            if (rVar5 == null) {
                rVar3.i = false;
                rVar = rVar3;
            } else if (rVar5.g == rVar2) {
                rVar5.g = rVar3;
            } else {
                rVar5.f = rVar3;
            }
            rVar3.g = rVar2;
            rVar2.e = rVar3;
        }
        return rVar;
    }

    public static int i(Object obj, Object obj2) {
        int iCompareTo;
        return (obj == null || obj2 == null || (iCompareTo = obj.getClass().getName().compareTo(obj2.getClass().getName())) == 0) ? System.identityHashCode(obj) <= System.identityHashCode(obj2) ? -1 : 1 : iCompareTo;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x001c, code lost:
    
        return r6;
     */
    @Override // j$.util.concurrent.l
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final j$.util.concurrent.l a(int r11, java.lang.Object r12) {
        /*
            r10 = this;
            j$.util.concurrent.r r0 = r10.f
        L2:
            r6 = r0
        L3:
            r7 = 0
            if (r6 == 0) goto L75
            int r4 = r10.lockState
            r0 = r4 & 3
            if (r0 == 0) goto L20
            int r0 = r6.a
            if (r0 != r11) goto L1d
            java.lang.Object r0 = r6.b
            if (r0 == r12) goto L1c
            if (r0 == 0) goto L1d
            boolean r0 = r12.equals(r0)
            if (r0 == 0) goto L1d
        L1c:
            return r6
        L1d:
            j$.util.concurrent.l r0 = r6.d
            goto L2
        L20:
            j$.sun.misc.a r8 = j$.util.concurrent.q.h
            long r2 = j$.util.concurrent.q.i
            int r5 = r4 + 4
            sun.misc.Unsafe r0 = r8.a
            r1 = r10
            boolean r0 = r0.compareAndSwapInt(r1, r2, r4, r5)
            if (r0 == 0) goto L3
            r9 = 6
            j$.util.concurrent.r r0 = r10.e     // Catch: java.lang.Throwable -> L54
            if (r0 != 0) goto L35
            goto L39
        L35:
            j$.util.concurrent.r r7 = r0.b(r11, r12, r7)     // Catch: java.lang.Throwable -> L54
        L39:
            sun.misc.Unsafe r0 = r8.a
            int r4 = r0.getIntVolatile(r10, r2)
            sun.misc.Unsafe r0 = r8.a
            int r5 = r4 + (-4)
            r1 = r10
            boolean r0 = r0.compareAndSwapInt(r1, r2, r4, r5)
            if (r0 == 0) goto L39
            if (r4 != r9) goto L53
            java.lang.Thread r0 = r10.g
            if (r0 == 0) goto L53
            java.util.concurrent.locks.LockSupport.unpark(r0)
        L53:
            return r7
        L54:
            r0 = move-exception
            r7 = r0
            j$.sun.misc.a r8 = j$.util.concurrent.q.h
            long r2 = j$.util.concurrent.q.i
        L5a:
            sun.misc.Unsafe r0 = r8.a
            int r4 = r0.getIntVolatile(r10, r2)
            sun.misc.Unsafe r0 = r8.a
            int r5 = r4 + (-4)
            r1 = r10
            boolean r0 = r0.compareAndSwapInt(r1, r2, r4, r5)
            if (r0 == 0) goto L5a
            if (r4 != r9) goto L74
            java.lang.Thread r0 = r10.g
            if (r0 == 0) goto L74
            java.util.concurrent.locks.LockSupport.unpark(r0)
        L74:
            throw r7
        L75:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.q.a(int, java.lang.Object):j$.util.concurrent.l");
    }

    public final void d() {
        j$.sun.misc.a aVar = h;
        if (aVar.a.compareAndSwapInt(this, i, 0, 1)) {
            return;
        }
        boolean z = false;
        while (true) {
            int i2 = this.lockState;
            if ((i2 & (-3)) == 0) {
                j$.sun.misc.a aVar2 = h;
                if (aVar2.a.compareAndSwapInt(this, i, i2, 1)) {
                    break;
                }
            } else if ((i2 & 2) == 0) {
                if (h.a.compareAndSwapInt(this, i, i2, i2 | 2)) {
                    this.g = Thread.currentThread();
                    z = true;
                }
            } else if (z) {
                LockSupport.park(this);
            }
        }
        if (z) {
            this.g = null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00a9 A[LOOP:0: B:3:0x0007->B:65:0x00a9, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0079 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final j$.util.concurrent.r e(int r12, java.lang.Object r13, java.lang.Object r14) {
        /*
            r11 = this;
            j$.util.concurrent.r r0 = r11.e
            r7 = 0
            r8 = 0
            r6 = r0
            r0 = r7
            r1 = r8
        L7:
            if (r6 != 0) goto L18
            j$.util.concurrent.r r1 = new j$.util.concurrent.r
            r5 = 0
            r6 = 0
            r2 = r12
            r3 = r13
            r4 = r14
            r1.<init>(r2, r3, r4, r5, r6)
            r11.e = r1
            r11.f = r1
            return r7
        L18:
            int r4 = r6.a
            r9 = 1
            if (r4 <= r12) goto L20
            r4 = -1
        L1e:
            r10 = r4
            goto L70
        L20:
            if (r4 >= r12) goto L24
            r10 = r9
            goto L70
        L24:
            java.lang.Object r4 = r6.b
            if (r4 == r13) goto Lac
            if (r4 == 0) goto L32
            boolean r5 = r13.equals(r4)
            if (r5 == 0) goto L32
            goto Lac
        L32:
            if (r0 != 0) goto L3a
            java.lang.Class r0 = j$.util.concurrent.ConcurrentHashMap.c(r13)
            if (r0 == 0) goto L50
        L3a:
            int r5 = j$.util.concurrent.ConcurrentHashMap.g
            if (r4 == 0) goto L4d
            java.lang.Class r5 = r4.getClass()
            if (r5 == r0) goto L45
            goto L4d
        L45:
            r5 = r13
            java.lang.Comparable r5 = (java.lang.Comparable) r5
            int r5 = r5.compareTo(r4)
            goto L4e
        L4d:
            r5 = r8
        L4e:
            if (r5 != 0) goto L6f
        L50:
            if (r1 != 0) goto L6a
            j$.util.concurrent.r r1 = r6.f
            if (r1 == 0) goto L5e
            j$.util.concurrent.r r1 = r1.b(r12, r13, r0)
            if (r1 != 0) goto L5d
            goto L5e
        L5d:
            return r1
        L5e:
            j$.util.concurrent.r r1 = r6.g
            if (r1 == 0) goto L69
            j$.util.concurrent.r r1 = r1.b(r12, r13, r0)
            if (r1 == 0) goto L69
            return r1
        L69:
            r1 = r9
        L6a:
            int r4 = i(r13, r4)
            goto L1e
        L6f:
            r10 = r5
        L70:
            if (r10 > 0) goto L75
            j$.util.concurrent.r r4 = r6.f
            goto L77
        L75:
            j$.util.concurrent.r r4 = r6.g
        L77:
            if (r4 != 0) goto La9
            j$.util.concurrent.r r5 = r11.f
            j$.util.concurrent.r r1 = new j$.util.concurrent.r
            r2 = r12
            r3 = r13
            r4 = r14
            r1.<init>(r2, r3, r4, r5, r6)
            r11.f = r1
            if (r5 == 0) goto L89
            r5.h = r1
        L89:
            if (r10 > 0) goto L8e
            r6.f = r1
            goto L90
        L8e:
            r6.g = r1
        L90:
            boolean r0 = r6.i
            if (r0 != 0) goto L97
            r1.i = r9
            return r7
        L97:
            r11.d()
            j$.util.concurrent.r r0 = r11.e     // Catch: java.lang.Throwable -> La5
            j$.util.concurrent.r r0 = c(r0, r1)     // Catch: java.lang.Throwable -> La5
            r11.e = r0     // Catch: java.lang.Throwable -> La5
            r11.lockState = r8
            return r7
        La5:
            r0 = move-exception
            r11.lockState = r8
            throw r0
        La9:
            r6 = r4
            goto L7
        Lac:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.q.e(int, java.lang.Object, java.lang.Object):j$.util.concurrent.r");
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x008e A[PHI: r0
      0x008e: PHI (r0v4 j$.util.concurrent.r) = (r0v3 j$.util.concurrent.r), (r0v12 j$.util.concurrent.r) binds: [B:55:0x008a, B:51:0x0083] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean f(j$.util.concurrent.r r11) {
        /*
            Method dump skipped, instruction units count: 207
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.q.f(j$.util.concurrent.r):boolean");
    }
}
