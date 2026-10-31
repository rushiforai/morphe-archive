package io.sentry;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Timer;
import java.util.UUID;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes4.dex */
public final class f4 implements r0 {

    /* renamed from: b, reason: collision with root package name */
    public final i4 f67225b;

    /* renamed from: d, reason: collision with root package name */
    public final a0 f67227d;

    /* renamed from: e, reason: collision with root package name */
    public final String f67228e;

    /* renamed from: g, reason: collision with root package name */
    public volatile d4 f67230g;

    /* renamed from: h, reason: collision with root package name */
    public volatile d4 f67231h;

    /* renamed from: i, reason: collision with root package name */
    public volatile Timer f67232i;

    /* renamed from: j, reason: collision with root package name */
    public final Object f67233j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f67234k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f67235l;

    /* renamed from: m, reason: collision with root package name */
    public final e1.m0 f67236m;
    public final io.sentry.protocol.d0 n;
    public final u0 o;

    /* renamed from: p, reason: collision with root package name */
    public final io.sentry.protocol.c f67237p;

    /* renamed from: q, reason: collision with root package name */
    public final t4 f67238q;

    /* renamed from: r, reason: collision with root package name */
    public final s4 f67239r;

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.protocol.u f67224a = new io.sentry.protocol.u((UUID) null);

    /* renamed from: c, reason: collision with root package name */
    public final CopyOnWriteArrayList f67226c = new CopyOnWriteArrayList();

    /* renamed from: f, reason: collision with root package name */
    public e4 f67229f = e4.f67210c;

    public f4(r4 r4Var, a0 a0Var, s4 s4Var, t4 t4Var) {
        this.f67232i = null;
        Object obj = new Object();
        this.f67233j = obj;
        this.f67234k = new AtomicBoolean(false);
        AtomicBoolean atomicBoolean = new AtomicBoolean(false);
        this.f67235l = atomicBoolean;
        this.f67237p = new io.sentry.protocol.c();
        this.f67225b = new i4(r4Var, this, a0Var, s4Var.f67765b, s4Var);
        this.f67228e = r4Var.f67701k;
        this.o = r4Var.o;
        this.f67227d = a0Var;
        this.f67238q = t4Var;
        this.n = r4Var.f67702l;
        this.f67239r = s4Var;
        e1.m0 m0Var = r4Var.n;
        if (m0Var != null) {
            this.f67236m = m0Var;
        } else {
            this.f67236m = new e1.m0(a0Var.t().getLogger());
        }
        if (t4Var != null) {
            t4Var.c(this);
        }
        if (s4Var.f67768e == null && s4Var.f67769f == null) {
            return;
        }
        boolean z11 = true;
        this.f67232i = new Timer(true);
        Long l9 = s4Var.f67769f;
        if (l9 != null) {
            synchronized (obj) {
                try {
                    if (this.f67232i != null) {
                        s();
                        atomicBoolean.set(true);
                        this.f67231h = new d4(this, 1);
                        this.f67232i.schedule(this.f67231h, l9.longValue());
                    }
                } catch (Throwable th2) {
                    this.f67227d.t().getLogger().e(g3.WARNING, "Failed to schedule finish timer", th2);
                    m4 m4VarH = h();
                    if (m4VarH == null) {
                        m4VarH = m4.DEADLINE_EXCEEDED;
                    }
                    if (this.f67239r.f67768e == null) {
                        z11 = false;
                    }
                    b(m4VarH, z11, null);
                    this.f67235l.set(false);
                } finally {
                }
            }
        }
        m();
    }

    @Override // io.sentry.q0
    public final boolean a() {
        return this.f67225b.f67319f;
    }

    @Override // io.sentry.r0
    public final void b(m4 m4Var, boolean z11, x xVar) {
        if (this.f67225b.f67319f) {
            return;
        }
        u2 u2VarA = this.f67227d.t().getDateProvider().a();
        CopyOnWriteArrayList copyOnWriteArrayList = this.f67226c;
        ListIterator listIterator = copyOnWriteArrayList.listIterator(copyOnWriteArrayList.size());
        while (listIterator.hasPrevious()) {
            i4 i4Var = (i4) listIterator.previous();
            i4Var.f67322i = null;
            i4Var.q(m4Var, u2VarA);
        }
        u(m4Var, u2VarA, z11, xVar);
    }

    @Override // io.sentry.q0
    public final void c() {
        q(h(), null);
    }

    @Override // io.sentry.q0
    public final void d(String str) {
        i4 i4Var = this.f67225b;
        if (i4Var.f67319f) {
            this.f67227d.t().getLogger().g(g3.DEBUG, "The transaction is already finished. Description %s cannot be set", str);
        } else {
            i4Var.f67316c.f67357f = str;
        }
    }

