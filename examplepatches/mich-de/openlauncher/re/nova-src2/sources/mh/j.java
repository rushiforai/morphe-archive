package mh;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public abstract class j extends f implements List, RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public static final g f76346b = new g(u.f76380e, 0);

    public static u j(int i5, Object[] objArr) {
        return i5 == 0 ? u.f76380e : new u(objArr, i5);
    }

    public static u k(Object[] objArr) {
        if (objArr.length == 0) {
            return u.f76380e;
        }
        Object[] objArr2 = (Object[]) objArr.clone();
        int length = objArr2.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (objArr2[i5] == null) {
                throw new NullPointerException(b.c0.h(i5, "at index "));
            }
        }
        return j(length, objArr2);
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // mh.f
    public int b(Object[] objArr) {
        int size = size();
        for (int i5 = 0; i5 < size; i5++) {
            objArr[i5] = get(i5);
        }
        return size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }

    @Override // mh.f
    public final a0 e() {
        return listIterator(0);
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
                    for (int i5 = 0; i5 < size; i5++) {
                        if (a.h(get(i5), list.get(i5))) {
                        }
                    }
                    return true;
                }
                g gVarListIterator = listIterator(0);
                Iterator it = list.iterator();
                while (true) {
                    if (gVarListIterator.hasNext()) {
                        if (!it.hasNext() || !a.h(gVarListIterator.next(), it.next())) {
                            break;
                        }
                    } else if (!it.hasNext()) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public j g() {
        return size() <= 1 ? this : new h(this);
    }

    @Override // java.util.List
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public j subList(int i5, int i11) {
        a.m(i5, i11, size());
        int i12 = i11 - i5;
        return i12 == size() ? this : i12 == 0 ? u.f76380e : new i(this, i5, i12);
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        int size = size();
        int iHashCode = 1;
        for (int i5 = 0; i5 < size; i5++) {
            iHashCode = (iHashCode * 31) + get(i5).hashCode();
        }
        return iHashCode;
    }

    public int indexOf(Object obj) {
        if (obj == null) {
            return -1;
        }
        int size = size();
        for (int i5 = 0; i5 < size; i5++) {
            if (obj.equals(get(i5))) {
                return i5;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final /* synthetic */ Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    /* renamed from: l, reason: merged with bridge method [inline-methods] */
    public final g listIterator(int i5) {
        int size = size();
        if (i5 < 0 || i5 > size) {
            throw new IndexOutOfBoundsException(a.n(i5, size, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX));
        }
        return isEmpty() ? f76346b : new g(this, i5);
    }

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

    @Override // java.util.List
    public final Object remove(int i5) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        throw new UnsupportedOperationException();
    }
}
