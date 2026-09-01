package defpackage;

import j$.util.List;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import java.util.function.UnaryOperator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ayf extends ogf implements List, RandomAccess, j$.util.List {
    public static final hxf f = new hxf(hzf.i, 0);

    public static hzf A(int i, Object[] objArr) {
        return i == 0 ? hzf.i : new hzf(i, objArr);
    }

    public static hzf B(Object[] objArr) {
        if (objArr.length == 0) {
            return hzf.i;
        }
        Object[] objArr2 = (Object[]) objArr.clone();
        int length = objArr2.length;
        for (int i = 0; i < length; i++) {
            if (objArr2[i] == null) {
                z72.c(b09.w(i, "at index "));
                return null;
            }
        }
        return A(length, objArr2);
    }

    @Override // java.util.List
    /* JADX INFO: renamed from: C, reason: merged with bridge method [inline-methods] */
    public final hxf listIterator(int i) {
        int size = size();
        if (i >= 0 && i <= size) {
            return isEmpty() ? f : new hxf(this, i);
        }
        z10.i(jq7.C(i, size, "index"));
        return null;
    }

    @Override // java.util.List
    public final void add(int i, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final boolean addAll(int i, Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            List list = (List) obj;
            int size = size();
            if (size == list.size()) {
                if (list instanceof RandomAccess) {
                    for (int i = 0; i < size; i++) {
                        if (gq7.c0(get(i), list.get(i))) {
                        }
                    }
                    return true;
                }
                hxf hxfVarListIterator = listIterator(0);
                Iterator it2 = list.iterator();
                while (true) {
                    if (hxfVarListIterator.hasNext()) {
                        if (!it2.hasNext() || !gq7.c0(hxfVarListIterator.next(), it2.next())) {
                            break;
                        }
                    } else if (!it2.hasNext()) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        int size = size();
        int iHashCode = 1;
        for (int i = 0; i < size; i++) {
            iHashCode = (iHashCode * 31) + get(i).hashCode();
        }
        return iHashCode;
    }

    @Override // java.util.List
    public int indexOf(Object obj) {
        if (obj == null) {
            return -1;
        }
        int size = size();
        for (int i = 0; i < size; i++) {
            if (obj.equals(get(i))) {
                return i;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final /* synthetic */ Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public int lastIndexOf(Object obj) {
        if (obj == null) {
            return -1;
        }
        for (int size = size() - 1; size >= 0; size--) {
            if (obj.equals(get(size))) {
                return size;
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final /* synthetic */ ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // defpackage.ogf
    public int q(Object[] objArr) {
        int size = size();
        for (int i = 0; i < size; i++) {
            objArr[i] = get(i);
        }
        return size;
    }

    @Override // java.util.List
    public final Object remove(int i) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, j$.util.List
    public /* synthetic */ void replaceAll(UnaryOperator unaryOperator) {
        List.CC.$default$replaceAll(this, unaryOperator);
    }

    @Override // java.util.List
    public final Object set(int i, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, j$.util.List
    public /* synthetic */ void sort(Comparator comparator) {
        List.CC.$default$sort(this, comparator);
    }

    @Override // defpackage.ogf
    public final ugf v() {
        return listIterator(0);
    }

    public ayf y() {
        return size() <= 1 ? this : new vxf(this);
    }

    @Override // java.util.List
    /* JADX INFO: renamed from: z, reason: merged with bridge method [inline-methods] */
    public ayf subList(int i, int i2) {
        jq7.A(i, i2, size());
        int i3 = i2 - i;
        return i3 == size() ? this : i3 == 0 ? hzf.i : new zxf(this, i, i3);
    }
}
