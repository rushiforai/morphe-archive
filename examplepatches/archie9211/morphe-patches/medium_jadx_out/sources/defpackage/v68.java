package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v68 implements List, vh6 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ v68(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.util.List
    public final void add(int i, Object obj) {
        int i2;
        int i3 = this.a;
        Object obj2 = this.b;
        switch (i3) {
            case 0:
                x68 x68Var = (x68) obj2;
                if (i < 0 || i > (i2 = x68Var.b)) {
                    x68Var.p(i);
                    throw null;
                }
                int i4 = i2 + 1;
                Object[] objArr = x68Var.a;
                if (objArr.length < i4) {
                    x68Var.m(i4, objArr);
                }
                Object[] objArr2 = x68Var.a;
                int i5 = x68Var.b;
                if (i != i5) {
                    k80.g0(i + 1, i, i5, objArr2, objArr2);
                }
                objArr2[i] = obj;
                x68Var.b++;
                return;
            default:
                ((o78) obj2).a(i, obj);
                return;
        }
    }

    @Override // java.util.List
    public final boolean addAll(int i, Collection collection) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                collection.getClass();
                x68 x68Var = (x68) obj;
                if (i < 0 || i > x68Var.b) {
                    x68Var.p(i);
                    throw null;
                }
                int i3 = 0;
                if (collection.isEmpty()) {
                    return false;
                }
                int size = collection.size() + x68Var.b;
                Object[] objArr = x68Var.a;
                if (objArr.length < size) {
                    x68Var.m(size, objArr);
                }
                Object[] objArr2 = x68Var.a;
                if (i != x68Var.b) {
                    k80.g0(collection.size() + i, i, x68Var.b, objArr2, objArr2);
                }
                for (Object obj2 : collection) {
                    int i4 = i3 + 1;
                    if (i3 < 0) {
                        d46.i0();
                        throw null;
                    }
                    objArr2[i3 + i] = obj2;
                    i3 = i4;
                }
                x68Var.b = collection.size() + x68Var.b;
                return true;
            default:
                return ((o78) obj).f(i, collection);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((x68) obj).d();
                break;
            default:
                ((o78) obj).i();
                break;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                return ((x68) obj2).g(obj) >= 0;
            default:
                return ((o78) obj2).j(obj);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                collection.getClass();
                x68 x68Var = (x68) obj;
                Iterator it2 = collection.iterator();
                while (it2.hasNext()) {
                    if (x68Var.g(it2.next()) < 0) {
                        break;
                    }
                }
                break;
            default:
                o78 o78Var = (o78) obj;
                Iterator it3 = collection.iterator();
                while (it3.hasNext()) {
                    if (!o78Var.j(it3.next())) {
                        break;
                    }
                }
                break;
        }
        return false;
    }

    @Override // java.util.List
    public final Object get(int i) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                pm8.a(i, this);
                return ((x68) obj).f(i);
            default:
                p78.a(i, this);
                return ((o78) obj).a[i];
        }
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                return ((x68) obj2).g(obj);
            default:
                return ((o78) obj2).k(obj);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((x68) obj).h();
            default:
                return ((o78) obj).c == 0;
        }
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        switch (this.a) {
            case 0:
                return new u68(0, 0, this);
            default:
                return new u68(0, 1, this);
        }
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        int i;
        int i2 = this.a;
        Object obj2 = this.b;
        switch (i2) {
            case 0:
                x68 x68Var = (x68) obj2;
                Object[] objArr = x68Var.a;
                int i3 = x68Var.b;
                if (obj == null) {
                    i = i3 - 1;
                    while (-1 < i) {
                        if (objArr[i] != null) {
                            i--;
                        }
                    }
                    return -1;
                }
                i = i3 - 1;
                while (-1 < i) {
                    if (!obj.equals(objArr[i])) {
                        i--;
                    }
                }
                return -1;
                return i;
            default:
                o78 o78Var = (o78) obj2;
                Object[] objArr2 = o78Var.a;
                for (int i4 = o78Var.c - 1; i4 >= 0; i4--) {
                    if (g76.L(obj, objArr2[i4])) {
                        return i4;
                    }
                }
                return -1;
        }
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        switch (this.a) {
            case 0:
                return new u68(0, 0, this);
            default:
                return new u68(0, 1, this);
        }
    }

    @Override // java.util.List
    public final Object remove(int i) {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                pm8.a(i, this);
                return ((x68) obj).k(i);
            default:
                p78.a(i, this);
                return ((o78) obj).m(i);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                collection.getClass();
                x68 x68Var = (x68) obj;
                int i2 = x68Var.b;
                Iterator it2 = collection.iterator();
                while (it2.hasNext()) {
                    x68Var.j(it2.next());
                }
                if (i2 == x68Var.b) {
                    break;
                }
                break;
            default:
                o78 o78Var = (o78) obj;
                if (!collection.isEmpty()) {
                    int i3 = o78Var.c;
                    Iterator it3 = collection.iterator();
                    while (it3.hasNext()) {
                        o78Var.l(it3.next());
                    }
                    if (i3 != o78Var.c) {
                    }
                }
                break;
        }
        return false;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                collection.getClass();
                x68 x68Var = (x68) obj;
                int i2 = x68Var.b;
                Object[] objArr = x68Var.a;
                for (int i3 = i2 - 1; -1 < i3; i3--) {
                    if (!collection.contains(objArr[i3])) {
                        x68Var.k(i3);
                    }
                }
                if (i2 != x68Var.b) {
                }
                break;
            default:
                o78 o78Var = (o78) obj;
                int i4 = o78Var.c;
                for (int i5 = i4 - 1; -1 < i5; i5--) {
                    if (!collection.contains(o78Var.a[i5])) {
                        o78Var.m(i5);
                    }
                }
                if (i4 != o78Var.c) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.List
    public final Object set(int i, Object obj) {
        int i2 = this.a;
        Object obj2 = this.b;
        switch (i2) {
            case 0:
                pm8.a(i, this);
                return ((x68) obj2).n(i, obj);
            default:
                p78.a(i, this);
                Object[] objArr = ((o78) obj2).a;
                Object obj3 = objArr[i];
                objArr[i] = obj;
                return obj3;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((x68) obj).b;
            default:
                return ((o78) obj).c;
        }
    }

    @Override // java.util.List
    public final List subList(int i, int i2) {
        switch (this.a) {
            case 0:
                pm8.b(i, i2, this);
                return new w68(this, i, i2, 0);
            default:
                p78.b(i, i2, this);
                return new w68(this, i, i2, 1);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        switch (this.a) {
            case 0:
                objArr.getClass();
                break;
        }
        return kng.O(this, objArr);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        switch (this.a) {
        }
        return kng.N(this);
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i) {
        switch (this.a) {
            case 0:
                return new u68(i, 0, this);
            default:
                return new u68(i, 1, this);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                return ((x68) obj2).j(obj);
            default:
                return ((o78) obj2).l(obj);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ((x68) obj2).a(obj);
                break;
            default:
                ((o78) obj2).b(obj);
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                collection.getClass();
                x68 x68Var = (x68) obj;
                int i2 = x68Var.b;
                Iterator it2 = collection.iterator();
                while (it2.hasNext()) {
                    x68Var.a(it2.next());
                }
                return i2 != x68Var.b;
            default:
                o78 o78Var = (o78) obj;
                return o78Var.f(o78Var.c, collection);
        }
    }
}
