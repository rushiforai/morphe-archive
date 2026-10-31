package b90;

import b.c0;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.lang.ref.Reference;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import x80.e0;
import x80.h0;
import x80.m0;
import x80.r;
import x80.v;

/* loaded from: classes.dex */
public final class j implements x80.i {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f17684a;

    /* renamed from: b, reason: collision with root package name */
    public final h0 f17685b;

    /* renamed from: c, reason: collision with root package name */
    public final n f17686c;

    /* renamed from: d, reason: collision with root package name */
    public final i f17687d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f17688e;

    /* renamed from: f, reason: collision with root package name */
    public Object f17689f;

    /* renamed from: g, reason: collision with root package name */
    public f f17690g;

    /* renamed from: h, reason: collision with root package name */
    public m f17691h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f17692i;

    /* renamed from: j, reason: collision with root package name */
    public e f17693j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f17694k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f17695l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f17696m;
    public volatile boolean n;
    public volatile e o;

    /* renamed from: p, reason: collision with root package name */
    public volatile m f17697p;

    public j(e0 e0Var, h0 originalRequest) {
        Intrinsics.g(originalRequest, "originalRequest");
        this.f17684a = e0Var;
        this.f17685b = originalRequest;
        this.f17686c = (n) e0Var.f95459b.f33136b;
        e0Var.f95462e.getClass();
        i iVar = new i(this);
        iVar.g(e0Var.f95478w, TimeUnit.MILLISECONDS);
        this.f17687d = iVar;
        this.f17688e = new AtomicBoolean();
        this.f17696m = true;
    }

