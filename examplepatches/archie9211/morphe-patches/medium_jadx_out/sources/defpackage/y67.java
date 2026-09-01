package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class y67 {
    public static final /* synthetic */ long a;
    public static final /* synthetic */ long b;
    public static final /* synthetic */ long c;
    private volatile /* synthetic */ Object _next$volatile = this;
    private volatile /* synthetic */ Object _prev$volatile = this;
    private volatile /* synthetic */ Object _removedRef$volatile;

    static {
        Unsafe unsafe = m80.a;
        a = unsafe.objectFieldOffset(y67.class.getDeclaredField("_next$volatile"));
        b = unsafe.objectFieldOffset(y67.class.getDeclaredField("_prev$volatile"));
        c = unsafe.objectFieldOffset(y67.class.getDeclaredField("_removedRef$volatile"));
    }

    public final boolean b(y67 y67Var, int i) {
        y67 y67Var2;
        y67 y67Var3;
        while (true) {
            y67 y67VarI = this.i();
            if (y67VarI instanceof k17) {
                return (((k17) y67VarI).d & i) == 0 && y67VarI.b(y67Var, i);
            }
            Unsafe unsafe = m80.a;
            unsafe.putObjectVolatile(y67Var, b, y67VarI);
            long j = a;
            unsafe.putObjectVolatile(y67Var, j, this);
            while (true) {
                Unsafe unsafe2 = m80.a;
                y67Var2 = this;
                y67Var3 = y67Var;
                if (unsafe2.compareAndSwapObject(y67VarI, a, y67Var2, y67Var3)) {
                    y67Var3.d(y67Var2);
                    return true;
                }
                if (unsafe2.getObjectVolatile(y67VarI, j) != y67Var2) {
                    break;
                }
                this = y67Var2;
                y67Var = y67Var3;
            }
            this = y67Var2;
            y67Var = y67Var3;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x002a, code lost:
    
        return r8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.y67 c() {
        /*
            r15 = this;
        L0:
            sun.misc.Unsafe r0 = defpackage.m80.a
            long r1 = defpackage.y67.b
            java.lang.Object r0 = r0.getObjectVolatile(r15, r1)
            r7 = r0
            y67 r7 = (defpackage.y67) r7
            r0 = 0
            r9 = r0
            r8 = r7
        Le:
            if (r8 == 0) goto L7b
            sun.misc.Unsafe r3 = defpackage.m80.a
            long r4 = defpackage.y67.a
            java.lang.Object r6 = r3.getObjectVolatile(r8, r4)
            if (r6 != r15) goto L36
            if (r7 != r8) goto L1d
            goto L2a
        L1d:
            sun.misc.Unsafe r3 = defpackage.m80.a
            long r5 = defpackage.y67.b
            r4 = r15
            boolean r15 = r3.compareAndSwapObject(r4, r5, r7, r8)
            r14 = r7
            r7 = r4
            if (r15 == 0) goto L2b
        L2a:
            return r8
        L2b:
            java.lang.Object r15 = r3.getObjectVolatile(r7, r1)
            if (r15 == r14) goto L33
        L31:
            r15 = r7
            goto L0
        L33:
            r15 = r7
            r7 = r14
            goto L1d
        L36:
            r14 = r7
            r7 = r15
            boolean r15 = r7.j()
            if (r15 == 0) goto L3f
            return r0
        L3f:
            boolean r15 = r6 instanceof defpackage.l4b
            if (r15 == 0) goto L72
            if (r9 == 0) goto L62
            l4b r6 = (defpackage.l4b) r6
            y67 r13 = r6.a
        L49:
            r12 = r8
            sun.misc.Unsafe r8 = defpackage.m80.a
            long r10 = defpackage.y67.a
            boolean r15 = r8.compareAndSwapObject(r9, r10, r12, r13)
            r3 = r8
            r8 = r12
            if (r15 == 0) goto L5b
            r15 = r7
            r8 = r9
            r7 = r14
            r9 = r0
            goto Le
        L5b:
            java.lang.Object r15 = r3.getObjectVolatile(r9, r4)
            if (r15 == r8) goto L49
            goto L31
        L62:
            if (r8 == 0) goto L6e
            java.lang.Object r15 = r3.getObjectVolatile(r8, r1)
            r8 = r15
            y67 r8 = (defpackage.y67) r8
        L6b:
            r15 = r7
            r7 = r14
            goto Le
        L6e:
            defpackage.rd6.m()
            return r0
        L72:
            r6.getClass()
            r15 = r6
            y67 r15 = (defpackage.y67) r15
            r9 = r8
            r8 = r15
            goto L6b
        L7b:
            defpackage.rd6.m()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y67.c():y67");
    }

    public final void d(y67 y67Var) {
        y67 y67Var2;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = b;
            y67 y67Var3 = (y67) unsafe.getObjectVolatile(y67Var, j);
            if (this.e() != y67Var) {
                return;
            }
            while (true) {
                Unsafe unsafe2 = m80.a;
                y67Var2 = this;
                y67 y67Var4 = y67Var;
                if (unsafe2.compareAndSwapObject(y67Var4, b, y67Var3, y67Var2)) {
                    if (y67Var2.j()) {
                        y67Var4.c();
                        return;
                    }
                    return;
                } else {
                    y67Var = y67Var4;
                    if (unsafe2.getObjectVolatile(y67Var4, j) != y67Var3) {
                        break;
                    } else {
                        this = y67Var2;
                    }
                }
            }
            this = y67Var2;
        }
    }

    public final Object e() {
        return m80.a.getObjectVolatile(this, a);
    }

    public final y67 h() {
        Object objE = e();
        l4b l4bVar = objE instanceof l4b ? (l4b) objE : null;
        if (l4bVar != null) {
            return l4bVar.a;
        }
        objE.getClass();
        return (y67) objE;
    }

    public final y67 i() {
        y67 y67VarC = c();
        if (y67VarC != null) {
            return y67VarC;
        }
        Unsafe unsafe = m80.a;
        long j = b;
        Object objectVolatile = unsafe.getObjectVolatile(this, j);
        while (true) {
            y67 y67Var = (y67) objectVolatile;
            if (!y67Var.j()) {
                return y67Var;
            }
            objectVolatile = m80.a.getObjectVolatile(y67Var, j);
        }
    }

    public boolean j() {
        return e() instanceof l4b;
    }

    public String toString() {
        return new kv4(1, 9, vv2.class, this, "classSimpleName", "getClassSimpleName(Ljava/lang/Object;)Ljava/lang/String;") + '@' + vv2.I(this);
    }
}
