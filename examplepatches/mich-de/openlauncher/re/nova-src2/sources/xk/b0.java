package xk;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class b0 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f95863a;

    /* renamed from: b, reason: collision with root package name */
    public int f95864b;

    /* renamed from: c, reason: collision with root package name */
    public int f95865c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c0 f95866d;

    public b0(c0 c0Var) {
        this.f95866d = c0Var;
        this.f95863a = c0Var.f95881d;
        this.f95864b = c0Var.isEmpty() ? -1 : 0;
        this.f95865c = -1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f95864b >= 0;
    }

    @Override // java.util.Iterator
    public final Object next() {
        c0 c0Var = this.f95866d;
        if (c0Var.f95881d != this.f95863a) {
            throw new ConcurrentModificationException();
        }
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f95864b;
        this.f95865c = i5;
        Object obj = c0Var.f()[i5];
        int i11 = this.f95864b + 1;
        if (i11 >= c0Var.f95882e) {
            i11 = -1;
        }
        this.f95864b = i11;
        return obj;
    }

    @Override // java.util.Iterator
    public final void remove() {
        c0 c0Var = this.f95866d;
        if (c0Var.f95881d != this.f95863a) {
            throw new ConcurrentModificationException();
        }
        w20.e.f(this.f95865c >= 0);
        this.f95863a += 32;
        c0Var.remove(c0Var.f()[this.f95865c]);
        this.f95864b--;
        this.f95865c = -1;
    }
}