    public static final String a(j jVar) {
        StringBuilder sb2 = new StringBuilder();
        c0.C(sb2, jVar.n ? "canceled " : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, ActionCategory.CALL, " to ");
        v vVarH = jVar.f17685b.f95509a.h("/...");
        Intrinsics.d(vVarH);
        vVarH.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        vVarH.f(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        sb2.append(vVarH.b().f95633i);
        return sb2.toString();
    }

    @Override // x80.i
    public final void b(x80.j jVar) {
        g gVar;
        if (!this.f17688e.compareAndSet(false, true)) {
            throw new IllegalStateException("Already Executed");
        }
        g90.m mVar = g90.m.f57276a;
        this.f17689f = g90.m.f57276a.g();
        r rVar = this.f17684a.f95458a;
        g gVar2 = new g(this, jVar);
        rVar.getClass();
        synchronized (rVar) {
            rVar.f95598b.add(gVar2);
            String str = this.f17685b.f95509a.f95628d;
            Iterator it = rVar.f95599c.iterator();
            while (true) {
                if (!it.hasNext()) {
                    Iterator it2 = rVar.f95598b.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            gVar = null;
                            break;
                        } else {
                            gVar = (g) it2.next();
                            if (Intrinsics.b(gVar.f17681c.f17685b.f95509a.f95628d, str)) {
                                break;
                            }
                        }
                    }
                } else {
                    gVar = (g) it.next();
                    if (Intrinsics.b(gVar.f17681c.f17685b.f95509a.f95628d, str)) {
                        break;
                    }
                }
            }
            if (gVar != null) {
                gVar2.f17680b = gVar.f17680b;
            }
            Unit unit = Unit.f71706a;
        }
        rVar.c();
    }

    public final void c(m mVar) {
        byte[] bArr = y80.c.f96853a;
        if (this.f17691h != null) {
            throw new IllegalStateException("Check failed.");
        }
        this.f17691h = mVar;
        mVar.f17715p.add(new h(this, this.f17689f));
    }

    @Override // x80.i
    public final void cancel() {
        Socket socket;
        if (this.n) {
            return;
        }
        this.n = true;
        e eVar = this.o;
        if (eVar != null) {
            eVar.f17666c.cancel();
        }
        m mVar = this.f17697p;
        if (mVar == null || (socket = mVar.f17704c) == null) {
            return;
        }
        y80.c.d(socket);
    }

    public final Object clone() {
        return new j(this.f17684a, this.f17685b);
    }

    public final IOException d(IOException iOException) throws IOException {
        IOException interruptedIOException;
        Socket socketI;
        byte[] bArr = y80.c.f96853a;
        m mVar = this.f17691h;
        if (mVar != null) {
            synchronized (mVar) {
                socketI = i();
            }
            if (this.f17691h == null) {
                if (socketI != null) {
                    y80.c.d(socketI);
                }
            } else if (socketI != null) {
                throw new IllegalStateException("Check failed.");
            }
        }
        if (!this.f17692i && this.f17687d.i()) {
            interruptedIOException = new InterruptedIOException("timeout");
            if (iOException != null) {
                interruptedIOException.initCause(iOException);
            }
        } else {
            interruptedIOException = iOException;
        }
        if (iOException != null) {
            Intrinsics.d(interruptedIOException);
        }
        return interruptedIOException;
    }

    public final void e(boolean z11) {
        e eVar;
        synchronized (this) {
            if (!this.f17696m) {
                throw new IllegalStateException("released");
            }
            Unit unit = Unit.f71706a;
        }
        if (z11 && (eVar = this.o) != null) {
            eVar.f17666c.cancel();
            eVar.f17664a.g(eVar, true, true, null);
        }
        this.f17693j = null;
    }

    public final m0 f() {
        ArrayList arrayList = new ArrayList();
        b70.d.z0(this.f17684a.f95460c, arrayList);
        arrayList.add(new c90.a(this.f17684a));
        arrayList.add(new c90.a(this.f17684a.f95467j));
        arrayList.add(new z80.b(this.f17684a.f95468k));
        arrayList.add(a.f17648a);
        b70.d.z0(this.f17684a.f95461d, arrayList);
        arrayList.add(new c90.b());
        h0 h0Var = this.f17685b;
        e0 e0Var = this.f17684a;
        try {
            try {
                m0 m0VarB = new c90.f(this, arrayList, 0, null, h0Var, e0Var.f95479x, e0Var.f95480y, e0Var.f95481z).b(this.f17685b);
                if (this.n) {
                    y80.c.c(m0VarB);
                    throw new IOException("Canceled");
                }
                h(null);
                return m0VarB;
            } catch (IOException e3) {
                IOException iOExceptionH = h(e3);
                Intrinsics.e(iOExceptionH, "null cannot be cast to non-null type kotlin.Throwable");
                throw iOExceptionH;
            }
        } catch (Throwable th2) {
            if (0 == 0) {
                h(null);
            }
            throw th2;
        }
    }

    public final IOException g(e exchange, boolean z11, boolean z12, IOException iOException) {
        boolean z13;
        boolean z14;
        Intrinsics.g(exchange, "exchange");
        if (exchange.equals(this.o)) {
            synchronized (this) {
                z13 = false;
                if (z11) {
                    try {
                        if (!this.f17694k) {
                            if (z12 || !this.f17695l) {
                                z14 = false;
                            }
                            Unit unit = Unit.f71706a;
                        }
                        if (z11) {
                            this.f17694k = false;
                        }
                        if (z12) {
                            this.f17695l = false;
                        }
                        boolean z15 = this.f17694k;
                        boolean z16 = (z15 || this.f17695l) ? false : true;
                        if (!z15 && !this.f17695l && !this.f17696m) {
                            z13 = true;
                        }
                        z14 = z13;
                        z13 = z16;
                        Unit unit2 = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                } else {
                    if (z12) {
                    }
                    z14 = false;
                    Unit unit22 = Unit.f71706a;
                }
            }
            if (z13) {
                this.o = null;
                m mVar = this.f17691h;
                if (mVar != null) {
                    synchronized (mVar) {
                        mVar.f17714m++;
                    }
                }
            }
            if (z14) {
                return d(iOException);
            }
        }
        return iOException;
    }

    public final IOException h(IOException iOException) {
        boolean z11;
        synchronized (this) {
            try {
                z11 = false;
                if (this.f17696m) {
                    this.f17696m = false;
                    if (!this.f17694k && !this.f17695l) {
                        z11 = true;
                    }
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return z11 ? d(iOException) : iOException;
    }

    public final Socket i() {
        m mVar = this.f17691h;
        Intrinsics.d(mVar);
        byte[] bArr = y80.c.f96853a;
        ArrayList arrayList = mVar.f17715p;
        Iterator it = arrayList.iterator();
        int i5 = 0;
        while (true) {
            if (!it.hasNext()) {
                i5 = -1;
                break;
            }
            if (Intrinsics.b(((Reference) it.next()).get(), this)) {
                break;
            }
            i5++;
        }
        if (i5 == -1) {
            throw new IllegalStateException("Check failed.");
        }
        arrayList.remove(i5);
        this.f17691h = null;
        if (!arrayList.isEmpty()) {
            return null;
        }
        mVar.f17716q = System.nanoTime();
        n nVar = this.f17686c;
        ConcurrentLinkedQueue concurrentLinkedQueue = nVar.f17721e;
        a90.c cVar = nVar.f17719c;
        byte[] bArr2 = y80.c.f96853a;
        if (!mVar.f17711j && nVar.f17717a != 0) {
            cVar.c(nVar.f17720d, 0L);
            return null;
        }
        mVar.f17711j = true;
        concurrentLinkedQueue.remove(mVar);
        if (concurrentLinkedQueue.isEmpty()) {
            cVar.a();
        }
        Socket socket = mVar.f17705d;
        Intrinsics.d(socket);
        return socket;
    }

    @Override // x80.i
    public final m0 l() {
        if (!this.f17688e.compareAndSet(false, true)) {
            throw new IllegalStateException("Already Executed");
        }
        this.f17687d.h();
        g90.m mVar = g90.m.f57276a;
        this.f17689f = g90.m.f57276a.g();
        try {
            r rVar = this.f17684a.f95458a;
            synchronized (rVar) {
                rVar.f95600d.add(this);
            }
            return f();
        } finally {
            r rVar2 = this.f17684a.f95458a;
            rVar2.a(rVar2.f95600d, this);
        }
    }

    @Override // x80.i
    public final boolean p() {
        return this.n;
    }
}
