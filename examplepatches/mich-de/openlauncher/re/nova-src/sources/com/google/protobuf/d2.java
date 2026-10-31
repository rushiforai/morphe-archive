package com.google.protobuf;

import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: classes3.dex */
public final class d2 extends AbstractMap {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f34838f = 0;

    /* renamed from: a, reason: collision with root package name */
    public List f34839a;

    /* renamed from: b, reason: collision with root package name */
    public Map f34840b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f34841c;

    /* renamed from: d, reason: collision with root package name */
    public volatile androidx.datastore.preferences.protobuf.e1 f34842d;

    /* renamed from: e, reason: collision with root package name */
    public Map f34843e;

    public static d2 f() {
        d2 d2Var = new d2();
        d2Var.f34839a = Collections.EMPTY_LIST;
        Map map = Collections.EMPTY_MAP;
        d2Var.f34840b = map;
        d2Var.f34843e = map;
        return d2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0024  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(Comparable comparable) {
        int i5;
        int i11;
        int size = this.f34839a.size();
        int i12 = size - 1;
        if (i12 < 0) {
            i5 = 0;
            while (i5 <= i12) {
                int i13 = (i5 + i12) / 2;
                int iCompareTo = comparable.compareTo(((e2) this.f34839a.get(i13)).f34849a);
                if (iCompareTo < 0) {
                    i12 = i13 - 1;
                } else {
                    if (iCompareTo <= 0) {
                        return i13;
                    }
                    i5 = i13 + 1;
                }
            }
            i11 = i5 + 1;
        } else {
            int iCompareTo2 = comparable.compareTo(((e2) this.f34839a.get(i12)).f34849a);
            if (iCompareTo2 > 0) {
                i11 = size + 1;
            } else {
                if (iCompareTo2 == 0) {
                    return i12;
                }
                i5 = 0;
                while (i5 <= i12) {
                }
                i11 = i5 + 1;
            }
        }
        return -i11;
    }

    public final void b() {
        if (this.f34841c) {
            throw new UnsupportedOperationException();
        }
    }

    public final Map.Entry c(int i5) {
        return (Map.Entry) this.f34839a.get(i5);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        b();
        if (!this.f34839a.isEmpty()) {
            this.f34839a.clear();
        }
        if (this.f34840b.isEmpty()) {
            return;
        }
        this.f34840b.clear();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Comparable comparable = (Comparable) obj;
        return a(comparable) >= 0 || this.f34840b.containsKey(comparable);
    }

    public final Set d() {
        return this.f34840b.isEmpty() ? Collections.EMPTY_SET : this.f34840b.entrySet();
    }

    public final SortedMap e() {
        b();
        if (this.f34840b.isEmpty() && !(this.f34840b instanceof TreeMap)) {
            TreeMap treeMap = new TreeMap();
            this.f34840b = treeMap;
            this.f34843e = treeMap.descendingMap();
        }
        return (SortedMap) this.f34840b;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        if (this.f34842d == null) {
            this.f34842d = new androidx.datastore.preferences.protobuf.e1(this, 6);
        }
        return this.f34842d;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d2)) {
            return super.equals(obj);
        }
        d2 d2Var = (d2) obj;
        int size = size();
        if (size == d2Var.size()) {
            int size2 = this.f34839a.size();
            if (size2 != d2Var.f34839a.size()) {
                return ((AbstractSet) entrySet()).equals(d2Var.entrySet());
            }
            for (int i5 = 0; i5 < size2; i5++) {
                if (c(i5).equals(d2Var.c(i5))) {
                }
            }
            if (size2 != size) {
                return this.f34840b.equals(d2Var.f34840b);
            }
            return true;
        }
        return false;
    }

    @Override // java.util.AbstractMap, java.util.Map
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public final Object put(Comparable comparable, Object obj) {
        b();
        int iA = a(comparable);
        if (iA >= 0) {
            return ((e2) this.f34839a.get(iA)).setValue(obj);
        }
        b();
        if (this.f34839a.isEmpty() && !(this.f34839a instanceof ArrayList)) {
            this.f34839a = new ArrayList(16);
        }
        int i5 = -(iA + 1);
        if (i5 >= 16) {
            return e().put(comparable, obj);
        }
        if (this.f34839a.size() == 16) {
            e2 e2Var = (e2) this.f34839a.remove(15);
            e().put(e2Var.f34849a, e2Var.f34850b);
        }
        this.f34839a.add(i5, new e2(this, comparable, obj));
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Comparable comparable = (Comparable) obj;
        int iA = a(comparable);
        return iA >= 0 ? ((e2) this.f34839a.get(iA)).f34850b : this.f34840b.get(comparable);
    }

    public final Object h(int i5) {
        b();
        Object obj = ((e2) this.f34839a.remove(i5)).f34850b;
        if (!this.f34840b.isEmpty()) {
            Iterator it = e().entrySet().iterator();
            List list = this.f34839a;
            Map.Entry entry = (Map.Entry) it.next();
            list.add(new e2(this, (Comparable) entry.getKey(), entry.getValue()));
            it.remove();
        }
        return obj;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        int size = this.f34839a.size();
        int iHashCode = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iHashCode += ((e2) this.f34839a.get(i5)).hashCode();
        }
        return this.f34840b.size() > 0 ? this.f34840b.hashCode() + iHashCode : iHashCode;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        b();
        Comparable comparable = (Comparable) obj;
        int iA = a(comparable);
        if (iA >= 0) {
            return h(iA);
        }
        if (this.f34840b.isEmpty()) {
            return null;
        }
        return this.f34840b.remove(comparable);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f34840b.size() + this.f34839a.size();
    }
}
