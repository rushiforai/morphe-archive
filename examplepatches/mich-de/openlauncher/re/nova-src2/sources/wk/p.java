package wk;

import java.lang.ref.ReferenceQueue;
import java.util.AbstractQueue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes.dex */
public final class p extends ReentrantLock {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f94557a;

    /* renamed from: b, reason: collision with root package name */
    public volatile int f94558b;

    /* renamed from: c, reason: collision with root package name */
    public long f94559c;

    /* renamed from: d, reason: collision with root package name */
    public int f94560d;

    /* renamed from: e, reason: collision with root package name */
    public int f94561e;

    /* renamed from: f, reason: collision with root package name */
    public volatile AtomicReferenceArray f94562f;

    /* renamed from: g, reason: collision with root package name */
    public final long f94563g;

    /* renamed from: h, reason: collision with root package name */
    public final ReferenceQueue f94564h;

    /* renamed from: i, reason: collision with root package name */
    public final ReferenceQueue f94565i;

    /* renamed from: j, reason: collision with root package name */
    public final AbstractQueue f94566j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicInteger f94567k = new AtomicInteger();

    /* renamed from: l, reason: collision with root package name */
    public final AbstractQueue f94568l;

    /* renamed from: m, reason: collision with root package name */
    public final AbstractQueue f94569m;
    public final a n;

    public p(g0 g0Var, int i5, long j11, a aVar) {
        this.f94557a = g0Var;
        this.f94563g = j11;
        this.n = aVar;
        AtomicReferenceArray atomicReferenceArray = new AtomicReferenceArray(i5);
        int length = (atomicReferenceArray.length() * 3) / 4;
        this.f94561e = length;
        if (g0Var.f94530j == c.f94500a && length == j11) {
            this.f94561e = length + 1;
        }
        this.f94562f = atomicReferenceArray;
        u uVar = g0Var.f94527g;
        r rVar = u.f94571a;
        this.f94564h = uVar != rVar ? new ReferenceQueue() : null;
        this.f94565i = g0Var.f94528h != rVar ? new ReferenceQueue() : null;
        this.f94566j = g0Var.b() ? new ConcurrentLinkedQueue() : g0.f94520s;
        AbstractQueue abstractQueue = g0.f94520s;
        this.f94568l = abstractQueue;
        this.f94569m = g0Var.b() ? new j() : abstractQueue;
    }

    public final h0 a(h0 h0Var, h0 h0Var2) {
        Object key = h0Var.getKey();
        if (key == null) {
            return null;
        }
        z zVarD = h0Var.d();
        Object obj = zVarD.get();
        if (obj == null && zVarD.b()) {
            return null;
        }
        h0 h0VarD = k.d(this.f94557a.f94533m, this, h0Var, h0Var2, key);
        h0VarD.m(zVarD.e(this.f94565i, obj, h0VarD));
        return h0VarD;
    }

