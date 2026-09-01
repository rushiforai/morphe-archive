package defpackage;

import java.util.AbstractList;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wn5 implements ListIterator, th6 {
    public final /* synthetic */ int a;
    public int b;
    public int c;
    public int d;
    public final Object e;

    public wn5(ejc ejcVar, int i) {
        this.a = 3;
        this.e = ejcVar;
        this.b = i - 1;
        this.c = -1;
        this.d = g01.S(ejcVar);
    }

    public void a() {
        if (((AbstractList) ((e17) this.e).e).modCount == this.d) {
            return;
        }
        z10.g();
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        int i = this.a;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                a();
                e17 e17Var = (e17) obj2;
                int i2 = this.b;
                this.b = i2 + 1;
                e17Var.add(i2, obj);
                this.c = -1;
                this.d = ((AbstractList) e17Var).modCount;
                return;
            case 2:
                b();
                f17 f17Var = (f17) obj2;
                int i3 = this.b;
                this.b = i3 + 1;
                f17Var.add(i3, obj);
                this.c = -1;
                this.d = ((AbstractList) f17Var).modCount;
                return;
            default:
                c();
                ejc ejcVar = (ejc) obj2;
                ejcVar.add(this.b + 1, obj);
                this.c = -1;
                this.b++;
                this.d = g01.S(ejcVar);
                return;
        }
    }

    public void b() {
        if (((AbstractList) ((f17) this.e)).modCount == this.d) {
            return;
        }
        z10.g();
    }

    public void c() {
        if (g01.S((ejc) this.e) == this.d) {
            return;
        }
        z10.g();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        Object obj = this.e;
        switch (i) {
            case 0:
                if (this.b < this.d) {
                }
                break;
            case 1:
                if (this.b < ((e17) obj).c) {
                }
                break;
            case 2:
                if (this.b < ((f17) obj).b) {
                }
                break;
            default:
                if (this.b < ((ejc) obj).size() - 1) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        switch (this.a) {
            case 0:
                if (this.b > this.c) {
                }
                break;
            case 1:
                if (this.b > 0) {
                }
                break;
            case 2:
                if (this.b > 0) {
                }
                break;
            default:
                if (this.b >= 0) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        int i = this.a;
        Object obj = this.e;
        switch (i) {
            case 0:
                x68 x68Var = ((yn5) obj).a;
                int i2 = this.b;
                this.b = i2 + 1;
                Object objF = x68Var.f(i2);
                objF.getClass();
                return (q28) objF;
            case 1:
                a();
                int i3 = this.b;
                e17 e17Var = (e17) obj;
                if (i3 >= e17Var.c) {
                    ywb.n();
                    return null;
                }
                this.b = i3 + 1;
                this.c = i3;
                return e17Var.a[e17Var.b + i3];
            case 2:
                b();
                int i4 = this.b;
                f17 f17Var = (f17) obj;
                if (i4 >= f17Var.b) {
                    ywb.n();
                    return null;
                }
                this.b = i4 + 1;
                this.c = i4;
                return f17Var.a[i4];
            default:
                c();
                int i5 = this.b + 1;
                this.c = i5;
                ejc ejcVar = (ejc) obj;
                g01.V(i5, ejcVar.size());
                Object obj2 = ejcVar.get(i5);
                this.b = i5;
                return obj2;
        }
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        switch (this.a) {
            case 0:
                return this.b - this.c;
            case 1:
                return this.b;
            case 2:
                return this.b;
            default:
                return this.b + 1;
        }
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        int i = this.a;
        Object obj = this.e;
        switch (i) {
            case 0:
                x68 x68Var = ((yn5) obj).a;
                int i2 = this.b - 1;
                this.b = i2;
                Object objF = x68Var.f(i2);
                objF.getClass();
                return (q28) objF;
            case 1:
                a();
                int i3 = this.b;
                if (i3 <= 0) {
                    ywb.n();
                    return null;
                }
                int i4 = i3 - 1;
                this.b = i4;
                this.c = i4;
                e17 e17Var = (e17) obj;
                return e17Var.a[e17Var.b + i4];
            case 2:
                b();
                int i5 = this.b;
                if (i5 <= 0) {
                    ywb.n();
                    return null;
                }
                int i6 = i5 - 1;
                this.b = i6;
                this.c = i6;
                return ((f17) obj).a[i6];
            default:
                c();
                ejc ejcVar = (ejc) obj;
                g01.V(this.b, ejcVar.size());
                int i7 = this.b;
                this.c = i7;
                this.b--;
                return ejcVar.get(i7);
        }
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        int i;
        switch (this.a) {
            case 0:
                return (this.b - this.c) - 1;
            case 1:
                i = this.b;
                break;
            case 2:
                i = this.b;
                break;
            default:
                return this.b;
        }
        return i - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        int i = this.a;
        Object obj = this.e;
        switch (i) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                e17 e17Var = (e17) obj;
                a();
                int i2 = this.c;
                if (i2 == -1) {
                    ygf.f("Call next() or previous() before removing element from the iterator.");
                    return;
                }
                e17Var.removeAt(i2);
                this.b = this.c;
                this.c = -1;
                this.d = ((AbstractList) e17Var).modCount;
                return;
            case 2:
                f17 f17Var = (f17) obj;
                b();
                int i3 = this.c;
                if (i3 == -1) {
                    ygf.f("Call next() or previous() before removing element from the iterator.");
                    return;
                }
                f17Var.removeAt(i3);
                this.b = this.c;
                this.c = -1;
                this.d = ((AbstractList) f17Var).modCount;
                return;
            default:
                c();
                ejc ejcVar = (ejc) obj;
                ejcVar.remove(this.c);
                this.b--;
                this.c = -1;
                this.d = g01.S(ejcVar);
                return;
        }
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        int i = this.a;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                a();
                int i2 = this.c;
                if (i2 != -1) {
                    ((e17) obj2).set(i2, obj);
                    return;
                } else {
                    ygf.f("Call next() or previous() before replacing element from the iterator.");
                    return;
                }
            case 2:
                b();
                int i3 = this.c;
                if (i3 != -1) {
                    ((f17) obj2).set(i3, obj);
                    return;
                } else {
                    ygf.f("Call next() or previous() before replacing element from the iterator.");
                    return;
                }
            default:
                ejc ejcVar = (ejc) obj2;
                c();
                int i4 = this.c;
                if (i4 < 0) {
                    ygf.f("Cannot call set before the first call to next() or previous() or immediately after a call to add() or remove()");
                    return;
                } else {
                    ejcVar.set(i4, obj);
                    this.d = g01.S(ejcVar);
                    return;
                }
        }
    }

    public wn5(f17 f17Var, int i) {
        this.a = 2;
        this.e = f17Var;
        this.b = i;
        this.c = -1;
        this.d = ((AbstractList) f17Var).modCount;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public wn5(yn5 yn5Var, int i, int i2) {
        this(yn5Var, (i2 & 1) != 0 ? 0 : i, 0, yn5Var.a.b);
        this.a = 0;
    }

    public wn5(yn5 yn5Var, int i, int i2, int i3) {
        this.a = 0;
        this.e = yn5Var;
        this.b = i;
        this.c = i2;
        this.d = i3;
    }

    public wn5(e17 e17Var, int i) {
        this.a = 1;
        this.e = e17Var;
        this.b = i;
        this.c = -1;
        this.d = ((AbstractList) e17Var).modCount;
    }
}
