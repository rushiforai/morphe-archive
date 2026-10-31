package xk;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public abstract class q implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f95988a;

    /* renamed from: b, reason: collision with root package name */
    public int f95989b;

    /* renamed from: c, reason: collision with root package name */
    public int f95990c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ n0 f95991d;

    public q(n0 n0Var) {
        this.f95991d = n0Var;
        k2 k2Var = n0Var.f95973c;
        this.f95988a = k2Var.f95954c == 0 ? -1 : 0;
        this.f95989b = -1;
        this.f95990c = k2Var.f95955d;
    }

    public abstract Object a(int i5);

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.f95991d.f95973c.f95955d == this.f95990c) {
            return this.f95988a >= 0;
        }
        throw new ConcurrentModificationException();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Object objA = a(this.f95988a);
        int i5 = this.f95988a;
        this.f95989b = i5;
        int i11 = i5 + 1;
        if (i11 >= this.f95991d.f95973c.f95954c) {
            i11 = -1;
        }
        this.f95988a = i11;
        return objA;
    }

    @Override // java.util.Iterator
    public final void remove() {
        n0 n0Var = this.f95991d;
        k2 k2Var = n0Var.f95973c;
        if (n0Var.f95973c.f95955d != this.f95990c) {
            throw new ConcurrentModificationException();
        }
        w20.e.f(this.f95989b != -1);
        n0Var.f95974d -= k2Var.f(this.f95989b);
        int i5 = this.f95988a;
        k2Var.getClass();
        this.f95988a = i5 - 1;
        this.f95989b = -1;
        this.f95990c = k2Var.f95955d;
    }
}
