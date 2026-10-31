package io.sentry;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes4.dex */
public final class i4 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final u2 f67314a;

    /* renamed from: b, reason: collision with root package name */
    public u2 f67315b;

    /* renamed from: c, reason: collision with root package name */
    public final j4 f67316c;

    /* renamed from: d, reason: collision with root package name */
    public final f4 f67317d;

    /* renamed from: e, reason: collision with root package name */
    public final g0 f67318e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f67319f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f67320g;

    /* renamed from: h, reason: collision with root package name */
    public final bg.g f67321h;

    /* renamed from: i, reason: collision with root package name */
    public k4 f67322i;

    /* renamed from: j, reason: collision with root package name */
    public final ConcurrentHashMap f67323j;

    /* renamed from: k, reason: collision with root package name */
    public final ConcurrentHashMap f67324k;

    /* renamed from: l, reason: collision with root package name */
    public final io.sentry.util.c f67325l;

    public i4(io.sentry.protocol.u uVar, l4 l4Var, f4 f4Var, String str, a0 a0Var, u2 u2Var, bg.g gVar, c4 c4Var) {
        this.f67319f = false;
        this.f67320g = new AtomicBoolean(false);
        this.f67323j = new ConcurrentHashMap();
        this.f67324k = new ConcurrentHashMap();
        this.f67325l = new io.sentry.util.c(new ge.d(16));
        this.f67316c = new j4(uVar, new l4(), str, l4Var, f4Var.f67225b.f67316c.f67355d);
        this.f67317d = f4Var;
        i30.j.Q(a0Var, "hub is required");
        this.f67318e = a0Var;
        this.f67321h = gVar;
        this.f67322i = c4Var;
        if (u2Var != null) {
            this.f67314a = u2Var;
        } else {
            this.f67314a = a0Var.t().getDateProvider().a();
        }
    }

    @Override // io.sentry.q0
    public final boolean a() {
        return this.f67319f;
    }

    @Override // io.sentry.q0
    public final void c() {
        i(this.f67316c.f67358g);
    }

    @Override // io.sentry.q0
    public final void d(String str) {
        this.f67316c.f67357f = str;
    }

    @Override // io.sentry.q0
    public final q4 e() {
        throw null;
    }

    @Override // io.sentry.q0
    public final boolean f(u2 u2Var) {
        if (this.f67315b == null) {
            return false;
        }
        this.f67315b = u2Var;
        return true;
    }

    @Override // io.sentry.q0
    public final void g(Number number, String str) {
        if (this.f67319f) {
            this.f67318e.t().getLogger().g(g3.DEBUG, "The span is already finished. Measurement %s cannot be set", str);
            return;
        }
        this.f67324k.put(str, new io.sentry.protocol.j(number, null));
        f4 f4Var = this.f67317d;
        i4 i4Var = f4Var.f67225b;
        if (i4Var == this || i4Var.f67324k.containsKey(str)) {
            return;
        }
        f4Var.g(number, str);
    }

    @Override // io.sentry.q0
    public final String getDescription() {
        return this.f67316c.f67357f;
    }

    @Override // io.sentry.q0
    public final m4 h() {
        return this.f67316c.f67358g;
    }

    @Override // io.sentry.q0
    public final void i(m4 m4Var) {
        q(m4Var, this.f67318e.t().getDateProvider().a());
    }

    @Override // io.sentry.q0
    public final void k(Object obj, String str) {
        this.f67323j.put(str, obj);
    }

    @Override // io.sentry.q0
    public final void n(String str, Long l9, m1 m1Var) {
        if (this.f67319f) {
            this.f67318e.t().getLogger().g(g3.DEBUG, "The span is already finished. Measurement %s cannot be set", str);
            return;
        }
        this.f67324k.put(str, new io.sentry.protocol.j(l9, m1Var.apiName()));
        f4 f4Var = this.f67317d;
        i4 i4Var = f4Var.f67225b;
        if (i4Var == this || i4Var.f67324k.containsKey(str)) {
            return;
        }
        f4Var.n(str, l9, m1Var);
    }

    @Override // io.sentry.q0
    public final j4 o() {
        return this.f67316c;
    }

    @Override // io.sentry.q0
    public final u2 p() {
        return this.f67315b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // io.sentry.q0
    public final void q(m4 m4Var, u2 u2Var) {
        u2 u2Var2;
        u2 u2Var3;
        if (this.f67319f || !this.f67320g.compareAndSet(false, true)) {
            return;
        }
        j4 j4Var = this.f67316c;
        j4Var.f67358g = m4Var;
        l4 l4Var = j4Var.f67353b;
        if (u2Var == null) {
            u2Var = this.f67318e.t().getDateProvider().a();
        }
        this.f67315b = u2Var;
        bg.g gVar = this.f67321h;
        gVar.getClass();
        if (gVar.f17888a) {
            f4 f4Var = this.f67317d;
            i4 i4Var = f4Var.f67225b;
            CopyOnWriteArrayList<i4> copyOnWriteArrayList = f4Var.f67226c;
            if (!i4Var.f67316c.f67353b.equals(l4Var)) {
                ArrayList arrayList = new ArrayList();
                Iterator it = copyOnWriteArrayList.iterator();
                while (it.hasNext()) {
                    i4 i4Var2 = (i4) it.next();
                    l4 l4Var2 = i4Var2.f67316c.f67354c;
                    if (l4Var2 != null && l4Var2.equals(l4Var)) {
                        arrayList.add(i4Var2);
                    }
                }
                copyOnWriteArrayList = arrayList;
            }
            u2 u2Var4 = null;
            u2 u2Var5 = null;
            for (i4 i4Var3 : copyOnWriteArrayList) {
                if (u2Var4 == null || i4Var3.f67314a.b(u2Var4) < 0) {
                    u2Var4 = i4Var3.f67314a;
                }
                if (u2Var5 == null || ((u2Var3 = i4Var3.f67315b) != null && u2Var3.b(u2Var5) > 0)) {
                    u2Var5 = i4Var3.f67315b;
                }
            }
            if (gVar.f17888a && u2Var5 != null && ((u2Var2 = this.f67315b) == null || u2Var2.b(u2Var5) > 0)) {
                f(u2Var5);
            }
        }
        k4 k4Var = this.f67322i;
        if (k4Var != null) {
            k4Var.a(this);
        }
        this.f67319f = true;
    }

    @Override // io.sentry.q0
    public final u2 r() {
        return this.f67314a;
    }

    public i4(r4 r4Var, f4 f4Var, a0 a0Var, u2 u2Var, s4 s4Var) {
        this.f67319f = false;
        this.f67320g = new AtomicBoolean(false);
        this.f67323j = new ConcurrentHashMap();
        this.f67324k = new ConcurrentHashMap();
        this.f67325l = new io.sentry.util.c(new ge.d(16));
        this.f67316c = r4Var;
        this.f67317d = f4Var;
        this.f67318e = a0Var;
        this.f67322i = null;
        if (u2Var != null) {
            this.f67314a = u2Var;
        } else {
            this.f67314a = a0Var.t().getDateProvider().a();
        }
        this.f67321h = s4Var;
    }
}
