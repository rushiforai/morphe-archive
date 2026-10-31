package xk;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class h2 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final n0 f95926a;

    /* renamed from: b, reason: collision with root package name */
    public final Iterator f95927b;

    /* renamed from: c, reason: collision with root package name */
    public e2 f95928c;

    /* renamed from: d, reason: collision with root package name */
    public int f95929d;

    /* renamed from: e, reason: collision with root package name */
    public int f95930e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f95931f;

    public h2(n0 n0Var, Iterator it) {
        this.f95926a = n0Var;
        this.f95927b = it;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f95929d > 0 || this.f95927b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        if (this.f95929d == 0) {
            e2 e2Var = (e2) this.f95927b.next();
            this.f95928c = e2Var;
            int iA = ((j2) e2Var).a();
            this.f95929d = iA;
            this.f95930e = iA;
        }
        this.f95929d--;
        this.f95931f = true;
        e2 e2Var2 = this.f95928c;
        Objects.requireNonNull(e2Var2);
        return ((j2) e2Var2).f95943a;
    }

    @Override // java.util.Iterator
    public final void remove() {
        w20.e.f(this.f95931f);
        if (this.f95930e == 1) {
            this.f95927b.remove();
        } else {
            e2 e2Var = this.f95928c;
            Objects.requireNonNull(e2Var);
            this.f95926a.remove(((j2) e2Var).f95943a);
        }
        this.f95930e--;
        this.f95931f = false;
    }
}
