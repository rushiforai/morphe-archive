package defpackage;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import java.io.Closeable;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qs5 implements Closeable {
    public static final v1c z;
    public final ns5 a;
    public final LinkedHashMap b = new LinkedHashMap();
    public final String c;
    public int d;
    public int e;
    public boolean f;
    public final cgd g;
    public final bgd h;
    public final bgd i;
    public final bgd j;
    public final xsa k;
    public long l;
    public long m;
    public long n;
    public long o;
    public final eo4 p;
    public final v1c q;
    public v1c r;
    public final dud s;
    public long t;
    public long u;
    public final m50 v;
    public final ys5 w;
    public final a3 x;
    public final LinkedHashSet y;

    static {
        v1c v1cVar = new v1c();
        v1cVar.b(4, 65535);
        v1cVar.b(5, OlympusMakernoteDirectory.TAG_MAIN_INFO);
        z = v1cVar;
    }

    public qs5(iq1 iq1Var) {
        this.a = (ns5) iq1Var.e;
        String str = (String) iq1Var.d;
        if (str == null) {
            g76.g0("connectionName");
            throw null;
        }
        this.c = str;
        this.e = 3;
        cgd cgdVar = (cgd) iq1Var.b;
        this.g = cgdVar;
        this.h = cgdVar.d();
        this.i = cgdVar.d();
        this.j = cgdVar.d();
        this.k = xsa.g;
        this.p = (eo4) iq1Var.f;
        v1c v1cVar = new v1c();
        v1cVar.b(4, 16777216);
        this.q = v1cVar;
        this.r = z;
        this.s = new dud(0);
        this.u = r0.a();
        m50 m50Var = (m50) iq1Var.c;
        if (m50Var == null) {
            g76.g0("socket");
            throw null;
        }
        this.v = m50Var;
        this.w = new ys5((xua) m50Var.d);
        this.x = new a3(this, 9, new ts5((yua) m50Var.c));
        this.y = new LinkedHashSet();
    }

    public final xs5 B(int i) {
        xs5 xs5Var;
        synchronized (this) {
            xs5Var = (xs5) this.b.remove(Integer.valueOf(i));
            notifyAll();
        }
        return xs5Var;
    }

    public final void D(b14 b14Var) {
        b14Var.getClass();
        synchronized (this.w) {
            synchronized (this) {
                if (this.f) {
                    return;
                }
                this.f = true;
                this.w.B(this.d, b14Var, egf.a);
            }
        }
    }

    public final void I(long j) {
        synchronized (this) {
            try {
                dud.c(this.s, j, 0L, 2);
                long jB = this.s.b();
                if (jB >= this.q.a() / 2) {
                    Q(0, jB);
                    dud.c(this.s, 0L, jB, 1);
                }
                eo4 eo4Var = this.p;
                dud dudVar = this.s;
                eo4Var.getClass();
                dudVar.getClass();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0035, code lost:
    
        r2 = java.lang.Math.min((int) java.lang.Math.min(r12, r6 - r4), r8.w.c);
        r6 = r2;
        r8.t += r6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void L(int r9, boolean r10, defpackage.kz0 r11, long r12) {
        /*
            r8 = this;
            r0 = 0
            int r2 = (r12 > r0 ? 1 : (r12 == r0 ? 0 : -1))
            r3 = 0
            if (r2 != 0) goto Ld
            ys5 r8 = r8.w
            r8.m(r10, r9, r11, r3)
            return
        Ld:
            int r2 = (r12 > r0 ? 1 : (r12 == r0 ? 0 : -1))
            if (r2 <= 0) goto L68
            monitor-enter(r8)
        L12:
            long r4 = r8.t     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            long r6 = r8.u     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            int r2 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r2 < 0) goto L34
            java.util.LinkedHashMap r2 = r8.b     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            java.lang.Integer r4 = java.lang.Integer.valueOf(r9)     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            boolean r2 = r2.containsKey(r4)     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            if (r2 == 0) goto L2c
            r8.wait()     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            goto L12
        L2a:
            r9 = move-exception
            goto L66
        L2c:
            java.io.IOException r9 = new java.io.IOException     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            java.lang.String r10 = "stream closed"
            r9.<init>(r10)     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
            throw r9     // Catch: java.lang.Throwable -> L2a java.lang.InterruptedException -> L59
        L34:
            long r6 = r6 - r4
            long r4 = java.lang.Math.min(r12, r6)     // Catch: java.lang.Throwable -> L2a
            int r2 = (int) r4     // Catch: java.lang.Throwable -> L2a
            ys5 r4 = r8.w     // Catch: java.lang.Throwable -> L2a
            int r4 = r4.c     // Catch: java.lang.Throwable -> L2a
            int r2 = java.lang.Math.min(r2, r4)     // Catch: java.lang.Throwable -> L2a
            long r4 = r8.t     // Catch: java.lang.Throwable -> L2a
            long r6 = (long) r2     // Catch: java.lang.Throwable -> L2a
            long r4 = r4 + r6
            r8.t = r4     // Catch: java.lang.Throwable -> L2a
            monitor-exit(r8)
            long r12 = r12 - r6
            ys5 r4 = r8.w
            if (r10 == 0) goto L54
            int r5 = (r12 > r0 ? 1 : (r12 == r0 ? 0 : -1))
            if (r5 != 0) goto L54
            r5 = 1
            goto L55
        L54:
            r5 = r3
        L55:
            r4.m(r5, r9, r11, r2)
            goto Ld
        L59:
            java.lang.Thread r9 = java.lang.Thread.currentThread()     // Catch: java.lang.Throwable -> L2a
            r9.interrupt()     // Catch: java.lang.Throwable -> L2a
            java.io.InterruptedIOException r9 = new java.io.InterruptedIOException     // Catch: java.lang.Throwable -> L2a
            r9.<init>()     // Catch: java.lang.Throwable -> L2a
            throw r9     // Catch: java.lang.Throwable -> L2a
        L66:
            monitor-exit(r8)
            throw r9
        L68:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qs5.L(int, boolean, kz0, long):void");
    }

    public final void N(int i, b14 b14Var) {
        b14Var.getClass();
        bgd.c(this.h, this.c + '[' + i + "] writeSynReset", 0L, new o(this, i, b14Var, 1), 6);
    }

    public final void Q(final int i, final long j) {
        bgd.c(this.h, this.c + '[' + i + "] windowUpdate", 0L, new m45() { // from class: js5
            @Override // defpackage.m45
            public final Object invoke() {
                qs5 qs5Var = this.a;
                try {
                    qs5Var.w.Q(i, j);
                } catch (IOException e) {
                    b14 b14Var = b14.PROTOCOL_ERROR;
                    qs5Var.f(b14Var, b14Var, e);
                }
                return c1e.a;
            }
        }, 6);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        f(b14.NO_ERROR, b14.CANCEL, null);
    }

    public final void f(b14 b14Var, b14 b14Var2, IOException iOException) {
        int i;
        Object[] array;
        b14Var.getClass();
        b14Var2.getClass();
        TimeZone timeZone = ggf.a;
        try {
            D(b14Var);
        } catch (IOException unused) {
        }
        synchronized (this) {
            if (this.b.isEmpty()) {
                array = null;
            } else {
                array = this.b.values().toArray(new xs5[0]);
                this.b.clear();
            }
        }
        xs5[] xs5VarArr = (xs5[]) array;
        if (xs5VarArr != null) {
            for (xs5 xs5Var : xs5VarArr) {
                try {
                    xs5Var.c(b14Var2, iOException);
                } catch (IOException unused2) {
                }
            }
        }
        try {
            this.w.close();
        } catch (IOException unused3) {
        }
        try {
            this.v.cancel();
        } catch (IOException unused4) {
        }
        this.h.g();
        this.i.g();
        this.j.g();
    }

    public final void flush() {
        this.w.flush();
    }

    public final xs5 m(int i) {
        xs5 xs5Var;
        synchronized (this) {
            xs5Var = (xs5) this.b.get(Integer.valueOf(i));
        }
        return xs5Var;
    }

    public final boolean p(long j) {
        synchronized (this) {
            if (this.f) {
                return false;
            }
            if (this.n < this.m) {
                if (j >= this.o) {
                    return false;
                }
            }
            return true;
        }
    }
}
