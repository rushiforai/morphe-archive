package com.google.android.gms.internal.consent_sdk;

import java.util.AbstractMap;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class v6 extends AbstractMap {

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ int f32270g = 0;

    /* renamed from: a, reason: collision with root package name */
    public Object[] f32271a;

    /* renamed from: b, reason: collision with root package name */
    public int f32272b;

    /* renamed from: c, reason: collision with root package name */
    public Map f32273c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f32274d;

    /* renamed from: e, reason: collision with root package name */
    public volatile androidx.datastore.preferences.protobuf.e1 f32275e;

    /* renamed from: f, reason: collision with root package name */
    public Map f32276f;

    public v6() {
        Map map = Collections.EMPTY_MAP;
        this.f32273c = map;
        this.f32276f = map;
    }

    public final Set a() {
        return this.f32273c.isEmpty() ? Collections.EMPTY_SET : this.f32273c.entrySet();
    }

    @Override // java.util.AbstractMap, java.util.Map
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final Object put(Comparable comparable, Object obj) {
        g();
        int iD = d(comparable);
        if (iD >= 0) {
            return ((w6) this.f32271a[iD]).setValue(obj);
        }
        g();
        if (this.f32271a == null) {
            this.f32271a = new Object[16];
        }
        int i5 = -(iD + 1);
        if (i5 >= 16) {
            return f().put(comparable, obj);
        }
        if (this.f32272b == 16) {
            w6 w6Var = (w6) this.f32271a[15];
            this.f32272b = 15;
            f().put(w6Var.f32283a, w6Var.f32284b);
        }
        Object[] objArr = this.f32271a;
        int length = objArr.length;
        System.arraycopy(objArr, i5, objArr, i5 + 1, 15 - i5);
        this.f32271a[i5] = new w6(this, comparable, obj);
        this.f32272b++;
        return null;
    }

    public final w6 c(int i5) {
        if (i5 < this.f32272b) {
            return (w6) this.f32271a[i5];
        }
        throw new ArrayIndexOutOfBoundsException(i5);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        g();
        if (this.f32272b != 0) {
            this.f32271a = null;
            this.f32272b = 0;
        }
        if (this.f32273c.isEmpty()) {
            return;
        }
        this.f32273c.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return d(comparable) >= 0 || this.f32273c.containsKey(comparable);
    }

    public final int d(Comparable comparable) {
        int i5 = this.f32272b;
        int i11 = i5 - 1;
        int i12 = 0;
        if (i11 >= 0) {
            int iCompareTo = comparable.compareTo(((w6) this.f32271a[i11]).f32283a);
            if (iCompareTo > 0) {
                return -(i5 + 1);
            }
            if (iCompareTo == 0) {
                return i11;
            }
        }
        while (i12 <= i11) {
            int i13 = (i12 + i11) / 2;
            int iCompareTo2 = comparable.compareTo(((w6) this.f32271a[i13]).f32283a);
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
        Object[] objArr = this.f32271a;
        Object obj = ((w6) objArr[i5]).f32284b;
        System.arraycopy(objArr, i5 + 1, objArr, i5, (this.f32272b - i5) - 1);
        this.f32272b--;
        if (!this.f32273c.isEmpty()) {
            Iterator it = f().entrySet().iterator();
            Object[] objArr2 = this.f32271a;
            int i11 = this.f32272b;
            Map.Entry entry = (Map.Entry) it.next();
            objArr2[i11] = new w6(this, (Comparable) entry.getKey(), entry.getValue());
            this.f32272b++;
            it.remove();
        }
        return obj;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.f32275e == null) {
            this.f32275e = new androidx.datastore.preferences.protobuf.e1(this, 2);
        }
        return this.f32275e;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v6)) {
            return super.equals(obj);
        }
        v6 v6Var = (v6) obj;
        int size = size();
        if (size == v6Var.size()) {
            int i5 = this.f32272b;
            if (i5 != v6Var.f32272b) {
                return entrySet().equals(v6Var.entrySet());
            }
            for (int i11 = 0; i11 < i5; i11++) {
                if (c(i11).equals(v6Var.c(i11))) {
                }
            }
            if (i5 != size) {
                return this.f32273c.equals(v6Var.f32273c);
            }
            return true;
        }
        return false;
    }

    public final SortedMap f() {
        g();
        if (this.f32273c.isEmpty() && !(this.f32273c instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.f32273c = treeMap;
            this.f32276f = treeMap.descendingMap();
        }
        return (SortedMap) this.f32273c;
    }

    public final void g() {
        if (this.f32274d) {
            throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iD = d(comparable);
        return iD >= 0 ? ((w6) this.f32271a[iD]).f32284b : this.f32273c.get(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int i5 = this.f32272b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode += this.f32271a[i11].hashCode();
        }
        return this.f32273c.size() > 0 ? this.f32273c.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        g();
        Comparable comparable = (Comparable) obj;
        int iD = d(comparable);
        if (iD >= 0) {
            return e(iD);
        }
        if (this.f32273c.isEmpty()) {
            return null;
        }
        return this.f32273c.remove(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f32273c.size() + this.f32272b;
    }
}
