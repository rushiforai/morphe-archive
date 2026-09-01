package defpackage;

import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lc9 {
    public final int a;
    public final m45 b;
    public final ReentrantLock c = new ReentrantLock();
    public int d;
    public boolean e;
    public final o42[] f;
    public final oyb g;
    public final m70 h;

    public lc9(int i, m45 m45Var) {
        this.a = i;
        this.b = m45Var;
        this.f = new o42[i];
        int i2 = pyb.a;
        this.g = new oyb(i);
        this.h = new m70(i);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r8) {
        /*
            r7 = this;
            m70 r0 = r7.h
            boolean r1 = r8 instanceof defpackage.jc9
            if (r1 == 0) goto L15
            r1 = r8
            jc9 r1 = (defpackage.jc9) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            jc9 r1 = new jc9
            r1.<init>(r7, r8)
        L1a:
            java.lang.Object r8 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 0
            oyb r5 = r7.g
            r6 = 1
            if (r3 == 0) goto L32
            if (r3 != r6) goto L2c
            defpackage.br7.v(r8)
            goto L3e
        L2c:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L32:
            defpackage.br7.v(r8)
            r1.d = r6
            java.lang.Object r8 = r5.a(r1)
            if (r8 != r2) goto L3e
            return r2
        L3e:
            java.util.concurrent.locks.ReentrantLock r8 = r7.c     // Catch: java.lang.Throwable -> L78
            r8.lock()     // Catch: java.lang.Throwable -> L78
            boolean r1 = r7.e     // Catch: java.lang.Throwable -> L7a
            if (r1 != 0) goto L7c
            boolean r1 = r0.isEmpty()     // Catch: java.lang.Throwable -> L7a
            if (r1 == 0) goto L6e
            int r1 = r7.d     // Catch: java.lang.Throwable -> L7a
            int r2 = r7.a     // Catch: java.lang.Throwable -> L7a
            if (r1 < r2) goto L54
            goto L6e
        L54:
            o42 r1 = new o42     // Catch: java.lang.Throwable -> L7a
            m45 r2 = r7.b     // Catch: java.lang.Throwable -> L7a
            java.lang.Object r2 = r2.invoke()     // Catch: java.lang.Throwable -> L7a
            anb r2 = (defpackage.anb) r2     // Catch: java.lang.Throwable -> L7a
            r1.<init>(r2)     // Catch: java.lang.Throwable -> L7a
            o42[] r2 = r7.f     // Catch: java.lang.Throwable -> L7a
            int r3 = r7.d     // Catch: java.lang.Throwable -> L7a
            int r4 = r3 + 1
            r7.d = r4     // Catch: java.lang.Throwable -> L7a
            r2[r3] = r1     // Catch: java.lang.Throwable -> L7a
            r0.addLast(r1)     // Catch: java.lang.Throwable -> L7a
        L6e:
            java.lang.Object r7 = r0.removeLast()     // Catch: java.lang.Throwable -> L7a
            o42 r7 = (defpackage.o42) r7     // Catch: java.lang.Throwable -> L7a
            r8.unlock()     // Catch: java.lang.Throwable -> L78
            return r7
        L78:
            r7 = move-exception
            goto L88
        L7a:
            r7 = move-exception
            goto L84
        L7c:
            java.lang.String r7 = "Connection pool is closed"
            r0 = 21
            defpackage.qk7.z(r0, r7)     // Catch: java.lang.Throwable -> L7a
            throw r4     // Catch: java.lang.Throwable -> L7a
        L84:
            r8.unlock()     // Catch: java.lang.Throwable -> L78
            throw r7     // Catch: java.lang.Throwable -> L78
        L88:
            r5.c()
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lc9.a(p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:11|(2:48|12)|24|44|29|(1:(1:39)(2:35|(1:37)))(1:31)|38|19|46|20|(1:22)(10:23|24|44|29|(0)(0)|38|19|46|20|(0)(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0064, code lost:
    
        r2 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0066, code lost:
    
        r12 = r12;
        r11 = r11;
        r2 = r0;
        r0 = r2;
     */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0057 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006f A[Catch: all -> 0x0073, TryCatch #0 {all -> 0x0073, blocks: (B:29:0x006b, B:31:0x006f, B:35:0x0077, B:39:0x007e), top: B:44:0x006b }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0058 -> B:24:0x005a). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(long r9, defpackage.d42 r11, defpackage.p92 r12) {
        /*
            r8 = this;
            boolean r0 = r12 instanceof defpackage.kc9
            if (r0 == 0) goto L13
            r0 = r12
            kc9 r0 = (defpackage.kc9) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            kc9 r0 = new kc9
            r0.<init>(r8, r12)
        L18:
            java.lang.Object r12 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L36
            if (r2 != r3) goto L30
            long r9 = r0.b
            rya r11 = r0.d
            m45 r2 = r0.c
            defpackage.br7.v(r12)     // Catch: java.lang.Throwable -> L2e
            goto L5a
        L2e:
            r12 = move-exception
            goto L66
        L30:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r4
        L36:
            defpackage.br7.v(r12)
        L39:
            rya r12 = new rya
            r12.<init>()
            mo5 r2 = new mo5     // Catch: java.lang.Throwable -> L64
            r5 = 17
            r2.<init>(r12, r8, r4, r5)     // Catch: java.lang.Throwable -> L64
            r0.c = r11     // Catch: java.lang.Throwable -> L64
            r0.d = r12     // Catch: java.lang.Throwable -> L64
            r0.b = r9     // Catch: java.lang.Throwable -> L64
            r0.g = r3     // Catch: java.lang.Throwable -> L64
            long r5 = defpackage.gsa.p0(r9)     // Catch: java.lang.Throwable -> L64
            java.lang.Object r2 = defpackage.wo7.z(r5, r2, r0)     // Catch: java.lang.Throwable -> L64
            if (r2 != r1) goto L58
            return r1
        L58:
            r2 = r11
            r11 = r12
        L5a:
            r12 = r11
            r11 = r2
            r2 = r0
            r0 = r4
            goto L6b
        L5f:
            r7 = r2
            r2 = r11
            r11 = r12
            r12 = r7
            goto L66
        L64:
            r2 = move-exception
            goto L5f
        L66:
            r7 = r12
            r12 = r11
            r11 = r2
            r2 = r0
            r0 = r7
        L6b:
            boolean r5 = r0 instanceof kotlinx.coroutines.TimeoutCancellationException     // Catch: java.lang.Throwable -> L73
            if (r5 == 0) goto L75
            r11.invoke()     // Catch: java.lang.Throwable -> L73
            goto L7c
        L73:
            r9 = move-exception
            goto L7f
        L75:
            if (r0 != 0) goto L7e
            java.lang.Object r12 = r12.a     // Catch: java.lang.Throwable -> L73
            if (r12 == 0) goto L7c
            return r12
        L7c:
            r0 = r2
            goto L39
        L7e:
            throw r0     // Catch: java.lang.Throwable -> L73
        L7f:
            java.lang.Object r10 = r12.a
            o42 r10 = (defpackage.o42) r10
            if (r10 == 0) goto L88
            r8.e(r10)
        L88:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lc9.b(long, d42, p92):java.lang.Object");
    }

    public final void c() {
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            this.e = true;
            for (o42 o42Var : this.f) {
                if (o42Var != null) {
                    o42Var.close();
                }
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    public final void d(StringBuilder sb) {
        m70 m70Var = this.h;
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            f17 f17VarB = d46.B();
            int i = m70Var.c;
            for (int i2 = 0; i2 < i; i2++) {
                f17VarB.add(m70Var.get(i2));
            }
            f17 f17VarW = d46.w(f17VarB);
            sb.append('\t' + toString() + " (");
            sb.append("capacity=" + this.a + ", ");
            sb.append("permits=" + Math.max(m80.a.getIntVolatile(this.g, nyb.f), 0) + ", ");
            sb.append("queue=(size=" + f17VarW.getSize() + ")[" + bu1.F0(f17VarW, null, null, null, null, 63) + ']');
            sb.append(")");
            sb.append('\n');
            o42[] o42VarArr = this.f;
            int length = o42VarArr.length;
            int i3 = 0;
            for (int i4 = 0; i4 < length; i4++) {
                o42 o42Var = o42VarArr[i4];
                i3++;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("\t\t[");
                sb2.append(i3);
                sb2.append("] - ");
                sb2.append(o42Var != null ? o42Var.a.toString() : null);
                sb.append(sb2.toString());
                sb.append('\n');
                if (o42Var != null) {
                    o42Var.p(sb);
                }
            }
            reentrantLock.unlock();
        } catch (Throwable th) {
            reentrantLock.unlock();
            throw th;
        }
    }

    public final void e(o42 o42Var) {
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            this.h.addLast(o42Var);
            reentrantLock.unlock();
            this.g.c();
        } catch (Throwable th) {
            reentrantLock.unlock();
            throw th;
        }
    }
}
