package defpackage;

import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ng4 implements ikc {
    public final we6 a;
    public long b;
    public boolean c;

    public ng4(we6 we6Var, long j) {
        this.a = we6Var;
        this.b = j;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return fmd.d;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        we6 we6Var = this.a;
        if (this.c) {
            return;
        }
        this.c = true;
        ReentrantLock reentrantLock = we6Var.c;
        reentrantLock.lock();
        try {
            int i = we6Var.b - 1;
            we6Var.b = i;
            if (i == 0) {
                if (we6Var.a) {
                    synchronized (we6Var) {
                        we6Var.d.close();
                    }
                }
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) {
        long j2;
        long j3;
        int i;
        kz0Var.getClass();
        if (this.c) {
            ygf.f("closed");
            return 0L;
        }
        we6 we6Var = this.a;
        long j4 = this.b;
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        long j5 = j + j4;
        long j6 = j4;
        while (true) {
            if (j6 >= j5) {
                j2 = -1;
                break;
            }
            iwb iwbVarI0 = kz0Var.I0(1);
            byte[] bArr = iwbVarI0.a;
            int i2 = iwbVarI0.c;
            j2 = -1;
            int iMin = (int) Math.min(j5 - j6, 8192 - i2);
            synchronized (we6Var) {
                bArr.getClass();
                we6Var.d.seek(j6);
                i = 0;
                while (true) {
                    if (i >= iMin) {
                        break;
                    }
                    int i3 = we6Var.d.read(bArr, i2, iMin - i);
                    if (i3 != -1) {
                        i += i3;
                    } else if (i == 0) {
                        i = -1;
                    }
                }
            }
            if (i == -1) {
                if (iwbVarI0.b == iwbVarI0.c) {
                    kz0Var.a = iwbVarI0.a();
                    lwb.a(iwbVarI0);
                }
                if (j4 == j6) {
                    j3 = -1;
                }
            } else {
                iwbVarI0.c += i;
                long j7 = i;
                j6 += j7;
                kz0Var.b += j7;
            }
        }
        j3 = j6 - j4;
        if (j3 != j2) {
            this.b += j3;
        }
        return j3;
    }
}
