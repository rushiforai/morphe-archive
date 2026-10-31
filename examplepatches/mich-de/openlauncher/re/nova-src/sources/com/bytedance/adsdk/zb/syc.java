package com.bytedance.adsdk.zb;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

/* loaded from: classes2.dex */
abstract class syc<K, V> {

    /* renamed from: zb, reason: collision with root package name */
    syc<K, V>.zb f23104zb;

    public final class ycx<T> implements Iterator<T> {

        /* renamed from: dj, reason: collision with root package name */
        boolean f23105dj = false;
        int sya;
        final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f23106zb;

        public ycx(int i5) {
            this.ycx = i5;
            this.f23106zb = syc.this.ycx();
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.sya < this.f23106zb;
        }

        @Override // java.util.Iterator
        public T next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            T t6 = (T) syc.this.ycx(this.sya, this.ycx);
            this.sya++;
            this.f23105dj = true;
            return t6;
        }

        @Override // java.util.Iterator
        public void remove() {
            if (!this.f23105dj) {
                throw new IllegalStateException();
            }
            int i5 = this.sya - 1;
            this.sya = i5;
            this.f23106zb--;
            this.f23105dj = false;
            syc.this.ycx(i5);
        }
    }

    public final class zb implements Set<K> {
        public zb() {
        }

        @Override // java.util.Set, java.util.Collection
        public boolean add(K k11) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean addAll(Collection<? extends K> collection) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Set, java.util.Collection
        public void clear() {
            syc.this.sya();
        }

        @Override // java.util.Set, java.util.Collection
        public boolean contains(Object obj) {
            return syc.this.ycx(obj) >= 0;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean containsAll(Collection<?> collection) {
            return syc.ycx(syc.this.zb(), collection);
        }

        @Override // java.util.Set, java.util.Collection
        public boolean equals(Object obj) {
            return syc.ycx(this, obj);
        }

        @Override // java.util.Set, java.util.Collection
        public int hashCode() {
            int iHashCode = 0;
            for (int iYcx = syc.this.ycx() - 1; iYcx >= 0; iYcx--) {
                Object objYcx = syc.this.ycx(iYcx, 0);
                iHashCode += objYcx == null ? 0 : objYcx.hashCode();
            }
            return iHashCode;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean isEmpty() {
            return syc.this.ycx() == 0;
        }

        @Override // java.util.Set, java.util.Collection, java.lang.Iterable
        public Iterator<K> iterator() {
            return new ycx(0);
        }

        @Override // java.util.Set, java.util.Collection
        public boolean remove(Object obj) {
            int iYcx = syc.this.ycx(obj);
            if (iYcx < 0) {
                return false;
            }
            syc.this.ycx(iYcx);
            return true;
        }

        @Override // java.util.Set, java.util.Collection
        public boolean removeAll(Collection<?> collection) {
            return syc.zb(syc.this.zb(), collection);
        }

        @Override // java.util.Set, java.util.Collection
        public boolean retainAll(Collection<?> collection) {
            return syc.sya(syc.this.zb(), collection);
        }

        @Override // java.util.Set, java.util.Collection
        public int size() {
            return syc.this.ycx();
        }

        @Override // java.util.Set, java.util.Collection
        public Object[] toArray() {
            return syc.this.zb(0);
        }

        @Override // java.util.Set, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) syc.this.ycx(tArr, 0);
        }
    }

    public static <K, V> boolean sya(Map<K, V> map, Collection<?> collection) {
        int size = map.size();
        Iterator<K> it = map.keySet().iterator();
        while (it.hasNext()) {
            if (!collection.contains(it.next())) {
                it.remove();
            }
        }
        return size != map.size();
    }

    public static <K, V> boolean ycx(Map<K, V> map, Collection<?> collection) {
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            if (!map.containsKey(it.next())) {
                return false;
            }
        }
        return true;
    }

    public static <K, V> boolean zb(Map<K, V> map, Collection<?> collection) {
        int size = map.size();
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            map.remove(it.next());
        }
        return size != map.size();
    }

    public Set<K> dj() {
        if (this.f23104zb == null) {
            this.f23104zb = new zb();
        }
        return this.f23104zb;
    }

    public abstract void sya();

    public abstract int ycx();

    public abstract int ycx(Object obj);

    public abstract Object ycx(int i5, int i11);

    public abstract void ycx(int i5);

    public abstract Map<K, V> zb();

    public <T> T[] ycx(T[] tArr, int i5) {
        int iYcx = ycx();
        if (tArr.length < iYcx) {
            tArr = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), iYcx));
        }
        for (int i11 = 0; i11 < iYcx; i11++) {
            tArr[i11] = ycx(i11, i5);
        }
        if (tArr.length > iYcx) {
            tArr[iYcx] = null;
        }
        return tArr;
    }

    public Object[] zb(int i5) {
        int iYcx = ycx();
        Object[] objArr = new Object[iYcx];
        for (int i11 = 0; i11 < iYcx; i11++) {
            objArr[i11] = ycx(i11, i5);
        }
        return objArr;
    }

    public static <T> boolean ycx(Set<T> set, Object obj) {
        if (set == obj) {
            return true;
        }
        if (obj instanceof Set) {
            Set set2 = (Set) obj;
            try {
                if (set.size() == set2.size()) {
                    if (set.containsAll(set2)) {
                        return true;
                    }
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }
}
