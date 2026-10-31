package com.google.android.gms.internal.measurement;

import java.util.AbstractMap;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class v2 extends AbstractMap {

    /* renamed from: a, reason: collision with root package name */
    public Object[] f33125a;

    /* renamed from: b, reason: collision with root package name */
    public int f33126b;

    /* renamed from: c, reason: collision with root package name */
    public Map f33127c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f33128d;

    /* renamed from: e, reason: collision with root package name */
    public volatile androidx.datastore.preferences.protobuf.e1 f33129e;

    /* renamed from: f, reason: collision with root package name */
    public Map f33130f;

    public v2() {
        Map map = Collections.EMPTY_MAP;
        this.f33127c = map;
        this.f33130f = map;
    }

    public final w2 a(int i5) {
        if (i5 < this.f33126b) {
            return (w2) this.f33125a[i5];
        }
        throw new ArrayIndexOutOfBoundsException(i5);
    }

    public final Set b() {
        return this.f33127c.isEmpty() ? Collections.EMPTY_SET : this.f33127c.entrySet();
    }

    @Override // java.util.AbstractMap, java.util.Map
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final Object put(Comparable comparable, Object obj) {
        f();
        int iE = e(comparable);
        if (iE >= 0) {
            return ((w2) this.f33125a[iE]).setValue(obj);
        }
        f();
        if (this.f33125a == null) {
            this.f33125a = new Object[16];
        }
        int i5 = -(iE + 1);
        if (i5 >= 16) {
            return g().put(comparable, obj);
        }
        if (this.f33126b == 16) {
            w2 w2Var = (w2) this.f33125a[15];
            this.f33126b = 15;
            g().put(w2Var.f33177a, w2Var.f33178b);
        }
        Object[] objArr = this.f33125a;
        int length = objArr.length;
        System.arraycopy(objArr, i5, objArr, i5 + 1, 15 - i5);
        this.f33125a[i5] = new w2(this, comparable, obj);
        this.f33126b++;
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        f();
        if (this.f33126b != 0) {
            this.f33125a = null;
            this.f33126b = 0;
        }
        if (this.f33127c.isEmpty()) {
            return;
        }
        this.f33127c.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return e(comparable) >= 0 || this.f33127c.containsKey(comparable);
    }

    public final Object d(int i5) {
        f();
        Object[] objArr = this.f33125a;
        Object obj = ((w2) objArr[i5]).f33178b;
        System.arraycopy(objArr, i5 + 1, objArr, i5, (this.f33126b - i5) - 1);
        this.f33126b--;
        if (!this.f33127c.isEmpty()) {
            Iterator it = g().entrySet().iterator();
            Object[] objArr2 = this.f33125a;
            int i11 = this.f33126b;
            Map.Entry entry = (Map.Entry) it.next();
            objArr2[i11] = new w2(this, (Comparable) entry.getKey(), entry.getValue());
            this.f33126b++;
            it.remove();
        }
        return obj;
    }

    public final int e(Comparable comparable) {
        int i5 = this.f33126b;
        int i11 = i5 - 1;
        int i12 = 0;
        if (i11 >= 0) {
            int iCompareTo = comparable.compareTo(((w2) this.f33125a[i11]).f33177a);
            if (iCompareTo > 0) {
                return -(i5 + 1);
            }
            if (iCompareTo == 0) {
                return i11;
            }
        }
        while (i12 <= i11) {
            int i13 = (i12 + i11) / 2;
            int iCompareTo2 = comparable.compareTo(((w2) this.f33125a[i13]).f33177a);
            if (iCompareTo2 < 0) {
                i11 = i13 - 1;
            } else {
                if (iCompareTo2 <= 0) {
                    return i13;
                }
                i12 = i13 + 1;
            }
        }
        return -(i12 + 1);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.f33129e == null) {
            this.f33129e = new androidx.datastore.preferences.protobuf.e1(this, 3);
        }
        return this.f33129e;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v2)) {
            return super.equals(obj);
        }
        v2 v2Var = (v2) obj;
        int size = size();
        if (size == v2Var.size()) {
            int i5 = this.f33126b;
            if (i5 != v2Var.f33126b) {
                return entrySet().equals(v2Var.entrySet());
            }
            for (int i11 = 0; i11 < i5; i11++) {
                if (a(i11).equals(v2Var.a(i11))) {
                }
            }
            if (i5 != size) {
                return this.f33127c.equals(v2Var.f33127c);
            }
            return true;
        }
        return false;
    }

    public final void f() {
        if (this.f33128d) {
            throw new UnsupportedOperationException();
        }
    }

    public final SortedMap g() {
        f();
        if (this.f33127c.isEmpty() && !(this.f33127c instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.f33127c = treeMap;
            this.f33130f = treeMap.descendingMap();
        }
        return (SortedMap) this.f33127c;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iE = e(comparable);
        return iE >= 0 ? ((w2) this.f33125a[iE]).f33178b : this.f33127c.get(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int i5 = this.f33126b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode += this.f33125a[i11].hashCode();
        }
        return this.f33127c.size() > 0 ? this.f33127c.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        f();
        Comparable comparable = (Comparable) obj;
        int iE = e(comparable);
        if (iE >= 0) {
            return d(iE);
        }
        if (this.f33127c.isEmpty()) {
            return null;
        }
        return this.f33127c.remove(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f33127c.size() + this.f33126b;
    }
}
