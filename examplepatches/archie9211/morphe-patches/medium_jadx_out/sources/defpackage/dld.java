package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class dld {
    public static final /* synthetic */ long b = m80.a.objectFieldOffset(dld.class.getDeclaredField("_size$volatile"));
    private volatile /* synthetic */ int _size$volatile;
    public n34[] a;

    public final void a(n34 n34Var) {
        n34Var.d((o34) this);
        n34[] n34VarArr = this.a;
        if (n34VarArr == null) {
            n34VarArr = new n34[4];
            this.a = n34VarArr;
        } else if (b() >= n34VarArr.length) {
            n34VarArr = (n34[]) Arrays.copyOf(n34VarArr, b() * 2);
            this.a = n34VarArr;
        }
        int iB = b();
        m80.a.putIntVolatile(this, b, iB + 1);
        n34VarArr[iB] = n34Var;
        n34Var.b = iB;
        e(iB);
    }

    public final int b() {
        return m80.a.getIntVolatile(this, b);
    }

    public final void c(n34 n34Var) {
        synchronized (this) {
            if (n34Var.b() != null) {
                d(n34Var.b);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:26:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.n34 d(int r8) {
        /*
            r7 = this;
            n34[] r0 = r7.a
            r0.getClass()
            int r1 = r7.b()
            r2 = -1
            int r1 = r1 + r2
            sun.misc.Unsafe r3 = defpackage.m80.a
            long r4 = defpackage.dld.b
            r3.putIntVolatile(r7, r4, r1)
            int r1 = r7.b()
            if (r8 >= r1) goto L7c
            int r1 = r7.b()
            r7.f(r8, r1)
            int r1 = r8 + (-1)
            int r1 = r1 / 2
            if (r8 <= 0) goto L3c
            r3 = r0[r8]
            r3.getClass()
            r4 = r0[r1]
            r4.getClass()
            int r3 = r3.compareTo(r4)
            if (r3 >= 0) goto L3c
            r7.f(r8, r1)
            r7.e(r1)
            goto L7c
        L3c:
            int r1 = r8 * 2
            int r3 = r1 + 1
            int r4 = r7.b()
            if (r3 < r4) goto L47
            goto L7c
        L47:
            n34[] r4 = r7.a
            r4.getClass()
            int r1 = r1 + 2
            int r5 = r7.b()
            if (r1 >= r5) goto L65
            r5 = r4[r1]
            r5.getClass()
            r6 = r4[r3]
            r6.getClass()
            int r5 = r5.compareTo(r6)
            if (r5 >= 0) goto L65
            goto L66
        L65:
            r1 = r3
        L66:
            r3 = r4[r8]
            r3.getClass()
            r4 = r4[r1]
            r4.getClass()
            int r3 = r3.compareTo(r4)
            if (r3 > 0) goto L77
            goto L7c
        L77:
            r7.f(r8, r1)
            r8 = r1
            goto L3c
        L7c:
            int r8 = r7.b()
            r8 = r0[r8]
            r8.getClass()
            r1 = 0
            r8.d(r1)
            r8.b = r2
            int r7 = r7.b()
            r0[r7] = r1
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dld.d(int):n34");
    }

    public final void e(int i) {
        while (i > 0) {
            n34[] n34VarArr = this.a;
            n34VarArr.getClass();
            int i2 = (i - 1) / 2;
            n34 n34Var = n34VarArr[i2];
            n34Var.getClass();
            n34 n34Var2 = n34VarArr[i];
            n34Var2.getClass();
            if (n34Var.compareTo(n34Var2) <= 0) {
                return;
            }
            f(i, i2);
            i = i2;
        }
    }

    public final void f(int i, int i2) {
        n34[] n34VarArr = this.a;
        n34VarArr.getClass();
        n34 n34Var = n34VarArr[i2];
        n34Var.getClass();
        n34 n34Var2 = n34VarArr[i];
        n34Var2.getClass();
        n34VarArr[i] = n34Var;
        n34VarArr[i2] = n34Var2;
        n34Var.b = i;
        n34Var2.b = i2;
    }
}
