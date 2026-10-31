package mk;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.util.Log;
import cl.k1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.KotlinNothingValueException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import p1.l1;
import p1.o1;
import p1.z;
import z.a1;
import z.b1;
import z.p0;
import z.r0;

/* loaded from: classes3.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public boolean f76460a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f76461b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f76462c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f76463d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f76464e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f76465f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f76466g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f76467h;

    /* renamed from: i, reason: collision with root package name */
    public Object f76468i;

    /* renamed from: j, reason: collision with root package name */
    public Object f76469j;

    /* renamed from: k, reason: collision with root package name */
    public Object f76470k;

    public o(Context context, String str, Intent intent, m mVar) {
        this.f76464e = new ArrayList();
        this.f76465f = new CopyOnWriteArrayList();
        this.f76462c = context;
        this.f76463d = str;
        this.f76466g = intent;
        this.f76467h = mVar;
        this.f76461b = p6.j.F(new ex.a(str, 3, false));
        this.f76468i = new kk.i(this, 1);
    }

    public void a() throws Exception {
        AtomicReference atomicReference = (AtomicReference) this.f76467h;
        try {
            switch (((l1) atomicReference.get()).ordinal()) {
                case 0:
                    throw new IllegalStateException("The paused composition is invalid because of a previous exception");
                case 1:
                    throw new IllegalStateException("The paused composition has been cancelled");
                case 2:
                case 3:
                case 4:
                    throw new IllegalStateException("The paused composition has not completed yet");
                case 5:
                    b();
                    l1 l1Var = l1.f81498f;
                    l1 l1Var2 = l1.f81499g;
                    while (!atomicReference.compareAndSet(l1Var, l1Var2)) {
                        if (atomicReference.get() != l1Var) {
                            o1.b("Unexpected state change from: " + l1Var + " to: " + l1Var2 + '.');
                            return;
                        }
                    }
                    return;
                case 6:
                    throw new IllegalStateException("The paused composition has already been applied");
                default:
                    throw new NoWhenBranchMatchedException();
            }
        } catch (Exception e3) {
            atomicReference.set(l1.f81493a);
            throw e3;
        }
    }

    public void b() {
        synchronized (this.f76466g) {
            try {
                ((mh.c) this.f76470k).J((i50.c) this.f76465f, (x1.l) this.f76469j);
                ((x1.l) this.f76469j).c();
                ((x1.l) this.f76469j).d();
                ((x1.l) this.f76469j).b();
                ((z) this.f76461b).f81682q = null;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                ((x1.l) this.f76469j).b();
                ((z) this.f76461b).f81682q = null;
                throw th2;
            }
        }
    }

    public void c() {
        p0 p0Var;
        ((AtomicReference) this.f76467h).set(l1.f81494b);
        x1.l lVar = (x1.l) this.f76469j;
        if (lVar.f94965d.c()) {
            p0Var = lVar.f94965d;
            p0 p0Var2 = b1.f97745a;
            lVar.f94965d = new p0();
            lVar.f94964c.g();
        } else {
            p0Var = null;
        }
        lVar.b();
        z zVar = (z) this.f76461b;
        zVar.f81682q = null;
        if (p0Var != null) {
            zVar.f81686u.f94972k = p0Var;
            zVar.f81688w = 2;
        }
    }

    public mh.c d() {
        return (mh.c) this.f76470k;
    }

    public x1.l e() {
        return (x1.l) this.f76469j;
    }

    public boolean f() {
        return ((l1) ((AtomicReference) this.f76467h).get()).compareTo(l1.f81498f) >= 0;
    }

    public boolean g() {
        return ((AtomicReference) this.f76467h).get() == l1.f81497e;
    }

    public void h() {
        boolean z11;
        l1 l1Var = l1.f81496d;
        l1 l1Var2 = l1.f81498f;
        AtomicReference atomicReference = (AtomicReference) this.f76467h;
        while (true) {
            if (atomicReference.compareAndSet(l1Var, l1Var2)) {
                z11 = true;
                break;
            } else if (atomicReference.get() != l1Var) {
                z11 = false;
                break;
            }
        }
        if (z11) {
            return;
        }
        o1.b("Unexpected state change from: " + l1Var + " to: " + l1Var2 + '.');
    }

    public void i() {
        boolean z11;
        AtomicReference atomicReference = (AtomicReference) this.f76467h;
        Object obj = atomicReference.get();
        l1 l1Var = l1.f81496d;
        if (obj == l1Var) {
            return;
        }
        l1 l1Var2 = l1.f81498f;
        while (true) {
            if (atomicReference.compareAndSet(l1Var2, l1Var)) {
                z11 = true;
                break;
            } else if (atomicReference.get() != l1Var2) {
                z11 = false;
                break;
            }
        }
        if (z11) {
            return;
        }
        o1.b("Unexpected state change from: " + l1Var2 + " to: " + l1Var + '.');
    }

    public boolean j(rl.g gVar) throws Exception {
        z zVar = (z) this.f76461b;
        p1.w wVar = (p1.w) this.f76462c;
        p1.t tVar = (p1.t) this.f76463d;
        boolean z11 = this.f76460a;
        AtomicReference atomicReference = (AtomicReference) this.f76467h;
        try {
            switch (((l1) atomicReference.get()).ordinal()) {
                case 0:
                    throw new IllegalStateException("The paused composition is invalid because of a previous exception");
                case 1:
                    throw new IllegalStateException("The paused composition has been cancelled");
                case 2:
                    if (z11) {
                        tVar.f81576z = 100;
                        tVar.f81575y = true;
                    }
                    try {
                        this.f76468i = wVar.b(zVar, gVar, (Function2) this.f76464e);
                        l1 l1Var = l1.f81495c;
                        l1 l1Var2 = l1.f81496d;
                        while (true) {
                            if (!atomicReference.compareAndSet(l1Var, l1Var2)) {
                                if (atomicReference.get() != l1Var) {
                                    o1.b("Unexpected state change from: " + l1Var + " to: " + l1Var2 + '.');
                                }
                            }
                        }
                        if (((a1) this.f76468i).b()) {
                            h();
                        }
                        return f();
                    } finally {
                        if (z11) {
                            tVar.v();
                        }
                    }
                case 3:
                    l1 l1Var3 = l1.f81496d;
                    l1 l1Var4 = l1.f81497e;
                    while (true) {
                        if (!atomicReference.compareAndSet(l1Var3, l1Var4)) {
                            if (atomicReference.get() != l1Var3) {
                                o1.b("Unexpected state change from: " + l1Var3 + " to: " + l1Var4 + '.');
                            }
                        }
                    }
                    try {
                        this.f76468i = wVar.m(zVar, gVar, (a1) this.f76468i);
                        l1 l1Var5 = l1.f81497e;
                        l1 l1Var6 = l1.f81496d;
                        while (true) {
                            if (!atomicReference.compareAndSet(l1Var5, l1Var6)) {
                                if (atomicReference.get() != l1Var5) {
                                    o1.b("Unexpected state change from: " + l1Var5 + " to: " + l1Var6 + '.');
                                }
                            }
                        }
                        if (((a1) this.f76468i).b()) {
                            h();
                        }
                        return f();
                    } catch (Throwable th2) {
                        l1 l1Var7 = l1.f81497e;
                        l1 l1Var8 = l1.f81496d;
                        while (true) {
                            if (!atomicReference.compareAndSet(l1Var7, l1Var8)) {
                                if (atomicReference.get() != l1Var7) {
                                    o1.b("Unexpected state change from: " + l1Var7 + " to: " + l1Var8 + '.');
                                }
                            }
                        }
                        throw th2;
                    }
                case 4:
                    p1.u.d("Recursive call to resume()");
                    throw new KotlinNothingValueException();
                case 5:
                    throw new IllegalStateException("Pausable composition is complete and apply() should be applied");
                case 6:
                    throw new IllegalStateException("The paused composition has been applied");
                default:
                    throw new NoWhenBranchMatchedException();
            }
        } catch (Exception e3) {
            atomicReference.set(l1.f81493a);
            throw e3;
        }
    }

    public void k(Runnable runnable) {
        m(new ab.z(this, runnable, false, 28));
    }

    public void l() {
        Iterator it = ((CopyOnWriteArrayList) this.f76465f).iterator();
        while (it.hasNext()) {
            f fVar = (f) it.next();
            fVar.getClass();
            Log.i("HsdpClientImpl", "HSDP bound service disconnected");
            ((Handler) ((qh.b) fVar.f76431b.f76461b).zza()).post(new ai.h(fVar, 27));
        }
    }

    public void m(Runnable runnable) {
        ((Handler) ((qh.b) this.f76461b).zza()).post(new k1(runnable, 1));
    }

    public o(z zVar, p1.w wVar, p1.t tVar, r0 r0Var, Function2 function2, boolean z11, i50.c cVar, Object obj) {
        this.f76461b = zVar;
        this.f76462c = wVar;
        this.f76463d = tVar;
        this.f76464e = function2;
        this.f76460a = z11;
        this.f76465f = cVar;
        this.f76466g = obj;
        this.f76467h = new AtomicReference(l1.f81495c);
        p0 p0Var = b1.f97745a;
        Intrinsics.e(p0Var, "null cannot be cast to non-null type androidx.collection.ScatterSet<E of androidx.collection.ScatterSetKt.emptyScatterSet>");
        this.f76468i = p0Var;
        x1.l lVar = new x1.l();
        lVar.g(r0Var, tVar.C());
        this.f76469j = lVar;
        this.f76470k = new mh.c(cVar.f61381d);
    }
}
