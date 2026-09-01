package defpackage;

import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t94 implements c44 {
    public final rva a;
    public final cgd b;
    public long c;
    public final CopyOnWriteArrayList d;
    public final LinkedBlockingDeque e;

    public t94(rva rvaVar, cgd cgdVar) {
        cgdVar.getClass();
        this.a = rvaVar;
        this.b = cgdVar;
        this.c = Long.MIN_VALUE;
        this.d = new CopyOnWriteArrayList();
        this.e = new LinkedBlockingDeque();
    }

    @Override // defpackage.c44
    public final dva a() throws IOException {
        imb imbVarD;
        long j;
        imb imbVar;
        IOException iOException = null;
        while (true) {
            try {
                if (this.d.isEmpty() && !this.a.a(null)) {
                    b();
                    iOException.getClass();
                    throw iOException;
                }
                if (this.a.k.q) {
                    throw new IOException("Canceled");
                }
                eoc eocVar = this.b.a;
                long jNanoTime = System.nanoTime();
                long j2 = this.c - jNanoTime;
                if (this.d.isEmpty() || j2 <= 0) {
                    imbVarD = d();
                    j = 250000000;
                    this.c = jNanoTime + 250000000;
                } else {
                    j = j2;
                    imbVarD = null;
                }
                if (imbVarD == null) {
                    TimeUnit timeUnit = TimeUnit.NANOSECONDS;
                    CopyOnWriteArrayList copyOnWriteArrayList = this.d;
                    if (copyOnWriteArrayList.isEmpty() || (imbVar = (imb) this.e.poll(j, timeUnit)) == null) {
                        imbVarD = null;
                    } else {
                        copyOnWriteArrayList.remove(imbVar.a);
                        imbVarD = imbVar;
                    }
                    if (imbVarD == null) {
                    }
                }
                boolean z = false;
                if (imbVarD.b == null && imbVarD.c == null) {
                    b();
                    if (!imbVarD.a.c()) {
                        imbVarD = imbVarD.a.g();
                    }
                    if (imbVarD.b == null && imbVarD.c == null) {
                        z = true;
                    }
                    if (z) {
                        return imbVarD.a.b();
                    }
                }
                Throwable th = imbVarD.c;
                if (th != null) {
                    if (!(th instanceof IOException)) {
                        throw th;
                    }
                    if (iOException == null) {
                        iOException = (IOException) th;
                    } else {
                        kyd.D(iOException, th);
                    }
                }
                jmb jmbVar = imbVarD.b;
                if (jmbVar != null) {
                    this.a.p.addFirst(jmbVar);
                }
            } finally {
                b();
            }
        }
    }

    public final void b() {
        CopyOnWriteArrayList copyOnWriteArrayList = this.d;
        Iterator it2 = copyOnWriteArrayList.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            jmb jmbVar = (jmb) it2.next();
            jmbVar.cancel();
            jmb jmbVarA = jmbVar.a();
            if (jmbVarA != null) {
                this.a.p.addLast(jmbVarA);
            }
        }
        copyOnWriteArrayList.clear();
    }

    @Override // defpackage.c44
    public final rva c() {
        return this.a;
    }

    public final imb d() {
        jmb n94Var;
        rva rvaVar = this.a;
        if (rvaVar.a(null)) {
            try {
                n94Var = rvaVar.b();
            } catch (Throwable th) {
                n94Var = new n94(th);
            }
            if (n94Var.c()) {
                return new imb(n94Var, (Throwable) null, 6);
            }
            if (n94Var instanceof n94) {
                return ((n94) n94Var).a;
            }
            this.d.add(n94Var);
            this.b.d().d(new s94(ggf.b + " connect " + rvaVar.i.h.h(), n94Var, this), 0L);
        }
        return null;
    }
}
