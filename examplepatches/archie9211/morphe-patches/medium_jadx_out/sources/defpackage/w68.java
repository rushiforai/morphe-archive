package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w68 implements List, vh6 {
    public final /* synthetic */ int a;
    public final List b;
    public final int c;
    public int d;

    public /* synthetic */ w68(List list, int i, int i2, int i3) {
        this.a = i3;
        this.b = list;
        this.c = i;
        this.d = i2;
    }

    @Override // java.util.List
    public final void add(int i, Object obj) {
        int i2 = this.a;
        int i3 = this.c;
        List list = this.b;
        switch (i2) {
            case 0:
                list.add(i + i3, obj);
                this.d++;
                break;
            default:
                list.add(i + i3, obj);
                this.d++;
                break;
        }
    }

    @Override // java.util.List
    public final boolean addAll(int i, Collection collection) {
        int i2 = this.a;
        int i3 = this.c;
        List list = this.b;
        switch (i2) {
            case 0:
                collection.getClass();
                list.addAll(i + i3, collection);
                this.d = collection.size() + this.d;
                if (collection.size() > 0) {
                }
                break;
            default:
                list.addAll(i + i3, collection);
                int size = collection.size();
                this.d += size;
                if (size > 0) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        int i = this.a;
        List list = this.b;
        int i2 = this.c;
        switch (i) {
            case 0:
                int i3 = this.d - 1;
                if (i2 <= i3) {
                    while (true) {
                        list.remove(i3);
                        if (i3 != i2) {
                            i3--;
                        }
                    }
                }
                this.d = i2;
                break;
            default:
                int i4 = this.d - 1;
                if (i2 <= i4) {
                    while (true) {
                        list.remove(i4);
                        if (i4 != i2) {
                            i4--;
                        }
                    }
                }
                this.d = i2;
                break;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        int i = this.a;
        List list = this.b;
        int i2 = this.c;
        switch (i) {
            case 0:
                int i3 = this.d;
                while (i2 < i3) {
                    if (!g76.L(list.get(i2), obj)) {
                        i2++;
                    }
                    break;
                }
                break;
            default:
                int i4 = this.d;
                while (i2 < i4) {
                    if (!g76.L(list.get(i2), obj)) {
                        i2++;
                    }
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        switch (this.a) {
            case 0:
                collection.getClass();
                Iterator it2 = collection.iterator();
                while (it2.hasNext()) {
                    if (!contains(it2.next())) {
                        break;
                    }
                }
                break;
            default:
                Iterator it3 = collection.iterator();
                while (it3.hasNext()) {
                    if (!contains(it3.next())) {
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
        int i3 = this.c;
        List list = this.b;
        switch (i2) {
            case 0:
                pm8.a(i, this);
                break;
            default:
                p78.a(i, this);
                break;
        }
        return list.get(i + i3);
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        int i = this.a;
        List list = this.b;
        int i2 = this.c;
        switch (i) {
            case 0:
                int i3 = this.d;
                for (int i4 = i2; i4 < i3; i4++) {
                    if (g76.L(list.get(i4), obj)) {
                        return i4 - i2;
                    }
                }
                return -1;
            default:
                int i5 = this.d;
                for (int i6 = i2; i6 < i5; i6++) {
                    if (g76.L(list.get(i6), obj)) {
                        return i6 - i2;
                    }
                }
                return -1;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        switch (this.a) {
            case 0:
                if (this.d == this.c) {
                }
                break;
            default:
                if (this.d == this.c) {
                }
                break;
        }
        return false;
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
        int i = this.a;
        List list = this.b;
        int i2 = this.c;
        switch (i) {
            case 0:
                int i3 = this.d - 1;
                if (i2 <= i3) {
                    while (!g76.L(list.get(i3), obj)) {
                        if (i3 != i2) {
                            i3--;
                        }
                    }
                }
                break;
            default:
                int i4 = this.d - 1;
                if (i2 <= i4) {
                    while (!g76.L(list.get(i4), obj)) {
                        if (i4 != i2) {
                            i4--;
                        }
                    }
                }
                break;
        }
        return -1;
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

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        int i = this.a;
        int i2 = this.c;
        List list = this.b;
        switch (i) {
            case 0:
                int i3 = this.d;
                while (i2 < i3) {
                    if (g76.L(list.get(i2), obj)) {
                        list.remove(i2);
                        this.d--;
                    } else {
                        i2++;
                    }
                    break;
                }
                break;
            default:
                int i4 = this.d;
                while (i2 < i4) {
                    if (g76.L(list.get(i2), obj)) {
                        list.remove(i2);
                        this.d--;
                    } else {
                        i2++;
                    }
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        switch (this.a) {
            case 0:
                collection.getClass();
                int i = this.d;
                Iterator it2 = collection.iterator();
                while (it2.hasNext()) {
                    remove(it2.next());
                }
                if (i != this.d) {
                }
                break;
            default:
                int i2 = this.d;
                Iterator it3 = collection.iterator();
                while (it3.hasNext()) {
                    remove(it3.next());
                }
                if (i2 != this.d) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        int i = this.a;
        int i2 = this.c;
        List list = this.b;
        switch (i) {
            case 0:
                collection.getClass();
                int i3 = this.d;
                int i4 = i3 - 1;
                if (i2 <= i4) {
                    while (true) {
                        if (!collection.contains(list.get(i4))) {
                            list.remove(i4);
                            this.d--;
                        }
                        if (i4 != i2) {
                            i4--;
                        }
                    }
                }
                if (i3 != this.d) {
                }
                break;
            default:
                int i5 = this.d;
                int i6 = i5 - 1;
                if (i2 <= i6) {
                    while (true) {
                        if (!collection.contains(list.get(i6))) {
                            list.remove(i6);
                            this.d--;
                        }
                        if (i6 != i2) {
                            i6--;
                        }
                    }
                }
                if (i5 != this.d) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.List
    public final Object set(int i, Object obj) {
        int i2 = this.a;
        int i3 = this.c;
        List list = this.b;
        switch (i2) {
            case 0:
                pm8.a(i, this);
                break;
            default:
                p78.a(i, this);
                break;
        }
        return list.set(i + i3, obj);
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        int i;
        int i2;
        switch (this.a) {
            case 0:
                i = this.d;
                i2 = this.c;
                break;
            default:
                i = this.d;
                i2 = this.c;
                break;
        }
        return i - i2;
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
    public final boolean add(Object obj) {
        int i = this.a;
        List list = this.b;
        switch (i) {
            case 0:
                int i2 = this.d;
                this.d = i2 + 1;
                list.add(i2, obj);
                break;
            default:
                int i3 = this.d;
                this.d = i3 + 1;
                list.add(i3, obj);
                break;
        }
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        int i = this.a;
        List list = this.b;
        switch (i) {
            case 0:
                collection.getClass();
                list.addAll(this.d, collection);
                this.d = collection.size() + this.d;
                if (collection.size() > 0) {
                }
                break;
            default:
                list.addAll(this.d, collection);
                int size = collection.size();
                this.d += size;
                if (size > 0) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.List
    public final Object remove(int i) {
        int i2 = this.a;
        int i3 = this.c;
        List list = this.b;
        switch (i2) {
            case 0:
                pm8.a(i, this);
                this.d--;
                return list.remove(i + i3);
            default:
                p78.a(i, this);
                this.d--;
                return list.remove(i + i3);
        }
    }
}
