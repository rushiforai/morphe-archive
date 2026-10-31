package xk;

import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public final class q1 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public Iterator f95993a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f95994b;

    /* renamed from: c, reason: collision with root package name */
    public Iterator f95995c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayDeque f95996d;

    @Override // java.util.Iterator
    public final boolean hasNext() {
        Iterator it;
        while (true) {
            Iterator it2 = this.f95994b;
            it2.getClass();
            if (it2.hasNext()) {
                return true;
            }
            while (true) {
                Iterator it3 = this.f95995c;
                if (it3 != null && it3.hasNext()) {
                    it = this.f95995c;
                    break;
                }
                ArrayDeque arrayDeque = this.f95996d;
                if (arrayDeque == null || arrayDeque.isEmpty()) {
                    break;
                }
                this.f95995c = (Iterator) this.f95996d.removeFirst();
            }
            it = null;
            this.f95995c = it;
            if (it == null) {
                return false;
            }
            Iterator it4 = (Iterator) it.next();
            this.f95994b = it4;
            if (it4 instanceof q1) {
                q1 q1Var = (q1) it4;
                this.f95994b = q1Var.f95994b;
                if (this.f95996d == null) {
                    this.f95996d = new ArrayDeque();
                }
                this.f95996d.addFirst(this.f95995c);
                if (q1Var.f95996d != null) {
                    while (!q1Var.f95996d.isEmpty()) {
                        this.f95996d.addFirst((Iterator) q1Var.f95996d.removeLast());
                    }
                }
                this.f95995c = q1Var.f95995c;
            }
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        Iterator it = this.f95994b;
        this.f95993a = it;
        return it.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        Iterator it = this.f95993a;
        if (it == null) {
            throw new IllegalStateException("no calls to next() since the last call to remove()");
        }
        it.remove();
        this.f95993a = null;
    }
}
