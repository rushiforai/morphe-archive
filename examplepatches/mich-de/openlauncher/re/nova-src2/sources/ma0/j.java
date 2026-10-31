package ma0;

import com.google.android.gms.internal.measurement.v6;
import fa.t;
import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public abstract class j implements ListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final t f76197a;

    /* renamed from: b, reason: collision with root package name */
    public final int f76198b;

    /* renamed from: c, reason: collision with root package name */
    public final int f76199c;

    /* renamed from: d, reason: collision with root package name */
    public int f76200d;

    public j(v6 v6Var, int i5, int i11) {
        v6Var.getClass();
        this.f76197a = new t(v6Var, i5);
        this.f76199c = i5;
        this.f76198b = i11;
    }

    public abstract Object a(t tVar);

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f76200d < this.f76198b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f76200d > 0;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public Object next() {
        int i5 = this.f76200d;
        if (i5 >= this.f76198b) {
            throw new NoSuchElementException();
        }
        this.f76200d = i5 + 1;
        return a(this.f76197a);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f76200d;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        int i5 = this.f76200d - 1;
        int i11 = this.f76199c;
        t tVar = this.f76197a;
        tVar.f54485a = i11;
        this.f76200d = 0;
        while (true) {
            int i12 = this.f76200d;
            if (i12 >= i5) {
                this.f76200d = i12 + 1;
                return a(tVar);
            }
            this.f76200d = i12 + 1;
            a(tVar);
        }
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f76200d - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
