package wk;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.atomic.AtomicReferenceArray;

/* loaded from: classes3.dex */
public final class l implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f94542a;

    /* renamed from: b, reason: collision with root package name */
    public int f94543b = -1;

    /* renamed from: c, reason: collision with root package name */
    public p f94544c;

    /* renamed from: d, reason: collision with root package name */
    public AtomicReferenceArray f94545d;

    /* renamed from: e, reason: collision with root package name */
    public h0 f94546e;

    /* renamed from: f, reason: collision with root package name */
    public f0 f94547f;

    /* renamed from: g, reason: collision with root package name */
    public f0 f94548g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ g0 f94549h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f94550i;

    public l(g0 g0Var, int i5) {
        this.f94550i = i5;
        this.f94549h = g0Var;
        this.f94542a = g0Var.f94523c.length - 1;
        a();
    }

    public final void a() {
        this.f94547f = null;
        if (e() || f()) {
            return;
        }
        while (true) {
            int i5 = this.f94542a;
            if (i5 < 0) {
                return;
            }
            p[] pVarArr = this.f94549h.f94523c;
            this.f94542a = i5 - 1;
            p pVar = pVarArr[i5];
            this.f94544c = pVar;
            if (pVar.f94558b != 0) {
                this.f94545d = this.f94544c.f94562f;
                this.f94543b = r0.length() - 1;
                if (f()) {
                    return;
                }
            }
        }
    }

    public final boolean b(h0 h0Var) {
        Object obj;
        g0 g0Var = this.f94549h;
        try {
            g0Var.f94532l.r();
            Object key = h0Var.getKey();
            Object obj2 = null;
            if (h0Var.getKey() != null && (obj = h0Var.d().get()) != null) {
                obj2 = obj;
            }
            if (obj2 == null) {
                this.f94544c.i();
                return false;
            }
            this.f94547f = new f0(g0Var, key, obj2);
            this.f94544c.i();
            return true;
        } catch (Throwable th2) {
            this.f94544c.i();
            throw th2;
        }
    }

    public final Object c() {
        return d();
    }

    public final f0 d() {
        f0 f0Var = this.f94547f;
        if (f0Var == null) {
            throw new NoSuchElementException();
        }
        this.f94548g = f0Var;
        a();
        return this.f94548g;
    }

    public final boolean e() {
        h0 h0Var = this.f94546e;
        if (h0Var == null) {
            return false;
        }
        while (true) {
            this.f94546e = h0Var.p();
            h0 h0Var2 = this.f94546e;
            if (h0Var2 == null) {
                return false;
            }
            if (b(h0Var2)) {
                return true;
            }
            h0Var = this.f94546e;
        }
    }

    public final boolean f() {
        while (true) {
            int i5 = this.f94543b;
            if (i5 < 0) {
                return false;
            }
            AtomicReferenceArray atomicReferenceArray = this.f94545d;
            this.f94543b = i5 - 1;
            h0 h0Var = (h0) atomicReferenceArray.get(i5);
            this.f94546e = h0Var;
            if (h0Var != null && (b(h0Var) || e())) {
                return true;
            }
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f94547f != null;
    }

    @Override // java.util.Iterator
    public Object next() {
        switch (this.f94550i) {
            case 1:
                return d().f94516a;
            case 2:
                return d().f94517b;
            default:
                return c();
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        f0 f0Var = this.f94548g;
        if (f0Var == null) {
            throw new IllegalStateException();
        }
        this.f94549h.remove(f0Var.f94516a);
        this.f94548g = null;
    }
}
