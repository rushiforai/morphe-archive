package p6;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.markers.KMutableIterator;
import z.d1;
import z.e1;

/* loaded from: classes2.dex */
public final class g0 implements Iterator, KMutableIterator {

    /* renamed from: a, reason: collision with root package name */
    public int f82170a = -1;

    /* renamed from: b, reason: collision with root package name */
    public boolean f82171b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ h0 f82172c;

    public g0(h0 h0Var) {
        this.f82172c = h0Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f82170a + 1 < this.f82172c.f82177j.f();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        this.f82171b = true;
        d1 d1Var = this.f82172c.f82177j;
        int i5 = this.f82170a + 1;
        this.f82170a = i5;
        return (e0) d1Var.g(i5);
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.f82171b) {
            throw new IllegalStateException("You must call next() before you can remove an element");
        }
        d1 d1Var = this.f82172c.f82177j;
        ((e0) d1Var.g(this.f82170a)).f82153b = null;
        int i5 = this.f82170a;
        Object[] objArr = d1Var.f97758c;
        Object obj = objArr[i5];
        Object obj2 = e1.f97763a;
        if (obj != obj2) {
            objArr[i5] = obj2;
            d1Var.f97756a = true;
        }
        this.f82170a = i5 - 1;
        this.f82171b = false;
    }
}
