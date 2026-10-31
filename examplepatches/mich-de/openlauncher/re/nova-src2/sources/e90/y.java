package e90;

import h6.c1;
import java.io.IOException;
import java.util.ArrayDeque;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import okhttp3.internal.http2.StreamResetException;

/* loaded from: classes.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final int f52398a;

    /* renamed from: b, reason: collision with root package name */
    public final q f52399b;

    /* renamed from: c, reason: collision with root package name */
    public long f52400c;

    /* renamed from: d, reason: collision with root package name */
    public long f52401d;

    /* renamed from: e, reason: collision with root package name */
    public long f52402e;

    /* renamed from: f, reason: collision with root package name */
    public long f52403f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayDeque f52404g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f52405h;

    /* renamed from: i, reason: collision with root package name */
    public final w f52406i;

    /* renamed from: j, reason: collision with root package name */
    public final v f52407j;

    /* renamed from: k, reason: collision with root package name */
    public final x f52408k;

    /* renamed from: l, reason: collision with root package name */
    public final x f52409l;

    /* renamed from: m, reason: collision with root package name */
    public int f52410m;
    public IOException n;

    public y(int i5, q connection, boolean z11, boolean z12, x80.u uVar) {
        Intrinsics.g(connection, "connection");
        this.f52398a = i5;
        this.f52399b = connection;
        this.f52403f = connection.f52360q.a();
        ArrayDeque arrayDeque = new ArrayDeque();
        this.f52404g = arrayDeque;
        this.f52406i = new w(this, connection.f52359p.a(), z12);
        this.f52407j = new v(this, z11);
        this.f52408k = new x(this);
        this.f52409l = new x(this);
        if (uVar == null) {
            if (!g()) {
                throw new IllegalStateException("remotely-initiated streams should have headers");
            }
        } else {
            if (g()) {
                throw new IllegalStateException("locally-initiated streams shouldn't have headers yet");
            }
            arrayDeque.add(uVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() {
        boolean z11;
        boolean zH;
        byte[] bArr = y80.c.f96853a;
        synchronized (this) {
            try {
                w wVar = this.f52406i;
                if (wVar.f52392b || !wVar.f52395e) {
                    z11 = false;
                } else {
                    v vVar = this.f52407j;
                    if (vVar.f52387a || vVar.f52389c) {
                        z11 = true;
                    }
                }
                zH = h();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z11) {
            c(9, null);
        } else {
            if (zH) {
                return;
            }
            this.f52399b.c(this.f52398a);
        }
    }

    public final void b() throws IOException {
        v vVar = this.f52407j;
        if (vVar.f52389c) {
            throw new IOException("stream closed");
        }
        if (vVar.f52387a) {
            throw new IOException("stream finished");
        }
        if (this.f52410m != 0) {
            IOException iOException = this.n;
            if (iOException != null) {
                throw iOException;
            }
            int i5 = this.f52410m;
            c1.w(i5);
            throw new StreamResetException(i5);
        }
    }

    public final void c(int i5, IOException iOException) {
        fq.c.o(i5, "rstStatusCode");
        if (d(i5, iOException)) {
            q qVar = this.f52399b;
            qVar.getClass();
            fq.c.o(i5, "statusCode");
            qVar.f52366w.h(this.f52398a, i5);
        }
    }

    public final boolean d(int i5, IOException iOException) {
        byte[] bArr = y80.c.f96853a;
        synchronized (this) {
            if (this.f52410m != 0) {
                return false;
            }
            this.f52410m = i5;
            this.n = iOException;
            notifyAll();
            if (this.f52406i.f52392b && this.f52407j.f52387a) {
                return false;
            }
            Unit unit = Unit.f71706a;
            this.f52399b.c(this.f52398a);
            return true;
        }
    }

    public final void e(int i5) {
        fq.c.o(i5, "errorCode");
        if (d(i5, null)) {
            this.f52399b.h(this.f52398a, i5);
        }
    }

    public final v f() {
        synchronized (this) {
            try {
                if (!this.f52405h && !g()) {
                    throw new IllegalStateException("reply before requesting the sink");
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return this.f52407j;
    }

    public final boolean g() {
        boolean z11 = (this.f52398a & 1) == 1;
        this.f52399b.getClass();
        return true == z11;
    }

    public final synchronized boolean h() {
        try {
            if (this.f52410m != 0) {
                return false;
            }
            w wVar = this.f52406i;
            if (wVar.f52392b || wVar.f52395e) {
                v vVar = this.f52407j;
                if (vVar.f52387a || vVar.f52389c) {
                    if (this.f52405h) {
                        return false;
                    }
                }
            }
            return true;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void i(x80.u headers, boolean z11) {
        boolean zH;
        Intrinsics.g(headers, "headers");
        byte[] bArr = y80.c.f96853a;
        synchronized (this) {
            try {
                if (this.f52405h && z11) {
                    this.f52406i.getClass();
                } else {
                    this.f52405h = true;
                    this.f52404g.add(headers);
                }
                if (z11) {
                    this.f52406i.f52392b = true;
                }
                zH = h();
                notifyAll();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (zH) {
            return;
        }
        this.f52399b.c(this.f52398a);
    }

    public final synchronized void j(int i5) {
        fq.c.o(i5, "errorCode");
        if (this.f52410m == 0) {
            this.f52410m = i5;
            notifyAll();
        }
    }
}
