package defpackage;

import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a98 extends nyb implements y88 {
    public static final /* synthetic */ AtomicReferenceFieldUpdater i = AtomicReferenceFieldUpdater.newUpdater(a98.class, Object.class, "owner$volatile");
    public static final /* synthetic */ long j = m80.a.objectFieldOffset(a98.class.getDeclaredField("owner$volatile"));
    private volatile /* synthetic */ Object owner$volatile;

    public a98() {
        super(1);
        this.owner$volatile = qb8.o;
    }

    public final boolean d() {
        return Math.max(m80.a.getIntVolatile(this, nyb.f), 0) == 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x004d, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean e(java.lang.Object r12) {
        /*
            r11 = this;
        L0:
            sun.misc.Unsafe r0 = defpackage.m80.a
            long r2 = defpackage.nyb.f
            int r4 = r0.getIntVolatile(r11, r2)
            int r1 = r11.a
            if (r4 <= r1) goto L26
        Lc:
            sun.misc.Unsafe r5 = defpackage.m80.a
            long r7 = defpackage.nyb.f
            int r9 = r5.getIntVolatile(r11, r7)
            int r10 = r11.a
            if (r9 <= r10) goto L23
            r6 = r11
            boolean r11 = r5.compareAndSwapInt(r6, r7, r9, r10)
            r1 = r6
            if (r11 == 0) goto L21
            goto L24
        L21:
            r11 = r1
            goto Lc
        L23:
            r1 = r11
        L24:
            r11 = r1
            goto L0
        L26:
            r1 = r11
            long r6 = defpackage.a98.j
            r11 = 1
            if (r4 > 0) goto L54
            r5 = 0
            if (r12 != 0) goto L30
            goto L4d
        L30:
            boolean r0 = r1.d()
            r2 = 2
            if (r0 != 0) goto L39
            r0 = r5
            goto L48
        L39:
            sun.misc.Unsafe r0 = defpackage.m80.a
            java.lang.Object r0 = r0.getObjectVolatile(r1, r6)
            d1g r3 = defpackage.qb8.o
            if (r0 == r3) goto L30
            if (r0 != r12) goto L47
            r0 = r11
            goto L48
        L47:
            r0 = r2
        L48:
            if (r0 == r11) goto L4e
            if (r0 == r2) goto L4d
            goto L24
        L4d:
            return r5
        L4e:
            java.lang.String r11 = "This mutex is already locked by the specified owner: "
            defpackage.ik4.m(r11, r12)
            return r5
        L54:
            int r5 = r4 + (-1)
            boolean r2 = r0.compareAndSwapInt(r1, r2, r4, r5)
            if (r2 == 0) goto L24
            r0.putObjectVolatile(r1, r6, r12)
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a98.e(java.lang.Object):boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0022, code lost:
    
        r4 = defpackage.a98.i;
        r6 = r0.c;
        r4.set(r6, r0.b);
        r4 = r0.a;
        r4.C(r1, r4.c, new defpackage.so1(4, new defpackage.q58(r6, 2, r0)));
     */
    @Override // defpackage.y88
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(defpackage.n92 r5, java.lang.Object r6) {
        /*
            r4 = this;
            boolean r0 = r4.e(r6)
            c1e r1 = defpackage.c1e.a
            if (r0 == 0) goto L9
            goto L52
        L9:
            n92 r5 = defpackage.pwd.Q(r5)
            x51 r5 = defpackage.wgf.s(r5)
            z88 r0 = new z88     // Catch: java.lang.Throwable -> L53
            r0.<init>(r4, r5, r6)     // Catch: java.lang.Throwable -> L53
        L16:
            java.util.concurrent.atomic.AtomicIntegerFieldUpdater r6 = defpackage.nyb.e     // Catch: java.lang.Throwable -> L53
            int r6 = r6.getAndDecrement(r4)     // Catch: java.lang.Throwable -> L53
            int r2 = r4.a     // Catch: java.lang.Throwable -> L53
            if (r6 > r2) goto L16
            if (r6 <= 0) goto L3f
            java.util.concurrent.atomic.AtomicReferenceFieldUpdater r4 = defpackage.a98.i     // Catch: java.lang.Throwable -> L53
            a98 r6 = r0.c     // Catch: java.lang.Throwable -> L53
            java.lang.Object r2 = r0.b     // Catch: java.lang.Throwable -> L53
            r4.set(r6, r2)     // Catch: java.lang.Throwable -> L53
            x51 r4 = r0.a     // Catch: java.lang.Throwable -> L53
            q58 r2 = new q58     // Catch: java.lang.Throwable -> L53
            r3 = 2
            r2.<init>(r6, r3, r0)     // Catch: java.lang.Throwable -> L53
            int r6 = r4.c     // Catch: java.lang.Throwable -> L53
            so1 r0 = new so1     // Catch: java.lang.Throwable -> L53
            r3 = 4
            r0.<init>(r3, r2)     // Catch: java.lang.Throwable -> L53
            r4.C(r1, r6, r0)     // Catch: java.lang.Throwable -> L53
            goto L45
        L3f:
            boolean r6 = r4.b(r0)     // Catch: java.lang.Throwable -> L53
            if (r6 == 0) goto L16
        L45:
            java.lang.Object r4 = r5.q()
            tb2 r5 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r4 != r5) goto L4e
            goto L4f
        L4e:
            r4 = r1
        L4f:
            if (r4 != r5) goto L52
            return r4
        L52:
            return r1
        L53:
            r4 = move-exception
            r5.B()
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a98.m(n92, java.lang.Object):java.lang.Object");
    }

    public final String toString() {
        return "Mutex@" + vv2.I(this) + "[isLocked=" + d() + ",owner=" + m80.a.getObjectVolatile(this, j) + ']';
    }

    @Override // defpackage.y88
    public final void f(Object obj) {
        while (this.d()) {
            Unsafe unsafe = m80.a;
            long j2 = j;
            Object objectVolatile = unsafe.getObjectVolatile(this, j2);
            d1g d1gVar = qb8.o;
            if (objectVolatile != d1gVar) {
                if (objectVolatile != obj && obj != null) {
                    rd6.j("This mutex is locked by ", objectVolatile, mgKMENwrbHf.aKPWLHblAZiv, obj, " is expected");
                    return;
                }
                while (true) {
                    a98 a98Var = this;
                    if (m80.a.compareAndSwapObject(a98Var, j, objectVolatile, d1gVar)) {
                        a98Var.c();
                        return;
                    } else {
                        if (m80.a.getObjectVolatile(a98Var, j2) != objectVolatile) {
                            this = a98Var;
                            break;
                        }
                        this = a98Var;
                    }
                }
            }
        }
        ygf.f("This mutex is not locked");
    }
}
