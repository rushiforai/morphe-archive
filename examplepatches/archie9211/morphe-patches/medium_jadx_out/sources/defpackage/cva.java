package defpackage;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.lang.ref.Reference;
import java.net.Socket;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cva implements Cloneable {
    public final up8 a;
    public final kbb b;
    public final boolean c;
    public final eva d;
    public final bva e;
    public final AtomicBoolean f;
    public Object g;
    public c44 h;
    public dva i;
    public boolean j;
    public zf3 k;
    public boolean l;
    public boolean m;
    public boolean n;
    public boolean o;
    public boolean p;
    public volatile boolean q;
    public volatile zf3 r;
    public final CopyOnWriteArrayList s;

    public cva(up8 up8Var, kbb kbbVar, boolean z) {
        up8Var.getClass();
        kbbVar.getClass();
        this.a = up8Var;
        this.b = kbbVar;
        this.c = z;
        this.d = (eva) up8Var.E.b;
        up8Var.d.getClass();
        bva bvaVar = new bva(this);
        bvaVar.g(up8Var.w, TimeUnit.MILLISECONDS);
        this.e = bvaVar;
        this.f = new AtomicBoolean();
        this.p = true;
        this.s = new CopyOnWriteArrayList();
        new AtomicReference(kbbVar.e);
    }

    public final void a(dva dvaVar) {
        dvaVar.getClass();
        TimeZone timeZone = ggf.a;
        if (this.i != null) {
            ygf.f("Check failed.");
        } else {
            this.i = dvaVar;
            dvaVar.p.add(new ava(this, this.g));
        }
    }

    public final IOException b(IOException iOException) {
        IOException interruptedIOException;
        Socket socketJ;
        TimeZone timeZone = ggf.a;
        dva dvaVar = this.i;
        if (dvaVar != null) {
            synchronized (dvaVar) {
                socketJ = j();
            }
            if (this.i == null) {
                if (socketJ != null) {
                    ggf.c(socketJ);
                }
            } else if (socketJ != null) {
                ygf.f("Check failed.");
                return null;
            }
        }
        if (!this.j && this.e.j()) {
            interruptedIOException = new InterruptedIOException("timeout");
            if (iOException != null) {
                interruptedIOException.initCause(iOException);
            }
        } else {
            interruptedIOException = iOException;
        }
        if (iOException != null) {
            interruptedIOException.getClass();
        }
        return interruptedIOException;
    }

    public final void c(j41 j41Var) {
        if (!this.f.compareAndSet(false, true)) {
            ygf.f("Already Executed");
            return;
        }
        ea9 ea9Var = ea9.a;
        this.g = ea9.a.g();
        n0c n0cVar = this.a.a;
        zua zuaVar = new zua(this, j41Var);
        n0cVar.getClass();
        n0c.b0(n0cVar, zuaVar, null, null, 6);
    }

    public final void cancel() {
        if (this.q) {
            return;
        }
        this.q = true;
        zf3 zf3Var = this.r;
        if (zf3Var != null) {
            ((b44) zf3Var.e).cancel();
        }
        Iterator it2 = this.s.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            ((jmb) it2.next()).cancel();
        }
    }

    public final Object clone() {
        return new cva(this.a, this.b, this.c);
    }

    public final adb d() {
        if (!this.f.compareAndSet(false, true)) {
            ygf.f("Already Executed");
            return null;
        }
        this.e.i();
        ea9 ea9Var = ea9.a;
        this.g = ea9.a.g();
        try {
            n0c n0cVar = this.a.a;
            synchronized (n0cVar) {
                ((ArrayDeque) n0cVar.d).add(this);
            }
            return g();
        } finally {
            n0c n0cVar2 = this.a.a;
            n0cVar2.getClass();
            n0c.b0(n0cVar2, null, this, null, 5);
        }
    }

    public final void e(boolean z) {
        zf3 zf3Var;
        synchronized (this) {
            if (!this.p) {
                throw new IllegalStateException("released");
            }
        }
        if (z && (zf3Var = this.r) != null) {
            ((b44) zf3Var.e).cancel();
            ((cva) zf3Var.d).h(zf3Var, true, true, true, true, null);
        }
        this.k = null;
    }

    public final adb g() {
        ArrayList arrayList = new ArrayList();
        bu1.n0(this.a.b, arrayList);
        arrayList.add(new ky0(this.a));
        arrayList.add(new ky0(this.a.j));
        arrayList.add(new ky0(this.a.k));
        arrayList.add(a41.c);
        if (!this.c) {
            bu1.n0(this.a.c, arrayList);
        }
        arrayList.add(a41.b);
        kbb kbbVar = this.b;
        up8 up8Var = this.a;
        try {
            try {
                adb adbVarB = new nva(this, arrayList, 0, null, kbbVar, up8Var.x, up8Var.y, up8Var.z).b(this.b);
                if (this.q) {
                    egf.b(adbVarB);
                    throw new IOException("Canceled");
                }
                i(null);
                return adbVarB;
            } catch (IOException e) {
                IOException iOExceptionI = i(e);
                iOExceptionI.getClass();
                throw iOExceptionI;
            }
        } catch (Throwable th) {
            if (0 == 0) {
                i(null);
            }
            throw th;
        }
    }

    public final IOException h(zf3 zf3Var, boolean z, boolean z2, boolean z3, boolean z4, IOException iOException) {
        boolean z5;
        boolean z6;
        zf3Var.getClass();
        if (zf3Var.equals(this.r)) {
            synchronized (this) {
                z5 = false;
                if (z) {
                    try {
                        if (!this.l) {
                            if ((z2 || !this.m) && ((!z4 || !this.n) && (!z3 || !this.o))) {
                            }
                        }
                        if (z) {
                            this.l = false;
                        }
                        if (z2) {
                            this.m = false;
                        }
                        if (z4) {
                            this.n = false;
                        }
                        if (z3) {
                            this.o = false;
                        }
                        boolean z7 = (this.l || this.m || this.n || this.o) ? false : true;
                        if (z7) {
                            if (!this.p) {
                                z5 = true;
                            }
                        }
                        boolean z8 = z7;
                        z6 = z5;
                        z5 = z8;
                    } catch (Throwable th) {
                        throw th;
                    }
                } else {
                    z6 = z2 ? false : false;
                }
            }
            if (z5) {
                this.r = null;
                dva dvaVar = this.i;
                if (dvaVar != null) {
                    dvaVar.d();
                }
            }
            if (z6) {
                return b(iOException);
            }
        }
        return iOException;
    }

    public final IOException i(IOException iOException) {
        boolean z;
        synchronized (this) {
            z = false;
            if (this.p) {
                this.p = false;
                if (!this.l && !this.m && !this.n) {
                    if (!this.o) {
                        z = true;
                    }
                }
            }
        }
        return z ? b(iOException) : iOException;
    }

    public final Socket j() {
        dva dvaVar = this.i;
        dvaVar.getClass();
        TimeZone timeZone = ggf.a;
        ArrayList arrayList = dvaVar.p;
        Iterator it2 = arrayList.iterator();
        int i = 0;
        while (true) {
            if (!it2.hasNext()) {
                i = -1;
                break;
            }
            if (g76.L(((Reference) it2.next()).get(), this)) {
                break;
            }
            i++;
        }
        if (i == -1) {
            ygf.f("Check failed.");
            return null;
        }
        arrayList.remove(i);
        this.i = null;
        if (!arrayList.isEmpty()) {
            return null;
        }
        dvaVar.q = System.nanoTime();
        eva evaVar = this.d;
        bgd bgdVar = evaVar.b;
        ConcurrentLinkedQueue concurrentLinkedQueue = evaVar.d;
        TimeZone timeZone2 = ggf.a;
        if (!dvaVar.j) {
            bgdVar.d(evaVar.c, 0L);
            return null;
        }
        dvaVar.j = true;
        concurrentLinkedQueue.remove(dvaVar);
        if (concurrentLinkedQueue.isEmpty()) {
            bgdVar.a();
        }
        return dvaVar.e;
    }
}