    public final void b() {
        while (true) {
            h0 h0Var = (h0) this.f94566j.poll();
            if (h0Var == null) {
                return;
            }
            AbstractQueue abstractQueue = this.f94569m;
            if (abstractQueue.contains(h0Var)) {
                abstractQueue.add(h0Var);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x003e, code lost:
    
        r3.f94560d++;
        r4 = r3.m(r5, r5, r5.getKey(), r5.d().get(), r5.d(), 3);
        r5 = r3.f94558b - 1;
        r11.set(r12, r4);
        r3.f94558b = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00f8, code lost:
    
        r3.o();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c() throws Throwable {
        p pVar;
        p pVar2;
        u uVar = this.f94557a.f94527g;
        r rVar = u.f94571a;
        int i5 = 0;
        if (uVar != rVar) {
            int i11 = 0;
            do {
                Object objPoll = this.f94564h.poll();
                if (objPoll == null) {
                    break;
                }
                h0 h0Var = (h0) objPoll;
                g0 g0Var = this.f94557a;
                g0Var.getClass();
                int iJ = h0Var.j();
                p pVarD = g0Var.d(iJ);
                pVarD.lock();
                try {
                    AtomicReferenceArray atomicReferenceArray = pVarD.f94562f;
                    int length = iJ & (atomicReferenceArray.length() - 1);
                    h0 h0VarP = (h0) atomicReferenceArray.get(length);
                    pVar2 = pVarD;
                    while (true) {
                        if (h0VarP == null) {
                            break;
                        }
                        if (h0VarP == h0Var) {
                            try {
                                break;
                            } catch (Throwable th2) {
                                th = th2;
                                pVar2.unlock();
                                pVar2.o();
                                throw th;
                            }
                        }
                        h0VarP = h0VarP.p();
                    }
                    pVar2.unlock();
                    pVar2.o();
                    i11++;
                } catch (Throwable th3) {
                    th = th3;
                    pVar2 = pVarD;
                }
            } while (i11 != 16);
        }
        if (this.f94557a.f94528h != rVar) {
            do {
                Object objPoll2 = this.f94565i.poll();
                if (objPoll2 == null) {
                    return;
                }
                z zVar = (z) objPoll2;
                g0 g0Var2 = this.f94557a;
                g0Var2.getClass();
                h0 h0VarF = zVar.f();
                int iJ2 = h0VarF.j();
                p pVarD2 = g0Var2.d(iJ2);
                Object key = h0VarF.getKey();
                pVarD2.lock();
                try {
                    AtomicReferenceArray atomicReferenceArray2 = pVarD2.f94562f;
                    int length2 = iJ2 & (atomicReferenceArray2.length() - 1);
                    h0 h0VarP2 = (h0) atomicReferenceArray2.get(length2);
                    int i12 = iJ2;
                    pVar = pVarD2;
                    while (true) {
                        if (h0VarP2 != null) {
                            int i13 = i12;
                            try {
                                Object key2 = h0VarP2.getKey();
                                if (h0VarP2.j() != i13 || key2 == null || !pVar.f94557a.f94525e.m(key, key2)) {
                                    h0VarP2 = h0VarP2.p();
                                    i12 = i13;
                                } else if (h0VarP2.d() == zVar) {
                                    pVar.f94560d++;
                                    h0 h0VarM = pVar.m(h0VarP2, h0VarP2, key2, zVar.get(), zVar, 3);
                                    int i14 = pVar.f94558b - 1;
                                    atomicReferenceArray2.set(length2, h0VarM);
                                    pVar.f94558b = i14;
                                    pVar.unlock();
                                    if (!pVar.isHeldByCurrentThread()) {
                                    }
                                } else {
                                    pVar.unlock();
                                    if (!pVar.isHeldByCurrentThread()) {
                                    }
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                pVar.unlock();
                                if (!pVar.isHeldByCurrentThread()) {
                                    pVar.o();
                                }
                                throw th;
                            }
                        } else {
                            pVar.unlock();
                            if (!pVar.isHeldByCurrentThread()) {
                            }
                        }
                    }
                    i5++;
                } catch (Throwable th5) {
                    th = th5;
                    pVar = pVarD2;
                }
            } while (i5 != 16);
        }
    }

    public final void d(Object obj, int i5, int i11, Object obj2) {
        this.f94559c -= i5;
        if (k.f(i11)) {
            this.n.getClass();
        }
        g0 g0Var = this.f94557a;
        if (g0Var.f94531k != g0.f94520s) {
            i0.a(i11, obj, obj2);
            g0Var.f94531k.getClass();
        }
    }

    public final void e(h0 h0Var) {
        if (this.f94557a.b()) {
            b();
            long jA = h0Var.d().a();
            long j11 = this.f94563g;
            if (jA > j11 && !l(h0Var, h0Var.j(), 5)) {
                throw new AssertionError();
            }
            while (this.f94559c > j11) {
                for (h0 h0Var2 : this.f94569m) {
                    if (h0Var2.d().a() > 0) {
                        if (!l(h0Var2, h0Var2.j(), 5)) {
                            throw new AssertionError();
                        }
                    }
                }
                throw new AssertionError();
            }
        }
    }

    public final void f() {
        AtomicReferenceArray atomicReferenceArray = this.f94562f;
        int length = atomicReferenceArray.length();
        if (length >= 1073741824) {
            return;
        }
        int i5 = this.f94558b;
        AtomicReferenceArray atomicReferenceArray2 = new AtomicReferenceArray(length << 1);
        this.f94561e = (atomicReferenceArray2.length() * 3) / 4;
        int length2 = atomicReferenceArray2.length() - 1;
        for (int i11 = 0; i11 < length; i11++) {
            h0 h0VarP = (h0) atomicReferenceArray.get(i11);
            if (h0VarP != null) {
                h0 h0VarP2 = h0VarP.p();
                int iJ = h0VarP.j() & length2;
                if (h0VarP2 == null) {
                    atomicReferenceArray2.set(iJ, h0VarP);
                } else {
                    h0 h0Var = h0VarP;
                    while (h0VarP2 != null) {
                        int iJ2 = h0VarP2.j() & length2;
                        if (iJ2 != iJ) {
                            h0Var = h0VarP2;
                            iJ = iJ2;
                        }
                        h0VarP2 = h0VarP2.p();
                    }
                    atomicReferenceArray2.set(iJ, h0Var);
                    while (h0VarP != h0Var) {
                        int iJ3 = h0VarP.j() & length2;
                        h0 h0VarA = a(h0VarP, (h0) atomicReferenceArray2.get(iJ3));
                        if (h0VarA != null) {
                            atomicReferenceArray2.set(iJ3, h0VarA);
                        } else {
                            k(h0VarP);
                            i5--;
                        }
                        h0VarP = h0VarP.p();
                    }
                }
            }
        }
        this.f94562f = atomicReferenceArray2;
        this.f94558b = i5;
    }

    public final Object g(int i5, Object obj) {
        try {
            if (this.f94558b != 0) {
                h0 h0VarH = h(this.f94557a.f94532l.r(), obj, i5);
                if (h0VarH == null) {
                    return null;
                }
                Object obj2 = h0VarH.d().get();
                if (obj2 != null) {
                    this.f94557a.getClass();
                    this.f94566j.add(h0VarH);
                    h0VarH.getKey();
                    this.f94557a.getClass();
                    this.f94557a.getClass();
                    return obj2;
                }
                q();
            }
            return null;
        } finally {
            i();
        }
    }

    public final h0 h(long j11, Object obj, int i5) {
        h0 h0VarP = (h0) this.f94562f.get((r3.length() - 1) & i5);
        while (true) {
            if (h0VarP == null) {
                h0VarP = null;
                break;
            }
            if (h0VarP.j() == i5) {
                Object key = h0VarP.getKey();
                if (key == null) {
                    q();
                } else if (this.f94557a.f94525e.m(obj, key)) {
                    break;
                }
            }
            h0VarP = h0VarP.p();
        }
        if (h0VarP == null) {
            return null;
        }
        this.f94557a.getClass();
        return h0VarP;
    }

    public final void i() {
        if ((this.f94567k.incrementAndGet() & 63) == 0) {
            n(this.f94557a.f94532l.r());
            o();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0076, code lost:
    
        unlock();
        o();
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x007c, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(Object obj, Object obj2, boolean z11, int i5) {
        int i11;
        lock();
        try {
            long jR = this.f94557a.f94532l.r();
            n(jR);
            if (this.f94558b + 1 > this.f94561e) {
                f();
            }
            AtomicReferenceArray atomicReferenceArray = this.f94562f;
            int length = (atomicReferenceArray.length() - 1) & i5;
            h0 h0Var = (h0) atomicReferenceArray.get(length);
            h0 h0VarP = h0Var;
            while (true) {
                if (h0VarP == null) {
                    this.f94560d++;
                    h0 h0VarE = k.e(this.f94557a.f94533m, this, obj, i5, h0Var);
                    p(h0VarE, obj2, jR);
                    atomicReferenceArray.set(length, h0VarE);
                    this.f94558b++;
                    e(h0VarE);
                    break;
                }
                Object key = h0VarP.getKey();
                if (h0VarP.j() == i5 && key != null && this.f94557a.f94525e.m(obj, key)) {
                    z zVarD = h0VarP.d();
                    Object obj3 = zVarD.get();
                    if (obj3 != null) {
                        if (z11) {
                            this.f94557a.getClass();
                            this.f94569m.add(h0VarP);
                        } else {
                            this.f94560d++;
                            d(obj, zVarD.a(), 2, obj3);
                            p(h0VarP, obj2, jR);
                            e(h0VarP);
                        }
                        unlock();
                        o();
                        return obj3;
                    }
                    this.f94560d++;
                    if (zVarD.b()) {
                        d(obj, zVarD.a(), 3, obj3);
                        p(h0VarP, obj2, jR);
                        i11 = this.f94558b;
                    } else {
                        p(h0VarP, obj2, jR);
                        i11 = this.f94558b + 1;
                    }
                    this.f94558b = i11;
                    e(h0VarP);
                } else {
                    h0VarP = h0VarP.p();
                }
            }
        } catch (Throwable th2) {
            unlock();
            o();
            throw th2;
        }
    }

    public final void k(h0 h0Var) {
        Object key = h0Var.getKey();
        h0Var.j();
        d(key, h0Var.d().a(), 3, h0Var.d().get());
        this.f94568l.remove(h0Var);
        this.f94569m.remove(h0Var);
    }

    public final boolean l(h0 h0Var, int i5, int i11) {
        AtomicReferenceArray atomicReferenceArray = this.f94562f;
        int length = i5 & (atomicReferenceArray.length() - 1);
        h0 h0Var2 = (h0) atomicReferenceArray.get(length);
        for (h0 h0VarP = h0Var2; h0VarP != null; h0VarP = h0VarP.p()) {
            if (h0VarP == h0Var) {
                this.f94560d++;
                h0 h0VarM = m(h0Var2, h0VarP, h0VarP.getKey(), h0VarP.d().get(), h0VarP.d(), i11);
                int i12 = this.f94558b - 1;
                atomicReferenceArray.set(length, h0VarM);
                this.f94558b = i12;
                return true;
            }
        }
        return false;
    }

    public final h0 m(h0 h0Var, h0 h0Var2, Object obj, Object obj2, z zVar, int i5) {
        d(obj, zVar.a(), i5, obj2);
        this.f94568l.remove(h0Var2);
        this.f94569m.remove(h0Var2);
        if (zVar.c()) {
            zVar.d(null);
            return h0Var;
        }
        int i11 = this.f94558b;
        h0 h0VarP = h0Var2.p();
        while (h0Var != h0Var2) {
            h0 h0VarA = a(h0Var, h0VarP);
            if (h0VarA != null) {
                h0VarP = h0VarA;
            } else {
                k(h0Var);
                i11--;
            }
            h0Var = h0Var.p();
        }
        this.f94558b = i11;
        return h0VarP;
    }

    public final void n(long j11) {
        if (tryLock()) {
            try {
                c();
                g0 g0Var = this.f94557a;
                b();
                if (((h0) this.f94568l.peek()) != null) {
                    g0Var.getClass();
                }
                if (((h0) this.f94569m.peek()) != null) {
                    g0Var.getClass();
                }
                this.f94567k.set(0);
            } finally {
                unlock();
            }
        }
    }

    public final void o() {
        if (isHeldByCurrentThread()) {
            return;
        }
        this.f94557a.f94531k.getClass();
    }

    public final void p(h0 h0Var, Object obj, long j11) {
        z zVarD = h0Var.d();
        g0 g0Var = this.f94557a;
        g0Var.f94530j.getClass();
        h0Var.m(g0Var.f94528h.b(this, h0Var, obj));
        b();
        this.f94559c++;
        this.f94569m.add(h0Var);
        this.f94568l.add(h0Var);
        zVarD.d(obj);
    }

    public final void q() {
        if (tryLock()) {
            try {
                c();
            } finally {
                unlock();
            }
        }
    }
}
