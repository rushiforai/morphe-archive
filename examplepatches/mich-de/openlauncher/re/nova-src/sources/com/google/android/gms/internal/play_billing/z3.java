package com.google.android.gms.internal.play_billing;

import java.util.AbstractMap;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class z3 extends AbstractMap {

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ int f33664g = 0;

    /* renamed from: a, reason: collision with root package name */
    public Object[] f33665a;

    /* renamed from: b, reason: collision with root package name */
    public int f33666b;

    /* renamed from: c, reason: collision with root package name */
    public Map f33667c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f33668d;

    /* renamed from: e, reason: collision with root package name */
    public volatile androidx.datastore.preferences.protobuf.e1 f33669e;

    /* renamed from: f, reason: collision with root package name */
    public Map f33670f;

    public z3() {
        Map map = Collections.EMPTY_MAP;
        this.f33667c = map;
        this.f33670f = map;
    }

    public final Set a() {
        return this.f33667c.isEmpty() ? Collections.EMPTY_SET : this.f33667c.entrySet();
    }

    @Override // java.util.AbstractMap, java.util.Map
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final Object put(Comparable comparable, Object obj) {
        g();
        int iD = d(comparable);
        if (iD >= 0) {
            return ((a4) this.f33665a[iD]).setValue(obj);
        }
        g();
        if (this.f33665a == null) {
            this.f33665a = new Object[16];
        }
        int i5 = -(iD + 1);
        if (i5 >= 16) {
            return f().put(comparable, obj);
        }
        if (this.f33666b == 16) {
            a4 a4Var = (a4) this.f33665a[15];
            this.f33666b = 15;
            f().put(a4Var.f33353a, a4Var.f33354b);
        }
        Object[] objArr = this.f33665a;
        int length = objArr.length;
        System.arraycopy(objArr, i5, objArr, i5 + 1, 15 - i5);
        this.f33665a[i5] = new a4(this, comparable, obj);
        this.f33666b++;
        return null;
    }

    public final a4 c(int i5) {
        if (i5 < this.f33666b) {
            return (a4) this.f33665a[i5];
        }
        throw new ArrayIndexOutOfBoundsException(i5);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        g();
        if (this.f33666b != 0) {
            this.f33665a = null;
            this.f33666b = 0;
        }
        if (this.f33667c.isEmpty()) {
            return;
        }
        this.f33667c.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return d(comparable) >= 0 || this.f33667c.containsKey(comparable);
    }

    public final int d(Comparable comparable) {
        int i5 = this.f33666b;
        int i11 = i5 - 1;
        int i12 = 0;
        if (i11 >= 0) {
            int iCompareTo = comparable.compareTo(((a4) this.f33665a[i11]).f33353a);
            if (iCompareTo > 0) {
                return -(i5 + 1);
            }
            if (iCompareTo == 0) {
                return i11;
            }
        }
        while (i12 <= i11) {
            int i13 = (i12 + i11) / 2;
            int iCompareTo2 = comparable.compareTo(((a4) this.f33665a[i13]).f33353a);
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

    public final Object e(int i5) {
        g();
        Object[] objArr = this.f33665a;
        Object obj = ((a4) objArr[i5]).f33354b;
        System.arraycopy(objArr, i5 + 1, objArr, i5, (this.f33666b - i5) - 1);
        this.f33666b--;
        if (!this.f33667c.isEmpty()) {
            Iterator it = f().entrySet().iterator();
            Object[] objArr2 = this.f33665a;
            int i11 = this.f33666b;
            Map.Entry entry = (Map.Entry) it.next();
            objArr2[i11] = new a4(this, (Comparable) entry.getKey(), entry.getValue());
            this.f33666b++;
            it.remove();
        }
        return obj;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.f33669e == null) {
            this.f33669e = new androidx.datastore.preferences.protobuf.e1(this, 5);
        }
        return this.f33669e;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z3)) {
            return super.equals(obj);
        }
        z3 z3Var = (z3) obj;
        int size = size();
        if (size == z3Var.size()) {
            int i5 = this.f33666b;
            if (i5 != z3Var.f33666b) {
                return entrySet().equals(z3Var.entrySet());
            }
            for (int i11 = 0; i11 < i5; i11++) {
                if (c(i11).equals(z3Var.c(i11))) {
                }
            }
            if (i5 != size) {
                return this.f33667c.equals(z3Var.f33667c);
            }
            return true;
        }
        return false;
    }

    public final SortedMap f() {
        g();
        if (this.f33667c.isEmpty() && !(this.f33667c instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.f33667c = treeMap;
            this.f33670f = treeMap.descendingMap();
        }
        return (SortedMap) this.f33667c;
    }

    public final void g() {
        if (this.f33668d) {
            throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iD = d(comparable);
        return iD >= 0 ? ((a4) this.f33665a[iD]).f33354b : this.f33667c.get(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int i5 = this.f33666b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode += this.f33665a[i11].hashCode();
        }
        return this.f33667c.size() > 0 ? this.f33667c.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        g();
        Comparable comparable = (Comparable) obj;
        int iD = d(comparable);
        if (iD >= 0) {
            return e(iD);
        }
        if (this.f33667c.isEmpty()) {
            return null;
        }
        return this.f33667c.remove(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f33667c.size() + this.f33666b;
    }
}
