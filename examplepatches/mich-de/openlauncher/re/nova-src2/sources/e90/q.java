package e90;

import com.amplitude.core.events.Plan;
import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import m90.d0;

/* loaded from: classes.dex */
public final class q implements Closeable {

    /* renamed from: z, reason: collision with root package name */
    public static final c0 f52345z;

    /* renamed from: a, reason: collision with root package name */
    public final g f52346a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f52347b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final String f52348c;

    /* renamed from: d, reason: collision with root package name */
    public int f52349d;

    /* renamed from: e, reason: collision with root package name */
    public int f52350e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f52351f;

    /* renamed from: g, reason: collision with root package name */
    public final a90.e f52352g;

    /* renamed from: h, reason: collision with root package name */
    public final a90.c f52353h;

    /* renamed from: i, reason: collision with root package name */
    public final a90.c f52354i;

    /* renamed from: j, reason: collision with root package name */
    public final a90.c f52355j;

    /* renamed from: k, reason: collision with root package name */
    public final b0 f52356k;

    /* renamed from: l, reason: collision with root package name */
    public long f52357l;

    /* renamed from: m, reason: collision with root package name */
    public long f52358m;
    public long n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public final c0 f52359p;

    /* renamed from: q, reason: collision with root package name */
    public c0 f52360q;

    /* renamed from: r, reason: collision with root package name */
    public long f52361r;

    /* renamed from: s, reason: collision with root package name */
    public long f52362s;

    /* renamed from: t, reason: collision with root package name */
    public long f52363t;

    /* renamed from: u, reason: collision with root package name */
    public long f52364u;

    /* renamed from: v, reason: collision with root package name */
    public final Socket f52365v;

    /* renamed from: w, reason: collision with root package name */
    public final z f52366w;

    /* renamed from: x, reason: collision with root package name */
    public final k f52367x;

    /* renamed from: y, reason: collision with root package name */
    public final LinkedHashSet f52368y;

    static {
        c0 c0Var = new c0();
        c0Var.c(7, 65535);
        c0Var.c(5, ReaderJsonLexerKt.BATCH_SIZE);
        f52345z = c0Var;
    }

    public q(bm.t tVar) {
        this.f52346a = (g) tVar.f18115g;
        String str = (String) tVar.f18112d;
        if (str == null) {
            Intrinsics.m("connectionName");
            throw null;
        }
        this.f52348c = str;
        this.f52350e = 3;
        a90.e eVar = (a90.e) tVar.f18110b;
        this.f52352g = eVar;
        this.f52353h = eVar.e();
        this.f52354i = eVar.e();
        this.f52355j = eVar.e();
        this.f52356k = b0.f52300a;
        c0 c0Var = new c0();
        c0Var.c(7, 16777216);
        this.f52359p = c0Var;
        this.f52360q = f52345z;
        this.f52364u = r0.a();
        Socket socket = (Socket) tVar.f18111c;
        if (socket == null) {
            Intrinsics.m("socket");
            throw null;
        }
        this.f52365v = socket;
        m90.c0 c0Var2 = (m90.c0) tVar.f18114f;
        if (c0Var2 == null) {
            Intrinsics.m("sink");
            throw null;
        }
        this.f52366w = new z(c0Var2);
        d0 d0Var = (d0) tVar.f18113e;
        if (d0Var == null) {
            Intrinsics.m(Plan.AMP_PLAN_SOURCE);
            throw null;
        }
        this.f52367x = new k(this, new u(d0Var));
        this.f52368y = new LinkedHashSet();
    }

    public final void a(int i5, int i11, IOException iOException) throws IOException {
        int i12;
        Object[] array;
        fq.c.o(i5, "connectionCode");
        fq.c.o(i11, "streamCode");
        byte[] bArr = y80.c.f96853a;
        try {
            d(i5);
        } catch (IOException unused) {
        }
        synchronized (this) {
            try {
                if (this.f52347b.isEmpty()) {
                    array = null;
                } else {
                    array = this.f52347b.values().toArray(new y[0]);
                    this.f52347b.clear();
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        y[] yVarArr = (y[]) array;
        if (yVarArr != null) {
            for (y yVar : yVarArr) {
                try {
                    yVar.c(i11, iOException);
                } catch (IOException unused2) {
                }
            }
        }
        try {
            this.f52366w.close();
        } catch (IOException unused3) {
        }
        try {
            this.f52365v.close();
        } catch (IOException unused4) {
        }
        this.f52353h.f();
        this.f52354i.f();
        this.f52355j.f();
    }

    public final synchronized y b(int i5) {
        return (y) this.f52347b.get(Integer.valueOf(i5));
    }

    public final synchronized y c(int i5) {
        y yVar;
        yVar = (y) this.f52347b.remove(Integer.valueOf(i5));
        notifyAll();
        return yVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        a(1, 9, null);
    }

    public final void d(int i5) {
        fq.c.o(i5, "statusCode");
        synchronized (this.f52366w) {
            Ref.IntRef intRef = new Ref.IntRef();
            synchronized (this) {
                if (this.f52351f) {
                    return;
                }
                this.f52351f = true;
                int i11 = this.f52349d;
                intRef.f71861a = i11;
                Unit unit = Unit.f71706a;
                this.f52366w.d(i11, i5, y80.c.f96853a);
            }
        }
    }

    public final synchronized void e(long j11) {
        long j12 = this.f52361r + j11;
        this.f52361r = j12;
        long j13 = j12 - this.f52362s;
        if (j13 >= this.f52359p.a() / 2) {
            l(0, j13);
            this.f52362s += j13;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0035, code lost:
    
        r2 = java.lang.Math.min((int) java.lang.Math.min(r12, r6 - r4), r8.f52366w.f52414c);
        r6 = r2;
        r8.f52363t += r6;
        r4 = kotlin.Unit.f71706a;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(int i5, boolean z11, m90.g gVar, long j11) {
        int iMin;
        long j12;
        if (j11 == 0) {
            this.f52366w.b(z11, i5, gVar, 0);
            return;
        }
        while (j11 > 0) {
            synchronized (this) {
                while (true) {
                    try {
                        try {
                            long j13 = this.f52363t;
                            long j14 = this.f52364u;
                            if (j13 < j14) {
                                break;
                            } else {
                                if (!this.f52347b.containsKey(Integer.valueOf(i5))) {
                                    throw new IOException("stream closed");
                                }
                                wait();
                            }
                        } catch (InterruptedException unused) {
                            Thread.currentThread().interrupt();
                            throw new InterruptedIOException();
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
            j11 -= j12;
            this.f52366w.b(z11 && j11 == 0, i5, gVar, iMin);
        }
    }

    public final void flush() {
        this.f52366w.flush();
    }

    public final void h(int i5, int i11) {
        fq.c.o(i11, "errorCode");
        this.f52353h.c(new n(this.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i5 + "] writeSynReset", this, i5, i11, 1), 0L);
    }

    public final void l(int i5, long j11) {
        this.f52353h.c(new p(this.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i5 + "] windowUpdate", this, i5, j11), 0L);
    }
}
