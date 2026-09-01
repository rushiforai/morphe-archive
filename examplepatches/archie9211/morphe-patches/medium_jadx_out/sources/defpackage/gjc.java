package defpackage;

import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gjc {
    public final x45 a;
    public boolean c;
    public o19 h;
    public fjc i;
    public final AtomicReference b = new AtomicReference(null);
    public final h9b d = new h9b(14, this);
    public final zzb e = new zzb(7, this);
    public final o78 f = new o78(new fjc[16]);
    public final Object g = new Object();
    public long j = -1;

    public gjc(x45 x45Var) {
        this.a = x45Var;
    }

    public final void a() {
        synchronized (this.g) {
            o78 o78Var = this.f;
            Object[] objArr = o78Var.a;
            int i = o78Var.c;
            for (int i2 = 0; i2 < i; i2++) {
                fjc fjcVar = (fjc) objArr[i2];
                fjcVar.e.a();
                fjcVar.f.a();
                fjcVar.l.a();
                fjcVar.m.clear();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001f  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0072  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(java.lang.Object r22) {
        /*
            r21 = this;
            r0 = r21
            r1 = r22
            java.lang.Object r2 = r0.g
            monitor-enter(r2)
            o78 r0 = r0.f     // Catch: java.lang.Throwable -> L8e
            int r3 = r0.c     // Catch: java.lang.Throwable -> L8e
            r5 = 0
            r6 = 0
        Ld:
            java.lang.Object[] r7 = r0.a
            if (r5 >= r3) goto L94
            r7 = r7[r5]     // Catch: java.lang.Throwable -> L8e
            fjc r7 = (defpackage.fjc) r7     // Catch: java.lang.Throwable -> L8e
            f78 r8 = r7.f     // Catch: java.lang.Throwable -> L8e
            java.lang.Object r8 = r8.k(r1)     // Catch: java.lang.Throwable -> L8e
            t68 r8 = (defpackage.t68) r8     // Catch: java.lang.Throwable -> L8e
            if (r8 != 0) goto L21
        L1f:
            r15 = r5
            goto L78
        L21:
            java.lang.Object[] r9 = r8.b     // Catch: java.lang.Throwable -> L8e
            int[] r10 = r8.c     // Catch: java.lang.Throwable -> L8e
            long[] r8 = r8.a     // Catch: java.lang.Throwable -> L8e
            int r11 = r8.length     // Catch: java.lang.Throwable -> L8e
            int r11 = r11 + (-2)
            if (r11 < 0) goto L1f
            r12 = 0
        L2d:
            r13 = r8[r12]     // Catch: java.lang.Throwable -> L8e
            r15 = r5
            long r4 = ~r13     // Catch: java.lang.Throwable -> L8e
            r16 = 7
            long r4 = r4 << r16
            long r4 = r4 & r13
            r16 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r4 = r4 & r16
            int r4 = (r4 > r16 ? 1 : (r4 == r16 ? 0 : -1))
            if (r4 == 0) goto L72
            int r4 = r12 - r11
            int r4 = ~r4     // Catch: java.lang.Throwable -> L8e
            int r4 = r4 >>> 31
            r5 = 8
            int r4 = 8 - r4
            r16 = r5
            r5 = 0
        L4d:
            if (r5 >= r4) goto L6e
            r17 = 255(0xff, double:1.26E-321)
            long r17 = r13 & r17
            r19 = 128(0x80, double:6.3E-322)
            int r17 = (r17 > r19 ? 1 : (r17 == r19 ? 0 : -1))
            if (r17 >= 0) goto L67
            int r17 = r12 << 3
            int r17 = r17 + r5
            r18 = r5
            r5 = r9[r17]     // Catch: java.lang.Throwable -> L8e
            r17 = r10[r17]     // Catch: java.lang.Throwable -> L8e
            r7.c(r1, r5)     // Catch: java.lang.Throwable -> L8e
            goto L69
        L67:
            r18 = r5
        L69:
            long r13 = r13 >> r16
            int r5 = r18 + 1
            goto L4d
        L6e:
            r5 = r16
            if (r4 != r5) goto L78
        L72:
            if (r12 == r11) goto L78
            int r12 = r12 + 1
            r5 = r15
            goto L2d
        L78:
            f78 r4 = r7.f     // Catch: java.lang.Throwable -> L8e
            boolean r4 = r4.j()     // Catch: java.lang.Throwable -> L8e
            if (r4 != 0) goto L83
            int r6 = r6 + 1
            goto L90
        L83:
            if (r6 <= 0) goto L90
            java.lang.Object[] r4 = r0.a     // Catch: java.lang.Throwable -> L8e
            int r5 = r15 - r6
            r7 = r4[r15]     // Catch: java.lang.Throwable -> L8e
            r4[r5] = r7     // Catch: java.lang.Throwable -> L8e
            goto L90
        L8e:
            r0 = move-exception
            goto L9e
        L90:
            int r5 = r15 + 1
            goto Ld
        L94:
            int r1 = r3 - r6
            r4 = 0
            java.util.Arrays.fill(r7, r1, r3, r4)     // Catch: java.lang.Throwable -> L8e
            r0.c = r1     // Catch: java.lang.Throwable -> L8e
            monitor-exit(r2)
            return
        L9e:
            monitor-exit(r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gjc.b(java.lang.Object):void");
    }

    public final boolean c() {
        boolean z;
        Set set;
        Set set2;
        synchronized (this.g) {
            z = this.c;
        }
        if (z) {
            return false;
        }
        boolean z2 = false;
        while (true) {
            AtomicReference atomicReference = this.b;
            while (true) {
                Object obj = atomicReference.get();
                set = null;
                Object obj2 = null;
                Object objSubList = null;
                if (obj == null) {
                    break;
                }
                if (obj instanceof Set) {
                    set2 = (Set) obj;
                } else {
                    if (!(obj instanceof List)) {
                        b22.b("Unexpected notification");
                        z72.b();
                        return false;
                    }
                    List list = (List) obj;
                    Set set3 = (Set) list.get(0);
                    if (list.size() == 2) {
                        objSubList = list.get(1);
                    } else if (list.size() > 2) {
                        objSubList = list.subList(1, list.size());
                    }
                    set2 = set3;
                    obj2 = objSubList;
                }
                while (!atomicReference.compareAndSet(obj, obj2)) {
                    if (atomicReference.get() != obj) {
                        break;
                    }
                }
                set = set2;
                break;
            }
            if (set == null) {
                return z2;
            }
            synchronized (this.g) {
                o78 o78Var = this.f;
                Object[] objArr = o78Var.a;
                int i = o78Var.c;
                for (int i2 = 0; i2 < i; i2++) {
                    z2 = ((fjc) objArr[i2]).a(set) || z2;
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(java.lang.Object r22, defpackage.x45 r23, defpackage.m45 r24) {
        /*
            Method dump skipped, instruction units count: 545
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gjc.d(java.lang.Object, x45, m45):void");
    }

    public final void e() {
        h9b h9bVar = this.d;
        uic.b(uic.a);
        synchronized (uic.c) {
            uic.h = bu1.R0(uic.h, h9bVar);
        }
        this.h = new o19(7, h9bVar);
    }
}
