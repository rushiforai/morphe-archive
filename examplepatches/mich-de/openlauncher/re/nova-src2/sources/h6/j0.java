package h6;

import android.os.Looper;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class j0 {

    /* renamed from: k, reason: collision with root package name */
    public static final Object f59386k = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final Object f59387a;

    /* renamed from: b, reason: collision with root package name */
    public final t.f f59388b;

    /* renamed from: c, reason: collision with root package name */
    public int f59389c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f59390d;

    /* renamed from: e, reason: collision with root package name */
    public volatile Object f59391e;

    /* renamed from: f, reason: collision with root package name */
    public volatile Object f59392f;

    /* renamed from: g, reason: collision with root package name */
    public int f59393g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f59394h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f59395i;

    /* renamed from: j, reason: collision with root package name */
    public final f0 f59396j;

    public j0(int i5) {
        Boolean bool = Boolean.FALSE;
        this.f59387a = new Object();
        this.f59388b = new t.f();
        this.f59389c = 0;
        this.f59392f = f59386k;
        this.f59396j = new f0(this);
        this.f59391e = bool;
        this.f59393g = 0;
    }

    public static void a(String str) {
        s.a.b0().f86500b.getClass();
        if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            throw new IllegalStateException(b.c0.l("Cannot invoke ", str, " on a background thread"));
        }
    }

    public final void b(i0 i0Var) {
        if (i0Var.f59379b) {
            if (!i0Var.e()) {
                i0Var.a(false);
                return;
            }
            int i5 = i0Var.f59380c;
            int i11 = this.f59393g;
            if (i5 >= i11) {
                return;
            }
            i0Var.f59380c = i11;
            i0Var.f59378a.onChanged(this.f59391e);
        }
    }

    public final void c(i0 i0Var) {
        if (this.f59394h) {
            this.f59395i = true;
            return;
        }
        this.f59394h = true;
        do {
            this.f59395i = false;
            if (i0Var != null) {
                b(i0Var);
                i0Var = null;
            } else {
                t.f fVar = this.f59388b;
                fVar.getClass();
                t.d dVar = new t.d(fVar);
                fVar.f87879c.put(dVar, Boolean.FALSE);
                while (dVar.hasNext()) {
                    b((i0) ((Map.Entry) dVar.next()).getValue());
                    if (this.f59395i) {
                        break;
                    }
                }
            }
        } while (this.f59395i);
        this.f59394h = false;
    }

    public final Object d() {
        Object obj = this.f59391e;
        if (obj != f59386k) {
            return obj;
        }
        return null;
    }

    public final void e(a0 a0Var, n0 n0Var) {
        Object obj;
        a("observe");
        if (a0Var.getLifecycle().b() == t.f59440a) {
            return;
        }
        h0 h0Var = new h0(this, a0Var, n0Var);
        t.f fVar = this.f59388b;
        t.c cVarB = fVar.b(n0Var);
        if (cVarB != null) {
            obj = cVarB.f87871b;
        } else {
            t.c cVar = new t.c(n0Var, h0Var);
            fVar.f87880d++;
            t.c cVar2 = fVar.f87878b;
            if (cVar2 == null) {
                fVar.f87877a = cVar;
                fVar.f87878b = cVar;
            } else {
                cVar2.f87872c = cVar;
                cVar.f87873d = cVar2;
                fVar.f87878b = cVar;
            }
            obj = null;
        }
        i0 i0Var = (i0) obj;
        if (i0Var != null && !i0Var.c(a0Var)) {
            throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
        }
        if (i0Var != null) {
            return;
        }
        a0Var.getLifecycle().a(h0Var);
    }

    public final void f(n0 n0Var) {
        Object obj;
        a("observeForever");
        g0 g0Var = new g0(this, n0Var);
        t.f fVar = this.f59388b;
        t.c cVarB = fVar.b(n0Var);
        if (cVarB != null) {
            obj = cVarB.f87871b;
        } else {
            t.c cVar = new t.c(n0Var, g0Var);
            fVar.f87880d++;
            t.c cVar2 = fVar.f87878b;
            if (cVar2 == null) {
                fVar.f87877a = cVar;
                fVar.f87878b = cVar;
            } else {
                cVar2.f87872c = cVar;
                cVar.f87873d = cVar2;
                fVar.f87878b = cVar;
            }
            obj = null;
        }
        i0 i0Var = (i0) obj;
        if (i0Var instanceof h0) {
            throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
        }
        if (i0Var != null) {
            return;
        }
        g0Var.a(true);
    }

    public void g() {
    }

    public void h() {
    }

    public void i(n0 n0Var) {
        a("removeObserver");
        i0 i0Var = (i0) this.f59388b.c(n0Var);
        if (i0Var == null) {
            return;
        }
        i0Var.b();
        i0Var.a(false);
    }

    public abstract void j(Object obj);

    public j0() {
        this.f59387a = new Object();
        this.f59388b = new t.f();
        this.f59389c = 0;
        Object obj = f59386k;
        this.f59392f = obj;
        this.f59396j = new f0(this);
        this.f59391e = obj;
        this.f59393g = -1;
    }
}