    @Override // io.sentry.q0
    public final q4 e() throws Throwable {
        f4 f4Var;
        if (!this.f67227d.t().isTraceSampling()) {
            return null;
        }
        synchronized (this) {
            try {
                try {
                    if (this.f67236m.f51337b) {
                        AtomicReference atomicReference = new AtomicReference();
                        AtomicReference atomicReference2 = new AtomicReference();
                        this.f67227d.s(new ae.h(19, atomicReference, atomicReference2));
                        f4Var = this;
                        this.f67236m.q(f4Var, (io.sentry.protocol.f0) atomicReference.get(), (io.sentry.protocol.u) atomicReference2.get(), this.f67227d.t(), this.f67225b.f67316c.f67355d);
                        f4Var.f67236m.f51337b = false;
                    } else {
                        f4Var = this;
                    }
                    return f4Var.f67236m.s();
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // io.sentry.q0
    public final boolean f(u2 u2Var) {
        return this.f67225b.f(u2Var);
    }

    @Override // io.sentry.q0
    public final void g(Number number, String str) {
        this.f67225b.g(number, str);
    }

    @Override // io.sentry.q0
    public final String getDescription() {
        return this.f67225b.f67316c.f67357f;
    }

    @Override // io.sentry.r0
    public final io.sentry.protocol.u getEventId() {
        return this.f67224a;
    }

    @Override // io.sentry.r0
    public final String getName() {
        return this.f67228e;
    }

    @Override // io.sentry.q0
    public final m4 h() {
        return this.f67225b.f67316c.f67358g;
    }

    @Override // io.sentry.q0
    public final void i(m4 m4Var) {
        q(m4Var, null);
    }

    @Override // io.sentry.q0
    public final q0 j(String str, String str2, u2 u2Var, u0 u0Var) {
        bg.g gVar = new bg.g(6);
        i4 i4Var = this.f67225b;
        boolean z11 = i4Var.f67319f;
        v1 v1Var = v1.f67862a;
        if (!z11 && this.o.equals(u0Var)) {
            int size = this.f67226c.size();
            a0 a0Var = this.f67227d;
            if (size >= a0Var.t().getMaxSpans()) {
                a0Var.t().getLogger().g(g3.WARNING, "Span operation: %s, description: %s dropped due to limit reached. Returning NoOpSpan.", str, str2);
                return v1Var;
            }
            if (!i4Var.f67319f) {
                f4 f4Var = i4Var.f67317d;
                l4 l4Var = i4Var.f67316c.f67353b;
                CopyOnWriteArrayList copyOnWriteArrayList = f4Var.f67226c;
                a0 a0Var2 = f4Var.f67227d;
                i4 i4Var2 = f4Var.f67225b;
                if (!i4Var2.f67319f && f4Var.o.equals(u0Var)) {
                    if (copyOnWriteArrayList.size() >= a0Var2.t().getMaxSpans()) {
                        a0Var2.t().getLogger().g(g3.WARNING, "Span operation: %s, description: %s dropped due to limit reached. Returning NoOpSpan.", str, str2);
                        return v1Var;
                    }
                    i30.j.Q(l4Var, "parentSpanId is required");
                    f4Var.t();
                    i4 i4Var3 = new i4(i4Var2.f67316c.f67352a, l4Var, f4Var, str, f4Var.f67227d, u2Var, gVar, new c4(f4Var));
                    i4Var3.f67316c.f67357f = str2;
                    i4Var3.k(String.valueOf(Thread.currentThread().getId()), "thread.id");
                    i4Var3.k(a0Var2.t().getMainThreadChecker().a() ? "main" : Thread.currentThread().getName(), "thread.name");
                    copyOnWriteArrayList.add(i4Var3);
                    t4 t4Var = f4Var.f67238q;
                    if (t4Var != null) {
                        t4Var.b(i4Var3);
                    }
                    return i4Var3;
                }
            }
        }
        return v1Var;
    }

    @Override // io.sentry.q0
    public final void k(Object obj, String str) {
        i4 i4Var = this.f67225b;
        if (i4Var.f67319f) {
            this.f67227d.t().getLogger().g(g3.DEBUG, "The transaction is already finished. Data %s cannot be set", str);
        } else {
            i4Var.k(obj, str);
        }
    }

    @Override // io.sentry.r0
    public final i4 l() {
        ArrayList arrayList = new ArrayList(this.f67226c);
        if (arrayList.isEmpty()) {
            return null;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            if (!((i4) arrayList.get(size)).f67319f) {
                return (i4) arrayList.get(size);
            }
        }
        return null;
    }

    @Override // io.sentry.r0
    public final void m() {
        Long l9;
        synchronized (this.f67233j) {
            try {
                if (this.f67232i != null && (l9 = this.f67239r.f67768e) != null) {
                    t();
                    this.f67234k.set(true);
                    this.f67230g = new d4(this, 0);
                    try {
                        this.f67232i.schedule(this.f67230g, l9.longValue());
                    } catch (Throwable th2) {
                        this.f67227d.t().getLogger().e(g3.WARNING, "Failed to schedule finish timer", th2);
                        m4 m4VarH = h();
                        if (m4VarH == null) {
                            m4VarH = m4.OK;
                        }
                        q(m4VarH, null);
                        this.f67234k.set(false);
                    }
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    @Override // io.sentry.q0
    public final void n(String str, Long l9, m1 m1Var) {
        this.f67225b.n(str, l9, m1Var);
    }

    @Override // io.sentry.q0
    public final j4 o() {
        return this.f67225b.f67316c;
    }

    @Override // io.sentry.q0
    public final u2 p() {
        return this.f67225b.f67315b;
    }

    @Override // io.sentry.q0
    public final void q(m4 m4Var, u2 u2Var) {
        u(m4Var, u2Var, true, null);
    }

    @Override // io.sentry.q0
    public final u2 r() {
        return this.f67225b.f67314a;
    }

    public final void s() {
        synchronized (this.f67233j) {
            try {
                if (this.f67231h != null) {
                    this.f67231h.cancel();
                    this.f67235l.set(false);
                    this.f67231h = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void t() {
        synchronized (this.f67233j) {
            try {
                if (this.f67230g != null) {
                    this.f67230g.cancel();
                    this.f67234k.set(false);
                    this.f67230g = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00a8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void u(m4 m4Var, u2 u2Var, boolean z11, x xVar) {
        c2 c2VarK;
        u2 u2Var2 = this.f67225b.f67315b;
        if (u2Var == null) {
            u2Var = u2Var2;
        }
        if (u2Var == null) {
            u2Var = this.f67227d.t().getDateProvider().a();
        }
        Iterator it = this.f67226c.iterator();
        while (it.hasNext()) {
            ((i4) it.next()).f67321h.getClass();
        }
        this.f67229f = new e4(true, m4Var);
        if (this.f67225b.f67319f) {
            return;
        }
        if (!this.f67239r.f67767d || v()) {
            AtomicReference atomicReference = new AtomicReference();
            i4 i4Var = this.f67225b;
            i4Var.f67322i = new be.f(5, this, i4Var.f67322i, atomicReference);
            i4Var.q(this.f67229f.f67212b, u2Var);
            Boolean bool = Boolean.TRUE;
            tm.o oVar = this.f67225b.f67316c.f67355d;
            if (bool.equals(oVar == null ? null : (Boolean) oVar.f89494c)) {
                tm.o oVar2 = this.f67225b.f67316c.f67355d;
                if (bool.equals(oVar2 == null ? null : (Boolean) oVar2.f89495d)) {
                    c2VarK = this.f67227d.t().getTransactionProfiler().k(this, (List) atomicReference.get(), this.f67227d.t());
                }
            } else {
                c2VarK = null;
            }
            if (atomicReference.get() != null) {
                ((List) atomicReference.get()).clear();
            }
            this.f67227d.s(new c4(this));
            io.sentry.protocol.b0 b0Var = new io.sentry.protocol.b0(this);
            if (this.f67232i != null) {
                synchronized (this.f67233j) {
                    try {
                        if (this.f67232i != null) {
                            t();
                            s();
                            this.f67232i.cancel();
                            this.f67232i = null;
                        }
                    } finally {
                    }
                }
            }
            if (z11 && this.f67226c.isEmpty() && this.f67239r.f67768e != null) {
                this.f67227d.t().getLogger().g(g3.DEBUG, "Dropping idle transaction %s because it has no child spans", this.f67228e);
            } else {
                b0Var.f67475t.putAll(this.f67225b.f67324k);
                this.f67227d.z(b0Var, e(), xVar, c2VarK);
            }
        }
    }

    public final boolean v() {
        ArrayList arrayList = new ArrayList(this.f67226c);
        if (arrayList.isEmpty()) {
            return true;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            i4 i4Var = (i4) it.next();
            if (!i4Var.f67319f && i4Var.f67315b == null) {
                return false;
            }
        }
        return true;
    }
}
