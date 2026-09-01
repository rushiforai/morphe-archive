package defpackage;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.TimeZone;
import okhttp3.internal.http2.StreamResetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xs5 implements xjc {
    public final int a;
    public final qs5 b;
    public final dud c;
    public long d;
    public long e;
    public final ArrayDeque f;
    public boolean g;
    public final vs5 h;
    public final us5 i;
    public final ws5 j;
    public final ws5 k;
    public b14 l;
    public IOException m;

    public xs5(int i, qs5 qs5Var, boolean z, boolean z2, yi5 yi5Var) {
        qs5Var.getClass();
        this.a = i;
        this.b = qs5Var;
        this.c = new dud(i);
        this.e = qs5Var.r.a();
        ArrayDeque arrayDeque = new ArrayDeque();
        this.f = arrayDeque;
        this.h = new vs5(this, qs5Var.q.a(), z2);
        this.i = new us5(this, z);
        this.j = new ws5(this);
        this.k = new ws5(this);
        if (yi5Var == null) {
            if (h()) {
                return;
            }
            ygf.f("remotely-initiated streams should have headers");
            throw null;
        }
        if (h()) {
            ygf.f("locally-initiated streams shouldn't have headers yet");
            throw null;
        }
        arrayDeque.add(yi5Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            r2 = this;
            java.util.TimeZone r0 = defpackage.ggf.a
            monitor-enter(r2)
            vs5 r0 = r2.h     // Catch: java.lang.Throwable -> L18
            boolean r1 = r0.b     // Catch: java.lang.Throwable -> L18
            if (r1 != 0) goto L1c
            boolean r0 = r0.e     // Catch: java.lang.Throwable -> L18
            if (r0 == 0) goto L1c
            us5 r0 = r2.i     // Catch: java.lang.Throwable -> L18
            boolean r1 = r0.a     // Catch: java.lang.Throwable -> L18
            if (r1 != 0) goto L1a
            boolean r0 = r0.c     // Catch: java.lang.Throwable -> L18
            if (r0 == 0) goto L1c
            goto L1a
        L18:
            r0 = move-exception
            goto L35
        L1a:
            r0 = 1
            goto L1d
        L1c:
            r0 = 0
        L1d:
            boolean r1 = r2.i()     // Catch: java.lang.Throwable -> L18
            monitor-exit(r2)
            if (r0 == 0) goto L2b
            b14 r0 = defpackage.b14.CANCEL
            r1 = 0
            r2.c(r0, r1)
            return
        L2b:
            if (r1 != 0) goto L34
            qs5 r0 = r2.b
            int r2 = r2.a
            r0.B(r2)
        L34:
            return
        L35:
            monitor-exit(r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xs5.a():void");
    }

    public final void b() throws IOException {
        us5 us5Var = this.i;
        if (us5Var.c) {
            ik4.g("stream closed");
            return;
        }
        if (us5Var.a) {
            ik4.g("stream finished");
            return;
        }
        if (g() != null) {
            IOException iOException = this.m;
            if (iOException != null) {
                throw iOException;
            }
            b14 b14VarG = g();
            b14VarG.getClass();
            throw new StreamResetException(b14VarG);
        }
    }

    public final void c(b14 b14Var, IOException iOException) {
        b14Var.getClass();
        if (e(b14Var, iOException)) {
            qs5 qs5Var = this.b;
            qs5Var.getClass();
            qs5Var.w.L(this.a, b14Var);
        }
    }

    @Override // defpackage.xjc
    public final void cancel() {
        f(b14.CANCEL);
    }

    @Override // defpackage.xjc
    public final ikc d() {
        return this.h;
    }

    public final boolean e(b14 b14Var, IOException iOException) {
        TimeZone timeZone = ggf.a;
        synchronized (this) {
            if (g() != null) {
                return false;
            }
            this.l = b14Var;
            this.m = iOException;
            notifyAll();
            if (this.h.b) {
                if (this.i.a) {
                    return false;
                }
            }
            this.b.B(this.a);
            return true;
        }
    }

    public final void f(b14 b14Var) {
        b14Var.getClass();
        if (e(b14Var, null)) {
            this.b.N(this.a, b14Var);
        }
    }

    public final b14 g() {
        b14 b14Var;
        synchronized (this) {
            b14Var = this.l;
        }
        return b14Var;
    }

    public final boolean h() {
        boolean z = (this.a & 1) == 1;
        this.b.getClass();
        return true == z;
    }

    public final boolean i() {
        synchronized (this) {
            try {
                if (g() != null) {
                    return false;
                }
                vs5 vs5Var = this.h;
                if (vs5Var.b || vs5Var.e) {
                    us5 us5Var = this.i;
                    if (us5Var.a || us5Var.c) {
                        if (this.g) {
                            return false;
                        }
                    }
                }
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void j(yi5 yi5Var, boolean z) {
        boolean zI;
        yi5Var.getClass();
        TimeZone timeZone = ggf.a;
        synchronized (this) {
            try {
                if (this.g && yi5Var.d(":status") == null && yi5Var.d(":method") == null) {
                    this.h.getClass();
                } else {
                    this.g = true;
                    this.f.add(yi5Var);
                }
                if (z) {
                    this.h.b = true;
                }
                zI = i();
                notifyAll();
            } catch (Throwable th) {
                throw th;
            }
        }
        if (zI) {
            return;
        }
        this.b.B(this.a);
    }

    public final void k(b14 b14Var) {
        b14Var.getClass();
        synchronized (this) {
            if (g() == null) {
                this.l = b14Var;
                notifyAll();
            }
        }
    }

    @Override // defpackage.xjc
    public final bfc q() {
        return this.i;
    }
}
